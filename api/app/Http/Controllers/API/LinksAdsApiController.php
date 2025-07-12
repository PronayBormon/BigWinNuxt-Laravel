<?php

namespace App\Http\Controllers\API;

use App\Models\linkads;
use App\Models\SocialReward;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class LinksAdsApiController extends Controller
{

    public function saveLinkAds(Request $request)
    {
        $validate = Validator::make($request->all(), [
            "creadit"   => "required",
            "links"     => "required",
            "comments"  => "required",
        ]);

        if ($validate->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validate->errors()
            ]);
        }

        $data = linkads::create([
            "creadit"   => $request->creadit,
            "links"     => $request->links,
            "comments"  => $request->comments,
            "status"    => "active",
        ]);

        return response()->json([
            'status' => 200,
            'message' => "Link create successfull",
        ]);
    }

    public function linkAdsList()
    {
        $data = linkads::orderby('id', 'desc')->paginate(10);
        return response()->json([
            'status' => 200,
            'data' => $data
        ]);
    }

    public function activelinkAdsList()
    {
        $data = linkads::where('status', 'active')->orderby('id', 'desc')->get();
        return response()->json([
            'status' => 200,
            'data' => $data
        ]);
    }

    public function linkAdsDetails($id)
    {
        $data = linkads::where('id', $id)->first();
        return response()->json([
            'status' => 200,
            'data' => $data
        ]);
    }


    public function updateLinkAds(Request $request)
    {
        $validate = Validator::make($request->all(), [
            "id"        => "required|integer",
            "creadit"   => "required",
            "links"     => "required",
            "comments"  => "required",
            "status"    => "required|in:active,inactive",
        ]);

        if ($validate->fails()) {
            return response()->json([
                'status' => 422,
                'errors' => $validate->errors()
            ]);
        }

        $link = linkads::where('id', $request->id)->first();

        // dd($link);

        $data = $link->update([
            "creadit"   => $request->creadit,
            "links"     => $request->links,
            "comments"  => $request->comments,
            "status"    => $request->status,
        ]);

        return response()->json([
            'status' => 200,
            'message' => "Link upudate successfull",
        ]);
    }


    public function deleteLinkAds($id)
    {
        $link = linkads::where('id', $id)->first();

        $link->delete();

        return response()->json([
            'status' => 200,
            'message' => "Link delete successful",
        ]);
    }

    public function verifyFollow(Request $request)
    {
        $request->validate([
            'link_id' => 'required|integer',
            // 'platform' => 'required|string|in:facebook,instagram,youtube', // validate platform too
        ]);

        // $user = auth()->user();

        // Check if already rewarded for this platform
        $already = SocialReward::where('user_id', $request->id)
            ->where('link_id', $request->link_id)
            ->first();

        if ($already) {
            return response()->json(['message' => 'Already rewarded'], 200);
        }

        // Check if link exists
        $linkdetails = linkads::find($request->link_id);

        if (!$linkdetails) {
            return response()->json(['message' => 'Invalid link ID'], 404);
        }

        // Save reward record
        $reward = SocialReward::create([
            'user_id' => $request->id,
            'link_id' => $request->link_id,
            'rewarded' => true,
        ]);

        if ($reward) {
            // Safely add credits


            $userDetails = User::where('id', $request->id)->first();
            $total = $userDetails->credit_points + $linkdetails->creadit;
            

            // dd($total);
            $userDetails->update([
                'credit_points' => $total,
            ]);

            return response()->json(['message' => 'Successfully Submited!'], 200);
        }

        return response()->json(['message' => 'Reward not granted!'], 500);
    }

    
}
