<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Auth;

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




    public static function cart_total(){

        $cart_items = UserCartItem::where('user_id', Auth::id())->get();

        $cart_total = 0;

        foreach($cart_items as $cart_item){

            $product_variant_stock = $cart_item->stock;
            $product_variant = $cart_item->variant;
            $product = $cart_item->product;

            $price = $product_variant_stock->price;
            $vendor_discount_percent = $product_variant_stock->vendor_discount_percentage;
            $vendor_discount_value = $price * $vendor_discount_percent / 100;

            $vendor_price = $price - $vendor_discount_value;

            $running_cost_percent = $product->running_cost_percentage->percent;
            $running_cost_value = $vendor_price * $running_cost_percent / 100;

            $product_sub_price = $vendor_price + $running_cost_value;

            $our_discount_percent = $product_variant_stock->our_discount_percentage;
            $our_discount_value = $product_sub_price * $our_discount_percent / 100;

            $product_price = ceil($product_sub_price - $our_discount_value);

            $cart_total += $product_price * $cart_item->quantity;

        }

        return $cart_total;
    }



    public static function cart_taxes(){

        $cart_items = UserCartItem::where('user_id', Auth::id())->get();

        $cart_taxes = 0;
        
        foreach($cart_items as $cart_item){

            $product_variant_stock = $cart_item->stock;
            $product_variant = $cart_item->variant;
            $product = $cart_item->product;

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

            $taxes_percentage = $product->product_taxes_percentage;
            $taxes_value = $product_price * $taxes_percentage / 100;
            
            $cart_taxes += $taxes_value * $cart_item->quantity;

        }

        return $cart_taxes;
    }





}
