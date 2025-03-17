<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeamPlayers extends Model
{
    use HasFactory;
    protected $table = "team_players";

    protected $fillable  = [
        'team_id',
        'player_name',
        'player_type',
        'status',
    ];

    public function team(){
        return $this->belongsTo(Country::class, "team_id");
    }
}
