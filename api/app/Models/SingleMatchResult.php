<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SingleMatchResult extends Model
{
    use HasFactory;

    protected $table = "singlematchresult";

    protected $fillable = [
        'match_id',
        'team_id'
    ];
    public function team(){
        return $this->belongsTo(Country::class, 'team_id', 'id');
    }
    
}
