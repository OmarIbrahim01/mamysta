@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item"><a href="index.html">My Children</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{ $child->name }}</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-9 order-lg-last dashboard-content">
                <h2>Edit Child Info</h2>
                <form action="{{ route('user_children_update', [$child->id]) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group required-field" style="max-width: 100% !important;">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name" value="{{ $child->name }}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group required-field" style="max-width: 100%;">
                                <label>Gender</label>
                                <div class="select-custom">
                                    <select id="gender" class="form-control" name="gender" required>
                                       <option value="{{ $child->gender->id }}" selected>{{ $child->gender->name }}</option>
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
                                <input type="number" class="form-control" name="day" placeholder="31" value="{{ \Carbon\Carbon::parse($child->birthday)->format('d') }}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group required-field">
                                <label>Month</label>
                                <input type="number" class="form-control" name="month" placeholder="12" value="{{ \Carbon\Carbon::parse($child->birthday)->format('m') }}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group required-field">
                                <label>Year</label>
                                <input type="number" class="form-control" name="year" placeholder="2021" value="{{ \Carbon\Carbon::parse($child->birthday)->format('Y') }}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mx-auto">
                            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 50px;">Save</button>
                        </div>
                    </div>
                </form>
                
            </div><!-- End .col-lg-9 -->

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