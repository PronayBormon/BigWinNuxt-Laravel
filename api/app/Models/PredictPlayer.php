<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PredictPlayer extends Model {
    use HasFactory;

    protected $fillable = ['predict_match_id', 'predict_team_id', 'player_id'];

    public function match() {
        return $this->belongsTo(PredictMatch::class);
    }

    public function team() {
        return $this->belongsTo(PredictTeam::class, 'predict_team_id');
    }

    public function player() {
        return $this->belongsTo(TeamPlayers::class, 'player_id');
    }
}
