<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BallerResult extends Model
{
    use HasFactory;

    protected $table = "ballerresult";

    protected $fillable = [
        'match_id',
        'team_id',
        'player_id',
        'over',
        'maden_over',
        'run',
        'wicket'
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
