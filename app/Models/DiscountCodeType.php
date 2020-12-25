<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiscountCodeType extends Model
{
    use HasFactory;

    public function discount_code()
    {
    	return $this->hasMany('App\Models\DiscountCode');
    }
}
