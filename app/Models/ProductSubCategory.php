<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSubCategory extends Model
{
    use HasFactory;


    public function product_category()
    {
    	return $this->belongsTo('App\Models\ProductCategory');
    }


    public function products()
    {
    	return $this->hasMany('App\Models\Product');
    }

    
}
