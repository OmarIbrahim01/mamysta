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


////////////////////////////////////////////////////////
/////////////////////Market Routes/////////////////////
//////////////////////////////////////////////////////
Route::get('/shop', [
	'as' => 'shop_home',
	'uses' => 'App\Http\Controllers\Shop\HomeController@index'
]);

// Product SubCategories Products Index
Route::get('/shop/{subcategory_id}', [
	'as' => 'shop_products_index',
	'uses' => 'App\Http\Controllers\Shop\ProductsController@index'
]);

// Product Products Show
Route::get('/shop/{subcategory_id}/{variant_id}', [
	'as' => 'shop_products_show',
	'uses' => 'App\Http\Controllers\Shop\ProductsController@show'
]);

// Product Sections Index
Route::get('/shop/sections', [
	'as' => 'shop_sections',
	'uses' => 'App\Http\Controllers\Shop\SectionsController@index'
]);

// Product Categories Index
Route::get('/shop/{section_id}/categories', [
	'as' => 'shop_categories',
	'uses' => 'App\Http\Controllers\Shop\CategoriesController@index'
]);

// Product SubCategories Index
Route::get('/shop/{section_id}/{category_id}/subcategories', [
	'as' => 'shop_subcategories',
	'uses' => 'App\Http\Controllers\Shop\SubCategoriesController@index'
]);


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
