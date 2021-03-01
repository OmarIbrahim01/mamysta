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
                <li class="breadcrumb-item active" aria-current="page">Groth Tracker</li>
            </ol>
        </nav>
    </div>

	<div class="container">
        
        <div class="row">
            <div class="col-md-6">
                <h2>Groth Tracker</h2>
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

        </div><!-- End .row -->

        <div class="row" style="margin-top: 10px;">
            <div class="col-md-12 mx-auto">
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Loreke readable English. Many desktop  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                <br>
            </div><!-- End .col-lg-10 -->
        </div>

        @if($children->count() > 0)

        @foreach($children as $child)
        <div class="row">
            <div class="col-md-10 mx-auto">
                <h3>{{ $child->name }} <small>({{ $child->gender->name }}, Born On: {{ \Carbon\Carbon::parse($child->birthday)->format('d/m/Y') }})</small></h3>
                <table class="table text-center">
                  <thead>
                    <tr>
                      <th>Date of Measurement</th>  
                      <th>Age</th>
                      <th>Weight</th>
                      <th>Height</th>
                    </tr>
                  </thead>
                  <tbody>
                    @foreach($child->groth_tracker_records as $record)
                    <tr>
                      <td>{{ \Carbon\Carbon::parse($record->date)->format('d/m/Y') }}</td>

                      <td>{{ \Carbon\Carbon::parse($child->birthday)->diff(\Carbon\Carbon::parse($record->date))->format('%y Years, %m Months and %d Days') }}</td>

                      <td>{{ $record->weight }} kg</td>
                      <td>{{ $record->height }} cm</td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>

                <br>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary float-right" data-toggle="modal" data-target="#add_record_{{ $child->id }}">
                  + Add Record
                </button>
                <!-- Modal -->
                <div class="modal fade" id="add_record_{{ $child->id }}" tabindex="-1" role="dialog" >
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form method="POST" action="{{ route('parenting_groth_tracker_store', [$child->id]) }}">
                                @csrf
                                <div class="modal-header">
                                    <h3 class="modal-title" id="addressModalLabel">Add Record</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div><!-- End .modal-header -->
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <h4>{{ $child->name }} <small>({{ $child->gender->name }}, Born On: {{ \Carbon\Carbon::parse($child->birthday)->format('d/m/Y') }})</small></h4>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 30px;">
                                        <div class="col-md-6">
                                            <div class="form-group required-field">
                                                <label>Date of Measurement</label>
                                                <input type="text" class="form-control float-right date_of_measurement" name="date_of_measurement" required>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group required-field">
                                                <label>Weight (kg)</label>
                                                <input type="number" class="form-control" name="weight" placeholder="Weight in (KG)" required>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group required-field">
                                                <label>Height (cm)</label>
                                                <input type="number" class="form-control" name="height" placeholder="Height in (CM)" required>
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


            <div class="col-md-5 mx-auto" style="margin-top: 30px;">
                <h4 class="text-center">Weight Chart</h4>
                <!-- Line chart -->
                <div class="card card-primary card-outline">
                  <div class="card-body">
                    <div id="weight-line-chart-{{ $child->id }}" style="height: 300px;"></div>
                  </div>
                  <!-- /.card-body-->
                </div>
                <!-- /.card -->
            </div>

            <div class="col-md-5 mx-auto" style="margin-top: 30px;">
                <h4 class="text-center">Height Chart</h4>
                <!-- Line chart -->
                <div class="card card-primary card-outline">
                  <div class="card-body">
                    <div id="height-line-chart-{{ $child->id }}" style="height: 300px;"></div>
                  </div>
                  <!-- /.card-body-->
                </div>
                <!-- /.card -->
            </div>


        </div>
        <hr>
        @endforeach


        @else
        <div class="row">
          <div class="col-md-8 mx-auto">
            <div class="card" style="width: 100%;">
              <div class="card-body">
                <h2 class="text-center">You Havent Added Any Children Yet.</h2>
                <p class="text-center">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using</p>
                <br>
                <button type="button" class="btn btn-primary text-center" data-toggle="modal" data-target="#ask_question" style="width: 100%;">
                  Add A Child Now
                </button>
              </div>
            </div>
          </div>
        </div>

        @endif


    </div><!-- End .container -->
	
</main><!-- End .main -->

@endsection


@section('js')
<!-- date-range-picker -->
<script src="/admin_panel/plugins/daterangepicker/moment.min.js"></script>
<script src="/admin_panel/plugins/daterangepicker/daterangepicker.js"></script>

<!-- FLOT CHARTS -->
<script src="/admin_panel/plugins/flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="/admin_panel/plugins/flot-old/jquery.flot.resize.min.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="/admin_panel/plugins/flot-old/jquery.flot.pie.min.js"></script>

