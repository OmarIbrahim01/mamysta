<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserCartItem extends Model
{
    use HasFactory;

    public function product()
    {
    	return $this->belongsTo('App\Models\Product', 'product_id');
    }

    public function variant()
    {
    	return $this->belongsTo('App\Models\ProductVariant', 'product_variant_id');
    }

    public function stock()
    {
    	return $this->belongsTo('App\Models\ProductVariantStock', 'product_variant_stock_id');
    }
}
