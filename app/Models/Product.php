<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function subcategory()
    {
    	return $this->belongsTo('App\Models\ProductSubCategory', 'product_sub_category_id');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\ProductCategory', 'product_category_id');
    }

    public function section()
    {
        return $this->belongsTo('App\Models\ProductSection', 'product_section_id');
    }

    public function gender()
    {
        return $this->belongsTo('App\Models\Gender', 'gender_id');
    }

    public function min_age()
    {
        return $this->belongsTo('App\Models\Age', 'min_age_id');
    }

    public function max_age()
    {
        return $this->belongsTo('App\Models\Age', 'max_age_id');
    }

    public function brand()
    {
    	return $this->belongsTo('App\Models\Brand');
    }

    public function running_cost_percentage()
    {
    	return $this->belongsTo('App\Models\ProductRunningCostPercentage', 'product_running_cost_percentage_id');
    }

    public function variants()
    {
        return $this->hasMany('App\Models\ProductVariant');
    }

    public function color()
    {
        return $this->belongsTo('App\Models\ProductColor');
    }

    public function status()
    {
        return $this->belongsTo('App\Models\ProductStatus', 'product_status_id');
    }

    public function stocks()
    {
        return $this->hasMany('App\Models\ProductVariantStock');
    }



    public function most_expensive_variant_price($product_id){
        $product = Product::findOrFail($product_id);
        $product_variant_stock = $product->stocks->where('stock', '>', 0)->sortByDesc('price')->first();

        $price = $product_variant_stock->price;
        $vendor_discount_percentage = $product_variant_stock->vendor_discount_percentage;
        $vendor_discount_value = $price * $vendor_discount_percentage / 100;

        $vendor_price = $price - $vendor_discount_value;

        $running_cost_percent = $product->running_cost_percentage->percent;
        $running_cost_value = $vendor_price * $running_cost_percent / 100;

        $product_sub_price = $vendor_price + $running_cost_value;

        $our_discount_percentage = $product_variant_stock->our_discount_percentage;
        $our_discount_value = $product_sub_price * $our_discount_percentage / 100;

        $product_price = $product_sub_price - $our_discount_value;

        return ceil($product_price);
    }


    public function cheapest_variant_price($product_id){
        $product = Product::findOrFail($product_id);
        $product_variant_stock = $product->stocks->where('stock', '>', 0)->sortBy('price')->first();

        $price = $product_variant_stock->price;
        $vendor_discount_percentage = $product_variant_stock->vendor_discount_percentage;
        $vendor_discount_value = $price * $vendor_discount_percentage / 100;

        $vendor_price = $price - $vendor_discount_value;

        $running_cost_percent = $product->running_cost_percentage->percent;
        $running_cost_value = $vendor_price * $running_cost_percent / 100;

        $product_sub_price = $vendor_price + $running_cost_value;

        $our_discount_percentage = $product_variant_stock->our_discount_percentage;
        $our_discount_value = $product_sub_price * $our_discount_percentage / 100;

        $product_price = $product_sub_price - $our_discount_value;

        return ceil($product_price);
    }

    public function cheapest_variant_id($product_id){
        $product = Product::findOrFail($product_id);
        $stock = $product->stocks->where('stock', '>', 0)->sortBy('price')->first();
        $variant = $stock->product_variant->id;

        return $variant;
    }


    public function cheapest_variant_image($product_id){
        $product = Product::findOrFail($product_id);
        $stock = $product->stocks->where('stock', '>', 0)->sortBy('price')->first();
        $variant_image = $stock->product_variant->images->first()->image;

        return $variant_image;
    }


}