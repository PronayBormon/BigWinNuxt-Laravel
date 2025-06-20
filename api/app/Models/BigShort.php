<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BigShort extends Model
{
    use HasFactory;

    protected $table = 'big_shorts';

    protected $fillable = [
        'team_one',
        'team_two',
        'start_date',
        'end_date',
        'image',
        'status',
    ];


    // Relationship: team_one → country
    public function teamA()
    {
        return $this->belongsTo(Country::class, 'team_one', 'id');
    }

    // Relationship: team_two → country
    public function teamB()
    {
        return $this->belongsTo(Country::class, 'team_two', 'id');
    }
}
