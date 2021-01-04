@extends('layouts.market_main')

@section('css')
@endsection

@section('content')

<main class="main">

	

	
	{{-- Banner Goes Here --}}

	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item"><a href="index.html">Shop</a></li>

				@if(isset(request()->section))
				<li class="breadcrumb-item"><a href="{{ route('shop_products_index', ['section' => request()->section]) }}">{{ $current_section->name }}</a></li>
				@endif

				@if(isset(request()->category))
				<li class="breadcrumb-item"><a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => request()->category]) }}">{{ $current_category->name }}</a></li>
				@endif

				@if(isset(request()->subcategory))
				<li class="breadcrumb-item"><a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => request()->category, 'subcategory' => request()->subcategory]) }}">{{ $current_subcategory->name }}</a></li>
				@endif

			
				
				
			</ol>
		</nav>

		<div class="row">
			<div class="col-lg-9 main-content">

				@if(!isset(request()->section) && !isset(request()->category) && !isset(request()->subcategory))
				<section class="product-category-panel" style="margin-bottom: 0px;">
			        <div class="row row-sm">
			        	@foreach($all_sections as $section)
			            <div class="col-6 col-sm-4 col-lg-3">
			                <div class="product-category">
			                    <a href="{{ route('shop_products_index', ['section' => $section->id]) }}">
			                        <figure>
			                            <img src="{{ $section->image }}">
			                        </figure>
			                        <div class="category-content">
			                            <h3>{{ $section->name }}</h3>
			                        </div>
			                    </a>
			                </div>
			            </div>
			            @endforeach
			        </div>
			    </section>
			    @endif

				@if(isset(request()->section) && !isset(request()->category) && !isset(request()->subcategory))
				<section class="product-category-panel" style="margin-bottom: 0px;">
			        <div class="row row-sm">
			        	@foreach($current_section->product_categories as $category)
			            <div class="col-6 col-sm-4 col-lg-3">
			                <div class="product-category">
			                    <a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => $category->id]) }}">
			                        <figure>
			                            <img src="{{ $category->image }}">
			                        </figure>
			                        <div class="category-content">
			                            <h3>{{ $category->name }}</h3>
			                        </div>
			                    </a>
			                </div>
			            </div>
			            @endforeach
			        </div>
			    </section>
			    @endif

			    @if(isset(request()->section) && isset(request()->category) && !isset(request()->subcategory))
				<section class="product-category-panel" style="margin-bottom: 0px;">
			        <div class="row row-sm">
			        	@foreach($current_category->product_subcategories as $subcategory)
			            <div class="col-6 col-sm-4 col-lg-3">
			                <div class="product-category">
			                    <a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => request()->category, 'subcategory' => $subcategory->id]) }}">
			                        <figure>
			                            <img src="{{ $subcategory->image }}">
			                        </figure>
			                        <div class="category-content">
			                            <h3>{{ $subcategory->name }}</h3>
			                        </div>
			                    </a>
			                </div>
			            </div>
			            @endforeach
			        </div>
			    </section>
			    @endif

			    <hr style="margin: 0 auto 5.2rem;">
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
										<a href="#" class="product-category">product subcategory</a>
									</div>
									<a href="#" class="btn-icon-wish"><i class="icon-heart"></i></a>
								</div>
								<h2 class="product-title">
									<a href="{{ route('shop_products_show', [$product->cheapest_variant_id($product->id)]) }}">{{ $product->title }}</a>
								</h2>
								<div class="ratings-container">
									<div class="product-ratings">
										<span class="ratings" style="width:100%"></span><!-- End .ratings -->
										<span class="tooltiptext tooltip-top"></span>
									</div><!-- End .product-ratings -->
								</div><!-- End .product-container -->
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

				<nav class="toolbox toolbox-pagination">
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
				</nav>
			</div><!-- End .col-lg-9 -->

			<div class="sidebar-overlay"></div>
			<div class="sidebar-toggle"><i class="fas fa-sliders-h"></i></div>
			<aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
				<div class="sidebar-wrapper">



					<div class="widget">
						<h3 class="widget-title">
							<a data-toggle="collapse" href="#sections-widget" role="button" aria-expanded="true" aria-controls="sections-widget">Sections</a>
						</h3>
						<div class="collapse show" id="sections-widget">
							<div class="widget-body">
								<ul class="cat-list">
									@foreach($all_sections as $section)
									<li><a href="{{ route('shop_products_index', ['section' => $section->id]) }}" class="{{ $section->id == request()->section ? 'text-active' : '' }}">{{ $section->name }}</a></li>
									@endforeach
								</ul>
							</div><!-- End .widget-body -->
						</div><!-- End .collapse -->
					</div><!-- End .widget -->

					@if(isset(request()->section))
					<div class="widget">
						<h3 class="widget-title">
							<a data-toggle="collapse" href="#categories-widget" role="button" aria-expanded="true" aria-controls="categories-widget">Categories</a>
						</h3>
						<div class="collapse show" id="categories-widget">
							<div class="widget-body">
								<ul class="cat-list">
									@foreach($current_section->product_categories as $category)
									<li><a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => $category->id]) }}" class="{{ $category->id == request()->category ? 'text-active' : '' }}">{{ $category->name }}</a></li>
									@endforeach
								</ul>
							</div><!-- End .widget-body -->
						</div><!-- End .collapse -->
					</div><!-- End .widget -->
					@endif


					@if(isset(request()->category))
					<div class="widget">
						<h3 class="widget-title">
							<a data-toggle="collapse" href="#subcategory-widget" role="button" aria-expanded="true" aria-controls="subcategory-widge">SubCategories</a>
						</h3>
						<div class="collapse show" id="subcategory-widge">
							<div class="widget-body">
								<ul class="cat-list">
									@foreach($current_category->product_subcategories as $subcategory)
									<li><a href="{{ route('shop_products_index', ['section' => request()->section, 'category' => request()->category, 'subcategory' => $subcategory->id]) }}" class="{{ $subcategory->id == request()->subcategory ? 'text-active' : '' }}">{{ $subcategory->name }}</a></li>
									@endforeach
								</ul>
							</div><!-- End .widget-body -->
						</div><!-- End .collapse -->
					</div><!-- End .widget -->
					@endif



					<div class="widget">
						<h3 class="widget-title">
							<a data-toggle="collapse" href="#widget-body-5" role="button" aria-expanded="true" aria-controls="widget-body-5">Brand</a>
						</h3>

						<div class="collapse show" id="widget-body-5">
							<div class="widget-body">
								<ul class="cat-list">
									@foreach($all_brands as $brand)
									<li><a href="#">{{ $brand->name }}</a></li>
									@endforeach
								</ul>
							</div><!-- End .widget-body -->
						</div><!-- End .collapse -->
					</div><!-- End .widget -->

					

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