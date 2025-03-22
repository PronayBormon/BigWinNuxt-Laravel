<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TournamentParticipant extends Model
{
    use HasFactory;
    protected $table = "tournament_participant";
    protected $fillable =[
        'tournament_id',
        'user_id',
    ];

    public function Tournament(){
        return $this->belongsTo(Tournament::class, "tournament_id");
    }
    public function user(){
        return $this->belongsTo(User::class, "user_id");
    }
}
