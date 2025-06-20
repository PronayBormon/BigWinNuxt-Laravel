<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function index()
    {
        return response()->json(['message' => 'Hello, World!']);
    }
    public function login(){
        return view('Auth.login');
    }
    public function registerTest(){
        return view('Auth.registerAPI');
    }
    public function register(){
        return view('Auth.register');
    }
    public function forgetPass(){
        return view('Auth.forget-pass');
    }
    public function store_user(Request $request)
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
            'status'        => "1",
            'email'         => $validatedData['email'],
            'password'      => Hash::make($validatedData['password']),
        ]);
    

        return redirect()->back()->with('success', 'Successfully created a new user');
    }
    public function user_login(Request $request)
    {        

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            return redirect()->intended('/');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ]);
    }
}
