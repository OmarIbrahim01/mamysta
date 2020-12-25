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
            <li class="active">
                <span>Shipping</span>
            </li>
            <li>
                <span>Review &amp; Payments</span>
            </li>
        </ul>

        <form id="checkout_form" method="POST" action="{{ route('shop_order_review') }}">
            @csrf
            <div class="row">
                <div class="col-lg-8">
                    <ul class="checkout-steps">
                        <li>
                            <h2 class="step-title">Shipping Address</h2>

                            @if(isset($selected_address) && $selected_address->count() > 0)
                            <div class="shipping-step-addresses">

                                <div class="shipping-address-box">
                                    <address>
                                        {{ $user->name }} {{ $user->last_name }} <br>
                                        {{ $selected_address->address }}, {{ $selected_address->city->name }}, 
                                        {{ $selected_address->region->name }} <br>
                                        Egypt. <br>
                                    </address>
                                    
                                    <div class="address-box-action clearfix">
                                        <input id="selected_address_id" type="radio" form="checkout_form" name="selected_address_id" value="{{ $selected_address->id }}" checked required>
                                        <label class="form-check-label" for="selected_address_id">Ship Here</label>
                                    </div><!-- End .address-box-action -->
                                </div><!-- End .hipping-address-box. -->
                                @foreach($addresses as $address)
                                <div class="shipping-address-box">
                                    <address>
                                        {{ $user->name }} {{ $user->last_name }} <br>
                                        {{ $address->address }}, {{ $address->city->name }}, 
                                        {{ $address->region->name }} <br>
                                        Egypt. <br>
                                    </address>

                                    <div class="address-box-action clearfix">
                                        <input id="selected_address_id" type="radio" form="checkout_form" name="selected_address_id" value="{{ $address->id }}" required>
                                        <label class="form-check-label" for="selected_address_id">Ship Here</label>
                                    </div><!-- End .address-box-action -->
                                </div><!-- End .shipping-address-box -->
                                @endforeach
                            </div><!-- End .shipping-step-addresses -->
                            <a href="#" class="btn btn-sm btn-outline-secondary btn-new-address" data-toggle="modal" data-target="#newaddressModal">+ New Address</a>
                            @else
                            <div class="form-group">
                                <label>Region</label>
                                <div class="select-custom">
                                    <select id="new_region_idd" form="checkout_form" name="new_region_id" class="form-control" required>
                                        <option value="" selected disabled>Select Region</option>
                                        @foreach($regions as $region)
                                        <option value="{{ $region->id }}">{{ $region->name }}</option>
                                        @endforeach
                                    </select>
                                </div><!-- End .select-custom -->
                            </div><!-- End .form-group -->

                            <div class="form-group">
                                <label>City</label>
                                <div class="select-custom">
                                    <select id="new_city_idd" form="checkout_form" name="new_city_id" class="form-control" required>
                                        <option value="" selected disabled>Select City</option>
                                    </select>
                                </div><!-- End .select-custom -->
                            </div><!-- End .form-group -->

                            <div class="form-group required-field">
                                <label>Street Address </label>
                                <textarea class="form-control" form="checkout_form" name="new_address_address" id="exampleFormControlTextarea1" rows="3" required></textarea>
                            </div><!-- End .form-group -->
                            @endif
                        </li>

                        <li>
                            <h2 class="step-title">Phone Number</h2>
                            @if(isset($selected_phone) && $selected_phone->count() > 0)
                            <div class="form-group">
                                <br>
                                <div class="select-custom">
                                    <select form="checkout_form" class="form-control form-control-sm" name="selected_phone_id">
                                        <option value="{{ $selected_phone->id }}" selected>{{ $selected_phone->phone }}</option>
                                        @foreach($phones as $phone)
                                        <option value="{{ $phone->id }}">{{ $phone->phone }}</option>
                                        @endforeach
                                    </select>
                                </div><!-- End .select-custom -->
                            </div><!-- End .form-group -->
                            <a href="#" class="btn btn-sm btn-outline-secondary btn-new-address" data-toggle="modal" data-target="#newphoneModal">+ New Phone</a>
                            @else
                            <div class="form-group required-field">
                                <label>Phone Number </label>
                                <div class="form-control-tooltip">
                                    <input type="tel" class="form-control" name="new_phone" form="checkout_form" required>
                                    <span class="input-tooltip" data-toggle="tooltip" title="For delivery questions." data-placement="right"><i class="icon-question-circle"></i></span>
                                </div><!-- End .form-control-tooltip -->
                            </div><!-- End .form-group -->
                            @endif
                        </li>

                        <li>
                            <div class="checkout-step-shipping">
                                <h2 class="step-title">Shipping Methods</h2>

                                <table class="table table-step-shipping">
                                    <tbody>
                                        <?php $index = 0; ?>
                                        @foreach($shipping_methods as $shipping_method)
                                        <tr>
                                            <td><input type="radio" form="checkout_form" name="shipping_method_id" value="{{ $shipping_method->id }}" @if($index == 0) {{ "checked" }} @endif></td>
                                            <td><strong>+{{ $shipping_method->price }} EGP</strong></td>
                                            <td>{{ $shipping_method->name }}</td>
                                            <td>{{ $shipping_method->days_info }}</td>
                                        </tr>
                                        <?php $index ++; ?>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div><!-- End .checkout-step-shipping -->
                        </li>
                    </ul>
                </div><!-- End .col-lg-8 -->

                <div class="col-lg-4">
                    <div class="order-summary">
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
            </div><!-- End .row -->

            <div class="row">
                <div class="col-lg-8">
                    <div class="checkout-steps-action">
                        <a href="#" onclick="event.preventDefault(); document.getElementById('checkout_form').submit();" class="btn btn-primary float-right">PROCEED TO NEXT STEP</a>
                    </div><!-- End .checkout-steps-action -->
                </div><!-- End .col-lg-8 -->
            </div><!-- End .row -->
        </form>
    </div><!-- End .container -->

    <div class="mb-6"></div><!-- margin -->
