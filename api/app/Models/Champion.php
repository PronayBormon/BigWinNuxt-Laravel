<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Champion extends Model
{
    use HasFactory;

    protected $table = "champion";

    protected $fillable = [
        'match_id',
        'user_id',
        'team_id',
        'mom',
        'mot'
    ];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    public function team()
    {
        return $this->belongsTo(TournamentTeam::class, 'team_id', 'id');
    }
    public function mom()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'mom', 'id');
    }
    public function mot()
    {
        return $this->belongsTo(TournamentTeamsPlayers::class, 'mot', 'id');
    }
}
