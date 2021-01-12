<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect()->route('shop_home');
});

Route::get('/home', [
	'as' => 'home',
	'uses' => 'App\Http\Controllers\Shop\HomeController@index'
]);


////////////////////////////////////////////////////////
/////////////////////Market Routes/////////////////////
//////////////////////////////////////////////////////

// Market Navigaion
Route::get('/shop', [
	'as' => 'shop_home',
	'uses' => 'App\Http\Controllers\Shop\HomeController@index'
]);

// Product SubCategories Products Index
Route::get('/shop/products/', [
	'as' => 'shop_products_index',
	'uses' => 'App\Http\Controllers\Shop\ProductsController@index'
]);

// Product Products Show
Route::get('/shop/products/{product_variant_id}', [
	'as' => 'shop_products_show',
	'uses' => 'App\Http\Controllers\Shop\ProductsController@show'
]);


////////// Market Shopping Cart ///////////////////////
Route::middleware(['auth'])->group(function () {

	Route::get('/shop/cart/', [
		'as' => 'shop_cart_index',
		'uses' => 'App\Http\Controllers\Shop\UserCartController@index'
	]);

	Route::post('/shop/cart/', [
		'as' => 'shop_cart_add_item',
		'uses' => 'App\Http\Controllers\Shop\UserCartController@store'
	]);

	Route::put('/shop/cart/{id}', [
		'as' => 'shop_cart_update_item',
		'uses' => 'App\Http\Controllers\Shop\UserCartController@update'
	]);

	Route::delete('/shop/cart/{id}', [
		'as' => 'shop_cart_delete_item',
		'uses' => 'App\Http\Controllers\Shop\UserCartController@destroy'
	]);

	Route::delete('/shop/cart/', [
		'as' => 'shop_cart_clear',
		'uses' => 'App\Http\Controllers\Shop\UserCartController@clear_cart'
	]);

});


////////// Market Checkout ///////////////////////
Route::middleware(['auth'])->group(function () {

	// Checkout index
	Route::get('/shop/checkout/', [
		'as' => 'shop_checkout',
		'uses' => 'App\Http\Controllers\Shop\CheckoutController@checkout'
	]);

	// Checkout change selected address
	Route::put('/shop/checkout/change_selected_address/{id}', [
		'as' => 'shop_checkout_change_selected_address',
		'uses' => 'App\Http\Controllers\Shop\CheckoutController@change_selected_address'
	]);

	// Checkout add new address
	Route::post('/shop/checkout/add_new_user_address/', [
		'as' => 'shop_checkout_add_new_user_address',
		'uses' => 'App\Http\Controllers\Shop\CheckoutController@add_new_user_address'
	]);


	// Checkout add new phone
	Route::post('/shop/checkout/add_new_user_phone/', [
		'as' => 'shop_checkout_add_new_user_phone',
		'uses' => 'App\Http\Controllers\Shop\CheckoutController@add_new_user_phone'
	]);

});

////////// Orders Routes ///////////////////////
Route::middleware(['auth'])->group(function () {

	// Create New Order
	Route::post('/shop/orders', [
		'as' => 'shop_orders_store',
		'uses' => 'App\Http\Controllers\Shop\OrdersController@store'
	]);

});

////////// Market Checkout ///////////////////////
Route::middleware(['auth'])->group(function () {
	// Review index
	Route::post('/shop/order_review/', [
		'as' => 'shop_order_review',
		'uses' => 'App\Http\Controllers\Shop\OrderReviewController@order_review'
	]);


	// Discount Code Check
	Route::get('/shop/order_review/discount_code_check', [
		'as' => 'shop_order_review_discount_code_check',
		'uses' => 'App\Http\Controllers\Shop\OrderReviewController@discount_code_check'
	]);


	// Review index
	Route::post('/shop/orders/store', [
		'as' => 'shop_order_store',
		'uses' => 'App\Http\Controllers\Customer\OrdersController@store'
	]);

});



////////// Customer Account Routes ///////////////////////
Route::middleware(['auth'])->group(function () {
	// Account index
	Route::get('/customer/account', [
		'as' => 'customer_account_index',
		'uses' => 'App\Http\Controllers\Customer\AccountController@index'
	]);

	// Orders index
	Route::get('/customer/orders', [
		'as' => 'customer_orders_index',
		'uses' => 'App\Http\Controllers\Customer\OrdersController@index'
	]);

	// Orders Show
	Route::get('/customer/orders/{order_id}', [
		'as' => 'customer_orders_show',
		'uses' => 'App\Http\Controllers\Customer\OrdersController@show'
	]);
});




////////////////////////////////////////////////
//////////////// Admin Routes /////////////////
//////////////////////////////////////////////
Route::middleware(['admin'])->group(function () {

	Route::get('/admin/', [
		'as' => 'admin_home',
		'uses' => 'App\Http\Controllers\Admin\HomeController@index'
	]);


	//////////////////Dashboared Routes/////////////////
	Route::get('/admin/shop/dashboard', [
		'as' => 'admin_shop_dashboared',
		'uses' => 'App\Http\Controllers\Admin\Shop\DashboardController@index'
	]);


	//////////////////Shop Products Index/////////////////
	Route::get('/admin/shop/products', [
		'as' => 'admin_shop_products_index',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@index'
	]);

	//////////////////Shop Products Show/////////////////
	Route::get('/admin/shop/products/{id}', [
		'as' => 'admin_shop_products_show',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@show'
	]);


	//////////////////Add Variant Images/////////////////
	Route::post('/admin/shop/products/{product_id}/{variant_id}/add_images', [
		'as' => 'admin_shop_products_add_images',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@addImages'
	]);

	//////////////////Remove Variant Images/////////////////
	Route::delete('/admin/shop/products/{product_id}/{variant_id}/remove_image', [
		'as' => 'admin_shop_products_remove_image',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@removeImage'
	]);

	//////////////////Edit Variant Attribute/////////////////
	Route::put('/admin/shop/products/{product_id}/{variant_id}/edit_attributes', [
		'as' => 'admin_shop_products_updateAttr',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@updateAttr'
	]);


	//////////////////Store Stock/////////////////
	Route::post('/admin/shop/product/{product_id}/{variant_id}/store_stock', [
		'as' => 'admin_shop_stocks_store',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@storeStock'
	]);

	//////////////////Update Stock/////////////////
	Route::put('/admin/shop/stocks/{stock_id}/update', [
		'as' => 'admin_shop_products_updateStock',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@updateStock'
	]);


});


Route::group(['prefix' => 'voyager_admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
