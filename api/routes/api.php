<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Mobile\authController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/add-account', [authController::class, 'register']);
Route::post('/login', [authController::class, 'user_login']);

Route::middleware('auth:sanctum')->post('api/logout', function (Request $request) {
    // Delete current token
    $request->user()->currentAccessToken()->delete();
    return response()->json(['message' => 'Logged out successfully']);
});

Route::prefix('api')->middleware('isAdmin')->group(function () {
    Route::post('/user-list', [UserController::class, 'userList'])->name('user.list');
    Route::post('/user-data/{id}', [UserController::class, 'user_data']);
    Route::post('/update', [UserController::class, 'updateUser']);


    Route::post('/add-country', [UserController::class, 'addNewCountry']);
    Route::post('/get-country', [UserController::class, 'getCountryList']);
    Route::delete('/delete-country/{id}', [UserController::class, 'removeCountry']);
    Route::post('/add-match', [UserController::class, 'addMatch']);
    Route::get('/getteamlist', [UserController::class, 'getTemaList']);
    Route::post('/add-prize-banner', [AdminController::class, 'addPrizeBanner']);
});
