@extends('layouts.market_main')

@section('css')
@endsection

@section('content')

<main class="main">

	

	
	{{-- Banner Goes Here --}}

	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item"><a href="#">Shop</a></li>
				<li class="breadcrumb-item"><a href="#">{{ $searchTerm }}</a></li>
			</ol>
		</nav>

		<div class="row">
			<div class="col-lg-9 main-content">

				<div class="row">
					<div class="col-md-12">
						<h4>Results For <span style="color: grey;">"{{ $searchTerm }}"</span></h4>
					</div>
				</div>

			    <hr style="margin: 0 auto 5.2rem;">
			    @if($products->count() > 0)
				<div class="row">
					@foreach($products as $product)
					@if($product->variants->count() > 0 && $product->stocks->count() > 0)

					<?php 
					$cheapest_variant_id = $product->cheapest_variant_id($product->id);
					$cheapest_variant_image = $product->cheapest_variant_image($product->id);
					$cheapest_variant_price = $product->cheapest_variant_price($product->id);
					$most_expensive_variant_price = $product->most_expensive_variant_price($product->id);

					$discount_value = $most_expensive_variant_price - $cheapest_variant_price;


					$discount_percentage = round((($most_expensive_variant_price - $cheapest_variant_price ) / $most_expensive_variant_price) * 100, 0);
					?>


					<div class="col-6 col-sm-4">
						<div class="product-default inner-quickview inner-icon">
							<figure>
								<a href="{{ route('shop_products_show', [$cheapest_variant_id]) }}">
									<img src="{{ $cheapest_variant_image }}" style="width: 270px; height: 244px; object-fit: contain;">
								</a>
								{{-- Labels --}}
								<div class="label-group">
									<div class="product-label label-hot">HOT</div>
									@if($discount_percentage > 0)
									<div class="product-label label-sale">-{{ $discount_percentage }}%</div>
									@endif
								</div>
								<div class="btn-icon-group">
									<button class="btn-icon btn-add-cart" data-toggle="modal" data-target="#addCartModal"><i class="icon-shopping-cart"></i></button>
								</div>
								<a href="{{ route('shop_products_show', [$product->cheapest_variant_id($product->id)]) }}" class="btn-quickview" title="Quick View">View</a>
							</figure>
							<div class="product-details">
								<div class="category-wrap">
									<div class="category-list">
										<a href="#" class="product-category">{{ $product->subcategory->name }}</a>
									</div>
									<a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
								</div>
								<h2 class="product-title">
									<a href="{{ route('shop_products_show', [$product->cheapest_variant_id($product->id)]) }}">{{ $product->title }}</a>
								</h2>
								{{--  
								<div class="ratings-container">
									<div class="product-ratings">
										<span class="ratings" style="width:100%"></span><!-- End .ratings -->
										<span class="tooltiptext tooltip-top"></span>
									</div><!-- End .product-ratings -->
								</div><!-- End .product-container -->
								--}}
								<div class="price-box">

									<span class="old-price">{{ ceil($product->most_expensive_variant_price($product->id)) }} EGP</span>
									<span class="product-price">{{ ceil($product->cheapest_variant_price($product->id)) }} EGP</span>
								</div><!-- End .price-box -->
							</div><!-- End .product-details -->
						</div>
					</div><!-- End .col-sm-4 -->
					@endif
					@endforeach
				</div><!-- End .row -->
				@else
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center">Sorry! No Results For <span style="color: grey;">"{{ $searchTerm }}"</span> Please Try Again</h2>
					</div>
				</div>
				@endif

				{{-- <nav class="toolbox toolbox-pagination">
					<ul class="pagination toolbox-item">
						<li class="page-item disabled">
							<a class="page-link page-link-btn" href="#"><i class="icon-angle-left"></i></a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><span class="page-link">...</span></li>
						<li class="page-item">
							<a class="page-link page-link-btn" href="#"><i class="icon-angle-right"></i></a>
						</li>
					</ul>
				</nav> --}}
			</div><!-- End .col-lg-9 -->

			<div class="sidebar-overlay"></div>
			<div class="sidebar-toggle"><i class="fas fa-sliders-h"></i></div>
			<aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
				<div class="sidebar-wrapper">





				


					
					

					<div class="widget widget-featured">
						<h3 class="widget-title">Featured</h3>
						
						<div class="widget-body">
							<div class="owl-carousel widget-featured-products">
								<div class="featured-col">
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-10.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-11.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-12.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
								</div><!-- End .featured-col -->

								<div class="featured-col">
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-13.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-14.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
									<div class="product-default left-details product-widget">
										<figure>
											<a href="product.html">
												<img src="/assets/images/products/product-8.jpg">
											</a>
										</figure>
										<div class="product-details">
											<h2 class="product-title">
												<a href="product.html">Product Short Name</a>
											</h2>
											<div class="ratings-container">
												<div class="product-ratings">
													<span class="ratings" style="width:100%"></span><!-- End .ratings -->
													<span class="tooltiptext tooltip-top"></span>
												</div><!-- End .product-ratings -->
											</div><!-- End .product-container -->
											<div class="price-box">
												<span class="product-price">$49.00</span>
											</div><!-- End .price-box -->
										</div><!-- End .product-details -->
									</div>
								</div><!-- End .featured-col -->
							</div><!-- End .widget-featured-slider -->
						</div><!-- End .widget-body -->
					</div><!-- End .widget -->
					
					<div class="widget widget-block">
						<h3 class="widget-title">Custom HTML Block</h3>
						<h5>This is a custom sub-title.</h5>
						<p>Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi. </p>
					</div><!-- End .widget -->
				</div><!-- End .sidebar-wrapper -->
			</aside><!-- End .col-lg-3 -->
		</div><!-- End .row -->
	</div><!-- End .container -->

	<div class="mb-3"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection