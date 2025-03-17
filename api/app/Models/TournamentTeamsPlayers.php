<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TournamentTeamsPlayers extends Model
{
    use HasFactory;

    protected $table = 'tournament_teams_players';

    protected $fillable = [
        'tournament_team_id',
        'tournament_id',
        'player_id',
    ];

    public function tournamentTeam()
    {
        return $this->belongsTo(TournamentTeam::class, 'tournament_team_id');
    }

    public function player()
    {
        return $this->belongsTo(TeamPlayers::class, 'player_id'); // Assuming Player model exists
    }
}
