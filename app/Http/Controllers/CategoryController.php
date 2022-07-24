<?php

namespace App\Http\Controllers;
use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
// use League\CommonMark\Extension\CommonMark\Node\Inline\Image;
use Image;

class CategoryController extends Controller
{
    function index(){
        $categories = Category::all();
        $trash_categories = Category::onlyTrashed()->get();
        return view('admin.category.index', [
            'categories'=> $categories,
            'trash_categories'=> $trash_categories,
        ]);
    }
    function store(Request $request ){

        if($request->category_image){
            $request->validate([
                // 'category_name'=>'required',
                // 'category_name'=>'unique:categories',
                'category_name'=>'required|unique:categories',
                'category_image'=>'mimes:jpg,png',
                'category_image'=>'file|max:512',
            ],[
                'category_name.required'=>'Nam koi re?',
                'category_name.unique'=>'This number already has been taken!',
            ]);
            // print_r($request->all());
            $category_id = Category::insertGetId([
                'category_name'=> $request->category_name,
                'added_by'=>Auth::id(),
                'created_at'=>Carbon::now(),
            ]);

            $category_image = $request->category_image;
            $extension = $category_image->getClientOriginalExtension();
            $file_name = $category_id .'.'. $extension;

            'Image'::make($category_image)->resize(300, 250)->save(public_path('/uploads/category/'.$file_name));

            Category::find($category_id)->update([
                'category_image'=>$file_name,
            ]);
        }
        else{
            $request->validate([
                'category_name'=>'required|unique:categories',
            ],[
                'category_name.required'=>'Nam koi re?',
                'category_name.unique'=>'This number already has been taken!',
            ]);
            $category_id = Category::insertGetId([
                'category_name'=> $request->category_name,
                'added_by'=>Auth::id(),
                'created_at'=>Carbon::now(),
            ]);
        }

        return back()->with('success', 'Category Added Successfully!');
    }
    function edit($category_id){
        $category_info = Category::find($category_id);
        return view('admin.category.edit', [
            'category_info'=> $category_info,
        ]);
    }
    function update(Request $request){

        if($request->category_image == ''){
            Category::find($request->category_id)->update([
                'category_name'=>$request->category_name,
                'added-by'=>Auth::id(),
                'updated_at'=>Carbon::now(),
            ]);
            return redirect('/category')->with('success', 'Category Updated Successfully!');
        }
        else{
            $image = Category::find($request->category_id);
            if($image->category_image == 'default.png'){
                $category_img = $request->category_image;
                $extension = $category_img->getClientOriginalExtension();
                $file_name = $request->category_id.'.'.$extension;

                'Image'::make($category_img)->save(public_path('/uploads/category/'.$file_name));

                Category::find($request->category_id)->update([
                    'category_image'=>$file_name,
                ]);
                return redirect('/category')->with('success', 'Category Updated Successfully!');
            }
            else{
                $delete_from = public_path('/uploads/category/'.$image->category_image);
                unlink($delete_from);

                $category_img = $request->category_image;
                $extension = $category_img->getClientOriginalExtension();
                $file_name = $request->category_id.'.'.$extension;

                'Image'::make($category_img)->save(public_path('/uploads/category/'.$file_name));

                Category::find($request->category_id)->update([
                    'category_image'=>$file_name,
                ]);
                return redirect('/category')->with('success', 'Category Updated Successfully!');
            }
        }
        die();
        Category::find($request->category_id)->update([
            'category_name'=>$request->category_name,
            'added-by'=>Auth::id(),
            'updated_at'=>Carbon::now(),
        ]);
        return redirect('/category')->with('success', 'Category Updated Successfully!');
    }
    function delete($category_id){
        Category::find($category_id)->delete();
        return back();
    }
    function mark_delete(Request $request){
        $request->validate([
            'mark'=>'required',
        ],[
            'mark.required'=>'Please check at least 1 category',
        ]);

        foreach($request->mark as $mark){
            Category::find($mark)->delete();
        }
        return back();
    }
    function restore($category_id){
        Category::onlyTrashed()->find($category_id)->restore();
        return back();
    }
    function pdelete($category_id){
        $image = Category::onlyTrashed()->find($category_id);
        if($image->category_image == 'default.png'){
            Category::onlyTrashed()->find($category_id)->forceDelete();
            return back();
        }
        else{
            $delete_from = public_path('/uploads/category/'.$image->category_image);
            unlink($delete_from);
            Category::onlyTrashed()->find($category_id)->forceDelete();
            return back();
        }

    }
}
