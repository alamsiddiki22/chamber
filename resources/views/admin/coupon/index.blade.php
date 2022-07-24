@extends('layouts.dashboard')


@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h3>Coupon List</h3>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tr>
                            <th>SL</th>
                            <th>Name</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Validity</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        @foreach ($coupons as $key=>$coupon)
                        <tr>
                            <td>{{ $key+1 }}</td>
                            <td>{{ $coupon->coupon_name }}</td>
                            <td>{{ $coupon->type }}</td>
                            <td>{{ $coupon->amount }}</td>
                            <td>{{ $coupon->validity }}</td>
                            <td>
                                <a href="" class="btn btn-{{ ($coupon->status == 0?'dark':'success') }}">{{ ($coupon->status == 0?'Deactive':'Active') }}</a>
                            </td>
                            <td>
                                <a href="" class="btn btn-danger">Del</a>
                            </td>
                        </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">
                    <h3>Add Coupon</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('coupon.store') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="" class="form-label">Coupon Name</label>
                            <input type="text" class="form-control" name="coupon_name">
                        </div>
                        <div class="form-group">
                            <label for="" class="form-label">Coupon Type</label>
                            <select name="type" class="form-control">
                                <option value="1">Percentage</option>
                                <option value="2">Fixed Amount</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="" class="form-label">Discount Amount</label>
                            <input type="text" class="form-control" name="amount">
                        </div>
                        <div class="form-group">
                            <label for="" class="form-label">Validity</label>
                            <input type="date" class="form-control" name="validity">
                        </div>
                        <div class="form-group">
                            <label for="" class="form-label">Minimum</label>
                            <input type="text" class="form-control" name="min">
                        </div>
                        <div class="form-group">
                            <label for="" class="form-label">Maximum</label>
                            <input type="text" class="form-control" name="max">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Add Coupon</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
