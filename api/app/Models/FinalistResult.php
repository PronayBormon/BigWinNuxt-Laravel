<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FinalistResult extends Model
{
    use HasFactory;

    protected $table = "finalistresult";

    protected $fillable = [
        'match_id',
        'team_one',
        'team_two',
        'hwt',
        'hs',
        'status'
    ];
}
