<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\UserAddress;
use App\Models\UserPhone;
use App\Models\Region;
use App\Models\City;
use App\Models\ShippingMethod;
use App\Models\PaymentMethod;
use App\Models\DiscountCode;
use App\Models\UserDiscountCode;
use App\Models\UserDiscount;

class OrderReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function order_review(Request $request)
    {

        $request->validate([
            'shipping_method_id' => 'required',
        ]);


        // Set Or Get Address
        if(isset($request->selected_address_id)){
            $user_address = UserAddress::findOrFail($request->selected_address_id);
        }elseif(!isset($request->selected_address_id)){
            $request->validate([
                'new_region_id' => 'required',
                'new_city_id' => 'required',
                'new_address_address' => 'required',
            ]);

            $new_user_address = new UserAddress;
            $new_user_address->user_id = Auth::id();
            $new_user_address->region_id = $request->new_region_id;
            $new_user_address->city_id = $request->new_city_id;
            $new_user_address->address = $request->new_address_address;
            $new_user_address->default_select = 1;
            $new_user_address->save();

            $user_address = UserAddress::findOrFail($new_user_address->id);
        }


        // Set Or Get Phone
        if(isset($request->selected_phone_id)){
            $user_phone = UserPhone::findOrFail($request->selected_phone_id);
        }elseif(!isset($request->selected_phone_id)){
            $request->validate([
                'new_phone' => 'required',
            ]);

            $new_user_phone = new UserPhone;
            $new_user_phone->user_id = Auth::id();
            $new_user_phone->phone = $request->new_phone;
            $new_user_phone->default_select = 1;
            $new_user_phone->save();

            $user_phone = UserPhone::findOrFail($new_user_phone->id);
        }

        // Get Shipping Method
        $shipping_method = ShippingMethod::findOrFail($request->shipping_method_id); 

        $payment_methods = PaymentMethod::all()->where('active', true);

        $cart_items = Auth::user()->cart_items;

        $cart_total = 0;
        foreach($cart_items as $cart_item){
            $item_price =  $cart_item->stock->price;
            $item_discount_percentage = $cart_item->stock->our_discount_percentage + $cart_item->stock->vendor_discount_percentage;
            $item_total = $item_price - ($item_price * $item_discount_percentage / 100);
            $running_cost_percentage = $cart_item->product->running_cost_percentage->percent;
            $sub_total = $item_total + ($item_total * $running_cost_percentage / 100);
            $final_total = $sub_total * $cart_item->quantity;

            $cart_total += $final_total;
        }

        $taxes = $cart_total * 14 / 100;

        $user_discounts = UserDiscount::where('user_id', Auth::id())->where('used', 0)->get();
        $user_discount_percentage = $user_discounts->sum('percentage');


        return view('shop.order_review', [
                        'user_address' => $user_address,
                        'user_phone' => $user_phone,
                        'shipping_method' => $shipping_method,
                        'cart_items' => $cart_items,
                        'cart_total' => $cart_total,
                        'taxes' => $taxes,
                        'user_discount_percentage' => $user_discount_percentage,
                        'user_discounts' => $user_discounts,
                        'payment_methods' => $payment_methods
                    ]);
    }



    public function discount_code_check(Request $request)
    {

        $discount_code = DiscountCode::where('code', $request->discount_code)->where('status', 1)->first();

        // Discount Code Found
        if(isset($discount_code) && $discount_code->count() > 0){

            //If Discount type (Used Multple Times)
            if($discount_code->type->id == 1){
                
                $user_discount_code = UserDiscountCode::where( 'user_id', Auth::id() )->where( 'discount_code_id', $discount_code->id)->first();

                //If Discount Code have been used before by user
                if(isset($user_discount_code) && $user_discount_code->count() > 0){
                    // Unvalid Code
                    return response()->json(array('discount_code_status'=> 'false'), 200);
                }
                //If Discount code havent been used before by user
                else{
                    // Valid Code
                    return response()->json(array(
                            'discount_code_status'=> 'true',
                            'discount_code_id' => $discount_code->id,
                            'discount_code_code' => $discount_code->code,
                            'discount_code_discount_percentage' => $discount_code->discount_percentage,
                    ), 200);
                }
            }
            //If Discount type (Used Once)
            elseif($discount_code->type->id == 2){

                $user_discount_code = UserDiscountCode::where( 'discount_code_id', $discount_code->id)->first();

                //If Discount Code have been used before by anyone
                if(isset($user_discount_code) && $user_discount_code->count() > 0){
                    // Unvalid Code
                    return response()->json(array('discount_code_status'=> 'false'), 200);
                }
                //If Discount code havent been used before by anyone
                else{
                    // Valid Code
                    return response()->json(array(
                            'discount_code_status'=> 'true',
                            'discount_code_id' => $discount_code->id,
                            'discount_code_code' => $discount_code->code,
                            'discount_code_discount_percentage' => $discount_code->discount_percentage,
                    ), 200);
                }

            }

        }
        // Discount Code Not Found
        else{
            return response()->json(array('discount_code_status'=> 'false'), 200);
        }

        
        // return response()->json(array('discount_code'=> $discount_code), 200);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
