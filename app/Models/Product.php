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
        return $this->belongsTo('App\Models\ProductStatus');
    }

    public function stocks()
    {
        return $this->hasMany('App\Models\ProductVariantStock');
    }



    public function cheapest_price_befor_discount($product_id){
        $product = Product::findOrFail($product_id);

        $price = $product->stocks->where('stock', '>', 0)->sortBy('price')->first()->price;

        $running_cost_percent = $product->running_cost_percentage->percent;


        $final_price = $price + ($price * $running_cost_percent / 100);


        
        return number_format((float)$final_price, 2, '.', '');
    }


    public function cheapest_price_after_discount($product_id){
        $product = Product::findOrFail($product_id);

        $price = $product->stocks->where('stock', '>', 0)->sortBy('price')->first()->price;
        $discount_percent = $product->stocks->where('stock', '>', 0)->sortBy('price')->first()->discount_precentage;

        $price_after_discount = $price - ($price * $discount_percent/100);

        $running_cost_percent = $product->running_cost_percentage->percent;


        $final_price = $price_after_discount + ($price_after_discount * $running_cost_percent / 100);



        return number_format((float)$final_price, 2, '.', '');
    }


     public function cheapest_discount_percentage($product_id){
        $product = Product::findOrFail($product_id);
        $discount_percent = $product->stocks->where('stock', '>', 0)->sortBy('price')->first()->discount_precentage;

        return $discount_percent;
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