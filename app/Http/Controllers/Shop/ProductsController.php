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

        $product_variant = ProductVariant::findOrFAil($variant_id);
        $product = $product_variant->product;
        $product_stock = $product_variant->stocks->where('stock', '>', 0)->sortBy('price')->first();

        $product_stock_price = $product_stock->price;
        $product_stock_discount_percent = $product_stock->discount_precentage;

        $product_stock_price_after_discount = $product_stock_price - ($product_stock_price * $product_stock_discount_percent / 100);

        $product_running_cost_percent = $product->running_cost_percentage->percent;


        $product_total_price_before_discount = $product_stock_price + ($product_stock_price * $product_running_cost_percent /100);
        $product_total_price = $product_stock_price_after_discount + ($product_stock_price_after_discount * $product_running_cost_percent /100);
        



        return view('shop.show', [
                        'product' => $product,
                        'product_variant' => $product_variant,
                        'product_stock' => $product_stock,
                        'product_total_price_before_discount' => number_format((float)$product_total_price_before_discount, 2, '.', ''),
                        'product_total_price' => number_format((float)$product_total_price, 2, '.', '')
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