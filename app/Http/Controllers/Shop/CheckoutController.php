<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\UserAddress;
use App\Models\UserPhone;
use App\Models\Region;
use App\Models\City;
use App\Models\ShippingMethod;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkout()
    {
        $user = Auth::user();
        $cart_items = $user->cart_items;
        $selected_address = $user->addresses->where('default_select', 1)->first();
        $selected_phone = $user->phones->where('default_select', 1)->first();

        $addresses = $user->addresses->where('default_select', 0);
        $phones = $user->phones->where('default_select', 0);

        $cart_items = Auth::user()->cart_items;


        $regions = Region::all();
        $cities = City::all();
        $shipping_methods = ShippingMethod::all();

        return view('shop.checkout', [
                        'cart_items' => $cart_items,
                        'user' => $user,
                        'selected_address' => $selected_address,
                        'selected_phone' => $selected_phone,
                        'addresses' => $addresses,
                        'phones' => $phones,
                        'regions' => $regions,
                        'cities' => $cities,
                        'shipping_methods' => $shipping_methods
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
        //
    }



    public function add_new_user_address(Request $request)
    {

        $new_user_address = new UserAddress;
        $new_user_address->user_id = Auth::id();
        $new_user_address->region_id = $request->new_address_region;
        $new_user_address->city_id = $request->new_address_city;
        $new_user_address->address = $request->new_address_address;
        $new_user_address->default_select = 0;
        $new_user_address->save();

        $user_addresses = Auth::user()->addresses;
        foreach($user_addresses as $user_address){
            $user_address->default_select = 0;
            $user_address->update();
        }

        $new_user_address->default_select = 1;
        $new_user_address->update();

        session()->flash('message', 'New Address Added Successfully');
        return redirect()->back();
    }



    public function add_new_user_phone(Request $request)
    {
        $new_phone = new UserPhone;
        $new_phone->user_id = Auth::id();
        $new_phone->phone = $request->new_phone_number;
        $new_phone->confirmation_code = null;
        $new_phone->confirmation_status = 0;
        $new_phone->default_select = 0;
        $new_phone->save();


        $user_phones = Auth::user()->phones;
        foreach($user_phones as $user_phone){
            $user_phone->default_select = 0;
            $user_phone->update();
        }


        $new_phone->default_select = 1;
        $new_phone->update();


        session()->flash('message', 'New Phone Added Successfully');
        return redirect()->back();
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

    public function change_selected_address(Request $request, $id)
    {

        
        $all_user_addresses = Auth::user()->addresses;
        foreach($all_user_addresses as $user_address){
            $user_address->default_select = 0;
            $user_address->update();
        }

        $selected_address = UserAddress::findOrFail($id);
        $selected_address->default_select = 1;
        $selected_address->update();

        session()->flash('message', 'Address Updated Successfully');
        return redirect()->back();


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
