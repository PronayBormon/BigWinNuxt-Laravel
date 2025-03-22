<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SemiFinal extends Model
{
    use HasFactory;
    protected $table ="semifinal";

    protected $fillable = [
        'match_id',
        'user_id',
        'team_id',
        'match',
        'win',
        'los',
        'tie',
        'pts',
        'status'
    ];
    public function team()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_id');
    }
    public function match_id()
    {
        return $this->belongsTo(TournamentTeam::class, 'match_id', 'id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

}
