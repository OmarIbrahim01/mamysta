<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductRevenuePercentage extends Model
{
    use HasFactory;

    public function product_stock()
    {
    	return $this->hasMany('App\Models\ProductVariantStock');
    }
}
