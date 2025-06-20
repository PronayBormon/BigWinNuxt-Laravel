<?php

namespace App\Http\Controllers\API\AdminController;

use App\Models\BigShort;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class BigshortController extends Controller
{

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
    public function save(Request $request)
    {

        $validate = Validator::make($request->all(), [
            "teamA" => "required|integer",
            "teamB" => "required|integer",
            "dateTime" => "required",
            "enddateTime" => "required",
            "image" => "required|image|mimes:png,webp|dimensions:height=350,width=700",
        ]);

        if ($validate->fails()) {
            return response()->json(["errors" => $validate->errors()], 422);
        }
        if ($request->hasFile('image')) {

            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);

            // Set the image path to save in the database
            $imagePath = 'uploads/' . $imageName;

            $query = BigShort::create([
                'team_one'          => $request->teamA,
                'team_two'          => $request->teamB,
                'start_date'        => $request->dateTime,
                'end_date'          => $request->enddateTime,
                'image'             => $imagePath,
            ]);

            if ($query) {
                return response()->json([
                    'message' => "Successfully add New bigshort Match",
                ]);
            }
        } else {
            return response()->json(["errors" => "Image not found"], 422);
        }
    }

    public function bigshortList(Request $request)
    {

        // dd($request->all());

        $query = BigShort::with(['teamA', 'teamB']);

        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->whereHas('teamA', function ($q1) use ($search) {
                    $q1->where('name', 'like', "%{$search}%");
                })->orWhereHas('teamB', function ($q2) use ($search) {
                    $q2->where('name', 'like', "%{$search}%");
                });
            });
        }


        $perPage = $request->items ?? 10;

        $data = $query->where('status', 'active')->orderBy('big_shorts.id', 'desc')->paginate($perPage);

        // dd($data);

        $data->getCollection()->transform(function ($item) {
            $item->start_time = $item->start_date ? \Carbon\Carbon::parse($item->start_date)->format('d M Y h:i A') : null;
            $item->end_time = $item->end_date ? \Carbon\Carbon::parse($item->end_date)->format('d M Y h:i A') : null;
            return $item;
        });

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

    public function bigDetails($id)
    {

        $data = BigShort::where('id', $id)
            ->with(["teamA", "teamB"])
            ->first();

        if ($data) {
            $baseUrl = url('uploads/');
            $data->image = url($data->image);

            $data->teamA->image = $baseUrl . '/' . $data->teamA->image;
            $data->teamB->image = $baseUrl . '/' . $data->teamB->image;


            // $data->time = \Carbon\Carbon::parse($data->time)->format('d M Y h:i A');

            $dateTime = \Carbon\Carbon::parse($data->end_date);

            // $data->start_time = $dateTime->format("h:i A");
            // $data->start_date = $dateTime->format("M d, Y");

            // $data->date = $data->created_at->format("M d Y");
        }


        return response()->json($data);
    }

    public function update_match(request $request)
    {
        $validate = Validator::make($request->all(), [
            "id" => "required",
            "teamA" => "required|integer",
            "teamB" => "required|integer",
        ]);

        if ($validate->fails()) {
            return response()->json(["errors" => $validate->errors()], 422);
        }

        $data = BigShort::where('id', $request->id)->first();

        if ($request->status == "Active") {
            // dd("1");
            $checkActive = BigShort::where('status', 'Active')->first();

            if ($checkActive == null) {


                if ($request->hasFile('image')) {

                    $image = $request->image;
                    $imageName = time() . "." . $image->getClientOriginalExtension();
                    $image->move(public_path('uploads'), $imageName);

                    // Set the image path to save in the database
                    $imagePath = 'uploads/' . $imageName;


                    if ($request->startDate && $request->endDate) {

                        $data->update([
                            'team_one'    => $request->teamA,
                            'team_two'    => $request->teamB,
                            'time'      => $request->startDate,
                            'end_date'  => $request->endDate,
                            'status'    => $request->status,
                            'image'     => $imagePath,
                        ]);

                        return response()->json(['message' => "successfully Update"]);
                    } else {
                        $data->update([
                            'team_one' => $request->teamA,
                            'team_two' => $request->teamB,
                            'status' => $request->status,
                            'image' => $imagePath,
                        ]);

                        return response()->json(['message' => "successfully Update"]);
                    }
                } else {

                    if ($request->startDate && $request->endDate) {
                        $data->update([
                            'team_one' => $request->teamA,
                            'team_two' => $request->teamB,
                            'time' => $request->startDate,
                            'end_date' => $request->endDate,
                            'status' => $request->status,
                        ]);

                        return response()->json(['message' => "successfully Update"]);
                    } else {
                        $data->update([
                            'team_one' => $request->teamA,
                            'team_two' => $request->teamB,
                            'status' => $request->status,
                        ]);

                        return response()->json(['message' => "successfully Update"]);
                    }
                }
            } else {

                return response()->json([
                    'errors' => ['match' => ['You have one active match']]
                ], 422);
            }
        } else {
            if ($request->hasFile('image')) {

                $image = $request->image;
                $imageName = time() . "." . $image->getClientOriginalExtension();
                $image->move(public_path('uploads'), $imageName);

                // Set the image path to save in the database
                $imagePath = 'uploads/' . $imageName;


                if ($request->startDate && $request->endDate) {

                    $data->update([
                        'team_one'    => $request->teamA,
                        'team_two'    => $request->teamB,
                        'time'      => $request->startDate,
                        'end_date'  => $request->endDate,
                        'status'    => $request->status,
                        'image'     => $imagePath,
                    ]);

                    return response()->json(['message' => "successfully Update"]);
                } else {
                    $data->update([
                        'team_one' => $request->teamA,
                        'team_two' => $request->teamB,
                        'status' => $request->status,
                        'image' => $imagePath,
                    ]);

                    return response()->json(['message' => "successfully Update"]);
                }
            } else {

                if ($request->startDate && $request->endDate) {
                    $data->update([
                        'team_one' => $request->teamA,
                        'team_two' => $request->teamB,
                        'time' => $request->startDate,
                        'end_date' => $request->endDate,
                        'status' => $request->status,
                    ]);

                    return response()->json(['message' => "successfully Update"]);
                } else {
                    $data->update([
                        'team_one' => $request->teamA,
                        'team_two' => $request->teamB,
                        'status' => $request->status,
                    ]);

                    return response()->json(['message' => "successfully Update"]);
                }
            }
        }
    }
}
