<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report extends Model
{

    protected $fillable = [
        'name',
        'email',
        'place_url',
    ];

    use HasFactory;
}