</main><!-- End .main -->




<!-- Modal -->
<div class="modal fade" id="newphoneModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="add_new_phone" method="POST" action="{{ route('shop_checkout_add_new_user_phone') }}">
                @csrf
                <div class="modal-header">
                    <h3 class="modal-title" id="addressModalLabel">Add New Phone Number</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div><!-- End .modal-header -->

                <div class="modal-body">
                    <div class="form-group required-field">
                        <label>Phone Number </label>
                        <div class="form-control-tooltip">
                            <input type="tel" form="add_new_phone" class="form-control form-control-sm" name="new_phone_number" required>
                            <span class="input-tooltip" data-toggle="tooltip" title="For delivery questions." data-placement="right"><i class="icon-question-circle"></i></span>
                        </div><!-- End .form-control-tooltip -->
                    </div><!-- End .form-group -->
                </div><!-- End .modal-body -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">Cancel</button>
                    <button type="submit" form="add_new_phone" class="btn btn-primary btn-sm">Save changes</button>
                </div><!-- End .modal-footer -->
            </form>
        </div><!-- End .modal-content -->
    </div><!-- End .modal-dialog -->
</div><!-- End .modal -->


<!-- Modal -->
<div class="modal fade" id="newaddressModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="add_new_address" method="POST" action="{{ route('shop_checkout_add_new_user_address') }}">
                @csrf
                <div class="modal-header">
                    <h3 class="modal-title" id="addressModalLabel">Shipping Address</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div><!-- End .modal-header -->

                <div class="modal-body">
                    <div class="form-group">
                        <label>Region</label>
                        <div class="select-custom">
                            <select id="add_new_address_region" form="add_new_address" class="form-control" name="new_address_region" required>
                                <option value="" selected disabled>Select Region</option>
                                @foreach($regions as $region)
                                <option value="{{ $region->id }}">{{ $region->name }}</option>
                                @endforeach
                            </select>
                        </div><!-- End .select-custom -->
                    </div><!-- End .form-group -->

                    <div class="form-group">
                        <label>City</label>
                        <div class="select-custom">
                            <select id="add_new_address_city" form="add_new_address" class="form-control" name="new_address_city" required>
                               <option value="" disabled>Select City</option>
                            </select>
                        </div><!-- End .select-custom -->
                    </div><!-- End .form-group -->

                    <div class="form-group required-field">
                        <label>Street Address </label>
                        <textarea form="add_new_address" name="new_address_address" class="form-control" id="exampleFormControlTextarea1" rows="3" required></textarea>
                    </div><!-- End .form-group -->
                </div><!-- End .modal-body -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">Cancel</button>
                    <button type="submit" form="add_new_address" class="btn btn-primary btn-sm">Save changes</button>
                </div><!-- End .modal-footer -->
            </form>
        </div><!-- End .modal-content -->
    </div><!-- End .modal-dialog -->
</div><!-- End .modal -->




@endsection


@section('js')

<script>
$(document).ready(function() {


  $("#add_new_address_region").change(function() {
    var val = $(this).val();
    $("#add_new_address_city").html(options[val]);
  });
  var options = [
    '',
    @foreach($regions as $region)
        "@foreach($region->cities as $city)<option value='{{$city->id}}'>{{$city->name}}</option>@endforeach",
    @endforeach
  ];




  $("#new_region_idd").change(function() {
    var val = $(this).val();
    $("#new_city_idd").html(options[val]);
  });
  var options = [
    '',
    @foreach($regions as $region)
        "@foreach($region->cities as $city)<option value='{{$city->id}}'>{{$city->name}}</option>@endforeach",
    @endforeach
  ];


});
</script>

@endsection