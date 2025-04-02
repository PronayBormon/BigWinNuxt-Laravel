<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChampionResult extends Model
{
    use HasFactory;

    protected $table = "championresult";

    protected $fillable = [
        'match_id',
        'team_id',
        'mom',
        'mot'
    ];
    public function match()
    {
        return $this->belongsTo(PredictMatch::class, 'match_id');
    }

    public function team()
    {
        return $this->belongsTo(PredictTeam::class, 'team_id', 'id');
    }
    
    public function mom()
    {
        return $this->belongsTo(PredictPlayer::class, 'mom', 'id');
    }
    public function mot()
    {
        return $this->belongsTo(PredictPlayer::class, 'mot', 'id');
    }
}
