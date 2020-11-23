@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">

    <div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">{{ $section->name }}</a></li>
            </ol>
        </nav>
    </div>

	<div class="container mt-2">
        <section class="product-category-panel">
            <div class="section-title">
                <h2>Categories in {{ $section->name }} Section</h2>
            </div>
            <div class="row row-sm">
            	@foreach($categories as $category)
                <div class="col-6 col-sm-4 col-lg-3">
                    <div class="product-category">
                        <a href="{{ route('shop_subcategories', [$section->id, $category->id]) }}">
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
    </div>
</main><!-- End .main -->

@endsection


@section('js')
@endsection