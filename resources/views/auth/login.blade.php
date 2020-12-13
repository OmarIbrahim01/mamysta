@extends('layouts.market_main')

@section('css')
@endsection


@section('content')

<main class="main">
    <nav aria-label="breadcrumb" class="breadcrumb-nav">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('home') }}"><i class="icon-home"></i></a></li>
                <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
        </div><!-- End .container -->
    </nav>

    <div class="container" style="width: 40%;">
        <div class="heading mb-4">
            <h2 class="title">Login</h2>
            <p>Please enter your Email and Password to login.</p>
        </div><!-- End .heading -->

        <form method="POST" action="{{ route('login') }}">
            @csrf

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group required-field">
                        <label for="email">{{ __('Email Address') }}</label>
                        <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    </div><!-- End .form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-group required-field">
                        <label for="password">{{ __('Password') }}</label>
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" required autocomplete="current-password">
                    </div><!-- End .form-group -->
                </div>
                <div class="col-md-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                        <label class="form-check-label" for="remember" style="margin-left: 5px;">{{ __('Remember Me') }}</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="form-footer">
                        <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
                    </div><!-- End .form-footer -->
                    @if (Route::has('password.request'))
                        <a class="btn btn-link" href="{{ route('password.request') }}">
                            {{ __('Forgot Your Password?') }}
                        </a>
                    @endif
                </div>
            </div>
        </form>
    </div><!-- End .container -->

    <div class="mb-10"></div><!-- margin -->
</main><!-- End .main -->

@endsection


@section('js')
@endsection