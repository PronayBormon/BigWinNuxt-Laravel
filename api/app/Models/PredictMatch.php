<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PredictMatch extends Model {
    use HasFactory;

    protected $fillable = ['start_date', 'end_date'];

    public function teams() {
        return $this->hasMany(PredictTeam::class);
    }
}

