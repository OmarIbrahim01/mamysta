@extends('layouts.parenting_main')

@section('css')
<!-- daterange picker -->
<link rel="stylesheet" href="/admin_panel/plugins/daterangepicker/daterangepicker.css">
@endsection


@section('content')

<main class="main">
	<div class="container">
        <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Vaccine Tracker</li>
            </ol>
        </nav>
    </div>

	<div class="container">

      <div class="row">

          <div class="col-lg-12 mx-auto">
              <div class="row">
                <div class="col-lg-6">
                  <h2>Vaccine Tracker</h2>
                </div>
                <div class="col-lg-6">
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
              

              <br>
              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. distribution of letters, as opposed  'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
          </div><!-- End .col-lg-10 -->


          @foreach($user->children as $child)
          <div class="col-lg-6">
            <div class="order-summary">
              <h3>{{ $child->name }}</h3>
              <p>Age: {{ \Carbon\Carbon::parse($child->birthday)->diff(\Carbon\Carbon::now())->format('%y Years, %m Months and %d Days') }}</p>

              <h4>
                <a href="#">Recomended Vaccines At This Age</a>
              </h4>
              <div>
                <table class="table table-mini-cart">
                  <thead>
                    <tr class="text-center">
                      <th>Vaccine Name</th>
                      <th>Age</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @php
                      $birthdate = Carbon\Carbon::parse($child->birthday);
                      $age_in_months = (int) round($birthdate->diffInDays(Carbon\Carbon::now()) / 30);
                      $recomended_vaccines = $all_vaccines->where('age', $age_in_months);
                    @endphp
                    @foreach($recomended_vaccines as $recomended_vaccine)
                    <tr class="text-center">
                      <td>{{ $recomended_vaccine->name }}</td>
                      <td>{{ $recomended_vaccine->age }} Month</td>
                      <td><a href="{{ route('parenting_vaccines_show', [$child_vaccine->vaccine->id]) }}">View</a></td>
                    </tr>
                    @endforeach
                  </tbody>  
                </table>
              </div>

              <h4>
                <a href="#">Vaccines Taken</a>
              </h4>
              <div>
                <table class="table table-mini-cart">
                  <thead>
                    <tr class="text-center">
                      <th>Vaccine Name</th>
                      <th>Taken On</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($child->vaccines as $child_vaccine)
                    <tr class="text-center">
                      <td>{{ $child_vaccine->vaccine->name }}</td>
                      <td>{{ \Carbon\Carbon::parse($child_vaccine->date)->format('d/m/Y') }}</td>
                      <td><a href="{{ route('parenting_vaccines_show', [$child_vaccine->vaccine->id]) }}">View</a></td>
                    </tr>
                    @endforeach
                  </tbody>  
                </table>
              </div>

            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add_vaccine_record_{{ $child->id }}">
              Add Vaccine Record
            </button>
            <!-- Modal -->
            <div class="modal fade" id="add_vaccine_record_{{ $child->id }}" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="{{ route('parenting_vaccine_tracker_store', [$child->id]) }}" method="POST">
                            @csrf
                            <div class="modal-header">
                                <h3 class="modal-title" id="addressModalLabel">Add Vaccine Record</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div><!-- End .modal-header -->

                            <div class="modal-body">

                                <div class="row">
                                  <div class="col-md-12">
                                    <h4>{{ $child->name }}</h4>
                                  </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-8 mx-auto">
                                        <div class="form-group required-field" style="max-width: 100%;">
                                            <label>Vaccine</label>
                                            <div class="select-custom">
                                                <select id="vaccine" class="form-control" name="vaccine" required>
                                                   <option value="" disabled selected>Select Vaccine</option>
                                                   @foreach($all_vaccines as $vaccine)
                                                   <option value="{{ $vaccine->id }}">{{ $vaccine->name }}</option>
                                                   @endforeach
                                                </select>
                                            </div><!-- End .select-custom -->
                                        </div><!-- End .form-group -->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 mx-auto">
                                        <div class="form-group required-field">
                                            <label>Date Taken</label>
                                            <input type="text" class="form-control date" name="date" required>
                                        </div>
                                    </div>
                                </div>

                            </div><!-- End .modal-body -->

                            <div class="modal-footer">
                                <button type="button" class="btn btn-link btn-sm" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary btn-sm">Add Record</button>
                            </div><!-- End .modal-footer -->
                        </form>
                    </div><!-- End .modal-content -->
                </div><!-- End .modal-dialog -->
            </div><!-- End .modal -->



          </div>
          <!-- End .col-lg-6 -->
          @endforeach
          
      </div><!-- End .row -->

    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
<!-- date-range-picker -->
<script src="/admin_panel/plugins/daterangepicker/moment.min.js"></script>
<script src="/admin_panel/plugins/daterangepicker/daterangepicker.js"></script>

<script>
  $('.date').daterangepicker({
      "singleDatePicker": true,
      // "showDropdowns": true,
      // "timePicker": true,
      "timePickerIncrement": 15,
      "autoApply": true,
      "locale": {
          "direction": "ltr",
          "format": "DD/MM/YYYY",
          "separator": " - ",
          "applyLabel": "Apply",
          "cancelLabel": "Cancel",
          "fromLabel": "From",
          "toLabel": "To",
          "customRangeLabel": "Custom",
          "daysOfWeek": [
              "Su",
              "Mo",
              "Tu",
              "We",
              "Th",
              "Fr",
              "Sa"
          ],
          "monthNames": [
              "January",
              "February",
              "March",
              "April",
              "May",
              "June",
              "July",
              "August",
              "September",
              "October",
              "November",
              "December"
          ],
          "firstDay": 6
      },
      "startDate": "{{Carbon\Carbon::now()->format('d/m/Y')}}",
  }, function(start, end, label) {
    console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
  });
</script>
@endsection