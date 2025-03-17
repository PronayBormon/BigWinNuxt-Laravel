<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TournamentTeam extends Model
{
    use HasFactory;

    protected $table = 'tournament_teams';

    protected $fillable = [
        'tournament_id',
        'team_id',
        'status',
    ];

    public function tournament()
    {
        return $this->belongsTo(Tournament::class, 'tournament_id');
    }

    public function team()
    {
        return $this->belongsTo(Country::class, 'team_id'); // Assuming teams are stored in the countries table
    }
    public function players()
    {
        return $this->hasMany(TournamentTeamsPlayers::class, 'tournament_team_id');
    }
}
