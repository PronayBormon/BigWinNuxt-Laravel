<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FinalistResult extends Model
{
    use HasFactory;

    protected $table = "finalistresult";

    protected $fillable = [
        'match_id',
        'team_one',
        'team_two',
        'hwt',
        'hs',
        'status'
    ];

    public function team1()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_one');
    }

    public function team2()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_two');
    }
    public function teamA()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_one');
    }

    public function teamB()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_two');
    }
    public function hs()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'hs');
    }
    public function highscore()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'hs');
    }

    public function match()
    {
        return $this->belongsTo(Tournament::class, 'match_id', 'id');
    }
}
