<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class DynamicPageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $pages = [
            [
                'title' => 'Rules',
                'slug' => Str::slug('Rules'),
                'description' => 'This page explains the rules of the application.',
            ],
            [
                'title' => 'App Link',
                'slug' => Str::slug('App Link'),
                'description' => 'This page provides the download link for the mobile app.',
            ],
        ];

        foreach ($pages as $page) {
            $exists = DB::table('dynamic_pages')
                ->where('slug', $page['slug'])
                ->exists();

            if (!$exists) {
                DB::table('dynamic_pages')->insert([
                    'title' => $page['title'],
                    'slug' => $page['slug'],
                    'description' => $page['description'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
