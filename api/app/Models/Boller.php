<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Boller extends Model
{
    use HasFactory;

    protected $table = 'boller';

    protected $fillable = [
        'match_id',
        'team_id',
        'user_id',
        'player_id',
        'over',
        'maden_over',
        'run',
        'wicket',
        'status',
    ];

    public function result()
    {
        return $this->belongsTo(BallerResult::class, 'player_id');
    }

    public function match()
    {
        return $this->belongsTo(PredictMatch::class, 'match_id');
    }

    public function team()
    {
        return $this->belongsTo(PredictTeam::class, 'team_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function TeamPlayers()
    {
        return $this->belongsTo(PredictPlayer::class, 'player_id', 'id');
    }
}
