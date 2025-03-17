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
        'player_name',
        'over',
        'maden_over',
        'run',
        'wicket',
        'status',
    ];

    public function match()
    {
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
