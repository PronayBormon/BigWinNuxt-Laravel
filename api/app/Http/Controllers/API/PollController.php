<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\poll;
use App\Models\PollAnswer;
use App\Models\PollOption;
use App\Models\SiteSetting;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PollController extends Controller
{
    public function pollStore(Request $request)
    {
        $request->validate([
            'question' => 'required|string',
            'options' => 'required|array|size:4',
            'options.*' => 'required|string',
        ]);

        $poll = Poll::create(['question' => $request->question, 'status' => "inactive"]);

        foreach ($request->options as $text) {
            $poll->options()->create(['option_text' => $text]);
        }

        return response()->json(['message' => 'Poll created successfully.']);
    }

    public function show($id)
    {
        $poll = Poll::with('options')->findOrFail($id);
        return response()->json($poll);
    }
    public function pollList(Request $request)
    {
        $query = Poll::with('options');

        if ($request->has('search')) {
            $query->where('question', 'like', '%' . $request->search . '%');
        }

        if ($request->has('status')) {
            $query->where('status', 'like', '%' . $request->status . '%');
        }

        $poll = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);


        return response()->json([
            'data' => $poll->items(),
            'pagination' => [
                'current_page' => $poll->currentPage(),
                'last_page' => $poll->lastPage(),
                'per_page' => $poll->perPage(),
                'total' => $poll->total(),
                'next_page_url' => $poll->nextPageUrl(),
                'prev_page_url' => $poll->previousPageUrl(),
                'links' => $this->generatePaginationLinks($poll),
            ]
        ]);
    }

    public function submitAnswer(Request $request)
    {

        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'poll_id' => 'required|exists:polls,id',
            'poll_option_id' => 'required|exists:poll_options,id',
        ]);

        $option = PollOption::where('id', $request->poll_option_id)
            ->where('poll_id', $request->poll_id)
            ->first();

        if (!$option) {
            return response()->json(['message' => 'Invalid option for this question'], 422);
        }

        $user = User::find($request->user_id);

        if (!$user) {
            return response()->json(['message' => 'Unauthenticated'], 401);
        }

        // Check if user already answered this question
        $alreadyAnswered = PollAnswer::where('user_id', $request->user_id)
            ->where('poll_id', $request->poll_id)
            ->exists();

        if ($alreadyAnswered) {
            return response()->json(['message' => 'You have already answered this question.'], 403);
        }

        $answare = PollAnswer::create([
            'user_id' => $request->user_id,
            'poll_id' => $request->poll_id,
            'poll_option_id' => $request->poll_option_id,
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
        $poll = poll::with(['options' => function ($query) {
            $query->withCount('answers');
        }])->findOrFail($id);

        return response()->json([
            'question' => $poll->question,
            'results' => $poll->options->map(function ($option) {
                return [
                    'option' => $option->option_text,
                    'votes' => $option->answers_count
                ];
            })
        ]);
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


    public function updatePoll(Request $request)
    {
        $request->validate([
            'poll_id' => 'required|exists:polls,id',
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
        $question = poll::findOrFail($request->poll_id);

        if ($request->status == 'active') {
            $existing = poll::where('status', 'active')->first();
            if ($existing) {
                return response()->json(['errors' => ['status' => ['Already have an active Poll.']]], 422);
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
                $existing = PollOption::where('id', $opt['id'])
                    ->where('poll_id', $question->id)
                    ->first();

                if ($existing) {
                    $existing->update(['option_text' => $opt['option_text']]);
                    $keepIds[] = $existing->id;
                }
            } else {
                // Create new option
                $new = PollOption::create([
                    'poll_id' => $question->id,
                    'option_text' => $opt['option_text'],
                ]);
                $keepIds[] = $new->id;
            }
        }

        // Delete removed options
        PollOption::where('poll_id', $question->id)
            ->whereNotIn('id', $keepIds)
            ->delete();

        return response()->json(['message' => 'Poll updated successfully.']);
    }


    public function getPollActive(Request $request)
    {
        $poll = Poll::with(['options' => function ($query) {
            $query->withCount('answers');
        }])->where('status', 'active')->first();

        if (!$poll) {
            return response()->json([
                'status' => false,
                'code' => 404,
                'message' => 'No active poll found.',
            ]);
        }
        $totalVotes = $poll->options->sum('answers_count');

        return response()->json([
            'status' => true,
            'code' => 200,
            'total_votes' => $totalVotes,
            'data' => [
                'id' => $poll->id,
                'question' => $poll->question,
                'options' => $poll->options->map(function ($option) {
                    return [
                        'id' => $option->id,
                        'option_text' => $option->option_text,
                        'votes' => $option->answers_count
                    ];
                })
            ]
        ]);
    }

    public function userPredict(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'user_id' => "required",
            'id' => "required",
        ]);

        if ($validate->fails()) {
            return response()->json(['errors' => $validate->errors()], 422);
        }

        $data = PollAnswer::where('user_id', $request->user_id)->where('poll_id', $request->id)->first();

        return response()->json($data);
    }
}
