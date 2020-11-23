@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">

    <div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">{{ $category->product_section->name }}</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{ $category->name }}</li>
            </ol>
        </nav>
    </div>

	<div class="container mt-2">
        <section class="product-category-panel">
            <div class="section-title">
                <h2>SubCategories in {{ $category->name }}</h2>
            </div>
            <div class="row row-sm">
            	@foreach($subcategories as $subcategory)
                <div class="col-6 col-sm-4 col-lg-3">
                    <div class="product-category">
                        <a href="{{ route('shop_products_index', [$subcategory->id]) }}">
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
    </div>
</main><!-- End .main -->

@endsection


@section('js')
@endsection