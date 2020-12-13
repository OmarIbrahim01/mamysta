<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use App\Models\ProductSection;
use App\Models\UserCartItem;
use View;
use Auth;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        $product_sections = ProductSection::all();

        
        
        view()->composer('*', function($view)
        {
            if (Auth::check()) {
                $user_cart_items = UserCartItem::where('user_id', Auth::user()->id)->get();
                $view->with('user_cart_items', $user_cart_items);
            }else {
                $view->with('user_cart_items', null);
            }
        });




        View::share([
                'product_sections' => $product_sections,
            ]);
    }
}
