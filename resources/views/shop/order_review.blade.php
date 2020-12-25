@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
	<nav aria-label="breadcrumb" class="breadcrumb-nav">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item active" aria-current="page">Checkout</li>
			</ol>
		</div><!-- End .container -->
	</nav>

	<div class="container">
		<ul class="checkout-progress-bar text-center">
			<li>
				<span>Shipping</span>
			</li>
			<li class="active">
				<span>Review &amp; Payments</span>
			</li>
		</ul>
		<div class="row">
			<div class="col-lg-4">
                <div class="order-summary" style="margin-top: 0px;">
                    <h3>Summary</h3>

                    <h4>
                        <a data-toggle="collapse" href="#order-cart-section" class="collapsed" role="button" aria-expanded="false" aria-controls="order-cart-section">2 products in Cart</a>
                    </h4>

                    <div class="collapse show" id="order-cart-section">
                        <table class="table table-mini-cart">
                            <tbody>
                                @foreach($cart_items as $cart_item)
                                <tr>
                                    <td class="product-col">
                                        <figure class="product-image-container">
                                            <a href="{{ route('shop_products_show', [$cart_item->variant->id]) }}" class="product-image">
                                                <img src="{{ $cart_item->variant->images->first()->image }}" alt="product">
                                            </a>
                                        </figure>
                                        <div>
                                            <h2 class="product-title">
                                                <a href="{{ route('shop_products_show', [$cart_item->variant->id]) }}">{{ $cart_item->product->brand->name }} {{ $cart_item->product->title }}</a>
                                            </h2>

                                            <span class="product-qty">Qty: {{ $cart_item->quantity }}</span>
                                        </div>
                                    </td>
                                    <td class="price-col">{{ number_format((float)$cart_item->stock->total($cart_item->stock->id) * $cart_item->quantity, 2, '.', '') }} EGP</td>
                                </tr>
                                @endforeach
                            </tbody>    
                        </table>
                    </div><!-- End #order-cart-section -->
                </div><!-- End .order-summary -->
            </div><!-- End .col-lg-4 -->
			<div class="col-lg-8 order-lg-first">
				<div class="row">
					<div class="col-md-12">

						<form method="POST" action="{{ route('shop_order_store') }}">
						@csrf

						<input type="hidden" name="user_address" value="{{ $user_address->id }}">
						<input type="hidden" name="user_phone" value="{{ $user_phone->id }}">
						<input type="hidden" name="shipping_method" value="{{ $shipping_method->id }}">


						<div class="card text-center">
							<div class="card-header">
								Shippping Information
							</div><!-- End .card-header -->
							<div class="card-body">
								<p>
									{{ Auth::user()->name }} {{ Auth::user()->last_name }}<br>
									{{ $user_address->address }}<br>
									{{ $user_address->city->name }}, {{ $user_address->region->name }}<br>
									{{ $user_phone->phone }}
								</p>
							</div><!-- End .card-body -->
						</div><!-- End .card -->
					</div>
					<div class="col-md-6">
						<div class="checkout-step-shipping">
							<h2 class="step-title">Payment Methods</h2>
							<table class="table table-step-shipping">
								<tbody>
									@foreach($payment_methods as $payment_method)
									<tr>
										<td><input type="radio" name="payment_method" value="{{ $payment_method->id }}" checked required></td>
										<td><strong>{{ $payment_method->name }}</strong></td>
										<td>+ {{ $payment_method->cost }} EGP</td>
									</tr>
									@endforeach
								</tbody>
							</table>
						</div><!-- End .checkout-step-shipping -->
					</div>
					<div class="col-md-6">
						<div class="checkout-step-shipping">
							<h2 class="step-title">Discount Code</h2>
							<div class="code_check_class" style="margin-top: 10px;">
								<input id="discount_code_input" type="text" class="form-control form-control-sm" name="discount_code" placeholder="Enter discount code" value="">

								<a id="code_check_button" class="btn btn-sm btn-outline-secondary">Apply Discount</a>
								<div class="code_validation">
									<small id="promo_unvalid" style="color: red; display: none;">Unvalid Coupon Code. Please try again.</small>
									<small id="promo_valid" style="color: green; display: none;">Discount Code Added Successfully</small>
								</div>
							</div>
							<br>
						</div><!-- End .checkout-step-shipping -->
					</div>
					<div class="col-md-12">
						<div class="cart-summary">
							<h3>Total</h3>

							<table class="table table-totals">
								<tbody>
									<tr>
										<td>Subtotal</td>
										<td>{{ $cart_total }} EGP</td>
									</tr>

									<tr id="discount_value_field">
										<td id="total_discount_percentage"></td>
										<td id="total_discount_value"></td>
									</tr>
									@if(isset($user_discounts) && $user_discounts->count() > 0)
									<tr>
										<td>Discount ({{ $user_discount_percentage }}%)</td>
										<td>{{ $cart_total * $user_discount_percentage / 100 }} EGP</td>
									</tr>
									@endif
									<tr>
										<td>Tax</td>
										<td>{{ $taxes }} EGP</td>
									</tr>
									<tr>
										<td>Shipping & Handling</td>
										<td>{{ $shipping_method->price }} EGP</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td>Order Total</td>
										<td id="order_final_total">{{ $cart_total - $user_discount_percentage + $taxes + $shipping_method->price }} EGP</td>
									</tr>
								</tfoot>
							</table>
						</div><!-- End .cart-summary -->
					</div>
				</div>
			</div><!-- End .col-lg-8 -->
		</div><!-- End .row -->
		<div class="row">
            <div class="col-lg-8">
                <div class="checkout-steps-action">
                    <button type="submit" class="btn btn-primary float-right">PLACE ORDER</button>
                    </form>
                </div><!-- End .checkout-steps-action -->
            </div><!-- End .col-lg-8 -->
        </div><!-- End .row -->
	</div><!-- End .container -->

	<div class="mb-6"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')

