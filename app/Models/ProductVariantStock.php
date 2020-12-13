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
        $our_discount_percent = $product_variant_stock->our_discount_percentage;


        $price_after_discount = $price - ($price * ($vendor_discount_percent + $our_discount_percent)/100);

        $running_cost_percent = $product->running_cost_percentage->percent;


        $final_price = $price_after_discount + ($price_after_discount * $running_cost_percent / 100);



        return number_format((float)$final_price, 2, '.', '');
    }
}
