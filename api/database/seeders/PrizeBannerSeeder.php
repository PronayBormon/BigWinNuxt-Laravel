<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class PrizeBannerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         $banners = [
            [
                'id' => 1,
                'name' => 'asdfasdf',
                'banner' => '1750258965.jpg',
                'status' => 1,
                'created_at' => '2025-06-18 15:02:45',
                'updated_at' => '2025-06-18 15:02:45',
                'type' => 2,
            ],
            [
                'id' => 2,
                'name' => 'Maiores qui voluptas',
                'banner' => '1750258987.png',
                'status' => 1,
                'created_at' => '2025-06-18 15:03:07',
                'updated_at' => '2025-06-18 15:03:07',
                'type' => 1,
            ],
            [
                'id' => 3,
                'name' => 'fasd',
                'banner' => '1750259058.jpeg',
                'status' => 1,
                'created_at' => '2025-06-18 15:04:18',
                'updated_at' => '2025-06-18 15:04:18',
                'type' => 3,
            ],
        ];

        foreach ($banners as $banner) {
            DB::table('prize_banner')->updateOrInsert(
                ['id' => $banner['id']], // Check for existing by ID
                $banner // Insert or update with this data
            );
        }
    }
}
