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
                <li class="breadcrumb-item active" aria-current="page">Groth Calculator Results</li>
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
                <h2>Your Results</h2>

                <p>It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                <br>
            </div><!-- End .col-lg-10 -->

            <div class="col-lg-8 mx-auto">

                <div class="card" style="width: 100%;">
                  <div class="card-body">
                    <h5 class="card-title">Results</h5>
                    <h4 class="text-center">{{ $gender->name }} , <small>Age ({{ \Carbon\Carbon::parse($birthdate)->diff(\Carbon\Carbon::now())->format('%y Years, %m Months and %d Days') }})</small></h4>
                    <br>
                    @if($age_in_months <= 36 && $age_in_months >= 1)
                    <table class="table text-center">
                      <thead>
                        <tr>
                          <th>Age</th>
                          <th>Average Weight</th>

                          <th>Average Height</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>{{ $age_in_months }} Month</td>
                          <td>{{ $groth_calculator_value->weight_from }} - {{ $groth_calculator_value->weight_to }} kg</td>
                          <td>{{ $groth_calculator_value->length_from }} - {{ $groth_calculator_value->length_to }} cm</td>
                        </tr>
                      </tbody>
                    </table>
                    @elseif($age_in_months > 36)
                    <h4 class="text-center" style="color: darkred;">Age is more than 36 months</h4>
                    <p class="text-center" style="color: darkred;">It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved</p>
                    @elseif($age_in_months < 1)
                    <h4 class="text-center" style="color: darkred;">Age is less than 1 month</h4>
                    <p class="text-center" style="color: darkred;">It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved</p>
                    @endif
                  </div>
                </div>
            </div><!-- End .col-lg-8-->


            <div class="col-lg-10 mx-auto">
                <p>It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.</p>
                <br>
            </div><!-- End .col-lg-10 -->

            <div class="col-lg-5 mx-auto">
                <a href="/app/groth_tracker/boys.jpg"><img src="/app/groth_tracker/boys.jpg" style="width: 100%; object-fit: contain;"></a>
            </div><!-- End .col-lg-10 -->
            <div class="col-lg-5 mx-auto">
                <a href="/app/groth_tracker/girls.jpg"><img src="/app/groth_tracker/girls.jpg" style="width: 100%; object-fit: contain;"></a>
            </div><!-- End .col-lg-10 -->

            <div class="col-lg-10 mx-auto">
                <p>It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).It is a long established using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                <br>
            </div><!-- End .col-lg-10 -->
            
        </div><!-- End .row -->
    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
@endsection