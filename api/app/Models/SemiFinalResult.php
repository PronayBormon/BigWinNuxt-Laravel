<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SemiFinalResult extends Model
{
    use HasFactory;

    protected $table ="semifinalresult";

    protected $fillable = [
        'match_id',
        'team_id',
        'match',
        'win',
        'los',
        'tie',
        'pts',
        'status'
    ];

    public function match()
    {
        return $this->belongsTo(MatchList::class, 'match_id', 'id');
    }
    public function team()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_id');
    }
}
