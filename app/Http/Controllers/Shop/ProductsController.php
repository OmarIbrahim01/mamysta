<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\ProductSection;
use App\Models\ProductCategory;
use App\Models\ProductSubCategory;
use App\Models\Brand;

use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductRevenuePercent;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $all_sections = ProductSection::all();
        $all_categories = ProductCategory::all();
        $all_subcategories = ProductSubcategory::all();
        $all_brands = Brand::all();

        if(isset($request->section)){
            $current_section = ProductSection::findOrFail($request->section);
        }else{
            $current_section = null;
        }

        if(isset($request->category)){
            $current_category = ProductCategory::findOrFail($request->category);
        }else{
            $current_category = null;
        }

        if(isset($request->subcategory)){
            $current_subcategory = ProductSubcategory::findOrFail($request->subcategory);
        }else{
            $current_subcategory = null;
        }
        

        $products = Product::all()->where('product_status_id', 1);


        if(isset($request->section)){
            $products = $products->where('product_section_id', $request->section);
        }

        if(isset($request->category)){
            $products = $products->where('product_category_id', $request->category);
        }

        if(isset($request->subcategory)){
            $products = $products->where('product_sub_category_id', $request->subcategory);
        }


        $products = $products->sortByDesc('sold_times');


        return view('shop.products_index', [
                                    'all_sections' => $all_sections,
                                    'all_categories' => $all_categories,
                                    'all_subcategories' => $all_subcategories,
                                    'all_brands' => $all_brands,

                                    'current_section' => $current_section,
                                    'current_category' => $current_category,
                                    'current_subcategory' => $current_subcategory,

                                    'products' => $products                                
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

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($variant_id)
    {
        // Current Variant
        $product_variant = ProductVariant::findOrFAil($variant_id);
        $product = $product_variant->product;
        $product_stock = $product_variant->stocks->where('stock', '>', 0)->sortBy('price')->first();

        $product_stock_price = $product_stock->price;
        $product_stock_vendor_discount_percentage = $product_stock->vendor_discount_percentage;
        $product_stock_vendor_discount_value = $product_stock_price * $product_stock_vendor_discount_percentage / 100;

        $product_stock_vendor_price = $product_stock_price - $product_stock_vendor_discount_value;

        $product_running_cost_percent = $product->running_cost_percentage->percent;
        $product_running_cost_value = $product_stock_vendor_price * $product_running_cost_percent / 100;

        $product_stock_sub_price = $product_stock_vendor_price + $product_running_cost_value;

        $product_stock_our_discount_percentage = $product_stock->our_discount_percentage;
        $product_stock_our_discount_value = $product_stock_sub_price * $product_stock_our_discount_percentage / 100;

        $product_stock_final_price = $product_stock_sub_price - $product_stock_our_discount_value;
        $product_stock_final_price = ceil($product_stock_final_price);


        // Most Expinsive Variant
        $me_product_variant = ProductVariant::findOrFAil($variant_id);
        $me_product = $me_product_variant->product;
        $me_product_stock = $me_product->stocks->where('stock', '>', 0)->sortByDesc('price')->first();

        $me_product_stock_price = $me_product_stock->price;
        $me_product_stock_vendor_discount_percentage = $me_product_stock->vendor_discount_percentage;
        $me_product_stock_vendor_discount_value = $me_product_stock_price * $me_product_stock_vendor_discount_percentage / 100;

        $me_product_stock_vendor_price = $me_product_stock_price - $me_product_stock_vendor_discount_value;

        $me_product_running_cost_percent = $me_product->running_cost_percentage->percent;
        $me_product_running_cost_value = $me_product_stock_vendor_price * $me_product_running_cost_percent / 100;

        $me_product_stock_sub_price = $me_product_stock_vendor_price + $me_product_running_cost_value;

        $me_product_stock_our_discount_percentage = $me_product_stock->our_discount_percentage;
        $me_product_stock_our_discount_value = $me_product_stock_sub_price * $me_product_stock_our_discount_percentage / 100;

        $me_product_stock_final_price = $me_product_stock_sub_price - $me_product_stock_our_discount_value;
        $me_product_stock_final_price = ceil($me_product_stock_final_price);



        return view('shop.show', [
                        'product' => $product,
                        'product_variant' => $product_variant,
                        'product_stock' => $product_stock,
                        'product_stock_final_price' => $product_stock_final_price,
                        'me_product_stock_final_price' => $me_product_stock_final_price,
                    ]);
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