<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class linkads extends Model
{
    use HasFactory;

    protected $fillable = [
        "creadit",
        "links",
        "comments",
        "status",
    ];

    
}
