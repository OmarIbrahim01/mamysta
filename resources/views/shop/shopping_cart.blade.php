@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container">
        <div class="row">
            @if($cart_items->count() > 0)
            <div class="col-lg-8">
                <div class="cart-table-container">
                    <table class="table table-cart">
                        <thead>
                            <tr>
                                <th class="product-col">Product</th>
                                <th class="price-col">Price</th>
                                <th class="qty-col">Qty</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $cart_total = 0; ?>
                            @foreach($cart_items as $cart_item)
                            {{-- Product Row --}}
                            <tr class="product-row">
                                <td class="product-col">
                                    <figure class="product-image-container">
                                        <a href="{{ route('shop_products_show', [$cart_item->variant->id]) }}" class="product-image">
                                            <img src="{{ $cart_item->variant->images->first()->image }}" alt="product" width="80" height="80">
                                        </a>
                                    </figure>
                                    <h5 class="product-title">
                                        <a href="{{ route('shop_products_show', [$cart_item->variant->id]) }}">{{ $cart_item->product->brand->name }} {{ $cart_item->product->title }}</a>
                                    </h5>
                                </td>
                                <td>{{ $cart_item->stock->total($cart_item->stock->id) }} EGP</td>
                                <td>
                                    <form method="POST" action="{{ route('shop_cart_update_item', [$cart_item->id]) }}" style="margin: 0;">
                                        @csrf
                                        @method('PUT')
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input class="vertical-quantity form-control" type="text" name="quantity" value="{{ $cart_item->quantity }}">
                                            </div>
                                            <div class="col-md-6">
                                                <button type="submit" class="btn btn-sm btn-primary">Apply</button>
                                            </div>
                                        </div>
                                    </form>
                                </td>

                                <td>{{ number_format((float)$cart_item->stock->total($cart_item->stock->id) * $cart_item->quantity, 2, '.', '') }} EGP</td>
                                <?php $cart_total += $cart_item->stock->total($cart_item->stock->id) * $cart_item->quantity; ?>
                            </tr>
                            <tr class="product-action-row">
                                <td colspan="4" class="clearfix">
                                    <div class="float-left">
                                        <a href="#" class="btn-move"><i class="icon-wishlist"></i> Move to Wishlist</a>
                                    </div><!-- End .float-left -->
                                    
                                    <div class="float-right">
                                        <a href="#" onclick="event.preventDefault(); document.getElementById('remove_cart_item_{{ $cart_item->id }}').submit();" title="Remove product"><span class="sr-only">Remove</span><i class="icon-cancel"></i>  Remove</a>
                                        <form id="remove_cart_item_{{ $cart_item->id }}" action="{{ route('shop_cart_delete_item', [$cart_item->id]) }}" method="POST" style="display: none;">
                                            @method('delete')
                                            @csrf
                                        </form>
                                    </div><!-- End .float-right -->
                                </td>
                            </tr>
                            {{-- /Product Row  End--}}
                            @endforeach
                        </tbody>

                        <tfoot>
                            <tr>
                                <td colspan="4" class="clearfix">
                                    <div class="float-left">
                                        <a href="{{ route('shop_home') }}" class="btn btn-outline-secondary">Continue Shopping</a>
                                    </div><!-- End .float-left -->

                                    <div class="float-right">
                                        <a href="#" class="btn btn-outline-secondary btn-clear-cart" onclick="event.preventDefault(); document.getElementById('clear_cart').submit();"><i class="icon-cancel"></i> Clear Shopping Cart</a>
                                        <form id="clear_cart" method="POST" action="{{ route('shop_cart_clear') }}">
                                            @csrf
                                            @method('delete')
                                        </form>
                                    </div><!-- End .float-right -->
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div><!-- End .cart-table-container -->
            </div><!-- End .col-lg-8 -->

            <div class="col-lg-4">
                <div class="cart-summary">
                    <h3>Summary</h3>
                    <table class="table table-totals">
                        <tfoot>
                            <tr>
                                <td>Order Total</td>

                                <td>{{ number_format((float)$cart_total, 2, '.', '') }} EGP</td>
                            </tr>
                        </tfoot>
                    </table>

                    <div class="checkout-methods">
                        <p>Discounts and Promo codes are added and calculated in checkout</p>
                        <a href="{{ route('shop_checkout') }}" class="btn btn-block btn-sm btn-primary">Go to Checkout</a>
                    </div><!-- End .checkout-methods -->
                </div><!-- End .cart-summary -->
            </div><!-- End .col-lg-4 -->
            @else
            <div class="col-lg-12 text-center">
                <i class="icon-cart" style="font-size: 10em;"></i>
                <h2>Your Shopping Cart Is Empty!</h2>
                <hr>
                <a href="{{ route('shop_home') }}" class="btn btn-primary">Start Shopping Now</a>
            </div>
            @endif

        </div><!-- End .row -->
    </div><!-- End .container -->

    <div class="mb-6"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection