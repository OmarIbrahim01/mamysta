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



    public function total($product_variant_stock_id){

        $product_variant_stock = ProductVariantStock::findOrFail($product_variant_stock_id);
        $product_variant = $product_variant_stock->product_variant;
        $product = $product_variant->product;



        $price = $product_variant_stock->price;
        $vendor_discount_percent = $product_variant_stock->vendor_discount_percentage;
        $vendor_discount_value = $price * $vendor_discount_percent / 100;

        $vendor_price = $price - $vendor_discount_value;

        $running_cost_percent = $product->running_cost_percentage->percent;
        $running_cost_value = $vendor_price * $running_cost_percent / 100;

        $product_sub_price = $vendor_price + $running_cost_value;

        $our_discount_percent = $product_variant_stock->our_discount_percentage;
        $our_discount_value = $product_sub_price * $our_discount_percent / 100;

        $product_price = $product_sub_price - $our_discount_value;

        return ceil($product_price);
    }
}
