<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Models\Answer;
use App\Models\Option;
use App\Models\Question;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\SiteSetting;

class QuestionController extends Controller
{
    public function questionStore(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'question' => 'required|string',
            'options' => 'required|array|size:4',
            'options.*' => 'required|string',
        ]);

        $question = Question::create([
            'question' => $request->question,
            'status' => 'inactive',
        ]);

        foreach ($request->options as $text) {
            $question->options()->create(['option_text' => $text]);
        }

        return response()->json(['message' => 'Question created successfully.']);
    }

    public function show($id)
    {
        $question = Question::with('options')->findOrFail($id);
        return response()->json($question);
    }



    public function submitAnsware(Request $request)
    {
        $request->validate([
            'question_id' => 'required|exists:questions,id',
            'option_id' => 'required|exists:options,id',
            'user_id' => 'required|exists:users,id',
        ]);

        // Check if option belongs to the question
        $option = Option::where('id', $request->option_id)
            ->where('question_id', $request->question_id)
            ->first();

        if (!$option) {
            return response()->json(['message' => 'Invalid option for this question'], 422);
        }

        $user = User::find($request->user_id);

        if (!$user) {
            return response()->json(['message' => 'Unauthenticated'], 401);
        }

        // Check if user already answered this question
        $alreadyAnswered = Answer::where('user_id', $request->user_id)
            ->where('question_id', $request->question_id)
            ->exists();

        if ($alreadyAnswered) {
            return response()->json(['message' => 'You have already answered this question.'], 403);
        }

        $answare = Answer::create([
            'user_id' => $request->user_id,
            'question_id' => $request->question_id,
            'option_id' => $request->option_id,
        ]);

        if ($answare) {

            $seting = SiteSetting::first();

            $userDetails = User::where('id', $user->id)->first();
            $total = $user->credit_points + $seting->question_credit;

            $userDetails->update([
                'credit_points' => $total,
            ]);

            return response()->json(['message' => 'Reward granted!'], 200);
        }

        return response()->json(['message' => 'Answer submitted successfully.']);
    }



    public function getResults($id)
    {
        $question = Question::with(['options' => function ($query) {
            $query->withCount('answers');
        }])->findOrFail($id);

        return response()->json([
            'question' => $question->question,
            'results' => $question->options->map(function ($option) {
                return [
                    'option' => $option->option_text,
                    'votes' => $option->answers_count
                ];
            })
        ]);
    }


    public function question(Request $request)
    {
        $query = Question::with('options');

        if ($request->has('search')) {
            $query->where('question', 'like', '%' . $request->search . '%');
        }

        if ($request->has('status')) {
            $query->where('status', 'like', '%' . $request->status . '%');
        }

        $question = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);


        return response()->json([
            'data' => $question->items(),
            'pagination' => [
                'current_page' => $question->currentPage(),
                'last_page' => $question->lastPage(),
                'per_page' => $question->perPage(),
                'total' => $question->total(),
                'next_page_url' => $question->nextPageUrl(),
                'prev_page_url' => $question->previousPageUrl(),
                'links' => $this->generatePaginationLinks($question),
            ]
        ]);
    }


    public function updateQuestion(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'question_id' => 'required|exists:questions,id',
            'question' => 'required|string',
            'status' => 'required|in:active,inactive',
            'options' => 'required|string', // coming as JSON string
        ]);

        // Decode the JSON string into an array
        $options = json_decode($request->options, true);

        if (!is_array($options) || count($options) < 1 || count($options) > 4) {
            return response()->json(['message' => 'Options must be an array with 1 to 4 items.'], 422);
        }

        // Update the question
        $question = question::findOrFail($request->question_id);

        if ($request->status == 'active') {
            $existing = Question::where('status', 'active')->first();
            if ($existing) {
                return response()->json(['errors' => ['status' => ['Already have an active question.']]], 422);
            }
        }

        $question->update([
            'question' => $request->question,
            'status' => $request->status,
        ]);

        // Track IDs of updated or kept options
        $keepIds = [];

        foreach ($options as $opt) {
            if (isset($opt['id'])) {
                // Update existing option
                $existing = Option::where('id', $opt['id'])
                    ->where('question_id', $question->id)
                    ->first();

                if ($existing) {
                    $existing->update(['option_text' => $opt['option_text']]);
                    $keepIds[] = $existing->id;
                }
            } else {
                // Create new option
                $new = Option::create([
                    'question_id' => $question->id,
                    'option_text' => $opt['option_text'],
                ]);
                $keepIds[] = $new->id;
            }
        }

        // Delete removed options
        Option::where('question_id', $question->id)
            ->whereNotIn('id', $keepIds)
            ->delete();

        return response()->json(['message' => 'question updated successfully.']);
    }


    private function generatePaginationLinks($data)
    {
        $links = [];
        $currentPage = $data->currentPage();
        $lastPage = $data->lastPage();

        if ($currentPage > 1) {
            $links[] = ['label' => 'Prev', 'url' => $data->url($currentPage - 1)];
        }

        $links[] = ['label' => 1, 'url' => $data->url(1), 'active' => $currentPage == 1];

        if ($currentPage > 3) {
            $links[] = ['label' => '...', 'url' => null];
        }

        for ($i = max(2, $currentPage - 1); $i <= min($lastPage - 1, $currentPage + 1); $i++) {
            $links[] = ['label' => $i, 'url' => $data->url($i), 'active' => $i == $currentPage];
        }

        if ($currentPage < $lastPage - 2) {
            $links[] = ['label' => '...', 'url' => null];
        }

        if ($lastPage > 1) {
            $links[] = ['label' => $lastPage, 'url' => $data->url($lastPage), 'active' => $currentPage == $lastPage];
        }

        if ($currentPage < $lastPage) {
            $links[] = ['label' => 'Next', 'url' => $data->url($currentPage + 1)];
        }

        return $links;
    }



    public function getQuestion(Request $request)
    {
        $query = Question::with('options')->where('status', 'active')->first();


        return response()->json([
            'status' => true,
            'code' => 200,
            'data' => $query,
        ]);
    }
}
