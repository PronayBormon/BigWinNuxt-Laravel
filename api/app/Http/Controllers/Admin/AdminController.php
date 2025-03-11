<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PrizeBanner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    public function addPrizeBanner(Request $request){
        dd($request->all());
        $validate = Validator::make($request->all(), [
            'name' => 'required||string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'type' => 'integer||required',
        ]);
        if($validate->fails()){
            return response()->json($validate->errors());
        }

        if($request->hasFile('image')){

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
}
