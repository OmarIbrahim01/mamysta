<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends \TCG\Voyager\Models\User
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'have_children',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];



    public function cart_items()
    {
        return $this->hasMany('App\Models\UserCartItem');
    }


    public function phones()
    {
        return $this->hasMany('App\Models\UserPhone');
    }


    public function addresses()
    {
        return $this->hasMany('App\Models\UserAddress');
    }

    public function children()
    {
        return $this->hasMany('App\Models\UserChild');
    }

    public function discount_codes()
    {
        return $this->hasMany('App\Models\UserDiscountCode');
    }


    public function orders()
    {
        return $this->hasMany('App\Models\Order')->orderByDesc('id');
    }


    public function questions()
    {
        return $this->hasMany('App\Models\ParentingQuestion');
    }


    public function topics()
    {
        return $this->hasMany('App\Models\ParentingTopic');
    }
}