<script>
  $('.date_of_measurement').daterangepicker({
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



<script>
  $(function () {

    @foreach($children as $child)
    /*
     * WEIGHT LINE CHART
     * ----------
     */
    //LINE randomly generated data

    var actual_weight = [],
        optimum_weight_min = [],
        optimum_weight_max = []

    @php
    $optimum_values = $groth_values->where('gender_id', $child->gender->id);
    @endphp

    @foreach($optimum_values as $optimum_valu)
    optimum_weight_min.push([{{ $optimum_valu->age }}, {{ $optimum_valu->weight_from }}]);
    optimum_weight_max.push([{{ $optimum_valu->age }}, {{ $optimum_valu->weight_to }}]);
    @endforeach

    @foreach($child->groth_tracker_records as $record)
    @php
    $age =(int) round(\Carbon\Carbon::parse($child->birthday)->diffInDays(\Carbon\Carbon::parse($record->date)) / 30);
    $weight = $record->weight;
    @endphp
    actual_weight.push([{{ $age }}, {{ $weight }}])
    @endforeach

    var line_data1 = {
      data : actual_weight,
      color: '#0ac20d'
    }
    var line_data2 = {
      data : optimum_weight_min,
      color: '#3b7fcc'
    }

    var line_data3 = {
      data : optimum_weight_max,
      color: '#3b7fcc'
    }
    $.plot('#weight-line-chart-{{ $child->id }}', [line_data1, line_data2, line_data3], {
      grid  : {
        hoverable  : true,
        borderColor: '#f3f3f3',
        borderWidth: 1,
        tickColor  : '#f3f3f3'
      },
      series: {
        shadowSize: 0,
        lines     : {
          show: true
        },
        points    : {
          show: true
        }
      },
      lines : {
        fill : false,
        color: ['#3c8dbc', '#f56954']
      },
      yaxis : {
        show: true
      },
      xaxis : {
        show: true
      }
    })
    //Initialize tooltip on hover
    $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
      position: 'absolute',
      display : 'none',
      opacity : 0.8
    }).appendTo('body')
    $('#line-chart1').bind('plothover', function (event, pos, item) {

      if (item) {
        var x = item.datapoint[0].toFixed(2),
            y = item.datapoint[1].toFixed(2)

        $('#line-chart1-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
          .css({
            top : item.pageY + 5,
            left: item.pageX + 5
          })
          .fadeIn(200)
      } else {
        $('#line-chart1-tooltip').hide()
      }

    })
    /* END LINE CHART */
    

    /*
     * HEIGHT LINE CHART
     * ----------
     */
    //LINE randomly generated data

    var actual_height = [],
        optimum_height_min = [],
        optimum_height_max = []

    @foreach($optimum_values as $optimum_valu)
    optimum_height_min.push([{{ $optimum_valu->age }}, {{ $optimum_valu->length_from }}]);
    optimum_height_max.push([{{ $optimum_valu->age }}, {{ $optimum_valu->length_to }}]);
    @endforeach

    @foreach($child->groth_tracker_records as $record)
    @php
    $age =(int) round(\Carbon\Carbon::parse($child->birthday)->diffInDays(\Carbon\Carbon::parse($record->date)) / 30);
    $height = $record->height;
    @endphp
    actual_height.push([{{ $age }}, {{ $height }}])
    @endforeach


    var line_data1 = {
      data : actual_height,
      color: '#0ac20d'
    }
    var line_data2 = {
      data : optimum_height_min,
      color: '#3b7fcc'
    }

    var line_data3 = {
      data : optimum_height_max,
      color: '#3b7fcc'
    }
    $.plot('#height-line-chart-{{ $child->id }}', [line_data1, line_data2, line_data3], {
      grid  : {
        hoverable  : true,
        borderColor: '#f3f3f3',
        borderWidth: 1,
        tickColor  : '#f3f3f3'
      },
      series: {
        shadowSize: 0,
        lines     : {
          show: true
        },
        points    : {
          show: true
        }
      },
      lines : {
        fill : false,
        color: ['#3c8dbc', '#f56954']
      },
      yaxis : {
        show: true
      },
      xaxis : {
        show: true
      }
    })
    //Initialize tooltip on hover
    $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
      position: 'absolute',
      display : 'none',
      opacity : 0.8
    }).appendTo('body')
    $('#line-chart1').bind('plothover', function (event, pos, item) {

      if (item) {
        var x = item.datapoint[0].toFixed(2),
            y = item.datapoint[1].toFixed(2)

        $('#line-chart1-tooltip').html(item.series.label + ' of ' + x + ' = ' + y)
          .css({
            top : item.pageY + 5,
            left: item.pageX + 5
          })
          .fadeIn(200)
      } else {
        $('#line-chart1-tooltip').hide()
      }

    })
    /* END LINE CHART */
    @endforeach
  })

  /*
   * Custom Label formatter
   * ----------------------
   */
  function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
      + label
      + '<br>'
      + Math.round(series.percent) + '%</div>'
  }
</script>

@endsection