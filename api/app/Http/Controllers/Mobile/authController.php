<?php

namespace App\Http\Controllers\Mobile;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class authController extends Controller
{
    public function register(request $request)
    {


        // Validate the incoming request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:8|confirmed',
        ]);

        $baseUsername = Str::slug($validatedData['name']); // Convert name to slug format
        $username = $baseUsername;

        $count = 1;

        while (User::where('username', $username)->exists()) {
            $username = $baseUsername . $count;
            $count++;
        }

        $userData = User::create([
            'name'          => $validatedData['name'],
            'username'      => $username,
            'register_ip'   => $request->ip_address,
            'login_ip'      => $request->ip_address,
            'email'         => $validatedData['email'],
            'password'      => Hash::make($validatedData['password']),
        ]);

        return response()->json([
            'status' => 201,
            'message' => 'User registered successfully',
            "data"      => $userData,
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
