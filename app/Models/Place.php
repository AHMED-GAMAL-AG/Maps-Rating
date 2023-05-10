<?php

namespace App\Models;

use App\Helpers\Slug;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Place extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'category_id',
        'overview',
        'image',
        'address',
        'longitude',
        'latitude',
        'user_id',
        'slug',
    ];

    public function ScopeSearch($query, $request)
    {
        if ($request->category_id) { // check if the user selected a category
            $query->whereCategory_id($request->category);
        }

        if ($request->address) { // check if the user entered an input in the search field
            $query->where('address', 'LIKE', '%' . $request->address . '%');
        }

        return $query;
    }

    public function getImageAttribute($image) // accessor function to get the image path
    {
        return asset('storage/images/' . $image);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function setNameAttribute($value) // mutator function executed when the name attribute is set to set the slug
    {
        $this->attributes['name'] = $value;
        $this->attributes['slug'] = Slug::uniqueSlug($value, 'places');
    }

    public function bookmarks()
    {
        $this->belongsToMany(User::class, 'bookmarks'); // return the users who bookmarked the place
    }
}
