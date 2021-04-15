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
                <h2>My Orders</h2>

                @if($orders->count() <= 0)
                <div class="col-lg-12 text-center">
                    <i class="icon-cart" style="font-size: 10em;"></i>
                    <h2>You Haven't Made Any Orders Yet!</h2>
                    <hr>
                    <a href="{{ route('shop_home') }}" class="btn btn-primary">Start Shopping Now</a>
                </div>
                @endif

                @foreach($orders as $order)
                <div class="card">
                    <div class="card-header">
                        Order <span style="color: #d93c81;">{{ $order->id }}</span>
                        <p class="card-edit">{{ $order->created_at->diffForHumans() }}</p>
                    </div><!-- End .card-header -->

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                <img src="/assets/images/shopping-cart.jpg">
                            </div>
                            <div class="col-md-2">
                                <h4><span class="badge badge-success">{{ $order->status->name }}</span></h4>
                            </div>
                            <div class="col-md-5">
                               <div class="checkout-step-shipping">

                                    <table class="table table-step-shipping">
                                        <tbody>
                                            @foreach($order->items as $item)
                                            <tr>
                                                <td>{{ $item->product->title }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div><!-- End .checkout-step-shipping -->
                            </div>
                            <div class="col-md-3 text-center">
                                <a href="{{ route('customer_orders_show', [$order->id]) }}" class="btn btn-primary btn-sm">See Details</a>
                                <ul class="list-group" style="margin-top: 30px;">
                                  <li class="list-group-item" style="background-color: #d93c81; color: white;">Total</li>
                                  <li class="list-group-item">{{ $order->total($order->id) }} EGP</li>
                                </ul>
                            </div>
                        </div>
                    </div><!-- End .card-body -->
                </div><!-- End .card -->
                @endforeach
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