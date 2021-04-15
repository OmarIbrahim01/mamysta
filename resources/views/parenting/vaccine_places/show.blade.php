@extends('layouts.parenting_main')

@section('css')
@endsection


@section('content')

<main class="main">
	<div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Vaccine Provider</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{ $vaccine_place->name }}</li>
            </ol>
        </nav>
    </div>

	<div class="container">

        <div class="row">
            <div class="col-lg-12 mx-auto">
                <h2>{{ $vaccine_place->name }}</h2>
            </div><!-- End .col-lg-12 -->

            <div class="col-lg-6">
                <h4>Adrress</h4>
                <p>{{ $vaccine_place->address }}, {{ $vaccine_place->city->name }}, {{ $vaccine_place->region->name }}</p>
            </div><!-- End .col-lg-12 -->
            <div class="col-lg-6">
                <a href="{{ $vaccine_place->map_link }}" class="btn btn-primary float-right" target="_blank">View On Map</a>
            </div><!-- End .col-lg-12 -->


            <div class="col-lg-12 mx-auto" style="margin-top: 20px;">
              <h4>Vaccines Provided By {{ $vaccine_place->name }}</h4>
              <p>List of all vaccines provided</p>
              <div class="card" style="width: 100%;">
                <div class="card-body">
                  <h5 class="card-title">All Vaccine</h5>
                  <table class="table text-center">
                    <thead>
                      <tr>
                        <th>Age</th>
                        <th>Action</th>
                        <th>Vaccine Name</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach($vaccine_place->vaccines_places_vaccines as $vaccine_place_vaccine)
                      <tr>
                        <td>{{ $vaccine_place_vaccine->vaccine->name }}</td>
                        <td>{{ $vaccine_place_vaccine->vaccine->age }}</td>
                        <td><a href="#" target="_blank">View More Info</a></td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            
            
        </div><!-- End .row -->
    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
@endsection