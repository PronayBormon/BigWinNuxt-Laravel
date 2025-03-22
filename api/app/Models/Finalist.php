<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Finalist extends Model
{
    use HasFactory;
    protected $table = "finalist";

    protected $fillable = [
        'match_id',
        'user_id',
        'team_one',
        'team_two',
        'hwt',
        'hs',
        'status'
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function teamOne()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_one', 'id');
    }

    public function teamTwo()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_two', 'id');
    }
    public function hwt()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'hwt', 'id');
    }
    public function hs()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'hs', 'id');
    }
}
