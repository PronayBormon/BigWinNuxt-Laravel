<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BatsmanResult extends Model
{
    use HasFactory;
    protected $table = "batsmanresult";

    protected $fillable = [
        'match_id',
        'team_id',
        'player_id',
        'run',
        'ball',
        'total_4',
        'total_6'
    ];

    
    public function match()
    {
        return $this->belongsTo(PredictMatch::class, 'match_id');
    }

    public function team()
    {
        return $this->belongsTo(PredictTeam::class, 'team_id', 'id');
    }
    
    public function TeamPlayers()
    {
        return $this->belongsTo(PredictPlayer::class, 'player_id', 'id');
    }
}
