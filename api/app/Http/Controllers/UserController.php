<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Country;
use App\Models\MatchList;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
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

    public function index()
    {
        $user = Auth::user();
        return view("welcome", compact('user'));
    }
    public function logout(Request $request)
    {
        Auth::logout(); // Log the user out

        return redirect('/');
    }
    public function userList(Request $request)
    {

        // dd($request->all());

        $userList = User::query();

        if ($request->has('perPage')) {
            $userList->limit($request->perPage);
        }
        if ($request->has('search') && !empty($request->search)) {
            $userList->where('name', 'like', '%' . $request->search . '%')
                ->orWhere('email', 'like', '%' . $request->search . '%');
        }

        if ($request->has('status') && !empty($request->status)) {
            $userList->where('status', $request->status);
        }
        $users = $userList->where('role', 1)->paginate($request->perPage ?: 10);
        // return response()->json($users);
        return response()->json([
            'data' => $users->items(),
            'meta' => [
                'current_page' => $users->currentPage(),
                'last_page' => $users->lastPage(),
                'per_page' => $users->perPage(),
                'total' => $users->total(),
                'links' => $users->links()
            ]
        ]);
    }

    public function user_data($id)
    {
        $data = User::where('id', $id)->first();
        return response()->json($data);
    }



    public function updateUser(Request $request)
    {
        $validateData = Validator::make($request->all(), [
            "id" => "required|integer",
            "name" => "required|string|max:255",
            "email" => "required|email|unique:users,email," . $request->id,
            "phone" => "nullable|string|max:20",
            "status" => "required|in:1,2", // Assuming status is either Active (1) or Inactive (2)
        ]);

        if ($validateData->fails()) {
            return response()->json(["errors" => $validateData->errors()], 422);
        }

        // Proceed with updating user
        $user = User::find($request->id);
        if (!$user) {
            return response()->json(["error" => "User not found"], 404);
        }

        $user->update([
            "name" => $request->name,
            "phone" => $request->phone,
            "status" => $request->status,
        ]);

        return response()->json(["message" => "User updated successfully", "user" => $user]);
    }

    public function addNewCountry(request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048', // Max 2MB
        ]);


        if ($validate->fails()) {
            return response()->json(["errors" => $validate->errors()], 422);
        }


        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $fileName = rand() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $fileName);

            $create = Country::create([
                'name' => $request->name,
                'image' => $fileName,
                'status' => '1',
            ]);

            return response()->json([
                'message'   => 'success',
                'data'      => $create,
            ]);
        }
    }

    public function getCountryList(Request $request)
    {

        $country = Country::where('status', '1')->orderby('id', 'desc')->get();

        $formattedCountryData = []; // Array to store formatted data
        foreach ($country as $item) {
            $formattedCountryData[] = [
                'id' => $item->id,
                'name' => $item->name,
                'image' => url("uploads/" . $item->image), // Assuming the flag is stored as a URL
                'status' => $item->status,
            ];
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Countries fetched successfully',
            'data' => $formattedCountryData
        ]);
    }
    public function removeCountry($id)
    {

        $country = Country::find($id);

        if (!$country) {
            return response()->json([
                'message' => "Country not found",
                'status' => 404,
            ], 404);
        }

        $country->delete();

        return response()->json([
            'message' => "Successfully Deleted",
            'status' => 200,
        ]);
    }

    public function getTemaList()
    {

        $country = Country::where('status', '1')->orderby('name', 'asc')->get();
        return response()->json($country);
    }

    public function addMatch(request $request)
    {
        // dd($request->all());
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
        if($request->hasFile('image')){

            $image = $request->image;
            $imageName = time(). "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);
        
            // Set the image path to save in the database
            $imagePath = 'uploads/' . $imageName;

            $query = MatchList::create([
                'team_a'        => $request->teamA,
                'team_b'        => $request->teamB,
                'time'          => $request->dateTime,
                'end_date'      => $request->enddateTime,
                'image'         => $imagePath,
                'match_type'    => '1',
                'game_type'     => '1',
                'status'        => '1',
            ]);
    
            if ($query) {
                return response()->json([
                    'message' => "Successfully add New Match",
                ]);
            }
        }else{
            return response()->json(["errors" => "Image not found"], 422);
        }

        
    }
    public function matchList(request $request)
    {

        // dd($request->all());
        $query = MatchList::query()
            ->join('countries as ta', 'match_list.team_a', '=', 'ta.id')
            ->join('countries as tb', 'match_list.team_b', '=', 'tb.id')
            ->select('match_list.*', 'ta.name as teamA', 'tb.name as teamB');

        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('ta.name', 'like', "%$search%")
                    ->orWhere('tb.name', 'like', "%$search%");
            });
        }

        $data = $query->orderBy('match_list.id', 'desc')->paginate($request->items);

        $data->getCollection()->transform(function ($item) {
            $item->start_time = $item->time ? \Carbon\Carbon::parse($item->time)->format('d M Y h:i A') : null;
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
}
