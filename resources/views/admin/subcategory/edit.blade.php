@extends('layouts.dashboard')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-lg-8 m-auto">
            <div class="card">
                <div class="card-header">
                    <h3>Edit Subcategory</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('subcategory.update') }}" method="POST">
                        @csrf
                        <div class="mt-3">
                            {{-- <label for="">Category Name</label>
                            <input type="text" name="category_name" class="form-control"> --}}
                            <select name="category_id" class="form-control">
                                <option value="">-- Select Category --</option>
                                @foreach ($categories as $category)
                                <option value="{{ $category->id }}" {{ $category->id==$subcategory_info->category_id?'selected':'' }}>{{ $category->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mt-3">
                            <label for="">Subcategory Name</label>
                            <input type="hidden" name="subcategory_id" class="form-control" value="{{ $subcategory_info->id }}">
                            <input type="text" name="subcategory_name" class="form-control" value="{{ $subcategory_info->subcategory_name }}">
                            @if(session('exist'))
                                <strong class="text-danger">{{ session('exist') }}</strong>
                            @endif
                            @error('subcategory_name')
                                <strong class="text-danger">{{ $message }}</strong>
                            @enderror
                        </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary">Update Subcategory </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
