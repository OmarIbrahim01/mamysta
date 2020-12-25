<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\UserAddress;
use App\Models\UserPhone;
use App\Models\Region;
use App\Models\City;
use App\Models\ShippingMethod;
use App\Models\PaymentMethod;
use App\Models\UserDiscount;
use App\Models\DiscountCode;
use App\Models\Order;
use App\Models\OrderItem;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $orders = Auth::user()->orders;

        
        return view('customer.orders.index', [
                                'orders' => $orders
                        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());

        // Get Order Info
        $user = Auth::user();
        $user_address = UserAddress::findOrFail($request->user_address);
        $user_phone = UserPhone::findOrFail($request->user_phone);
        $shipping_method = ShippingMethod::findOrFail($request->shipping_method);
        $payment_method = PaymentMethod::findOrFail($request->payment_method);
        if(!empty($request->discount_code)){
            $discount_code = DiscountCode::where('code', $request->discount_code)->first();
            $discount_code_percentage = $discount_code->discount_percentage;
        }else{
            $discount_code_percentage = 0;
        }
        $user_discounts = UserDiscount::where('user_id', Auth::id())->where('used', 0)->get();
        $user_discount_percentage = $user_discounts->sum('percentage');

        // Create New Order
        $order = new Order;
        $order->user_id = Auth::id();
        $order->order_status_id = 1;
        $order->user_adress_id = $user_address->id;
        $order->user_phone_id = $user_phone->id;
        $order->shipping_method_id = $shipping_method->id;
        $order->shipping_cost = $shipping_method->price;
        $order->payment_method_id = $payment_method->id;
        $order->payment_cost = $payment_method->cost;
        $order->tracking_number = null;
        $order->note = null;
        $order->save();
        

        // Get Cart Items
        $cart_items = Auth::user()->cart_items;

        // Save Cart items As Order Items
        foreach($cart_items as $cart_item){
            for ($i=0; $i < $cart_item->quantity; $i++) { 
                $order_item = new OrderItem;
                $order_item->order_id = $order->id;
                $order_item->product_id = $cart_item->product_id;
                $order_item->product_variant_id = $cart_item->product_variant_id;
                $order_item->product_variant_stock_id = $cart_item->product_variant_stock_id;
                $order_item->vendor_id = $cart_item->stock->vendor_id;
                $order_item->price = $cart_item->stock->price;
                $order_item->running_cost_percentage = $cart_item->product->product_running_cost_percentage_id;
                $order_item->product_revenue_percentage = $cart_item->stock->product_revenue_percentage_id;
                $order_item->our_discount_percentage = $cart_item->stock->our_discount_percentage;
                $order_item->vendor_discount_percentage = $cart_item->stock->vendor_discount_percentage;
                $order_item->taxes_percentage = $cart_item->product->product_taxes_percentage;
                $order_item->discount_code_percentage = $discount_code_percentage;
                $order_item->user_discount_percentage = $user_discount_percentage;
                $order_item->price = $cart_item->stock->price;
                $order_item->save();
            }

            $cart_item->delete();

        }


        session()->flash('message', 'Order Created Successfully');
        return redirect()->route('customer_orders_index');



    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order = Order::findOrFail($id);
        return view('customer.orders.show', [ 'order' => $order ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
