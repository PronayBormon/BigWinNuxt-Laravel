<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'username',
        'email',
        'phone',
        'password',
        'role',
        'login_ip',
        'register_ip',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Relationships
    public function batsman()
    {
        return $this->hasMany(Batsman::class, 'user_id');
    }

    public function boller()
    {
        return $this->hasMany(Boller::class, 'user_id');
    }

    public function singleReport()
    {
        return $this->hasMany(SingleMatchReport::class, 'user_id', 'id');
    }

    // Add relationships for predictions
    public function semiFinalPredictions()
    {
        return $this->hasMany(SemiFinal::class, 'user_id');
    }

    public function finalPredictions()
    {
        return $this->hasMany(Finalist::class, 'user_id');
    }

    public function championPredictions()
    {
        return $this->hasMany(Champion::class, 'user_id');
    }
}
