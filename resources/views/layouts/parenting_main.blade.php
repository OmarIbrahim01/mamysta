<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>Mamysta - Market</title>

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Bootstrap eCommerce Template">
	<meta name="author" content="SW-THEMES">
		
	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="/assets/images/icons/favicon.ico">
	
	
	<script type="text/javascript">
		WebFontConfig = {
			google: { families: [ 'Open+Sans:300,400,600,700,800','Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
		};
		(function(d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = '/assets/js/webfont.js';
			wf.async = true;
			s.parentNode.insertBefore(wf, s);
		})(document);
	</script>

	<!-- Plugins CSS File -->
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

	<!-- Main CSS File -->
	<link rel="stylesheet" href="/assets/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="/assets/vendor/fontawesome-free/css/all.min.css"> 
	<link rel="stylesheet" href="/assets/css/custom.css">
	{{-- CSS Section --}}
	@yield('css')
</head>
<body>
	<div class="page-wrapper">
		<div class="top-notice bg-dark text-white">
			<div class="container text-center">
				<h5 class="d-inline-block mb-0 mr-2">Get Up to <b>10% OFF</b> With Promo Code </h5>
				<a href="category.html" class="category">#ABCD</a>
				<small>* Limited time only</small>
				<button title="Close (Esc)" type="button" class="mfp-close">×</button>
			</div><!-- End .container -->
		</div><!-- End .top-notice -->

		<header class="header">
			<div class="header-top">
				<div class="container">
					<div class="header-left">
						<p class="top-message ls-0 text-uppercase text-white d-none d-sm-block">All Mom and Kids Shopping Needs</p>
					</div><!-- End .header-left -->

					<div class="header-right header-dropdowns w-sm-100">
						<div class="header-dropdown dropdown-expanded d-none d-lg-block mr-4">
							<a href="#">Links</a>
							<div class="header-menu">
								<ul>
									<li><a href="my-account.html">Track Order </a></li>
									<li><a href="about.html">About</a></li>
									<li><a href="contact.html">Contact</a></li>
									<li><a href="#">Help &amp; FAQs</a></li>
								</ul>
							</div><!-- End .header-menu -->
						</div><!-- End .header-dropown -->

						<span class="separator"></span>

						<div class="header-dropdown mr-auto mr-sm-3 mr-md-0">
							<a href="#"><img src="/assets/images/flags/eg.png" alt="Egypt Flag">Egypt</a>
						</div><!-- End .header-dropown -->

						<span class="separator"></span>

						<div class="social-icons">
							<a href="#" class="social-icon social-facebook icon-facebook" target="_blank"></a>
							<a href="#" class="social-icon social-instagram icon-instagram" target="_blank"></a>
							<a href="#" class="social-icon social-twitter icon-twitter" target="_blank"></a>
						</div><!-- End .social-icons -->
					</div><!-- End .header-right -->
				</div><!-- End .container -->
			</div><!-- End .header-top -->

			<div class="header-middle">
				<div class="container">
					<div class="header-left col-lg-2 w-auto pl-0">
						<button class="mobile-menu-toggler mr-2" type="button">
							<i class="icon-menu"></i>
						</button>
						<a href="index.html" class="logo">
							<img src="/assets/images/logo.png" alt="Porto Logo">
						</a>
					</div><!-- End .header-left -->

					<div class="header-right w-lg-max ml-0">
						<div class="header-icon header-search header-search-inline header-search-category w-lg-max pl-3" style="margin-right: 100px;">
							<a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
							<form action="#" method="get">
								<div class="header-search-wrapper">
									<input type="search" class="form-control" name="q" id="q" placeholder="Search..." required>
									<div class="select-custom">
										<select id="cat" name="cat">
											<option value="">All Categories</option>
											<option value="4">Fashion</option>
											<option value="12">- Women</option>
											<option value="13">- Men</option>
											<option value="66">- Jewellery</option>
											<option value="67">- Kids Fashion</option>
											<option value="5">Electronics</option>
											<option value="21">- Smart TVs</option>
											<option value="22">- Cameras</option>
											<option value="63">- Games</option>
											<option value="7">Home &amp; Garden</option>
											<option value="11">Motors</option>
											<option value="31">- Cars and Trucks</option>
											<option value="32">- Motorcycles &amp; Powersports</option>
											<option value="33">- Parts &amp; Accessories</option>
											<option value="34">- Boats</option>
											<option value="57">- Auto Tools &amp; Supplies</option>
										</select>
									</div><!-- End .select-custom -->
									<button class="btn icon-search-3" type="submit"></button>
								</div><!-- End .header-search-wrapper -->
							</form>
						</div><!-- End .header-search -->

						
						@auth

						<div class="dropdown cart-dropdown" style="margin-right: 20px;">
							<a href="#" class="dropdown-toggle dropdown-arrow" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
								<i class="icon-user-2"></i>
							</a>
							<div class="dropdown-menu">
								<div class="dropdownmenu-wrapper">
									<div class="dropdown-cart-header">
										<p class="text-center">Hello, {{ Auth::user()->name }}</p>
									</div><!-- End .dropdown-cart-header -->
									<div class="row" style="margin: 20px 45px 10px 45px;">
										<a href="{{ route('customer_account_index') }}" class="btn btn-link link-primary"><i class="icon-user-2"></i> Account</a>
									</div>
									<div class="row" style="margin: 20px 45px 10px 45px;">
										<a href="{{ route('customer_questions_and_answers_index') }}" class="btn btn-link link-primary"><i class="icon-question-circle"></i> My Q&A</a>
									</div>
									<div class="row" style="margin: 10px 45px;">
										<a href="{{ route('customer_orders_index') }}" class="btn btn-link link-primary"><i class="icon-bag-2"></i> My Orders</a>
									</div>
									<div class="row" style="margin: 10px 45px;">
										<a href="#" class="btn btn-link link-primary"><i class="icon-wishlist-2"></i> Favourites</a>
									</div>
									<br>
									<div class="row" style="margin: 10px 45px;">
										<a href="#" class="btn btn-link link-primary" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="icon-right-open-big"></i> Logout</a>
										<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
										    @csrf
										</form>
									</div>
								</div><!-- End .dropdownmenu-wrapper -->
							</div><!-- End .dropdown-menu -->
						</div><!-- End .dropdown -->

						<div class="dropdown cart-dropdown">
							<a href="#" class="dropdown-toggle dropdown-arrow" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-display="static">
								<i class="icon-shopping-cart"></i>
								<?php $cart_items_count = 0 ?>
								@foreach($user_cart_items as $user_cart_item)
								<?php $cart_items_count += $user_cart_item->quantity ?>
								@endforeach
								<span class="cart-count badge-circle">{{ $cart_items_count }}</span>
							</a>

							<div class="dropdown-menu">
								<div class="dropdownmenu-wrapper">
									<div class="dropdown-cart-header">
										<span>{{ $cart_items_count }}</span>
										<a href="{{ route('shop_cart_index') }}" class="float-right">View Cart</a>
									</div><!-- End .dropdown-cart-header -->
									
									<div class="dropdown-cart-products">
										
										@if($user_cart_items->count() > 0)
										<?php $total = 0; ?>
										@foreach($user_cart_items as $user_cart_item)
										<?php $total += $user_cart_item->stock->total($user_cart_item->stock->id) * $user_cart_item->quantity; ?>
										<div class="product">
											<div class="product-details">
												<h4 class="product-title">
													<a href="{{ route('shop_products_show', [$user_cart_item->variant->id]) }}">{{ $user_cart_item->product->brand->name }} {{ $user_cart_item->product->title }}</a>
												</h4>
												
												<span class="cart-product-info">
													<span class="cart-product-qty">{{ $user_cart_item->quantity }}</span>
													x <span style="color: darkred;">{{ ceil($user_cart_item->stock->total($user_cart_item->stock->id) * $user_cart_item->quantity) }} EGP </span>
												</span>
											</div><!-- End .product-details -->
												
											<figure class="product-image-container">
												<a href="{{ route('shop_products_show', [$user_cart_item->variant->id]) }}" class="product-image">
													<img src="{{ $user_cart_item->variant->images->first()->image }}" alt="product" style="width: 70px; height: 70px; object-fit: contain;">
												</a>
												<a href="#" onclick="event.preventDefault(); document.getElementById('remove_cart_item_{{ $user_cart_item->id }}').submit();" class="btn-remove icon-cancel" title="Remove Product"></a>
												<form id="remove_cart_item_{{ $user_cart_item->id }}" action="{{ route('shop_cart_delete_item', [$user_cart_item->id]) }}" method="POST" style="display: none;">
													@method('delete')
												    @csrf
												</form>
											</figure>
										</div><!-- End .product -->
										@endforeach
										@endif
										
									</div><!-- End .cart-product -->
									@if($user_cart_items->count() > 0)
									<div class="dropdown-cart-total">
										<span>Total</span>
										
										<span class="cart-total-price float-right">{{ ceil($total) }} EGP</span>
									</div><!-- End .dropdown-cart-total -->
									
									<div class="dropdown-cart-action">
										<a href="{{ route('shop_cart_index') }}" class="btn btn-dark btn-block">View Shopping Cart</a>
									</div><!-- End .dropdown-cart-total -->
									<div class="dropdown-cart-action">
										<a href="{{ route('shop_checkout') }}" class="btn btn-primary btn-block">Proceed To Checkout</a>
									</div><!-- End .dropdown-cart-total -->
									@endif
								</div><!-- End .dropdownmenu-wrapper -->
							</div><!-- End .dropdown-menu -->
						</div><!-- End .dropdown -->
						@else
						<a href="{{ route('login') }}" class="header-icon" style="text-decoration: underline;">Login</a>
						<p class="header-icon">/</p>
						<a href="{{ route('register') }}" class="header-icon" style="text-decoration: underline;">Sign Up</a>
						@endif
					</div><!-- End .header-right -->
				</div><!-- End .container -->
			</div><!-- End .header-middle -->

			<div class="header-bottom sticky-header d-none d-lg-block" style="background-color: #eee;">
				<div class="container">
					<nav class="main-nav w-100">
						<ul class="menu">
							<li>
								<a href="{{ route('parenting_home') }}">Home</a>
							</li>

							<li>
								<a href="{{ route('parenting_questions_and_answers') }}">Q&A</a>
							</li>

							<li>
								<a href="{{ route('parenting_topics_index') }}">Topics</a>
							</li>

							<li>
								<a href="#" class="sf-with-ul">Child Groth</a>
								<ul style="display: none;">
									<li><a href="{{ route('parenting_groth_calaculator_index') }}">Groth Calculator</a></li>
									<li><a href="{{ route('parenting_groth_tracker_index') }}">Groth Tracker</a></li>
								</ul>
							</li>



							<li>
								<a href="#">Vaccine Finder</a>
							</li>

							<li class="float-right"><a href="{{ route('shop_home') }}" class="outlined-btn outlined-btn-success">Mamysta Shop</a></li>
						</ul>
					</nav>
				</div><!-- End .container -->
			</div><!-- End .header-bottom -->
		</header><!-- End .header -->


		@if ($errors->any())
	        <div class="alert alert-danger alert-dismissible fade show notification_popup">
	            <ul>
	                @foreach ($errors->all() as $error)
	                    <li>{{ $error }}</li>
	                @endforeach
	            </ul>
	            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	        </div>
	    @endif

	    @if (session()->has('message'))
	        <div class="alert alert-success alert-dismissible fade show notification_popup">
	            <ul>
	              <li>{{ session('message') }}</li>
	            </ul>
	            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	        </div>
	    @endif


		{{-- Content Section --}}
		@yield('content')


		<div class="brands-section mt-5 mb-5">
			<div class="container">
				<div class="brands-slider owl-carousel owl-theme images-center">
					<img src="/assets/images/brands/brand1.png" width="140" height="60" alt="brand">
					<img src="/assets/images/brands/brand2.png" width="140" height="60" alt="brand">
					<img src="/assets/images/brands/brand3.png" width="140" height="60" alt="brand">
					<img src="/assets/images/brands/brand4.png" width="140" height="60" alt="brand">
					<img src="/assets/images/brands/brand5.png" width="140" height="60" alt="brand">
					<img src="/assets/images/brands/brand6.png" width="140" height="60" alt="brand">
				</div><!-- End .brands-slider -->
			</div>
		</div>
		

		<footer class="footer bg-dark">
			<div class="footer-middle">
				<div class="container">
					<div class="footer-ribbon bg-primary text-white ls-10">
						Get in touch
					</div><!-- End .footer-ribbon -->
					<div class="row">
						<div class="col-lg-3 col-md-4">
							<div class="widget">
								<h4 class="widget-title">Contact Info</h4>
								<ul class="contact-info">
									<li>
										<span class="contact-info-label">Address</span>123 Street Name, City, England
									</li>
									<li>
										<span class="contact-info-label">Phone</span>Toll Free <a href="tel:">(123) 456-7890</a>
									</li>
									<li>
										<span class="contact-info-label">Email</span> <a href="mailto:mail@example.com">mail@example.com</a>
									</li>
									<li>
										<span class="contact-info-label">Working Days/Hours</span>
										Mon - Sun / 9:00AM - 8:00 PM
									</li>
								</ul>
								<div class="social-icons">
									<a href="#" class="social-icon social-instagram icon-instagram" target="_blank" title="Instagram"></a>
									<a href="#" class="social-icon social-twitter icon-twitter" target="_blank" title="Twitter"></a>
									<a href="#" class="social-icon social-facebook icon-facebook" target="_blank" title="Facebook"></a>
								</div><!-- End .social-icons -->
							</div><!-- End .widget -->
						</div><!-- End .col-lg-3 -->

						<div class="col-lg-9 col-md-8">
							<div class="widget widget-newsletter">
								<h4 class="widget-title">Subscribe newsletter</h4>
								<div class="row">
									<div class="col-lg-6 col-md-12">
										<p>Get all the latest information on Events, Sales and Offers. Sign up for newsletter today</p>
									</div><!-- End .col-lg-6 -->

									<div class="col-lg-6 col-md-12">
										<form action="#" class="d-flex mb-0 w-100">
											<input type="email" class="form-control mb-0" placeholder="Email address" required>

											<input type="submit" class="btn btn-primary shadow-none" value="Subscribe">
										</form>
									</div><!-- End .col-lg-6 -->
								</div><!-- End .row -->
							</div><!-- End .widget -->

							<div class="row">
								<div class="col-sm-6">
									<div class="widget">
										<h4 class="widget-title">Customer Service</h4>

										<ul class="links link-parts row mb-0">
											<div class="link-part col-lg-6 col-md-12">
												<li><a href="#">Help & FAQs</a></li>
												<li><a href="#">Order Tracking</a></li>
												<li><a href="#">Shipping & Delivery</a></li>
											</div>
											<div class="link-part col-lg-6 col-md-12">
												<li><a href="#">Orders History</a></li>
												<li><a href="#">Advanced Search</a></li>
												<li><a href="#" class="login-link">Login</a></li>
											</div>
										</ul>
									</div><!-- End .widget -->
								</div><!-- End .col-sm-6 -->

								<div class="col-sm-6">
									<div class="widget">
										<h4 class="widget-title">About Us</h4>
										
										<ul class="links link-parts row mb-0">
											<div class="link-part col-lg-6 col-md-12">
												<li><a href="about.html">About Us</a></li>
												<li><a href="#">Corporate Sales</a></li>
												<li><a href="#">Careers</a></li>
											</div>
											<div class="link-part col-lg-6 col-md-12">
												<li><a href="#">Community</a></li>
												<li><a href="#">Investor Relations</a></li>
											</div>
										</ul>
									</div><!-- End .widget -->
								</div><!-- End .col-sm-6 -->
							</div><!-- End .row -->
						</div><!-- End .col-lg-9 -->
					</div><!-- End .row -->
				</div><!-- End .container -->
			</div><!-- End .footer-middle -->

			<div class="container">
				<div class="footer-bottom d-flex justify-content-between align-items-center flex-wrap">
					<p class="footer-copyright py-3 pr-4 mb-0">&copy; Porto eCommerce. 2020. All Rights Reserved</p>

					<img src="/assets/images/payments.png" alt="payment methods" class="footer-payments py-3">
				</div><!-- End .footer-bottom -->
			</div><!-- End .container -->
		</footer><!-- End .footer -->
	</div><!-- End .page-wrapper -->

	<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

	<div class="mobile-menu-container">
		<div class="mobile-menu-wrapper">
			<span class="mobile-menu-close"><i class="icon-cancel"></i></span>
			<nav class="mobile-nav">
				<ul class="mobile-menu mb-3">
					<li class="active"><a href="index.html">Home</a></li>
					<li>
						<a href="category.html">Categories<span class="tip tip-new">New</span></a>
						<ul>
							<li><a href="category-banner-full-width.html">Full Width Banner</a></li>
							<li><a href="category-banner-boxed-slider.html">Boxed Slider Banner</a></li>
							<li><a href="category-banner-boxed-image.html">Boxed Image Banner</a></li>
							<li><a href="category-sidebar-left.html">Left Sidebar</a></li>
							<li><a href="category-sidebar-right.html">Right Sidebar</a></li>
							<li><a href="category-flex-grid.html">Product Flex Grid</a></li>
							<li><a href="category-horizontal-filter1.html">Horizontal Filter 1</a></li>
							<li><a href="category-horizontal-filter2.html">Horizontal Filter 2</a></li>
							<li><a href="#">List Types</a></li>
							<li><a href="category-infinite-scroll.html">Ajax Infinite Scroll<span class="tip tip-new">New</span></a></li>
							<li><a href="category.html">3 Columns Products</a></li>
							<li><a href="category-4col.html">4 Columns Products</a></li>
							<li><a href="category-5col.html">5 Columns Products</a></li>
							<li><a href="category-6col.html">6 Columns Products</a></li>
							<li><a href="category-7col.html">7 Columns Products</a></li>
							<li><a href="category-8col.html">8 Columns Products</a></li>
						</ul>
					</li>
					<li>
						<a href="product.html">Products</a>
						<ul>
							<li>
								<a href="#">Variations</a>
								<ul>
									<li><a href="product.html">Horizontal Thumbs</a></li>
									<li><a href="product-full-width.html">Vertical Thumbnails<span class="tip tip-hot">Hot!</span></a></li>
									<li><a href="product.html">Inner Zoom</a></li>
									<li><a href="product-addcart-sticky.html">Addtocart Sticky</a></li>
									<li><a href="product-sidebar-left.html">Accordion Tabs</a></li>
								</ul>
							</li>
							<li>
								<a href="#">Variations</a>
								<ul>
									<li><a href="product-sticky-tab.html">Sticky Tabs</a></li>
									<li><a href="product-simple.html">Simple Product</a></li>
									<li><a href="product-sidebar-left.html">With Left Sidebar</a></li>
								</ul>
							</li>
							<li>
								<a href="#">Product Layout Types</a>
								<ul>
									<li><a href="product.html">Default Layout</a></li>
									<li><a href="product-extended-layout.html">Extended Layout</a></li>
									<li><a href="product-full-width.html">Full Width Layout</a></li>
									<li><a href="product-grid-layout.html">Grid Images Layout</a></li>
									<li><a href="product-sticky-both.html">Sticky Both Side Info<span class="tip tip-hot">Hot!</span></a></li>
									<li><a href="product-sticky-info.html">Sticky Right Side Info</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">Pages<span class="tip tip-hot">Hot!</span></a>
						<ul>
							<li><a href="cart.html">Shopping Cart</a></li>
							<li>
								<a href="#">Checkout</a>
								<ul>
									<li><a href="checkout-shipping.html">Checkout Shipping</a></li>
									<li><a href="checkout-shipping-2.html">Checkout Shipping 2</a></li>
									<li><a href="checkout-review.html">Checkout Review</a></li>
								</ul>
							</li>
							<li><a href="about.html">About</a></li>
							<li><a href="#" class="login-link">Login</a></li>
							<li><a href="forgot-password.html">Forgot Password</a></li>
						</ul>
					</li>
					<li><a href="blog.html">Blog</a>
						<ul>
							<li><a href="single.html">Blog Post</a></li>
						</ul>
					</li>
					<li><a href="contact.html">Contact Us</a></li>
					<li><a href="#">Special Offer!<span class="tip tip-hot">Hot!</span></a></li>
					<li><a href="https://1.envato.market/DdLk5" target="_blank">Buy Porto!</a></li>
				</ul>

				<ul class="mobile-menu">
					<li><a href="my-account.html">Track Order </a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="category.html">Our Stores</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
					<li><a href="#">Help &amp; FAQs</a></li>
				</ul>
			</nav><!-- End .mobile-nav -->

			<div class="social-icons">
				<a href="#" class="social-icon" target="_blank"><i class="icon-facebook"></i></a>
				<a href="#" class="social-icon" target="_blank"><i class="icon-twitter"></i></a>
				<a href="#" class="social-icon" target="_blank"><i class="icon-instagram"></i></a>
			</div><!-- End .social-icons -->
		</div><!-- End .mobile-menu-wrapper -->
	</div><!-- End .mobile-menu-container -->


	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/optional/isotope.pkgd.min.js"></script>
	<script src="/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="/assets/js/main.min.js"></script>
	{{-- JS Section --}}
	@yield('js')
</body>
</html>