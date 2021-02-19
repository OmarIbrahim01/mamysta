@extends('admin.parenting.layout')

@section('css')
<!-- summernote -->
<link rel="stylesheet" href="/admin_panel/plugins/summernote/summernote-bs4.css">
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Edit Topic</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Topics</a></li>
          <li class="breadcrumb-item active">Edit Topic Topic</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="card card-primary">
        <div class="card-header">
          <h3 class="card-title">Edit Topic</h3>
        </div>
        <div class="card-body">
          <form action="{{ route('admin_parenting_topics_update', [$topic->id]) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label>Category</label>
                  <select class="form-control custom-select" name="category" required>
                    <option selected="" value="{{ $topic->category->id }}">{{ $topic->category->name }}</option>
                    @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="inputStatus">Status</label>
                  <select class="form-control custom-select" name="status" required>
                    <option selected="" value="{{ $topic->status->id }}">{{ $topic->status->name }}</option>
                    @foreach($statuses as $status)
                    <option value="{{ $status->id }}">{{ $status->name }}</option>
                    @endforeach
                  </select>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label>Title</label>
                  <input type="text" class="form-control" name="title" value="{{ $topic->title }}" required>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label>Image</label>
                  <small>(leave this empty if you dont want to change the image)</small>
                  <div class="input-group">
                    <div class="custom-file">
                      <input type="file" class="custom-file-input" name="image">
                      <label class="custom-file-label">Choose Images</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                  <label>Topic</label>
                  <textarea class="form-control textarea" rows="4" name="topic" required>{!! $topic->topic !!}</textarea>
                </div>
              </div>
              <div class="col-md-12">
                <button type="submit" class="btn btn-primary">Save Topic</button>
              </div>
            </div>
            <!-- /.row -->
          </form>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>

  </div>
</section>
<!-- /.content -->
@endsection




@section('js')
<!-- Summernote -->
<script src="/admin_panel/plugins/summernote/summernote-bs4.min.js"></script>
<script>
  $(function () {
    // Summernote
    $('.textarea').summernote(
      {
        height: 500
      }
    )
  })
</script>
@endsection

