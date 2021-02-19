@extends('layouts.parenting_main')

@section('css')
<style>
	.active a{
		color: #d93c81 !important;
	}
</style>
@endsection


@section('content')
<main class="main">
	<nav aria-label="breadcrumb" class="breadcrumb-nav">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
				<li class="breadcrumb-item active" aria-current="page">Topics</li>
			</ol>
		</div><!-- End .container -->
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<h2>Topics</h2>

				@foreach($topics as $topic)
				<article class="post">
					<div class="post-media">
						<a href="{{ route('parenting_topics_show', [$topic->id]) }}">
							<img src="{{ $topic->image }}" alt="Post">
						</a>
					</div><!-- End .post-media -->

					<div class="post-body">
						<div class="post-date">
							<span class="day">{{ $topic->created_at->format('d') }}</span>
							<span class="month">{{ $topic->created_at->format('M') }}</span>
						</div><!-- End .post-date -->

						<h2 class="post-title">
							<a href="{{ route('parenting_topics_show', [$topic->id]) }}">{{ $topic->title }}</a>
						</h2>

						<div class="post-content">
							<p>{!! Str::limit($topic->topic, 300)  !!}</p>

							<a href="{{ route('parenting_topics_show', [$topic->id]) }}" class="read-more">Read More <i class="icon-angle-double-right"></i></a>
						</div><!-- End .post-content -->

						<div class="post-meta">
							<span><i class="icon-calendar"></i>{{ $topic->created_at->format('d M, Y') }}</span>
							<span><i class="icon-user"></i>By: <a href="#">{{ $topic->user->name }} {{ $topic->user->last_name }}</a></span>
							<span><i class="icon-folder-open"></i>
								<a href="#">{{ $topic->category->name }}</a>
							</span>
						</div><!-- End .post-meta -->
					</div><!-- End .post-body -->
				</article><!-- End .post -->
				@endforeach


				{{-- <nav class="toolbox toolbox-pagination border-0">
					<ul class="pagination">
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

			<aside class="sidebar col-lg-3">
				<div class="sidebar-wrapper">
					

					<div class="widget widget-categories">
						<h4 class="widget-title">Topic Categories</h4>

						<ul class="list">
							<li class="{{ request('category') == null  ? 'active' : '' }}"><a href="{{ route('parenting_topics_index') }}">All Topics</a></li>
							@foreach($categories as $category)
							<li class="{{ request('category') == $category->id ? 'active' : '' }}"><a href="{{ route('parenting_topics_index', ['category' => $category->id]) }}">{{ $category->name }}</a></li>
							@endforeach
						</ul>
					</div><!-- End .widget -->



				</div><!-- End .sidebar-wrapper -->
			</aside><!-- End .col-lg-3 -->
		</div><!-- End .row -->
	</div><!-- End .container -->

	<div class="mb-6"></div><!-- margin -->
</main><!-- End .main -->
@endsection


@section('js')
@endsection