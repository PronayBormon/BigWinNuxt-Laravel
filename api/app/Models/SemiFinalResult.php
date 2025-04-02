<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SemiFinalResult extends Model
{
    use HasFactory;

    protected $table ="semifinalresult";

    protected $fillable = [
        'match_id',
        'team_id',
        'match',
        'win',
        'los',
        'tie',
        'pts',
        'status'
    ];
}
