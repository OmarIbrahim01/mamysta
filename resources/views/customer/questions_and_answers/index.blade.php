@extends('layouts.parenting_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 order-lg-last dashboard-content">
                <div class="row">
                    <div class="col-md-6">
                        <h2>My Questions & Anwers</h2>
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
                                    <form id="add_new_address" method="POST" action="#">
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
                                                    <label class="custom-control-label" for="change-bill-address">Hide My Info</label>
                                                    <br>
                                                    <small>This will hide your name and profile to other people when seeing your question</small>
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
                            <img src="/assets/images/avatar/avatar1.jpg" width="65" height="65" alt="avatar"/>
                        </div><!-- End .comment-avatar-->

                        <div class="comment-box">
                            {{-- <div class="ratings-container">
                                <div class="product-ratings">
                                    <span class="ratings" style="width:80%"></span>
                                </div>
                            </div> --}}

                            <div class="comment-info mb-1">
                                <h4 class="avatar-name">{{ $question->user->name }} {{ $question->user->last_name }}</h4> - <span class="comment-date">{{ $question->created_at->format('d M, Y') }}</span>
                                <span style="font-weight: bold;">( {{ $question->status->name }} )</span>
                            </div><!-- End .comment-info -->

                            <div class="comment-text">
                                <p>{{ $question->question }}</p>
                            </div><!-- End .comment-text -->

                            @if($question->answers->where('parenting_answer_status_id', 2)->count() > 0)
                            @foreach($question->answers->where('parenting_answer_status_id', 2) as $answer)
                            <div class="ans" style="margin-left: 20px;">
                                <div class="comment-box">
                                    <div class="comment-info mb-1">
                                        <h4 class="avatar-name">{{ $answer->user->name }} {{ $answer->user->last_name }}</h4> - <span class="comment-date">{{ $answer->type->name }}</span>
                                    </div><!-- End .comment-info -->

                                    <div class="comment-text">
                                        <p>{!! $answer->answer !!}</p>
                                    </div><!-- End .comment-text -->
                                </div>
                            </div>
                            @endforeach
                            <div class="ans" style="margin-left: 20px;">
                                @if($question->status->id == 3)
                                <form method="POST" action="{{ route('customer_questions_and_answers_answer_store', [$question->id]) }}">
                                    @csrf
                                    <div class="form-group required-field" style="max-width: 100%;">
                                        <label>Your Answer</label>
                                        <textarea name="user_answer" class="form-control" id="user_answer" rows="4" required></textarea>
                                    </div><!-- End .form-group -->
                                    <button type="submit" class="btn btn-primary">Submit Answer</button>
                                </form>
                                @endif
                            </div>
                            @endif
                        </div><!-- End .comment-box -->
                    </li><!-- comment-container -->
                    @endforeach

                    

                </ol><!-- End .comment-list -->
            </div>

            <aside class="sidebar col-lg-3">
                @include('customer.side_menu')
            </aside><!-- End .col-lg-3 -->
        </div><!-- End .row -->
    </div><!-- End .container -->

    <div class="mb-5"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection