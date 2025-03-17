<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Batsman extends Model
{
    use HasFactory;
    protected $table ='batsman';

    protected $fillable = [
        'match_id',
        'team_id',
        'user_id',
        'player_name',
        'run',
        'ball',
        'total_4',
        'total_6',
        'status',
    ];
    public function match(){        
        return $this->belongsTo(MatchList::class, 'match_id');
    }

    public function team()
    {
        return $this->belongsTo(Country::class, 'team_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
