@extends ('layouts.dashboard')
@section('content')

<div class="">
    <div class="row">
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header">
                    <h3>Category List</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('category.marked') }}" method="POST">
                    @csrf
                    <table class="table table-striped">
                        <tr>
                            <th><input type="checkbox" id="checkAll">Mark All</th>
                            <th>SL</th>
                            <th>Category Name</th>
                            <th>Added By</th>
                            <th>Image</th>
                            <th>Created At</th>
                            <th>Action</th>
                        </tr>
                        @forelse ($categories as $key=>$category)
                        <tr>
                            <td><input type="checkbox" name="mark[]" value="{{ $category->id }}"></td>
                            <td>{{ $key+1 }}</td>
                            <td>{{ $category->category_name }}</td>
                            <td>{{ $category->rel_to_user->name }}</td>
                            <td><img width="40" src="{{ asset('uploads/category') }}/{{ $category->category_image }}"></td>
                            <td>{{ $category->created_at->diffForHumans() }}</td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn btn-success light sharp" data-toggle="dropdown">
                                        <svg width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="24" height="24"/><circle fill="#000000" cx="5" cy="12" r="2"/><circle fill="#000000" cx="12" cy="12" r="2"/><circle fill="#000000" cx="19" cy="12" r="2"/></g></svg>
                                    </button>
                                    <div class="dropdown-menu">
                                        <a href="{{ route('category.edit', $category->id) }}" class="dropdown-item">Edit</a>
                                        <a href="{{ route('category.delete', $category->id) }}" class="dropdown-item">Delete</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="5" class="text-center">No Data Found</td>
                        </tr>
                        @endforelse
                    </table>
                    @error('mark')
                        <div>
                            <strong class="text-danger">{{ $message }}</strong>
                        </div>
                    @enderror

                    @if (App\Models\Category::count() > 0)
                    <button type="submit" class="btn btn-danger">Delete Marked</button>
                    @endif
                </form>
                </div>
            </div>

            <div class="card mt-5">
                <div class="card-header">
                    <h3>Trash Category List</h3>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tr>
                            <th>SL</th>
                            <th>Category Name</th>
                            <th>Added By</th>
                            <th>Image</th>
                            <th>Created At</th>
                            <th>Action</th>
                        </tr>
                        @forelse ($trash_categories as $key=>$category)
                        <tr>
                            <td>{{ $key+1 }}</td>
                            <td>{{ $category->category_name }}</td>
                            <td>{{ $category->rel_to_user->name }}</td>
                            <td><img width="40" src="{{ $category->asset('uploads/category') }}/{{ $category->category_image }}"></td>
                            <td>{{ $category->created_at->diffForHumans() }}</td>
                            <td>
                                <a href="{{ route('category.restore', $category->id) }}" class="btn btn-success">Restore</a>
                                <a href="{{ route('category.per.delete', $category->id) }}" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="5" class="text-center">No Data Found</td>
                        </tr>
                        @endforelse
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="card">
                <div class="card-header">
                    <h3>Add Category</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('category.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="mt-3">
                            <label for="" class="form-label">Category Name</label>
                            <input type="text" name="category_name" class="form-control">
                            @error('category_name')
                                <strong class="text-danger">{{ $message }}</strong>
                            @enderror
                        </div>
                        <div class="mt-3">
                            <label for="" class="form-label">Category Image</label>
                            <input type="file" name="category_image" class="form-control">
                            @error('category_image')
                                <strong class="text-danger">{{ $message }}</strong>
                            @enderror
                        </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary">Add Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('footer_script')
@if(session('success'))
    <script>
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
            })

            Toast.fire({
            icon: 'success',
            title: '{{ session('success') }}'
            })
    </script>
@endif
<script>
    $("#checkAll").click(function(){
        $('input:checkbox').not(this).prop('checked', this.checked);
    });
</script>
@endsection
