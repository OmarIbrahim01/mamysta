<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductSection extends Model
{
    use HasFactory;

    public function product_categories()
    {
    	return $this->hasMany('App\Models\ProductCategory');
    }
}
