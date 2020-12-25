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
        $product_revenue_percentage = $item->product_revenue_percentage;
        $our_discount_percentage = $item->our_discount_percentage;
        $vendor_discount_percentage = $item->vendor_discount_percentage;
        $taxes_percentage = $item->taxes_percentage;
        $discount_code_percentage = $item->discount_code_percentage;
        $user_discount_percentage = $item->user_discount_percentage;

        $total_stock_discount = $our_discount_percentage + $vendor_discount_percentage;

        $item_total_price = $price - ($price * $total_stock_discount / 100);

        $item_total = $item_total_price + ($item_total_price * $product_revenue_percentage / 100);

        $item_extra_discounts = $discount_code_percentage + $user_discount_percentage;

        $item_sub_total = $item_total - ($item_total * $item_extra_discounts / 100);

        $item_final_total = $item_sub_total + ($item_sub_total * $taxes_percentage / 100);

        return number_format((float)$item_final_total, 2, '.', '');
    }


}
