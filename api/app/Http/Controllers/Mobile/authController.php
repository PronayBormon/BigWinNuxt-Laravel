<?php

namespace App\Http\Controllers\Mobile;

use App\Models\User;
use App\Models\SiteSetting;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\SendVerificationCode;
use App\Models\NotificationUser;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
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
            'status'         => "1",
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
        $user = User::where('email', $request->email)->first();
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
        } else {
            return response()->json([
                'status' => 402,
                'error' => "Creadentials dosen't match",
            ]);
        }
    }
    public function SendCode(request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['message' => "User Not found"]);
        }

        $code = rand(100000, 999999);

        // Save to cache for 10 minutes
        Cache::put('reset_code_' . $user->email, $code, now()->addMinutes(10));

        Mail::to($request->email)->send(new SendVerificationCode($code));

        return response()->json([
            'success' => true,
            'message' => 'Verification code sent to your email.',
        ]);
    }
    public function VerifyCodeAndReset(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'code' => 'required|digits:6',
            'password' => 'required|min:6|confirmed' // requires password_confirmation
        ]);

        $cachedCode = Cache::get('reset_code_' . $request->email);

        if (!$cachedCode || $cachedCode != $request->code) {
            return response()->json(['success' => false, 'message' => 'Invalid or expired code.'], 400);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['success' => false, 'message' => 'User not found.'], 404);
        }

        // Update password
        $user->password = Hash::make($request->password);
        $user->save();

        // Optionally delete the code from cache
        Cache::forget('reset_code_' . $request->email);

        return response()->json([
            'success' => true,
            'message' => 'Password reset successful.'
        ]);
    }
}
