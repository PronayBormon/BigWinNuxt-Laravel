<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\PrizeBanner;
use App\Models\SpinList;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function addPrizeBanner(Request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'name' => 'required||string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'type' => 'integer||required',
        ]);
        if ($validate->fails()) {
            return response()->json($validate->errors());
        }

        if ($request->hasFile('image')) {

            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);

            $query = PrizeBanner::create([
                'name' => $request->name,
                'type' => $request->type,
                'banner' => $imageName,
                'status' => '1',
            ]);

            return response()->json([
                'message' => "Success",
                'data' => $query,
            ]);
        }
    }
    public function PrizeBanner()
    {
        $BattingprizeBanner = PrizeBanner::where('type', '1')->orderby('id', "desc")->first();
        $BowlingprizeBanner = PrizeBanner::where('type', '2')->orderby('id', "desc")->first();
        $TournamentprizeBanner = PrizeBanner::where('type', '3')->orderby('id', "desc")->first();

        return response()->json([
            'batting' => $BattingprizeBanner ? array_merge($BattingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BattingprizeBanner->banner)
            ]) : null,

            'bowling' => $BowlingprizeBanner ? array_merge($BowlingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BowlingprizeBanner->banner)
            ]) : null,

            'tournament' => $TournamentprizeBanner ? array_merge($TournamentprizeBanner->toArray(), [
                'image' => url('uploads/' . $TournamentprizeBanner->banner)
            ]) : null,
        ]);
    }
    public function newspin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'name' => 'required|string',
            'prize' => 'required|string',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $save = SpinList::create([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => '1',
        ]);

        if ($save) {

            return response()->json([
                'message' => "success",
                'data' => $save,
            ]);
        }
    }
    public function SpinList(Request $request)
    {
        $query = SpinList::query();

        // Apply search filter
        if ($request->has('searchInput') && !empty($request->searchInput)) {
            $query->where('name', 'like', '%' . $request->searchInput . '%');
        }

        // Apply status filter
        if ($request->has('status') && $request->status !== null) {
            $query->where('status', $request->status);
        }

        // Apply pagination (default 10 items per page)
        $data = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }

    // 🔹 **Generate Pagination Links with Ellipsis**
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

    public function getspin($id)
    {
        $data = SpinList::where('id', $id)->first();
        return response()->json($data);
    }

    public function updateSpin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required|string',
            'prize' => 'required|string',
            'status' => 'required',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $data = SpinList::where('id', $request->id)->first();

        $save = $data->update([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => $request->status,
        ]);

        if ($save) {

            return response()->json([
                'message' => "success",
                'data' => $save,
            ]);
        }
    }

    public function newMessage(request $request)
    {

        $validator = Validator::make($request->all(), [
            'message' => 'required|min:5',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 401);
        }

        $data = Notification::create([
            'message' => $request->message,
            'status' => "1",
        ]);

        if ($data) {
            return response()->json(['message' => 'success']);
        }
    }
    public function messageList(Request $request)
    {
        $query = Notification::query();

        // Apply search filter if 'searchInput' is present (use 'has' instead of 'hasFile')
        if ($request->has('searchInput')) {
            $query->where('message', 'like', '%' . $request->searchInput . '%');
        }
        
        $data = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);

        $data->getCollection()->transform(function ($item) {
            $item->created = $item->created_at->format('d M Y h:i A');
            return $item;
        });
        // dd($data);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
}
