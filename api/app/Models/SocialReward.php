<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialReward extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id',
        'platform',
        'rewarded',
        'link_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
