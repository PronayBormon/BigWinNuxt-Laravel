<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;
    protected $table = "countries";
    protected $fillable = [
        'name',
        'image',
        'status',
    ];
    public function batsman(){
        return $this->hasMany(Batsman::class, 'team_id');
    }
    public function boller(){
        return $this->hasMany(Boller::class, 'team_id');
    }
        
    // Matches where this country is 'team_a'
    public function teamAMatches(){
        return $this->hasMany(MatchList::class, 'team_a', 'id');
    }

    // Matches where this country is 'team_b'
    public function teamBMatches(){
        return $this->hasMany(MatchList::class, 'team_b', 'id');
    }
    public function palyers(){
        return $this->hasMany(TeamPlayers::class, 'team_id', 'id');
    }
    public function tournament()
    {
        return $this->hasMany(Country::class, 'team_id');  
    }
    public function maxPredictTeam()
    {
        return $this->hasMany(PredictTeam::class, 'team_id'); // Assuming teams are stored in the countries table
    }

    // Get all matches where this country is either 'team_a' or 'team_b'
    public function allMatches(){
        return MatchList::where('team_a', $this->id)
                        ->orWhere('team_b', $this->id);
    }
    
}
