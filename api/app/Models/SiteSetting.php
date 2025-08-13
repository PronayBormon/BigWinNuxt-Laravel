<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    use HasFactory;
    protected $fillable = [
        'website_name',
        'ads_prize',
        'logo_path',
        'register_bonus',
        'question_credit',
        'pull_credit',
        'spin_creadit',
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
