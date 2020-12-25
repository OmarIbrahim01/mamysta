<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiscountCode extends Model
{
    use HasFactory;

    public function type()
    {
    	return $this->belongsTo('App\Models\DiscountCodeType', 'discount_code_type_id');
    }

    public function user_discount_codes()
    {
    	return $this->hasMany('App\Models\UserDiscountCode');
    }
}
