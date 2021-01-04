<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\OrderItem;

class OrderItem extends Model
{
    use HasFactory;

    public function order()
    {
    	return $this->belongsTo('App\Models\Order', 'order_id');
    }

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

    public function vendor()
    {
    	return $this->belongsTo('App\Models\Vendor', 'vendor_id');
    }




    public function total($item_id)
    {
        
        $item = OrderItem::findOrFail($item_id);

        $price = $item->price;
        $vendor_discount_percentage = $item->vendor_discount_percentage;
        $vendor_discount_value = $price * $vendor_discount_percentage / 100;

        $vendor_price = $price - $vendor_discount_value;

        $running_cost_percent = $item->running_cost_percentage;
        $running_cost_value = $vendor_price * $running_cost_percent / 100;

        $product_sub_price = $vendor_price + $running_cost_value;

        $our_discount_percentage = $item->our_discount_percentage;
        $our_discount_value = $product_sub_price * $our_discount_percentage / 100;

        $product_price = $product_sub_price - $our_discount_value;
        

        $discount_code_percentage = $item->discount_code_percentage;
        $user_discount_percentage = $item->user_discount_percentage;
        $total_discount_percentage = $discount_code_percentage + $user_discount_percentage;
        $total_discount_value = $product_price * $total_discount_percentage / 100;

        $product_sub_total = $product_price - $total_discount_value;
        
        $taxes_percentage = $item->taxes_percentage;
        $taxes_value = $item->taxes_percentage;


        $product_final_total = $product_sub_total + $taxes_value;


        return ceil($product_final_total);
    }


}
