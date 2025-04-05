<?php

namespace App\Models;

use App\Models\Batsman;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MatchList extends Model
{
    use HasFactory;

    protected $table = "match_list";

    protected $fillable = [
        'team_a',
        'team_b',
        'time',
        'end_date',
        'match_type',
        'game_type',
        'status',
        'image',
    ];
    
    // Each match belongs to a Country (Team A)
    public function teamA(){
        return $this->belongsTo(Country::class, 'team_a', 'id');
    }

    // Each match belongs to a Country (Team B)
    public function teamB(){
        return $this->belongsTo(Country::class, 'team_b', 'id');
    }
    public function report(){
        return $this->hasMany(singleMatchReport::class, 'match_id', 'id');
    }
    
  
    // public function batsman()
    // {
    //     return $this->hasMany(Batsman::class, 'match_id');
    // }

    // public function boller(){
    //     return $this->hasMany(Boller::class, 'match_id');
    // }
}
