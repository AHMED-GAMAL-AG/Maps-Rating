<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{

    protected $fillable = [
        'user_id',
        'service_rating',
        'quality_rating',
        'cleanliness_rating',
        'pricing_rating',
        'review',
        'place_id',
    ];

    use HasFactory;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function avgRating()
    {
        $service_rating = $this->service_rating;
        $quality_rating = $this->quality_rating;
        $cleanliness_rating = $this->cleanliness_rating;
        $pricing_rating = $this->pricing_rating;
        $total = ($service_rating + $quality_rating + $cleanliness_rating + $pricing_rating) / 4;

        return $total;
    }

    public function likes()
    {
        return $this->belongsToMany(User::class , 'likes');
    }

}
