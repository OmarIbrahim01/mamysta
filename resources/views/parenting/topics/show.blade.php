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
				<li class="breadcrumb-item"><a href="index.html">Topics</a></li>
				<li class="breadcrumb-item active" aria-current="page">{{ $topic->title }}</li>
			</ol>
		</div><!-- End .container -->
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<article class="post single">
					<div class="post-media">
						<div class="post-slider owl-carousel owl-theme">
							<img src="{{ $topic->image }}" alt="Post" style="width: 100%; height: 320px; object-fit: cover;">
						</div><!-- End .post-slider -->
					</div><!-- End .post-media -->

					<div class="post-body">
						<div class="post-date">
							<span class="day">{{ $topic->created_at->format('d') }}</span>
							<span class="month">{{ $topic->created_at->format('M') }}</span>
						</div><!-- End .post-date -->

						<h2 class="post-title">
							{{ $topic->title }}
						</h2>

						<div class="post-meta">
							<span><i class="icon-calendar"></i>{{ $topic->created_at->format('d M, Y') }}</span>
							<span><i class="icon-user"></i>By: <a href="#">{{ $topic->user->name }} {{ $topic->user->last_name }}</a></span>
							<span><i class="icon-folder-open"></i>
								<a href="#">{{ $topic->category->name }}</a>
							</span>
						</div><!-- End .post-meta -->

						<div class="post-content">
							<p>{!! $topic->topic !!}</p>
						</div><!-- End .post-content -->

						<div class="post-author" style="border-bottom: none;">
							<h3><i class="icon-user"></i>Author</h3>

							<figure>
								<a href="#">
									<img src="{{ $topic->user->avatar }}" alt="author">
								</a>
							</figure>

							<div class="author-content">
								<h4><a href="#">{{ $topic->user->name }} {{ $topic->user->last_name }}</a></h4>
								<p>{!! $topic->user->bio !!}</p>
							</div><!-- End .author.content -->
						</div><!-- End .post-author -->

						
					</div><!-- End .post-body -->
				</article><!-- End .post -->

				<div class="related-posts">
					<h4 class="light-title">Related <strong>Topics</strong></h4>

					<div class="owl-carousel owl-theme related-posts-carousel">

						@foreach($topic->category->topics as $topic)
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
									<p>{!! Str::limit($topic->topic, 150)  !!}</p>

									<a href="{{ route('parenting_topics_show', [$topic->id]) }}" class="read-more">Read More <i class="icon-angle-double-right"></i></a>
								</div><!-- End .post-content -->
							</div><!-- End .post-body -->
						</article>
						@endforeach
						
					</div><!-- End .owl-carousel -->
				</div><!-- End .related-posts -->
			</div><!-- End .col-lg-9 -->

			<aside class="sidebar col-lg-3">
				<div class="sidebar-wrapper">
					

					<div class="widget widget-categories">
						<h4 class="widget-title">Topic Categories</h4>

						<ul class="list">
							<li><a href="{{ route('parenting_topics_index') }}">All Topics</a></li>
							@foreach($categories as $all_category)
							<li class="{{ $topic->category->id == $all_category->id ? 'active' : '' }}"><a href="{{ route('parenting_topics_index', ['category' => $all_category->id]) }}">{{ $all_category->name }}</a></li>
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