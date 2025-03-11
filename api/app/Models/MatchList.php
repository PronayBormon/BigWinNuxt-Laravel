<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchList extends Model
{
    use HasFactory;

    protected $table = "match_list";

    protected $fillable = [
        'team-a',
        'team-b',
        'time',
        'match_type',
        'game_type',
        'status',
    ];
}
