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
                <li class="breadcrumb-item active" aria-current="page">Vaccine Finder</li>
            </ol>
        </nav>
    </div>

	<div class="container">

        <div class="row">
            <div class="col-lg-10 mx-auto">
                <h2>Vaccine Places</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look text, and a search Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
            </div><!-- End .col-lg-10 -->


            <div class="col-lg-10 mx-auto" style="margin-top: 20px;">
              <form action="{{ route('parenting_vaccine_places_index') }}" method="GET">
                <div class="row">
                  <div class="col-md-6">
                    <h4>Find Location Near You</h4>
                    <p>Select your region to find the closest location near you</p>
                  </div>
                  <div class="col-md-6">
                    <div class="row">
                      <div class="col-md-10">
                        <div class="form-group required-field" style="max-width: 100%;">
                            <label>Region</label>
                            <div class="select-custom">
                              <select id="gender" class="form-control" name="region" required>
                                 <option value="" disabled selected>Select Region</option>
                                 @foreach($regions as $region)
                                 <option value="{{ $region->id }}">{{ $region->name }}</option>
                                 @endforeach
                              </select>
                          </div><!-- End .select-custom -->
                        </div><!-- End .form-group -->
                      </div>
                      <div class="col-md-2">
                        <button type="submit" class="btn btn-primary" style="margin-top: 25px;">Find</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>


            @if(!empty($my_region_vaccine_places))
            <div class="col-lg-10 mx-auto" style="margin-top: -40px; margin-bottom: 50px;">
              <h4>Nearest Locations</h4>
              <p>List of all nearst locations around you</p>
              <div class="card" style="width: 100%;">
                <div class="card-body">
                  <h5 class="card-title">Locations</h5>
                  <table class="table text-center">
                    <thead>
                      <tr>
                        <th>Location Name</th>
                        <th>Region</th>
                        <th>City</th>
                        <th>Address</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach($my_region_vaccine_places as $vaccine_place)
                      <tr>
                        <td><a href="{{ route('parenting_vaccine_places_show', [$vaccine_place->id]) }}">{{ $vaccine_place->name }}</a></td>
                        <td>{{ $vaccine_place->region->name }}</td>
                        <td>{{ $vaccine_place->city->name }}</td>
                        <td>{{ $vaccine_place->address }}</td>
                        <td><a href="{{ $vaccine_place->map_link }}" target="_blank">View On Map</a></td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            @endif



            <div class="col-lg-10 mx-auto" style="margin-top: -40px;">
                <h4>All Locations</h4>
                <p>List of all locations around the country</p>
                <div class="card" style="width: 100%;">
                  <div class="card-body">
                    <h5 class="card-title">Vaccine Provider around the country</h5>
                    <table class="table text-center">
                      <thead>
                        <tr>
                          <th>Place</th>
                          <th>Region</th>
                          <th>City</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach($vaccine_places as $vaccine_place)
                        <tr>
                          <td><a href="{{ route('parenting_vaccine_places_show', [$vaccine_place->id]) }}">{{ $vaccine_place->name }}</a></td>
                          <td>{{ $vaccine_place->region->name }}</td>
                           <td>{{ $vaccine_place->city->name }}</td>
                          <td><a href="{{ route('parenting_vaccine_places_show', [$vaccine_place->id]) }}">View More Info</a></td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                  </div>
                </div>

            </div>


            <div class="col-lg-10 mx-auto">
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
            </div><!-- End .col-lg-10 -->
            
        </div><!-- End .row -->
    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
@endsection