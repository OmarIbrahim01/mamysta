<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariantStock extends Model
{
    use HasFactory;

    public function product()
    {
        return $this->belongsTo('App\Models\Product');
    }

    public function product_variant()
    {
    	return $this->belongsTo('App\Models\ProductVariant');
    }

    public function vendor()
    {
    	return $this->belongsTo('App\Models\Vendor');
    }

    public function revenue_percentage()
    {
    	return $this->belongsTo('App\Models\ProductRevenuePercentage', 'product_revenue_percentage_id');
    }
}
