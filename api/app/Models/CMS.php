<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CMS extends Model
{
    use HasFactory;
    protected $table = "cms";
    protected $fillable =[
        'page',
        'section',
        'title',
        'description',
        'image',
        'section',
        'video',
    ];
}
