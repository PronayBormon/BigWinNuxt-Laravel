<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\CMS;
use App\Enums\Page;
use Illuminate\Http\Request;

class CMSController extends Controller
{
    public function matchPage(Request $request)
    {
        $data = CMS::where('page', Page::SingleMatchPage)->first();
        if ($request->has('image')) {
            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('cms'), $imageName);
            $path = "cms/" . $imageName;
            CMS::updateOrCreate([
                'page' => Page::SingleMatchPage,
            ], [
                'image' => $path,
            ]);
            if ($data) {
                return response()->json(['message' => "Cms Updated Successfully"]);
            }
        }else{
            
            return response()->json(['error' => "Cms Updated Successfully"],422);
        }
    }
    public function matchPageimage(){        
        $data = CMS::where('page', Page::SingleMatchPage)->first();
        $image = url($data->image);
        return response()->json(['image' => $image]);
    }
    public function MaxPredictPage(Request $request)
    {
        $data = CMS::where('page', Page::MaxPredictPage)->first();
        if ($request->has('image')) {
            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('cms'), $imageName);
            $path = "cms/" . $imageName;
            CMS::updateOrCreate([
                'page' => Page::MaxPredictPage,
            ], [
                'image' => $path,
            ]);
            if ($data) {
                return response()->json(['message' => "Cms Updated Successfully"]);
            }
        }else{
            
            return response()->json(['error' => "Cms Updated Successfully"],422);
        }
    }  
    public function MaxPredictPageimage(){        
        $data = CMS::where('page', Page::MaxPredictPage)->first();
        $image = url($data->image);
        return response()->json(['image' => $image]);
    }
    public function WalletPagetPage(Request $request)
    {
        $data = CMS::where('page', Page::WalletPage)->first();
        if ($request->has('image')) {
            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('cms'), $imageName);
            $path = "cms/" . $imageName;
            CMS::updateOrCreate([
                'page' => Page::WalletPage,
            ], [
                'image' => $path,
            ]);
            if ($data) {
                return response()->json(['message' => "Cms Updated Successfully"]);
            }
        }else{
            
            return response()->json(['error' => "Cms Updated Successfully"],422);
        }
    }
    public function WalletPagetPageimage(){        
        $data = CMS::where('page', Page::WalletPage)->first();
        $image = url($data->image);
        return response()->json(['image' => $image]);
    }
    public function WinnerPage(Request $request)
    {
        $data = CMS::where('page', Page::WinnerPage)->first();
        if ($request->has('image')) {
            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('cms'), $imageName);
            $path = "cms/" . $imageName;
            CMS::updateOrCreate([
                'page' => Page::WinnerPage,
            ], [
                'image' => $path,
            ]);
            if ($data) {
                return response()->json(['message' => "Cms Updated Successfully"]);
            }
        }else{
            
            return response()->json(['error' => "Cms Updated Successfully"],422);
        }
    }
    public function WinnerPageimage(){        
        $data = CMS::where('page', Page::WinnerPage)->first();
        $image = url($data->image);
        return response()->json(['image' => $image]);
    }
    public function ProfilePage(Request $request)
    {
        $data = CMS::where('page', Page::ProfilePage)->first();
        if ($request->has('image')) {
            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('cms'), $imageName);
            $path = "cms/" . $imageName;
            CMS::updateOrCreate([
                'page' => Page::ProfilePage,
            ], [
                'image' => $path,
            ]);
            if ($data) {
                return response()->json(['message' => "Cms Updated Successfully"]);
            }
        }else{
            
            return response()->json(['error' => "Cms Updated Successfully"],422);
        }
    }
    public function ProfilePageimage(){        
        $data = CMS::where('page', Page::ProfilePage)->first();
        $image = url($data->image);
        return response()->json(['image' => $image]);
    }


}
