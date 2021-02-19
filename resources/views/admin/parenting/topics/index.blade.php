@extends('admin.parenting.layout')

@section('css')
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>All Topics</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Topics</a></li>
          <li class="breadcrumb-item active">View All Topics</li>
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
      <h3 class="card-title">Topics</h3>
    </div>
    <div class="card-body p-0">
      <table class="table table-striped projects">
          <thead>
              <tr>
                  <th style="width: 1%">
                      ID
                  </th>
                  <th style="width: 25%">
                      Title
                  </th>
                  <th>
                      Topic
                  </th>
                  <th>
                      Category
                  </th>
                  <th style="width: 8%" class="text-center">
                      Status
                  </th>
                  <th style="width: 18%">
                    Actions
                  </th>
              </tr>
          </thead>
          <tbody>
              @foreach($topics as $topic)
              <tr>
                  <td>{{ $topic->id }}</td>
                  <td>
                    <a href="{{ route('admin_parenting_topics_show', [$topic->id]) }}">
                      <img src="{{ $topic->image }}" style="width: 200px; height: 75px; object-fit: cover;">
                      <br/>
                      <h4>{{ $topic->title }}</h4>
                      <small>Created: {{ $topic->created_at->format('d M, Y') }}</small>
                    </a>
                  </td>
                  <td style="max-width: 200px;">{!! Str::limit($topic->topic, 300)  !!}</td>
                  <td>{{ $topic->category->name }}</td>
                  <td class="project-state">
                      <span class="badge badge-success" style="background-color: {{ $topic->status->color }};">{{ $topic->status->name }}</span>
                  </td>
                  <td class="project-actions text-right">
                      <a class="btn btn-primary btn-sm" href="{{ route('admin_parenting_topics_show', [$topic->id]) }}">
                          <i class="fas fa-folder">
                          </i>
                          View
                      </a>
                      <a class="btn btn-info btn-sm" href="{{ route('admin_parenting_topics_edit', [$topic->id]) }}">
                          <i class="fas fa-pencil-alt">
                          </i>
                          Edit
                      </a>
                  </td>
              </tr>
              @endforeach
          </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->

</section>
<!-- /.content -->

@endsection




@section('js')
@endsection

