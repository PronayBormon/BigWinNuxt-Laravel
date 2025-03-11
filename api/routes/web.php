<?php

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Auth\AuthController;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', [UserController::class, "index"])->name('home');
Route::get('/login', [AuthController::class, "login"])->name('login');
Route::get('/registerAPI', [AuthController::class, "registerTest"])->name('reg');
Route::get('/register', [AuthController::class, "register"])->name('register');
Route::get('/forget-password', [AuthController::class, "forgetPass"])->name('forget-password');


Route::post('/newUsers', [AuthController::class, "store_user"])->name('add-user');
Route::post('/user-login', [AuthController::class, "user_login"])->name('user_login');
// For web routes
Route::post('/logout', [UserController::class, 'logout'])->name('logout');



