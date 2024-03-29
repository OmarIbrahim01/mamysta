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


// Product Seaech 
Route::get('/shop/products/search', [
	'as' => 'shop_products_search',
	'uses' => 'App\Http\Controllers\Shop\ProductsController@search'
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
















////////////////////////////////////////////////////////
//////////////////Parenting Routes/////////////////////
//////////////////////////////////////////////////////

// Parenting Home
Route::get('/parenting', [
	'as' => 'parenting_home',
	'uses' => 'App\Http\Controllers\Parenting\HomeController@index'
]);

// Parenting Q&A Index
Route::get('/parenting/questions_and_answers', [
	'as' => 'parenting_questions_and_answers',
	'uses' => 'App\Http\Controllers\Parenting\QuestionsController@index'
]);

// Parenting Topics Index
Route::get('/parenting/topics', [
	'as' => 'parenting_topics_index',
	'uses' => 'App\Http\Controllers\Parenting\TopicsController@index'
]);

// Parenting Topics Show
Route::get('/parenting/topics/{id}', [
	'as' => 'parenting_topics_show',
	'uses' => 'App\Http\Controllers\Parenting\TopicsController@show'
]);





////////////////////////////////////////////////////////
//////////////Groth Tracker Routes/////////////////////
//////////////////////////////////////////////////////


//////////////Groth Calculator Routes/////////////////////

// Groth Calculator Index
Route::get('/parenting/groth_calaculator', [
	'as' => 'parenting_groth_calaculator_index',
	'uses' => 'App\Http\Controllers\Parenting\GrothCalculatorController@index'
]);

// Groth Calculator Result
Route::get('/parenting/groth_tracker_calaculator/result', [
	'as' => 'parenting_groth_tracker_calaculator_result',
	'uses' => 'App\Http\Controllers\Parenting\GrothCalculatorController@result'
]);




//////////////Vaccines Routes/////////////////////

// Vaccines Index
Route::get('/parenting/vaccines', [
	'as' => 'parenting_vaccines_index',
	'uses' => 'App\Http\Controllers\Parenting\VaccinesController@index'
]);

// Vaccines show
Route::get('/parenting/vaccines/{id}', [
	'as' => 'parenting_vaccines_show',
	'uses' => 'App\Http\Controllers\Parenting\VaccinesController@show'
]);



//////////////Vaccine Places Routes/////////////////////

// Vaccine Places Index
Route::get('/parenting/vaccine_places', [
	'as' => 'parenting_vaccine_places_index',
	'uses' => 'App\Http\Controllers\Parenting\VaccinePlacesController@index'
]);

// Vaccine Places show
Route::get('/parenting/vaccine_places/{id}', [
	'as' => 'parenting_vaccine_places_show',
	'uses' => 'App\Http\Controllers\Parenting\VaccinePlacesController@show'
]);









////////// Parenting Customer Account Routes ///////////////////////
Route::middleware(['auth'])->group(function () {



	//////////////Vaccine Tracker Routes/////////////////////

	// Vaccine Tracker Index
	Route::get('/parenting/vaccine_tracker', [
		'as' => 'parenting_vaccine_tracker_index',
		'uses' => 'App\Http\Controllers\Parenting\VaccineTrackerController@index'
	]);

	// Vaccine Tracker Store
	Route::post('/parenting/vaccine_tracker/{child_id}/store', [
		'as' => 'parenting_vaccine_tracker_store',
		'uses' => 'App\Http\Controllers\Parenting\VaccineTrackerController@store'
	]);






	//////////////Groth Tracker Routes/////////////////////

	// Groth Tracker Index
	Route::get('/parenting/groth_tracker', [
		'as' => 'parenting_groth_tracker_index',
		'uses' => 'App\Http\Controllers\Parenting\GrothTrackerController@index'
	]);

	// Groth Tracker Store
	Route::post('/parenting/groth_tracker/{child_id}', [
		'as' => 'parenting_groth_tracker_store',
		'uses' => 'App\Http\Controllers\Parenting\GrothTrackerController@store'
	]);







	/////////////////// User Children Routes ///////////////////////

	// User Children index
	Route::get('/customer/children', [
		'as' => 'user_children_index',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@index'
	]);

	// User Children create
	Route::get('/customer/children/create', [
		'as' => 'user_children_create',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@create'
	]);

	// User Children store
	Route::post('/customer/children', [
		'as' => 'user_children_store',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@store'
	]);

	// User Children show
	Route::get('/customer/children/{id}', [
		'as' => 'user_children_show',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@show'
	]);

	// User Children edit
	Route::get('/customer/children/{id}/edit', [
		'as' => 'user_children_edit',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@edit'
	]);

	// User Children update
	Route::put('/customer/children/{id}', [
		'as' => 'user_children_update',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@update'
	]);

	// User Children destroy
	Route::delete('/customer/children/{id}', [
		'as' => 'user_children_destroy',
		'uses' => 'App\Http\Controllers\Customer\ChildrenController@destroy'
	]);



	/////////////////// Parenting Q&A Routes ///////////////////////

	// Parenting Q&A Store
	Route::post('/parenting/questions', [
		'as' => 'parenting_questions_store',
		'uses' => 'App\Http\Controllers\Parenting\QuestionsController@store'
	]);

	// Customer Q&A Index
	Route::get('/customer/questions_and_answers', [
		'as' => 'customer_questions_and_answers_index',
		'uses' => 'App\Http\Controllers\Customer\QuestionsAndAnswersController@index'
	]);

	// Customer Q&A Submit Required Info
	Route::post('/customer/questions_and_answers/{question_id}/submit_answer', [
		'as' => 'customer_questions_and_answers_answer_store',
		'uses' => 'App\Http\Controllers\Customer\QuestionsAndAnswersController@answer_store'
	]);

});
















































////////////////////////////////////////////////
//////////////// Admin Routes /////////////////
//////////////////////////////////////////////
Route::middleware(['admin'])->group(function () {

	////////////////////////////////////////////////
	//////////// Main Admin Routes/////////////////
	//////////////////////////////////////////////
	Route::get('/admin/', [
		'as' => 'admin_home',
		'uses' => 'App\Http\Controllers\Admin\HomeController@index'
	]);


	////////////////////////////////////////////////
	//////////// Shop Admin Routes/////////////////
	//////////////////////////////////////////////

	//////////////////Dashboared Routes/////////////////
	Route::get('/admin/shop/dashboard', [
		'as' => 'admin_shop_dashboared',
		'uses' => 'App\Http\Controllers\Admin\Shop\DashboardController@index'
	]);


	////////////////////////////////////////////////
	//////////// Products Admin Routes/////////////
	//////////////////////////////////////////////

	//////////////////Shop Products Index/////////////////
	Route::get('/admin/shop/products', [
		'as' => 'admin_shop_products_index',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@index'
	]);

	//////////////////Shop Products Create/////////////////
	Route::get('/admin/shop/products/create', [
		'as' => 'admin_shop_products_create',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@create'
	]);

	//////////////////Shop Products Store/////////////////
	Route::post('/admin/shop/products/', [
		'as' => 'admin_shop_products_store',
		'uses' => 'App\Http\Controllers\Admin\Shop\ProductsController@store'
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



	//////////////////Orders Index/////////////////
	Route::get('/admin/shop/orders', [
		'as' => 'admin_shop_orders_index',
		'uses' => 'App\Http\Controllers\Admin\Shop\OrdersController@index'
	]);




































	/////////////////////////////////////////////////
	//////////// Parenting Admin Routes/////////////
	///////////////////////////////////////////////
	

	//////////////////Dashboared Routes/////////////////

	//Dashboared Index
	Route::get('/admin/parenting/dashboard', [
		'as' => 'admin_parenting_dashboared',
		'uses' => 'App\Http\Controllers\Admin\Parenting\DashboardController@index'
	]);


	//////////////////Parenting Q&A Index/////////////////

	//Q&A Index
	Route::get('/admin/parenting/questions', [
		'as' => 'admin_parenting_questions_index',
		'uses' => 'App\Http\Controllers\Admin\Parenting\QuestionsController@index'
	]);

	//Q&A Submit Answer
	Route::post('/admin/parenting/questions/{id}/submit_answer', [
		'as' => 'admin_parenting_questions_submit_answer',
		'uses' => 'App\Http\Controllers\Admin\Parenting\QuestionsController@submit_answer'
	]);



	/////////////////////// Parenting Topics  /////////////////////////

	//Topics Index
	Route::get('/admin/parenting/topics', [
		'as' => 'admin_parenting_topics_index',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@index'
	]);

	//Topics Create
	Route::get('/admin/parenting/topics/create', [
		'as' => 'admin_parenting_topics_create',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@create'
	]);

	//Topics Store
	Route::post('/admin/parenting/topics', [
		'as' => 'admin_parenting_topics_store',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@store'
	]);

	//Topics Show
	Route::get('/admin/parenting/topics/{id}', [
		'as' => 'admin_parenting_topics_show',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@show'
	]);

	//Topics Edit
	Route::get('/admin/parenting/topics/{id}/edit', [
		'as' => 'admin_parenting_topics_edit',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@edit'
	]);

	//Topics Update
	Route::put('/admin/parenting/topics/{id}', [
		'as' => 'admin_parenting_topics_update',
		'uses' => 'App\Http\Controllers\Admin\Parenting\TopicsController@update'
	]);

	







	


});


Route::group(['prefix' => 'voyager_admin'], function () {
    Voyager::routes();
});

Auth::routes();



Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
