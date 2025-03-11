<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $token = $request->bearerToken(); // Get token from Authorization header

        if (!$token) {
            return response()->json(['error' => 'No token provided'], 401);
        }

        $user = Auth::guard('api')->user();

        if (!$user) {
            return response()->json(['error' => 'Invalid token'], 401);
        }
        $role = $user->role;
        // dd($role);
        if ($role != 2) {
            return response()->json(['error' => 'You are not an admin'], 403);
        }

        return $next($request);
    }
}
