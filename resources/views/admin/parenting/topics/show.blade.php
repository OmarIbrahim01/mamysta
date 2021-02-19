@extends('admin.parenting.layout')

@section('css')
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>{{ $topic->title }}</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Topics</a></li>
          <li class="breadcrumb-item active">{{ $topic->title }}</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<!-- Main content -->
<section class="content">

  <!-- Default box -->
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">Topic</h3>
    </div>
    <div class="card-body">
      <div class="row">
        
        <div class="col-12 col-md-12 col-lg-8 order-1 order-md-1">
          <h3 class="text-primary">{{ $topic->title }}</h3>
          <br>
          <img src="{{ $topic->image }}" style="width: 100%; height: 300px; object-fit: cover;">
          <hr>
          <p class="text-muted">{!! $topic->topic !!}</p>
        </div>
        <div class="col-12 col-md-12 col-lg-4 order-2 order-md-2">

        <div class="text-right mt-5 mb-3" style="margin-top: -6px !important;">
          <a href="{{ route('admin_parenting_topics_edit', [$topic->id]) }}" class="btn btn-sm btn-success" style="width: 80px;">Edit</a>
        </div>

        <div class="card card-solid">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12">
                <h4 class="text-center">Topic Status</h4>
                <hr>
                <div class="row mx-auto">
                  <div class="col-md-12">
                    <h4 class=" text-center" style="color: {{ $topic->status->color }}; ">{{ $topic->status->name }}</h4>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /.card-body -->
        </div>  
        <hr>
        <h5 class="mt-5 text-muted text-center" style="margin-bottom: 50px;">{{ $topic->category->name }}</h5>
        <hr>
        <h5 class="text-muted">Author</h5>
        <div class="user-block" style="margin-bottom: 40px;">
          <img class="img-circle img-bordered-sm" src="{{ $topic->user->avatar }}" alt="User Image">
          <span class="username">
            <a href="#">{{ $topic->user->name }} {{ $topic->user->last_name }}</a>
          </span>
          <span class="description">{{ $topic->created_at->format('d M, Y') }}</span>
        </div>
        <div class="info-box bg-light">
          <div class="info-box-content">
            <span class="info-box-text text-center text-muted">Views</span>
            <span class="info-box-number text-center text-muted mb-0">9999</span>
          </div>
        </div>



        </div>
      </div>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->


</section>
<!-- /.content -->
@endsection




@section('js')
@endsection

