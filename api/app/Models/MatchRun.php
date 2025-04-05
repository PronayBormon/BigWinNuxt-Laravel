<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchRun extends Model
{
    use HasFactory;
    protected $table = "match_run";

    protected $fillable = [
        'match_id',
        'user_id',
        'run',
    ];
    
}
