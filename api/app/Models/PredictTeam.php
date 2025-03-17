<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PredictTeam extends Model {
    use HasFactory;

    protected $fillable = ['predict_match_id', 'country_id'];

    public function match() {
        return $this->belongsTo(PredictMatch::class);
    }

    public function country() {
        return $this->belongsTo(Country::class, "country_id");
    }

    public function players() {
        return $this->hasMany(PredictPlayer::class);
    }
}
