<?php

namespace Database\Seeders;

use App\Models\Country;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // List of all cricket-playing nations (Full Members + Major Associate Members)
        $countries = [
            // ✅ ICC Full Members
            ['name' => 'Afghanistan', 'image' => 'afghanistan.png'],
            ['name' => 'Australia', 'image' => 'australia.png'],
            ['name' => 'Bangladesh', 'image' => 'bangladesh.png'],
            ['name' => 'England', 'image' => 'england.png'],
            ['name' => 'India', 'image' => 'india.png'],
            ['name' => 'Ireland', 'image' => 'ireland.png'],
            ['name' => 'New Zealand', 'image' => 'new_zealand.png'],
            ['name' => 'Pakistan', 'image' => 'pakistan.png'],
            ['name' => 'South Africa', 'image' => 'south_africa.png'],
            ['name' => 'Sri Lanka', 'image' => 'sri_lanka.png'],
            ['name' => 'West Indies', 'image' => 'west_indies.png'],
            ['name' => 'Zimbabwe', 'image' => 'zimbabwe.png'],

            // ✅ ICC Associate Members (Top teams)
            ['name' => 'Nepal', 'image' => 'nepal.png'],
            ['name' => 'United Arab Emirates', 'image' => 'uae.png'],
            ['name' => 'Oman', 'image' => 'oman.png'],
            ['name' => 'Scotland', 'image' => 'scotland.png'],
            ['name' => 'Netherlands', 'image' => 'netherlands.png'],
            ['name' => 'Namibia', 'image' => 'namibia.png'],
            ['name' => 'Papua New Guinea', 'image' => 'png.png'],
            ['name' => 'Hong Kong', 'image' => 'hong_kong.png'],
            ['name' => 'United States', 'image' => 'usa.png'],
            ['name' => 'Canada', 'image' => 'canada.png'],
            ['name' => 'Bermuda', 'image' => 'bermuda.png'],
            ['name' => 'Qatar', 'image' => 'qatar.png'],
            ['name' => 'Malaysia', 'image' => 'malaysia.png'],
            ['name' => 'Kuwait', 'image' => 'kuwait.png'],
            ['name' => 'Singapore', 'image' => 'singapore.png'],
            ['name' => 'Botswana', 'image' => 'botswana.png'],
            ['name' => 'Germany', 'image' => 'germany.png'],
            ['name' => 'Jersey', 'image' => 'jersey.png'],
            ['name' => 'Kenya', 'image' => 'kenya.png'],
            ['name' => 'Tanzania', 'image' => 'tanzania.png'],
            ['name' => 'Uganda', 'image' => 'uganda.png'],
            ['name' => 'Vanuatu', 'image' => 'vanuatu.png'],
        ];

        // Insert into the database
        foreach ($countries as $country) {
            Country::create([
                'name' => $country['name'],
                'image' => $country['image'],
                'status' => 1, // Active status
            ]);
        }
    }
}
