<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */

    public function run()
    {

        $users = [
            [
                'name' => 'admin',
                'username' => 'admin',
                'email' => 'admin@gmail.com',
                'role' => '2',
                'status' => '1',
                'password' => Hash::make('12345678'),
            ],
            [
                'name' => 'user',
                'username' => 'user',
                'email' => 'user@gmail.com',
                'role' => '1',
                'status' => '1',
                'password' => Hash::make('12345678'),
            ],
        ];

        foreach ($users as $userData) {
            // Check if user with this email or username already exists
            $exists = User::where('email', $userData['email'])
                ->orWhere('username', $userData['username'])
                ->exists();

            if (!$exists) {
                User::factory()->create($userData);
            }
        }

        $this->call(countriesSeeder::class);
        $this->call(TeamPlayersSeeder::class);
        $this->call(SiteSettingsSeeder::class);
    }
}
