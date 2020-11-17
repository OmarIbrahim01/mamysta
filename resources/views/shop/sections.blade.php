@extends('layouts.market_main');

@section('css')
@endsection


@section('content')

<main class="main">
	<div class="container mt-2">
        <section class="product-category-panel">
            <div class="section-title">
                <h2>All Sections</h2>
            </div>
            <div class="row row-sm">
            	@foreach($product_sections as $product_section)
                <div class="col-6 col-sm-4 col-lg-3">
                    <div class="product-category">
                        <a href="{{ route('shop_categories', [$product_section->id]) }}">
                            <figure>
                                <img src="{{ $product_section->image }}">
                            </figure>
                            <div class="category-content">
                                <h3>{{ $product_section->name }}</h3>
                            </div>
                        </a>
                    </div>
                </div>
                @endforeach
            </div>
        </section>
    </div>
</main><!-- End .main -->

@endsection


@section('js')
@endsection