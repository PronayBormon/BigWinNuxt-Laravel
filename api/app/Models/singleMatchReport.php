<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use PHPUnit\Framework\Constraint\Count;

class singleMatchReport extends Model
{
    use HasFactory;
    protected $table = "match_report";

    protected $fillable =[
        
        'user_id',
        'match_id',
        'predict_team_id',
        'predict_status',
        
    ];
    public function match(){
        return $this->belongsTo(MatchList::class, 'match_id', 'id');
    }
    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    public function team(){
        return $this->belongsTo(Country::class, 'predict_team_id', 'id');
    }
    public function result()
    {
        return $this->hasOne(SingleMatchResult::class, 'match_id', 'match_id');
    }
    
}
