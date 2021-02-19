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
        <h1>Questions</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Questions</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Question Statuses</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <div class="card-body p-0">
            <ul class="nav nav-pills flex-column">
              <li class="nav-item">
                <a href="{{ route('admin_parenting_questions_index') }}" class="nav-link {{ !request('status') ? 'active' : '' }}">
                  All Questions
                  <span class="badge bg-primary float-right">{{ $all_questions_count }}</span>
                </a>
              </li>
              @foreach($statuses as $status)
              <li class="nav-item">
                <a href="{{ route('admin_parenting_questions_index', ['status' => $status->id]) }}" class="nav-link {{ $status->id == request('status') ? 'active' : '' }}">
                  {{ $status->name }}
                  <span class="badge bg-primary float-right" style="background-color: {{ $status->color }} !important;">{{ $status->questions->count() }}</span>
                </a>
              </li>
              @endforeach
            </ul>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
      <!-- /.col -->
      <div class="col-md-8">

        @foreach($questions as $question)
        <div class="card card-widget">
          <div class="card-header">
            <div class="user-block">
              <img class="img-circle" src="{{ $question->user->avatar }}" alt="User Image">
              <span class="username"><a href="#">{{ $question->user->name }} {{ $question->user->last_name }}</a></span>
              <span class="description">#{{ $question->id }} Asked - {{ $question->created_at->diffForHumans() }} </span>
            </div>
            <!-- /.user-block -->
            <div class="user-block text-center" style="margin-left: 200px;">
              <h4><span class="badge bg-primary float-right" style="background-color: {{ $question->status->color }} !important;">{{ $question->status->name }}</span></h4>
            </div>
            <!-- /.user-block -->
            {{-- <div class="card-tools">
              <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Mark as read">
                <i class="far fa-circle"></i></button>
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
              </button>
            </div> --}}
            <!-- /.card-tools -->
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <!-- post text -->
            <p>{!! $question->question !!}</p>
            <span class="float-right text-muted">{{ $question->answers->count() }} Answers</span>
          </div>
          <!-- /.card-body -->

          @if($question->answers->count() > 0)
          <div class="card-footer card-comments">
            @foreach($question->answers as $answer)
            <div class="card-comment">
              <!-- User image -->
              <img class="img-circle img-sm" src="{{ $answer->user->avatar }}" alt="User Image">
              <div class="comment-text">
                <span class="username">
                  {{ $answer->user->name }} {{ $answer->user->last_name }}
                  <span class="text-muted float-right">{{ $answer->created_at->diffForHumans() }}</span>
                </span><!-- /.username -->
                {!! $answer->answer !!}
              </div>
              <!-- /.comment-text -->
            </div>
            <!-- /.card-comment -->
            @endforeach
          </div>
          @endif

          <!-- /.card-footer -->
          <div class="card-footer">
            <form action="#" method="post">
              <img class="img-fluid img-circle img-sm" src="{{ Auth::user()->avatar }}" alt="Alt Text">
              <!-- .img-push is used to add margin to elements next to floating images -->
              <div class="img-push">
                <div class="row">
                  <div class="col-md-12">
                    <textarea class="textarea" placeholder="Post Your Answer"></textarea>
                  </div>
                  <div class="col-md-4">
                    <div class="form-group">
                      <select class="form-control" name="size" required>
                        @foreach($answering_statuses as $answering_status)
                        <option value="{{ $answering_status->id }}">{{ $answering_status->name }}</option>
                        @endforeach
                      </select>
                    </div>
                  </div>
                  <div class="col-sm-2">
                    <button type="submit" class="btn btn-primary" style="width: 100%;">Submit</button>
                  </div>
                </div>
                
              </div>
            </form>
          </div>
          <!-- /.card-footer -->
        </div>
        <!-- /.card -->
        @endforeach
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
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
        height: 150
      }
    )
  })
</script>
@endsection

