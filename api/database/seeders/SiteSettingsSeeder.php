<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class SiteSettingsSeeder extends Seeder
{
    public function run()
    {
        // Check if record with id=1 exists
        $exists = DB::table('site_settings')->where('id', 1)->exists();

        if (!$exists) {
            DB::table('site_settings')->insert([
                'id' => 1,
                'website_name' => 'BigWin=Win Big',
                'logo_path' => 'uploads/1745410612.png',
                'register_bonus' => 100,
                'question_credit' => 11,
                'pull_credit' => 50,
                'spin_creadit' => 5,
                'ads_prize' => 5,
                'single_match_bonus' => '10',
                'max_predict_bonus' => '20',
                'tournament_bonus' => '30',
                'admin_email' => 'admin@gmail.com',
                'support_email' => 'support@mail.com',
                'phone' => '000000000000',
                'facebook' => 'https://web.com',
                'whatsapp' => 'https://web.com',
                'telegram' => 'https://web.com',
                'instagram' => 'https://web.com',
                'twitter' => 'https://web.com',
                'linkedin' => 'https://web.com',
                'youtube' => 'https://web.com',
                'meta_title' => 'https://web.com',
                'meta_description' => 'https://web.com',
                'meta_keywords' => 'https://web.com',
                'created_at' => Carbon::parse('2025-04-13 15:55:36'),
                'updated_at' => Carbon::parse('2025-06-01 11:48:22'),
            ]);
        }
    }
}
