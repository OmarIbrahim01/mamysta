@extends('admin.shop.layout')

@section('css')
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>All Products</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Products</a></li>
          <li class="breadcrumb-item active">View All Products</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">Products</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            
            <div class="row">
              @foreach($products as $product)
              <?php 
              $cheapest_variant_id = $product->cheapest_variant_id($product->id);
              $cheapest_variant_image = $product->cheapest_variant_image($product->id);
              $cheapest_variant_price = $product->cheapest_variant_price($product->id);
              $most_expensive_variant_price = $product->most_expensive_variant_price($product->id);

              $discount_value = $most_expensive_variant_price - $cheapest_variant_price;


              $discount_percentage = round((($most_expensive_variant_price - $cheapest_variant_price ) / $most_expensive_variant_price) * 100, 0);
              ?>
              <div class="col-sm-4">
                <a href="{{ route('admin_shop_products_show', [$product->id]) }}">
                  <div class="position-relative">
                    <img src="{{ $cheapest_variant_image }}" alt="Photo 1" class="img-fluid" style="width: 270px; height: 244px; object-fit: contain;">
                    <div class="row" style="margin-top: 20px;">
                      <div class="col-md-12">
                        <small>{{ $product->subcategory->name }}</small>
                      </div>
                      <div class="col-md-12">
                        <h5>{{ $product->title }}</h5>
                      </div>
                      <div class="col-md-6">
                        <h6 style="color: darkred; text-decoration: line-through;">{{ ceil($product->most_expensive_variant_price($product->id)) }} EGP</h6>
                      </div>
                      <div class="col-md-6">
                        <h6 style="color: darkred; ">{{ ceil($product->cheapest_variant_price($product->id)) }} EGP</h6>
                      </div>
                      <div class="col-md-6">
                        @if($discount_percentage > 0)
                        <h6>-{{ $discount_percentage }}%</h6>
                        @endif
                      </div>
                    </div>
                  </div>
                </a>
              </div>
              @endforeach
            </div>

          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container-fluid -->
</section>
<!-- /.content -->

@endsection




@section('js')
@endsection

