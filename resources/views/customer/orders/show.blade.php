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
                                <h4>Order Number <span style="color: #d93c81;">#{{ $order->id }}</span></h4>
                                <p>
                                    Items: {{ $order->items->count() }}<br>
                                    Placed On: {{ $order->created_at->format('d/m/Y') }}<br>
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
                                <h2><span class="badge badge-primary">{{ $order->status->name }}</span></h2>
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
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($order->items as $item)
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
                                                <td>{{ $item->total($item->id) }} EGP</td>
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
                                <p>{{ $order->payment_method->name }}</p>
                                <br>
                                <h4>Payment Details</h4>
                                <table class="table table-totals">
                                    <tbody>
                                        <tr>
                                            <td>Subtotal</td>
                                            <td>{{ $order->items_total($order->id) }} EGP</td>
                                        </tr>
                                        <tr>
                                            <td>Shipping & Handling</td>
                                            <td>{{ $order->shipping_method->price }} EGP</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Order Total</td>
                                            <td>{{ $order->total($order->id) }} EGP</td>
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
                                <h4>Shipping Method</h4>
                                <p>{{ $order->shipping_method->name }}</p>
                                <br>
                                <h4>Shipping Address</h4>
                                <p>
                                    {{ $order->user->name }} {{ $order->user->last_name }}<br>
                                    {{ $order->user_address->address }}<br>
                                    {{ $order->user_address->city->name }}, {{ $order->user_address->region->name }}<br>
                                </p>
                                <p>Phone: {{ $order->user_phone->phone}}</p>
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