<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class countriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // DB::table('countries')->insert([
        //     ['id' => 48, 'name' => 'India', 'image' => '183903118.png', 'status' => 1, 'created_at' => '2025-04-04 19:12:56', 'updated_at' => '2025-04-04 19:12:56'],
        //     ['id' => 49, 'name' => 'Pakistan', 'image' => '1221114629.png', 'status' => 1, 'created_at' => '2025-04-04 19:13:18', 'updated_at' => '2025-04-04 19:13:18'],
        //     ['id' => 50, 'name' => 'Australia', 'image' => '86463351.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:13:54', 'updated_at' => '2025-04-04 19:13:54'],
        //     ['id' => 51, 'name' => 'England', 'image' => '28099063.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:14:22', 'updated_at' => '2025-04-04 19:14:22'],
        //     ['id' => 52, 'name' => 'West Indies', 'image' => '1638743264.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:14:45', 'updated_at' => '2025-04-04 19:14:45'],
        //     ['id' => 53, 'name' => 'South Africa', 'image' => '2117990730.png', 'status' => 1, 'created_at' => '2025-04-04 19:15:05', 'updated_at' => '2025-04-04 19:15:05'],
        //     ['id' => 54, 'name' => 'New Zealand', 'image' => '1467618457.png', 'status' => 1, 'created_at' => '2025-04-04 19:15:22', 'updated_at' => '2025-04-04 19:15:22'],
        //     ['id' => 55, 'name' => 'Sri Lanka', 'image' => '508868760.png', 'status' => 1, 'created_at' => '2025-04-04 19:15:58', 'updated_at' => '2025-04-04 19:15:58'],
        //     ['id' => 56, 'name' => 'Bangladesh', 'image' => '198824309.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:16:16', 'updated_at' => '2025-04-04 19:16:16'],
        //     ['id' => 57, 'name' => 'Afghanistan', 'image' => '2013001144.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:16:31', 'updated_at' => '2025-04-04 19:16:31'],
        //     ['id' => 58, 'name' => 'Zimbabwe', 'image' => '1314592742.png', 'status' => 1, 'created_at' => '2025-04-04 19:16:48', 'updated_at' => '2025-04-04 19:16:48'],
        //     ['id' => 59, 'name' => 'Ireland', 'image' => '1365042192.png', 'status' => 1, 'created_at' => '2025-04-04 19:17:12', 'updated_at' => '2025-04-04 19:17:12'],
        //     ['id' => 60, 'name' => 'Scotland', 'image' => '29602780.jpg', 'status' => 1, 'created_at' => '2025-04-04 19:17:29', 'updated_at' => '2025-04-04 19:17:29'],
        //     ['id' => 61, 'name' => 'Netherlands', 'image' => '1386039070.png', 'status' => 1, 'created_at' => '2025-04-04 19:17:44', 'updated_at' => '2025-04-04 19:17:44'],
        //     ['id' => 62, 'name' => 'Namibia', 'image' => '1062870303.png', 'status' => 1, 'created_at' => '2025-04-04 19:18:19', 'updated_at' => '2025-04-04 19:18:19'],
        //     ['id' => 63, 'name' => 'UAE', 'image' => '820332060.png', 'status' => 1, 'created_at' => '2025-04-04 19:18:32', 'updated_at' => '2025-04-04 19:18:32'],
        //     ['id' => 65, 'name' => 'Nepal', 'image' => '1071760655.png', 'status' => 1, 'created_at' => '2025-04-04 19:19:05', 'updated_at' => '2025-04-04 19:19:05'],
        //     ['id' => 66, 'name' => 'USA', 'image' => '1672732692.png', 'status' => 1, 'created_at' => '2025-04-04 19:19:22', 'updated_at' => '2025-04-04 19:19:22'],
        //     ['id' => 67, 'name' => 'Oman', 'image' => '2053599473.png', 'status' => 1, 'created_at' => '2025-04-04 19:19:42', 'updated_at' => '2025-04-04 19:19:42'],
        //     ['id' => 68, 'name' => 'PNG', 'image' => '955292146.png', 'status' => 1, 'created_at' => '2025-04-04 19:19:59', 'updated_at' => '2025-04-04 19:19:59'],
        //     ['id' => 69, 'name' => 'Canada', 'image' => '813515040.png', 'status' => 1, 'created_at' => '2025-04-04 19:20:15', 'updated_at' => '2025-04-04 19:20:15'],
        //     ['id' => 70, 'name' => 'Lahore Qalandars', 'image' => '1235794920.png', 'status' => 1, 'created_at' => '2025-04-04 19:37:42', 'updated_at' => '2025-04-04 19:37:42'],
        //     ['id' => 71, 'name' => 'Karachi Kings', 'image' => '1413710988.png', 'status' => 1, 'created_at' => '2025-04-04 19:38:03', 'updated_at' => '2025-04-04 19:38:03'],
        //     ['id' => 72, 'name' => 'Islamabad United', 'image' => '658878190.png', 'status' => 1, 'created_at' => '2025-04-04 19:38:24', 'updated_at' => '2025-04-04 19:38:24'],
        //     ['id' => 73, 'name' => 'Peshawar Zalmi', 'image' => '700357201.png', 'status' => 1, 'created_at' => '2025-04-04 19:38:50', 'updated_at' => '2025-04-04 19:38:50'],
        //     ['id' => 74, 'name' => 'Quetta Gladiators', 'image' => '310917500.png', 'status' => 1, 'created_at' => '2025-04-04 19:39:16', 'updated_at' => '2025-04-04 19:39:16'],
        //     ['id' => 75, 'name' => 'Multan Sultans', 'image' => '20888909.png', 'status' => 1, 'created_at' => '2025-04-04 19:39:40', 'updated_at' => '2025-04-04 19:39:40'],
        //     ['id' => 76, 'name' => 'Sydney Sixers', 'image' => '847026229.png', 'status' => 1, 'created_at' => '2025-04-04 20:13:10', 'updated_at' => '2025-04-04 20:13:10'],
        //     ['id' => 77, 'name' => 'Sydney Thunder', 'image' => '1743476068.png', 'status' => 1, 'created_at' => '2025-04-04 20:13:30', 'updated_at' => '2025-04-04 20:13:30'],
        //     ['id' => 78, 'name' => 'Melbourne Stars', 'image' => '1889465609.png', 'status' => 1, 'created_at' => '2025-04-04 20:13:51', 'updated_at' => '2025-04-04 20:13:51'],
        //     ['id' => 79, 'name' => 'Melbourne Renegades', 'image' => '80649637.png', 'status' => 1, 'created_at' => '2025-04-04 20:14:12', 'updated_at' => '2025-04-04 20:14:12'],
        //     ['id' => 80, 'name' => 'Brisbane Heat', 'image' => '1200610315.png', 'status' => 1, 'created_at' => '2025-04-04 20:14:33', 'updated_at' => '2025-04-04 20:14:33'],
        //     ['id' => 81, 'name' => 'Adelaide Strikers', 'image' => '1595626676.png', 'status' => 1, 'created_at' => '2025-04-04 20:15:07', 'updated_at' => '2025-04-04 20:15:07'],
        //     ['id' => 82, 'name' => 'Perth Scorchers', 'image' => '1992450081.png', 'status' => 1, 'created_at' => '2025-04-04 20:15:38', 'updated_at' => '2025-04-04 20:15:38'],
        //     ['id' => 83, 'name' => 'Hobart Hurricanes', 'image' => '1625087571.png', 'status' => 1, 'created_at' => '2025-04-04 20:16:12', 'updated_at' => '2025-04-04 20:16:12'],
        // ]);
        $countries = [
            ['id' => 48, 'name' => 'India', 'image' => '183903118.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 49, 'name' => 'Pakistan', 'image' => '1221114629.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 50, 'name' => 'Australia', 'image' => '86463351.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 51, 'name' => 'England', 'image' => '28099063.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 52, 'name' => 'West Indies', 'image' => '1638743264.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 53, 'name' => 'South Africa', 'image' => '2117990730.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 54, 'name' => 'New Zealand', 'image' => '1467618457.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 55, 'name' => 'Sri Lanka', 'image' => '508868760.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 56, 'name' => 'Bangladesh', 'image' => '198824309.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 57, 'name' => 'Afghanistan', 'image' => '2013001144.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 58, 'name' => 'Zimbabwe', 'image' => '1314592742.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 59, 'name' => 'Ireland', 'image' => '1365042192.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 60, 'name' => 'Scotland', 'image' => '29602780.jpg', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 61, 'name' => 'Netherlands', 'image' => '1386039070.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 62, 'name' => 'Namibia', 'image' => '1062870303.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 63, 'name' => 'UAE', 'image' => '820332060.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 65, 'name' => 'Nepal', 'image' => '1071760655.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 66, 'name' => 'USA', 'image' => '1672732692.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 67, 'name' => 'Oman', 'image' => '2053599473.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 68, 'name' => 'PNG', 'image' => '955292146.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 69, 'name' => 'Canada', 'image' => '813515040.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 70, 'name' => 'Lahore Qalandars', 'image' => '1235794920.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 71, 'name' => 'Karachi Kings', 'image' => '1413710988.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 72, 'name' => 'Islamabad United', 'image' => '658878190.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 73, 'name' => 'Peshawar Zalmi', 'image' => '700357201.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 74, 'name' => 'Quetta Gladiators', 'image' => '310917500.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 75, 'name' => 'Multan Sultans', 'image' => '20888909.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 76, 'name' => 'Sydney Sixers', 'image' => '847026229.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 77, 'name' => 'Sydney Thunder', 'image' => '1743476068.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 78, 'name' => 'Melbourne Stars', 'image' => '1889465609.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 79, 'name' => 'Melbourne Renegades', 'image' => '80649637.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 80, 'name' => 'Brisbane Heat', 'image' => '1200610315.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 81, 'name' => 'Adelaide Strikers', 'image' => '1595626676.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 82, 'name' => 'Perth Scorchers', 'image' => '1992450081.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['id' => 83, 'name' => 'Hobart Hurricanes', 'image' => '1625087571.png', 'status' => 1, 'created_at' => now(), 'updated_at' => now()],
        ];

        DB::table('countries')->upsert(
            $countries,
            ['id'], // Unique by 'id'
            ['name', 'image', 'status', 'updated_at'] // Columns to update if exists
        );
    }
}
