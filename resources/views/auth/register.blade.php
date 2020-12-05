@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('home') }}"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">Sign Up</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container" style="width: 40%;">
        <div class="row">
            <div class="col-lg-12">
                <h2>Sign Up</h2>
                
                <form  method="POST" action="{{ route('register') }}" oninput='confirm_password.setCustomValidity(confirm_password.value != password.value ? "Passwords do not match." : "")'>
                    @csrf

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group required-field">
                                        <label for="name">First Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}" autocomplete="name" required autofocus>
                                    </div><!-- End .form-group -->
                                </div><!-- End .col-md-4 -->

                                <div class="col-md-6">
                                    <div class="form-group required-field">
                                        <label for="last_name">Last Name</label>
                                        <input type="text" class="form-control @error('last_name') is-invalid @enderror" id="last_name" name="last_name" value="{{ old('last_name') }}" autocomplete="first_name" required>
                                    </div><!-- End .form-group -->
                                </div><!-- End .col-md-4 -->
                            </div><!-- End .row -->
                        </div><!-- End .col-sm-11 -->
                    </div><!-- End .row -->

                    <div class="form-group required-field">
                        <label for="email">Email</label>
                        <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" required>
                    </div><!-- End .form-group -->

                    <div class="form-group required-field">
                        <label for="password">Password</label>
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" autocomplete="new-password" required>
                    </div><!-- End .form-group -->

                    <div class="form-group required-field">
                        <label for="password-confirm">Password Confirm</label>
                        <input type="password" class="form-control" id="password-confirm" name="password_confirmation" autocomplete="new-password" required>
                    </div><!-- End .form-group -->

                    <div class="col-md-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="terms" id="terms" required>
                            <label class="form-check-label" for="terms" style="margin-left: 5px;">I accept the Terms & Conditions</label>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="newsletter" id="newsletter" checked>
                            <label class="form-check-label" for="terms" style="margin-left: 5px;">I want to receive Mamysta Newsletters with the best deals and offers</label>
                        </div>
                    </div>

                    <div class="mb-2"></div><!-- margin -->

                    <div class="row">
                        <div class="col-md-6 mx-auto">
                            <div class="form-footer">
                                <div class="form-footer">
                                    <button type="submit" class="btn btn-primary" style="width: 100%;">Sign Up</button>
                                </div>
                            </div><!-- End .form-footer -->
                        </div>
                    </div>

                </form>
            </div><!-- End .col-lg-9 -->
        </div><!-- End .row -->
    </div><!-- End .container -->

    <div class="mb-5"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection