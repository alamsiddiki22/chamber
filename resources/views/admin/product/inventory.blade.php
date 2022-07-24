@extends('layouts.dashboard')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-8">
            <div class="card h-auto">
                <div class="card-header">
                    <h3>Inventory List of, {{ $product_info->product_name }}</h3>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tr>
                            <th>SL</th>
                            <th>Color Name</th>
                            <th>Size Name</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                        @foreach ($inventories as $key=>$inventory)
                        <tr>
                            <td>{{ $key+1 }}</td>
                            <td>
                                @if ($inventory->rel_to_color->color_name == 'NA')
                                    NA
                                @else
                                <span class="badge" style="background: {{ $inventory->rel_to_color->color_code }}; color:transparent">cl</span>
                                @endif
                            </td>
                            <td>{{ $inventory->rel_to_size->size_name }}</td>
                            <td>{{ $inventory->quantity }}</td>
                            <td><a href="#" class="btn btn-danger shadow btn-xs sharp mr-1"><i class="fa fa-trash"></i></a></td>
                        </tr>
                        @endforeach
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card">
                <div class="card-header">
                    <h3>Add Inventory</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('add.inventory') }}" method="POST">
                        @csrf
                       <div class="form-group">
                            <input type="hidden" class="form-control" name="product_id" readonly value="{{ $product_info->id }}">
                            <input type="text" class="form-control" readonly value="{{ $product_info->product_name }}">
                       </div>
                       <div class="form-group">
                            <select name="color_id" class="form-control">
                                <option value="">-- Select Color --</option>
                                @foreach ($colors as $color)
                                    <option value="{{ $color->id }}">{{$color->color_name}}</option>
                                @endforeach
                            </select>
                       </div>
                       <div class="form-group">
                        <select name="size_id" class="form-control">
                            <option value="">-- Select Size --</option>
                            @foreach ($sizes as $size)
                                    <option value="{{ $size->id }}">{{$size->size_name}}</option>
                                @endforeach
                        </select>
                       </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="quantity" placeholder="Quantity">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Add Inventory</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
