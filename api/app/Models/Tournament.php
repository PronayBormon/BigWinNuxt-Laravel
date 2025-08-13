<?php

namespace App\Models;

use App\Models\TournamentTeam;
use App\Models\TournamentTeamsPlayers;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Tournament extends Model
{
    use HasFactory;

    protected $table = 'tournaments';

    protected $fillable = [
        'name',
        'start_date',
        'end_date',
        'image',
        'status',
    ];

    public function teams()
    {
        return $this->hasMany(TournamentTeam::class, 'tournament_id');
    }
    public function players()
    {
        return $this->hasMany(TournamentTeamsPlayers::class, 'tournament_id');
    }
    public function champion()
    {
        return $this->hasOne(Champion::class, 'match_id');
    }

    

    // public function getImageAttribute($v){
    //     if(Request::is('api/*')){
    //         return url($v);
    //     }
    //     return $v;
    // }
}
