<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use HasFactory;


    public function product_subcategories()
    {
    	return $this->hasMany('App\Models\ProductSubCategory');
    }

    public function product_section()
    {
    	return $this->belongsTo('App\Models\ProductSection');
    }
}
