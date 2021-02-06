<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\ProductSection;
use App\Models\ProductCategory;
use App\Models\ProductSubCategory;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductStatus;
use App\Models\ProductVariant;
use App\Models\ProductVariantStock;
use App\Models\ProductRevenuePercent;
use App\Models\ProductSize;
use App\Models\ProductColor;
use App\Models\ProductVariantImage;
use App\Models\ProductRunningCostPercentage;
use App\Models\Vendor;
use Illuminate\Support\Facades\Storage;


class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
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


        $products = $products->sortByDesc('id');

        return view('admin.shop.products.index', [
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
        
        $brands = Brand::all();
        $statuses = ProductStatus::all();
        $sizes = ProductSize::all();
        $colors = ProductColor::all();
        $vendors = Vendor::all();
        $sections = ProductSection::all();
        $running_cost_percentages = ProductRunningCostPercentage::all();

        return view('admin.shop.products.create', [
                            'sections' => $sections,
                            'brands' => $brands,
                            'statuses' => $statuses,
                            'sizes' => $sizes,
                            'colors' => $colors,
                            'vendors' => $vendors,
                            'sections' => $sections,
                            'running_cost_percentages' => $running_cost_percentages
                        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $subcategory = ProductSubcategory::findOrFail($request->subcategory);
        $category = $subcategory->product_category;
        $section = $category->product_section;

        // Create Product
        $product = new Product;
        $product->title = $request->title;
        $product->description = $request->description;
        $product->sku = null;
        $product->product_section_id = $section->id;
        $product->product_category_id = $category->id;
        $product->product_sub_category_id = $subcategory->id;
        $product->brand_id = $request->brand;
        $product->gender_id = 1;
        $product->min_age_id = 1;
        $product->max_age_id = 1;
        $product->product_running_cost_percentage_id = $request->running_cost;
        $product->product_taxes_percentage = $request->taxes;
        $product->product_status_id = $request->status;
        $product->sold_timex = 0;
        $product->save();


        // Create First Variant
        $variant = new ProductVariant;
        $variant->product_id = $product->id;
        $variant->product_color_id = $request->color;
        $variant->product_size_id = $request->size;
        $variant->dimensions = $request->length . 'x' . $request->width . 'x' . $request->height;
        $variant->weight = $request->weight;
        $variant->sku = null;
        $variant->save();

        // Add Images for first variant
        foreach($request->file('images') as $image){
            $image_new_name = $variant->id.'_'.$image->getClientOriginalName();
            Storage::disk('products')->putFileAs('/'. $product->id .'/'.$variant->id.'/', $image, $image_new_name);
            $variant_image = new ProductVariantImage;
            $variant_image->product_variant_id = $variant->id;
            $variant_image->image = '/app/products/'. $product->id .'/'.$variant->id.'/'.$image_new_name;
            $variant_image->save();
        }
            
        // Create Stock
        $stock = new ProductVariantStock;
        $stock->product_id = $product->id;
        $stock->product_variant_id = $variant->id;
        $stock->vendor_id = $request->vendor;
        $stock->stock = $request->stock_qty;
        $stock->price = $request->price;
        $stock->product_revenue_percentage_id = $request->revenue_percentage;
        $stock->our_discount_percentage = $request->our_discount;
        $stock->vendor_discount_percentage = $request->vendor_discount;
        $stock->save();


        session()->flash('message', 'Product Added Successfully');
        return redirect()->route('admin_shop_products_show', [$product->id]);

    }

    public function storeStock(Request $request, $product_id, $variant_id)
    {
        $stock = new ProductVariantStock;
        $stock->product_id = $product_id;
        $stock->product_variant_id = $variant_id;
        $stock->vendor_id = $request->vendor;
        $stock->stock = $request->stock_qty;
        $stock->price = $request->price;
        $stock->product_revenue_percentage_id = $request->product_revenue_percentage;
        $stock->our_discount_percentage = $request->our_discount_percentage;
        $stock->vendor_discount_percentage = $request->vendor_discount_percentage;
        $stock->save();

        session()->flash('message', 'Stock Added Successfully');
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
        $product = Product::findOrFail($id);
        $sizes = ProductSize::all();
        $colors = ProductColor::all();
        $vendors = Vendor::all();

        $product_statuses = ProductStatus::all();

        return view('admin.shop.products.show', [
                            'product' => $product,
                            'sizes' => $sizes,
                            'colors' => $colors,
                            'product_statuses' => $product_statuses,
                            'vendors' => $vendors
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

    public function updateAttr(Request $request, $product_id, $variant_id)
    {
        $variant = ProductVariant::findOrFail($variant_id);
        $variant->product_color_id = $request->color;
        $variant->product_size_id = $request->size;
        $variant->update();

        session()->flash('message', 'Product Attributes Updated Successfully');
        return redirect()->back();
    }

    public function updateStock(Request $request, $stock_id)
    {
        $stock = ProductVariantStock::findOrFail($stock_id);
        $stock->stock = $request->stock_qty;
        $stock->price = $request->price;
        $stock->product_revenue_percentage_id = $request->product_revenue_percentage;
        $stock->our_discount_percentage = $request->our_discount_percentage;
        $stock->vendor_discount_percentage = $request->vendor_discount_percentage;
        $stock->update();

        session()->flash('message', 'Stock Updated Successfully');
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


    public function addImages(Request $request, $product_id, $variant_id)
    {

        $product = Product::findOrFail($product_id);
        $variant = ProductVariant::findOrFail($variant_id);
        if(!empty($request->file('images'))){
            foreach($request->file('images') as $image){
                $image_new_name = $variant->id.'_'.$image->getClientOriginalName();
                Storage::disk('products')->putFileAs('/'. $product->id .'/'.$variant->id.'/', $image, $image_new_name);
                $variant_image = new ProductVariantImage;
                $variant_image->product_variant_id = $variant->id;
                $variant_image->image = '/app/products/'. $product->id .'/'.$variant->id.'/'.$image_new_name;
                $variant_image->save();
            }
            session()->flash('message', 'Images Added Successfuly');
        }

        

        return redirect()->back();

    }



    public function removeImage(Request $request, $product_id, $variant_id)
    {

        $image = ProductVariantImage::findOrFail($request->image);
        $image->delete();

        session()->flash('message', 'Images Added Successfuly');
        
        return redirect()->back();

    }






}
