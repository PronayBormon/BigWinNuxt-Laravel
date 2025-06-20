<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\TeamPlayers;

class TeamPlayersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // List of top 100 Asian players
        $players = [
            // 🇮🇳 India
            'Virat Kohli',
            'Rohit Sharma',
            'KL Rahul',
            'Shubman Gill',
            'Ishan Kishan',
            'Suryakumar Yadav',
            'Shreyas Iyer',
            'Ruturaj Gaikwad',
            'Sanju Samson',
            'Manish Pandey',
            'Hardik Pandya',
            'Ravindra Jadeja',
            'Axar Patel',
            'Washington Sundar',
            'Deepak Hooda',
            'Kuldeep Yadav',
            'Yuzvendra Chahal',
            'Mohammed Shami',
            'Jasprit Bumrah',
            'Arshdeep Singh',
            'Prasidh Krishna',
            'Umesh Yadav',
            'Deepak Chahar',
            'Bhuvneshwar Kumar',
            'Jaydev Unadkat',
            'Khaleel Ahmed',
            'Shardul Thakur',
            'Varun Chakravarthy',
            'Nitish Rana',
            'Venkatesh Iyer',

            // 🇵🇰 Pakistan
            'Babar Azam',
            'Mohammad Rizwan',
            'Fakhar Zaman',
            'Shan Masood',
            'Imam-ul-Haq',
            'Abdullah Shafique',
            'Asif Ali',
            'Iftikhar Ahmed',
            'Shadab Khan',
            'Mohammad Nawaz',
            'Mohammad Haris',
            'Shoaib Malik',
            'Mohammad Hafeez',
            'Sarfaraz Ahmed',
            'Agha Salman',
            'Mohammad Wasim Jr',
            'Haris Rauf',
            'Shaheen Afridi',
            'Naseem Shah',
            'Hasan Ali',
            'Abrar Ahmed',
            'Usama Mir',
            'Zaman Khan',

            // 🇧🇩 Bangladesh
            'Shakib Al Hasan',
            'Tamim Iqbal',
            'Mushfiqur Rahim',
            'Mahmudullah Riyad',
            'Litton Das',
            'Anamul Haque',
            'Soumya Sarkar',
            'Afif Hossain',
            'Najmul Hossain Shanto',
            'Yasir Ali',
            'Shoriful Islam',
            'Mustafizur Rahman',
            'Mehidy Hasan Miraz',
            'Taskin Ahmed',
            'Nasum Ahmed',
            'Mohammad Saifuddin',
            'Taijul Islam',
            'Naim Sheikh',
            'Mohammad Mithun',
            'Rubel Hossain',

            // 🇱🇰 Sri Lanka
            'Kusal Mendis',
            'Angelo Mathews',
            'Dinesh Chandimal',
            'Charith Asalanka',
            'Pathum Nissanka',
            'Kusal Perera',
            'Avishka Fernando',
            'Dasun Shanaka',
            'Dhananjaya de Silva',
            'Wanindu Hasaranga',
            'Maheesh Theekshana',
            'Dunith Wellalage',
            'Chamika Karunaratne',
            'Lahiru Kumara',
            'Dushmantha Chameera',
            'Dilshan Madushanka',
            'Kasun Rajitha',
            'Asitha Fernando',
            'Binura Fernando',
            'Niroshan Dickwella',
            'Jeffrey Vandersay',
            'Ramesh Mendis',

            // 🇦🇫 Afghanistan
            'Rashid Khan',
            'Mohammad Nabi',
            'Rahmanullah Gurbaz',
            'Ibrahim Zadran',
            'Hazratullah Zazai',
            'Najibullah Zadran',
            'Azmatullah Omarzai',
            'Gulbadin Naib',
            'Hashmatullah Shahidi',
            'Karim Janat',
            'Zahir Khan',
            'Noor Ahmad',
            'Fareed Ahmad',
            'Qais Ahmad',

            // 🇳🇿 New Zealand
            'Kane Williamson',
            'Devon Conway',
            'Tom Latham',
            'Daryl Mitchell',
            'Glenn Phillips',
            'Finn Allen',
            'Martin Guptill',
            'Will Young',
            'Michael Bracewell',
            'James Neesham',
            'Mark Chapman',
            'Kyle Jamieson',
            'Tim Southee',
            'Trent Boult',
            'Lockie Ferguson',
            'Ish Sodhi',
            'Rachin Ravindra',
            'Mitchell Santner',
            'Ben Lister',
            'Adam Milne',

            // 🇿🇦 South Africa
            'Quinton de Kock',
            'Temba Bavuma',
            'Aiden Markram',
            'Rassie van der Dussen',
            'David Miller',
            'Heinrich Klaasen',
            'Reeza Hendricks',
            'Tristan Stubbs',
            'Marco Jansen',
            'Wayne Parnell',
            'Kagiso Rabada',
            'Lungi Ngidi',
            'Anrich Nortje',
            'Tabraiz Shamsi',
            'Keshav Maharaj',
            'Gerald Coetzee',
            'Andile Phehlukwayo',
            'Bjorn Fortuin',
            'Lizaad Williams',
            'Tony de Zorzi',

            // 🇦🇺 Australia
            'David Warner',
            'Travis Head',
            'Steve Smith',
            'Marnus Labuschagne',
            'Glenn Maxwell',
            'Marcus Stoinis',
            'Cameron Green',
            'Josh Inglis',
            'Alex Carey',
            'Tim David',
            'Pat Cummins',
            'Mitchell Starc',
            'Josh Hazlewood',
            'Nathan Lyon',
            'Adam Zampa',
            'Sean Abbott',
            'Ashton Agar',
            'Michael Neser',
            'Matthew Wade',
            'Aaron Finch'
        ];


        // Insert players into the database
        foreach ($players as $player) {
            TeamPlayers::create([
                'player_name' => $player,
                'status' => 1, // Active player
            ]);
        }
    }
}
