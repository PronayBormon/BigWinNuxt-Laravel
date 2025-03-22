<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tournament extends Model
{
    use HasFactory;

    protected $table = 'tournaments';

    protected $fillable = [
        'name',
        'start_date',
        'end_date',
        'status',
    ];

    public function teams()
    {
        return $this->hasMany(TournamentTeam::class, 'tournament_id');
    }
    public function players()
    {
        return $this->hasMany(TournamentTeamsPlayers::class, 'tournament_id');
    }
}
