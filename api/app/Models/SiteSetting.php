<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    use HasFactory;
    protected $fillable = [
        'website_name',
        'logo_path',
        'register_bonus',
        'single_match_bonus',
        'max_predict_bonus',
        'tournament_bonus',
        'admin_email',
        'support_email',
        'phone',
        'facebook',
        'whatsapp',
        'telegram',
        'instagram',
        'twitter',
        'linkedin',
        'youtube',
        'meta_title',
        'meta_description',
        'meta_keywords'
    ];
}
