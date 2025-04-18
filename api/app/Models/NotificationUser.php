<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotificationUser extends Model
{
    use HasFactory;

    protected $table = "notification_user";

    protected $fillable = [
        'notification_id',
        'user_id',
        'status',
    ];

    public function message()
    {
        return $this->hasOne(Notification::class, 'id', 'notification_id');
    }
}
