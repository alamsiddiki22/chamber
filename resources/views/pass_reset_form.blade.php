@extends('frontend.master')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-6 m-auto">
            <div class="card my-5">
                <div class="card-header bg-primary">
                    <h3 class="text-white">Password Reset Form</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('pass.reset.update') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label for="" class="form-label">New Password</label>
                            <input type="password" name="password" class="form-control">
                        </div>
                        <input type="hidden" name="token" value="{{ $token }}">
                        <div class="mb-3">
                            <button class="btn btn-primary">Reset Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
