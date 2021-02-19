@extends('layouts.parenting_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">Q&A</a></li>
            </ol>
        </nav>
        <div class="product-single-container product-single-default">
            <div class="row">
                <div class="col-md-3" style="margin-top: 30px; margin-bottom: 30px;">
                    <h3 class="widget-title" style="margin-bottom: 20px;">
                        <a data-toggle="collapse" href="#widget-body-2" role="button" aria-expanded="true" aria-controls="widget-body-2">Categories</a>
                    </h3>

                    <div class="collapse show" id="widget-body-2">
                        <div class="widget-body">
                            <ul class="cat-list">
                                <li><a href="{{ route('parenting_questions_and_answers') }}" @if(!isset(request()->category)) style="color: #d93c81;" @endif>All Questions</a></li>
                                @foreach($categories as $category)
                                <li><a href="{{ route('parenting_questions_and_answers', ['category' => $category->id]) }}" @if(request()->category == $category->id) style="color: #d93c81;" @endif>{{ $category->name }}</a></li>
                                @endforeach
                            </ul>
                        </div><!-- End .widget-body -->
                    </div><!-- End .collapse -->
                </div>
                <div class="col-md-9">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>Questions & Anwers</h2>
                        </div>
                        <div class="col-md-6">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#ask_question">
                              Ask A Question
                            </button>

                            
                            <!-- Modal -->
                            <div class="modal fade" id="ask_question" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form id="add_new_question" method="POST" action="{{ route('parenting_questions_store') }}">
                                            @csrf
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="addressModalLabel">Ask A Question</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div><!-- End .modal-header -->

                                            <div class="modal-body">

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group required-field" style="max-width: 100%;">
                                                    <label>Gender</label>
                                                    <div class="select-custom">
                                                        <select id="gender" class="form-control" name="gender" required>
                                                           <option value="" disabled selected>Select Gender</option>
                                                           @foreach($genders as $gender)
                                                           <option value="{{ $gender->id }}">{{ $gender->name }}</option>
                                                           @endforeach
                                                        </select>
                                                    </div><!-- End .select-custom -->
                                                </div><!-- End .form-group -->
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group required-field">
                                                            <label>Age</label>
                                                            <input type="text" class="form-control" name="age" required>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group required-field" style="max-width: 100%;">
                                                    <label>Category</label>
                                                    <div class="select-custom">
                                                        <select id="category" class="form-control" name="category" required>
                                                           <option value="" disabled selected>Select Category</option>
                                                           @foreach($categories as $category)
                                                           <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                           @endforeach
                                                        </select>
                                                    </div><!-- End .select-custom -->
                                                </div><!-- End .form-group -->

                                                <div class="form-group required-field" style="max-width: 100%;">
                                                    <label>Your Question</label>
                                                    <textarea name="question" class="form-control" id="question" rows="4" required></textarea>
                                                </div><!-- End .form-group -->
                                                <div class="form-group-custom-control">
                                                    <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="change-bill-address" value="1" name="privet">
                                                        <label class="custom-control-label" for="change-bill-address">Hide My Name</label>
                                                        <br>
                                                        <small>This will hide your name to other people when seeing your question</small>
                                                    </div><!-- End .custom-checkbox -->
                                                </div>


                                            </div><!-- End .modal-body -->

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">Cancel</button>
                                                <button type="submit" form="add_new_address" class="btn btn-primary btn-sm">Submit Question</button>
                                            </div><!-- End .modal-footer -->
                                        </form>
                                    </div><!-- End .modal-content -->
                                </div><!-- End .modal-dialog -->
                            </div><!-- End .modal -->


                        </div>
                        
                    </div>


                    <ol class="comment-list">


                        @foreach($questions as $question)
                        <li class="comment-container">
                            <div class="comment-avatar" style="flex: .01 0 auto;">
                                @if($question->user->role_id == 100 & $question->privet == 1)
                                <img src="/assets/images/avatar/avatar1.jpg" width="65" height="65" alt="avatar"/>
                                @else
                                <img src="/assets/images/avatar/avatar1.jpg" width="65" height="65" alt="avatar"/>
                                @endif
                            </div><!-- End .comment-avatar-->

                            <div class="comment-box">
                                {{-- <div class="ratings-container">
                                    <div class="product-ratings">
                                        <span class="ratings" style="width:80%"></span>
                                    </div>
                                </div> --}}

                                <div class="comment-info mb-1">
                                    <h4 class="avatar-name">
                                        @if($question->user->role_id == 100 && $question->privet == 1)
                                        Mommy
                                        @else
                                        {{ $question->user->name }} {{ $question->user->last_name }}
                                        @endif
                                        
                                    </h4>
                                     - <span class="comment-date">{{ $question->created_at->format('d M, Y') }}</span>
                                </div><!-- End .comment-info -->

                                <div class="comment-text text-left">
                                    <p>{{ $question->question }}</p>
                                </div><!-- End .comment-text -->

                                @if($question->answers->where('parenting_answer_status_id', 2)->count() > 0)
                                @foreach($question->answers->where('parenting_answer_status_id', 2) as $answer)
                                <div class="ans" style="margin-left: 20px;">
                                    <div class="comment-box">
                                        <div class="comment-info mb-1">
                                            <h4 class="avatar-name">
                                                @if($answer->user->role_id == 100 && $question->privet == 1)
                                                Mommy
                                                @else
                                                {{ $answer->user->name }} {{ $answer->user->last_name }}
                                                @endif
                                                
                                            </h4> - <span class="comment-date">{{ $answer->type->name }}</span>
                                        </div><!-- End .comment-info -->

                                        <div class="comment-text">
                                            <p>{!! $answer->answer !!}</p>
                                        </div><!-- End .comment-text -->
                                    </div>
                                </div>
                                @endforeach
                                @endif

                            </div><!-- End .comment-box -->
                        </li><!-- comment-container -->
                        @endforeach

                        

                    </ol><!-- End .comment-list -->
                </div>
            </div><!-- End .row -->
        </div><!-- End .product-single-container -->

        
    </div><!-- End .container -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection