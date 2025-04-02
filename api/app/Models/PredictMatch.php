<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PredictMatch extends Model {
    use HasFactory;

    protected $fillable = ['id','start_date', 'end_date'];

    public function teams() {
        return $this->hasMany(PredictTeam::class, "predict_match_id", 'id');
    }
    public function Boller() {
        return $this->hasMany(Boller::class, "match_id", 'id');
    }
    public function Batsman() {
        return $this->hasMany(Batsman::class, "match_id", 'id');
    }
}

