@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">Customer</li>
                <li class="breadcrumb-item active" aria-current="page">Orders</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 order-lg-last dashboard-content">
                <h2>Order Details</h2>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Details
                            </div><!-- End .card-header -->
                            <div class="card-body">
                                <h4>Order Number <span style="color: #d93c81;">#1212</span></h4>
                                <p>
                                    Items: 1<br>
                                    Place On: 12/12/2020<br>
                                </p>
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                Order Status
                            </div><!-- End .card-header -->
                            <div class="card-body text-center">
                                <h2><span class="badge badge-primary">Placed</span></h2>
                                <p>Excpected Delivery From: 12/12/2020 To: 17/12/2020</p>
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                Items In Your Order
                            </div><!-- End .card-header -->
                            <div class="card-body">
                                <div class="cart-table-container">
                                    <table class="table table-cart">
                                        <thead>
                                            <tr>
                                                <th class="product-col">Product</th>
                                                <th class="price-col">Price</th>
                                                <th class="qty-col">Discount</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($order->items as $item)

                                            <?php

                                            $price = $item->price;
                                            $our_discount_percentage = $item->our_discount_percentage;
                                            $vendor_discount_percentage = $item->vendor_discount_percentage;

                                            $stock_discount_percentage = $our_discount_percentage + $vendor_discount_percentage;
                                            $stock_discount_value = $price * $stock_discount_percentage / 100;

                                            $item_vendor_price = $price - $stock_discount_value;

                                            $running_cost_percentage = $item->running_cost_percentage;

                                            $item_price = $item_vendor_price + ($item_vendor_price * $running_cost_percentage / 100);


                                            
                                            $discount_code_percentage = $item->discount_code_percentage;
                                            $discount_code_value = $item_price * $discount_code_percentage / 100;

                                            $user_discount_percentage = $item->user_discount_percentage;
                                            $user_discount_value = $item_price * $user_discount_percentage / 100;

                                            $item_total = $item_price + ($user_discount_value + $user_discount_value);

                                            $taxes_percentage = $item->taxes_percentage;
                                            $taxes_value = $item_total * $taxes_percentage / 100;

                                            $item_total_without_discount = number_format((float)$item_price + ($item_price * $taxes_percentage / 100), 2, '.', '');

                                            $item_final_total = number_format((float)$item_total + $taxes_value, 2, '.', '');

                                            

                                            ?>


                                            <tr class="product-row">
                                                <td class="product-col">
                                                    <figure class="product-image-container">
                                                        <a href="#}" class="product-image">
                                                            <img src="{{ $item->variant->images->first()->image }}" alt="product" width="50" height="50">
                                                        </a>
                                                    </figure>
                                                    <h5 class="product-title">
                                                        <a href="#">{{ $item->product->title }}</a>
                                                    </h5>
                                                </td>
                                                <td>{{ $item_total_without_discount }} EGP</td>
                                                <td>{{  $item_final_total - $item_total_without_discount }} EGP</td>
                                                <td>{{ $item_final_total }} EGP</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div><!-- End .cart-table-container -->
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div>



                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                PAYMENT INFORMATION
                            </div><!-- End .card-header -->
                            <div class="card-body">
                                <h4>Payment Method</h4>
                                <p>Cash On Delivery</p>
                                <br>
                                <h4>Payment Details</h4>
                                <table class="table table-totals">
                                    <tbody>
                                        <tr>
                                            <td>Subtotal</td>
                                            <td>17.90 EGP</td>
                                        </tr>

                                        <tr>
                                            <td>Tax</td>
                                            <td>0.00 EGP</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Order Total</td>
                                            <td>17.90 EGP</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div>


                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                DELIVERY INFORMATION
                            </div><!-- End .card-header -->
                            <div class="card-body">
                                <h4>Delivery Method</h4>
                                <p>Standard Door Delivery</p>
                                <br>
                                <h4>Shipping Address</h4>
                                <p>
                                    Omar Ibrahim<br>
                                    22 ali ameen st, first floor apt.1<br>
                                    Nasr City Al Manteqah Al Oula, Cairo<br>
                                </p>
                                <p>Phone: 01114030995</p>
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div>


                </div>
            </div><!-- End .col-lg-9 -->
            <aside class="sidebar col-lg-3">
                @include('customer.side_menu')
            </aside><!-- End .col-lg-3 -->
        </div><!-- End .row -->
    </div><!-- End .container -->

    <div class="mb-5"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection