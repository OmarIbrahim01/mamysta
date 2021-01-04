<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\UserCartItem;
use Illuminate\Support\Facades\Auth;

class UserCartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cart_items = UserCartItem::where('user_id', Auth::id())->get();
        $cart_total = UserCartItem::cart_total();
        return view('shop.shopping_cart', [
                            'cart_items' => $cart_items,
                            'cart_total' => $cart_total
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

        $cart_item = new UserCartItem;

        $cart_item->user_id = Auth::id();
        $cart_item->product_id = $request->product_id;
        $cart_item->product_variant_id = $request->variant_id;
        $cart_item->product_variant_stock_id = $request->stock_id;
        $cart_item->quantity = $request->quantity;

        $cart_item->save();

        session()->flash('message', 'Item Added To Shopping Cart Successfully');
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
        $cart_item = UserCartItem::findOrFail($id);
        $cart_item->quantity = $request->quantity;
        $cart_item->update();

        session()->flash('message', 'Quantity Updated Successfully');
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
        $item = UserCartItem::findOrFail($id);
        $item->delete();

        session()->flash('message', 'Item Removed From Shopping Cart Successfully');
        return redirect()->back();
    }



    public function clear_cart()
    {
        $items = Auth::user()->cart_items;
        foreach($items as $item){
            $item->delete();
        }
        

        session()->flash('message', 'Shopping Cart Cleared Successfully');
        return redirect()->back();
    }
}
