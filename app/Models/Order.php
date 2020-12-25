<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
    	return $this->belongsTo('App\Models\PaymentMethod', 'payment_method_id ');
    }


}
