<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrizeBanner extends Model
{
    use HasFactory;
    protected $table = 'prize_banner';
    protected $fillable = [
        'name',
        'banner',
        'type',
        'status',
    ];
}