<script>

	$("#discount_value_field").hide();

	$("#code_check_button").click(function() {
        $.ajax({
          type: "GET",
          url: '{{ route('shop_order_review_discount_code_check') }}',
          data: {
          	_token:'{{ csrf_token() }}',
            discount_code: $('#discount_code_input').val()
          },
          success: function(data) {
            if (data.discount_code_status != 'false') {
                        
                        var discountId = data.discount_code_id;
                        var discountCodeCode = data.discount_code_code;
                        var discountPercentage = data.discount_code_discount_percentage;
                        var userDicountPercentage = {{ $user_discount_percentage }};


                        var cartTotal = {{ $cart_total }};

                        var codeDiscountValue = cartTotal * discountPercentage / 100;
                        var userDicountValue = cartTotal * userDicountPercentage / 100;

                        var totalAfterDiscount = cartTotal - (codeDiscountValue + userDicountValue);

                        var taxes = {{ $taxes }};

                        var shippingPrice = {{ $shipping_method->price }};

                        var finalTotal = totalAfterDiscount + taxes + shippingPrice;
                        
                        
                        $("#discount_code_input").prop( "value", data.discount_code_code );
                        $("#discount_code_input").attr("readonly", true); 
                        $("#code_check_button").hide();
                        $("#promo_valid").show();
                        $("#promo_unvalid").hide();

                        $("#discount_value_field").show();

                        $("#total_discount_percentage").text("Promo Code Discount (" + discountPercentage + "%)");
						$("#total_discount_value").text(codeDiscountValue.toFixed(2) + " EGP");

						$("#order_final_total").text(finalTotal.toFixed(2) + " EGP");
						
            }
            else{
            	$("#promo_unvalid").show();
            }
          },
          error: function(data){
            alert("A problem occured Please try again later.");
          }

        });
    });
</script>

@endsection