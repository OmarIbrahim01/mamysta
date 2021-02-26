@extends('layouts.parenting_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">My Children</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 order-lg-last dashboard-content">


                <div class="row">
                    <div class="col-md-6">
                        <h2>My Children</h2>
                    </div>
                    <div class="col-md-6">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#ask_question">
                          Add A Child
                        </button>
                        <!-- Modal -->
                        <div class="modal fade" id="ask_question" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <form action="{{ route('user_children_store') }}" method="POST">
                                        @csrf
                                        <div class="modal-header">
                                            <h3 class="modal-title" id="addressModalLabel">Add A Child</h3>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div><!-- End .modal-header -->

                                        <div class="modal-body">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group required-field" style="max-width: 100% !important;">
                                                        <label>Name</label>
                                                        <input type="text" class="form-control" name="name" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
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
                                            </div>
                                            <h4>Born On:</h4>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group required-field">
                                                        <label>Day</label>
                                                        <input type="number" class="form-control" name="day" placeholder="31" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group required-field">
                                                        <label>Month</label>
                                                        <input type="number" class="form-control" name="month" placeholder="12" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group required-field">
                                                        <label>Year</label>
                                                        <input type="number" class="form-control" name="year" placeholder="2021" required>
                                                    </div>
                                                </div>
                                            </div>

                                        </div><!-- End .modal-body -->

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-primary btn-sm">Add Child</button>
                                        </div><!-- End .modal-footer -->
                                    </form>
                                </div><!-- End .modal-content -->
                            </div><!-- End .modal-dialog -->
                        </div><!-- End .modal -->
                    </div>
                </div>

                @if(Auth::user()->children->count() > 0)

                @foreach($children as $child)
                <div class="row">
                    <div class="col-md-7">
                        <div class="card">
                            <div class="card-header text-center">
                                {{ $child->name }}
                                <a href="{{ route('user_children_edit', [$child->id]) }}" class="card-edit">Edit</a>
                            </div><!-- End .card-header -->

                            <div class="card-body">
                                <p>Gender: {{ $child->gender->name }}</p>
                                <p>Born: {{ \Carbon\Carbon::parse($child->birthday)->format('d/m/Y') }}</p>
                                <p>Age: {{ \Carbon\Carbon::parse($child->birthday)->diff(\Carbon\Carbon::now())->format('%y Years, %m Months and %d Days') }}</p>
                            </div><!-- End .card-body -->
                        </div><!-- End .card -->
                    </div><!-- End .col-md-6 -->
                </div>
                @endforeach

                @else
                <div class="row" style="margin-top: 100px;">
                    <div class="col-md-12">
                        <h3 class="text-center">You Have not added any children yet</h3>
                        <p class="text-center">By adding your children we will have access to more feature like <a href="#">Groth Tracker</a> and <a href="#">Vacin Finder</a> and you will be able to track your kids health and get recomended products based on their age and gender.</p>
                    </div>
                </div>

                @endif



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