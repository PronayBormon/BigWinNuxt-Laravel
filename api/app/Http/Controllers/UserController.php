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

        $country = Country::where('status', '1')->orderby('id', 'desc')->get();
        return response()->json($country);
    }

    public function addMatch(request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            "teamA" => "required|integer",
            "teamB" => "required|integer",
            "dateTime" => "required",
        ]);

        if ($validate->fails()) {
            return response()->json(["errors" => $validate->errors()], 422);
        }

        $query = MatchList::create([
            'team-a'        => $request->teamA,
            'team-b'        => $request->teamB,
            'time'          => $request->dateTime,
            'match_type'    => '1',
            'game_type'     => '1',
            'status'        => '1',
        ]);

        if($query){
            return response()->json([
                'message' => "Successfully add New Match",
            ]);
        }
    }
}
