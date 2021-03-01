@extends('layouts.parenting_main')

@section('css')
@endsection


@section('content')

<main class="main">
	<div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Groth Calculator</li>
            </ol>
        </nav>
    </div>

	<div class="container">

        {{-- <div class="row mx-auto" style="width: 50%;">
            <div class="col-lg-2 mx-auto">
                <a href="#" class="btn btn-primary">Calculator</a>
            </div>
            <div class="col-lg-2 mx-auto">
                <a href="#" class="btn btn-secondary" style="background-color: grey; border-color: grey;">Tracker</a>
            </div>
        </div>
        <br> --}}
        
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2>Groth Calculator</h2>

                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                <br>
            </div><!-- End .col-lg-10 -->
            <div class="col-lg-8 mx-auto">

                <div class="card" style="width: 100%;">
                  <div class="card-body">
                    <h5 class="card-title">Groth Tracker Calculator</h5>
                    <p class="card-text">Please Enter Your Child Gender and Birthday To Calculat the mesurments</p>
                    <br>
                    <form action="{{ route('parenting_groth_tracker_calaculator_result') }}" method="GET">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group required-field" style="width: 100%;">
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
                        <h6>Birthday</h6>
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
                        <br>
                        <div class="row">
                            <div class="col-lg-12">
                                <button type="submit" class="btn btn-primary">Calculate</button>
                            </div>
                        </div>
                    </form>
                  </div>
                </div>
            </div><!-- End .col-lg-8-->
            <div class="col-lg-10 mx-auto">
                <p>Please Note: It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem.</p>
                <br>
            </div><!-- End .col-lg-10 -->
        </div><!-- End .row -->
    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
@endsection