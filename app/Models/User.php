<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array<int, string>
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    /**
     * Get the default profile photo URL if no profile photo has been uploaded.
     *
     * @return string
     */
    protected function defaultProfilePhotoUrl() // override default profile photo
    {
        return 'https://api.dicebear.com/6.x/bottts-neutral/svg?seed=' . urlencode($this->name);
    }


    public function likes()
    {
        return $this->belongsToMany(Review::class, 'likes'); // user can make many likes and review can have many likes
    }

    public function alreadyliked($review)
    {
        return $this->likes()->whereReviewId($review)->exists();
    }

    public function places()
    {
        return $this->hasMany(Place::class);
    }

    public function bookmarks()
    {
        return $this->belongsToMany(Place::class, 'bookmarks'); // user can make many bookMarks and place can have many bookMarks
    }

    public function alreadyBookmarked($place_id)
    {
        return $this->bookmarks()->wherePlaceId($place_id)->exists();
    }

    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    public function hasRole($role)
    {
        return $this->role()->where('name', $role)->exists();
    }
}
