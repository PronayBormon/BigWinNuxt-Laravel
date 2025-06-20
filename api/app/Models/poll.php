<?php

namespace App\Models;

use App\Models\PollOption;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class poll extends Model
{
    use HasFactory;
    protected $fillable = ['question', 'status'];

    public function options()
    {
        return $this->hasMany(PollOption::class);
    }

    public function answers()
    {
        return $this->hasMany(PollAnswer::class,'poll_id');
    }
}
