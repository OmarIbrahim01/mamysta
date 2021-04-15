<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Order;

class Order extends Model
{
    use HasFactory;

    public function items()
    {
    	return $this->hasMany('App\Models\OrderItem');
    }

    public function user_discounts()
    {
    	return $this->hasMany('App\Models\UserDiscount');
    }


    public function user()
    {
    	return $this->belongsTo('App\Models\User');
    }

    public function status()
    {
    	return $this->belongsTo('App\Models\OrderStatus', 'order_status_id');
    }

    public function user_address()
    {
    	return $this->belongsTo('App\Models\UserAddress', 'user_adress_id');
    }

    public function user_phone()
    {
    	return $this->belongsTo('App\Models\UserPhone', 'user_phone_id');
    }

    public function shipping_method()
    {
    	return $this->belongsTo('App\Models\ShippingMethod', 'shipping_method_id');
    }

    public function payment_method()
    {
    	return $this->belongsTo('App\Models\PaymentMethod', 'payment_method_id');
    }


    public function total($id)
    {

    	$order = Order::findOrFail($id);
    	$items = $order->items;

    	$items_total = 0;
    	foreach($items as $item){

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
            $taxes_value = $product_sub_total * $taxes_percentage / 100;


            $product_final_total = $product_sub_total + $taxes_value;

            $items_total += $product_final_total;
        }

        $shipping_method_price = $order->shipping_method->price;

        $order_total = $items_total + $shipping_method_price;

        return ceil($order_total);
    }




    public function items_total($id)
    {

        $order = Order::findOrFail($id);
        $items = $order->items;

        $items_total = 0;
        foreach($items as $item){

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
            $taxes_value = $product_sub_total * $taxes_percentage / 100;


            $product_final_total = $product_sub_total + $taxes_value;

            $items_total += $product_final_total;
        }

        return ceil($items_total);
    }






}
