<?php

namespace App\Http\Controllers\Mobile;

use App\Models\User;
use App\Models\SiteSetting;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\NotificationUser;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class authController extends Controller
{
    public function register(request $request)
    {
        
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => [
                'required',
                'string',
                'min:6',
                'regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).+$/',
                'confirmed',
            ],
        ]);

        $baseUsername = Str::slug($validatedData['name']); 
        $username = $baseUsername;

        $count = 1;

        while (User::where('username', $username)->exists()) {
            $username = $baseUsername . $count;
            $count++;
        }
        $settings = SiteSetting::first();

        $userData = User::create([
            'name'          => $validatedData['name'],
            'username'      => $username,
            'register_ip'   => $request->ip_address,
            'login_ip'      => $request->ip_address,
            'phone'         => $request->phone,
            'email'         => $validatedData['email'],
            'password'      => Hash::make($validatedData['password']),
            'Credit_Points' => $settings->register_bonus,
        ]);

        $notify = NotificationUser::create([
            'notification_id' => '1',
            'user_id' => $userData->id,
            'status' => 'unread',
        ]);

        $token = $userData->createToken('')->plainTextToken;

        return response()->json([
            'status' => 200,
            'token' => $token,
            'status' => 201,
            'message' => 'User registered successfully',
            "user"      => $userData,
        ]);
    }

    public function user_login(Request $request)
    {
        // dd($request->login_ip);

        $user = User::where('email', $request->email)->first();
        // dd($user);
        if ($user->status != 1) {
            return response()->json([
                'status' => 402,
                'error' => "Your Account Is Not Active.",
            ]);
        } elseif ($user != [] && Hash::check($request->password, $user->password)) {

            $token = $user->createToken('')->plainTextToken;
            $ip_update = $user->update([
                'login_ip' => $request->login_ip,
            ]);

            return response()->json([
                'status' => 200,
                'token' => $token,
                'user' => $user,
                'message' => "Login successfully",
            ]);
            // dd($token);
        } else {
            return response()->json([
                'status' => 402,
                'error' => "Creadentials dosen't match",
            ]);
        }
    }
}
