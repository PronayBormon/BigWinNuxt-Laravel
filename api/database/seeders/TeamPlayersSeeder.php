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
            'Virat Kohli', 'Babar Azam', 'Rohit Sharma', 'Shakib Al Hasan', 'Rashid Khan',
            'Kane Williamson', 'Mushfiqur Rahim', 'Hardik Pandya', 'Mohammad Rizwan', 'Jasprit Bumrah',
            'Mujeeb Ur Rahman', 'Shaheen Afridi', 'Tamim Iqbal', 'KL Rahul', 'Azmatullah Omarzai',
            'Iftikhar Ahmed', 'Mehidy Hasan Miraz', 'Mustafizur Rahman', 'Yuzvendra Chahal', 'Ravindra Jadeja',
            'Mohammed Shami', 'Surya Kumar Yadav', 'Imam-ul-Haq', 'Haris Rauf', 'Naseem Shah',
            'Taskin Ahmed', 'Afif Hossain', 'Najmul Hossain Shanto', 'Mohammad Nabi', 'Litton Das',
            'Fakhar Zaman', 'Asif Ali', 'Shreyas Iyer', 'Deepak Chahar', 'Rahmat Shah',
            'Mohammad Wasim Jr', 'Shivam Dube', 'Agha Salman', 'Hashmatullah Shahidi', 'Ibrahim Zadran',
            'Gulbadin Naib', 'Rahmanullah Gurbaz', 'Sadeera Samarawickrama', 'Dinesh Chandimal', 'Angelo Mathews',
            'Kusal Mendis', 'Pathum Nissanka', 'Wanindu Hasaranga', 'Dasun Shanaka', 'Maheesh Theekshana',
            'Dunith Wellalage', 'Chamika Karunaratne', 'Lahiru Kumara', 'Dushmantha Chameera', 'Mohammad Nawaz',
            'Shan Masood', 'Washington Sundar', 'Axar Patel', 'Ruturaj Gaikwad', 'Prasidh Krishna',
            'Mohammad Haris', 'Shubman Gill', 'Arshdeep Singh', 'Sanju Samson', 'Kamindu Mendis',
            'Shoaib Malik', 'Anamul Haque', 'Yasir Ali', 'Mahmudullah Riyad', 'Mohammad Saifuddin',
            'Soumya Sarkar', 'Shoriful Islam', 'Saud Shakeel', 'Ramesh Mendis', 'Avishka Fernando',
            'Asitha Fernando', 'Kusal Perera', 'Dilshan Madushanka', 'Matheesha Pathirana', 'Nuwan Pradeep',
            'Tim Southee', 'Trent Boult', 'Lockie Ferguson', 'Martin Guptill', 'Devon Conway',
            'Tom Latham', 'Daryl Mitchell', 'Glenn Phillips', 'Finn Allen', 'Ish Sodhi',
            'Rachin Ravindra', 'Mitchell Santner', 'Ben Lister', 'Mark Chapman', 'Kyle Jamieson',
            'James Neesham', 'Will Young', 'Michael Bracewell'
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
