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


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
