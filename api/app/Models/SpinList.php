<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SpinList extends Model
{
    use HasFactory;
    protected $table = 'spin_list';

    protected $fillable = [
        'name',
        'status',
        'prize',
    ];


}
