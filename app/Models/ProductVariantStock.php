<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductVariantStock extends Model
{
    use HasFactory;

    public function variant()
    {
    	return $this->belongsTo('App\Models\ProductVariant');
    }

    public function vendor()
    {
    	return $this->belongsTo('App\Models\Vendor');
    }

    public function revenue_percentage()
    {
    	return $this->belongsTo('App\Models\ProductRevenuePercent');
    }
}
