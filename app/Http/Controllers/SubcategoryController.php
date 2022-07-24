<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;

class SubcategoryController extends Controller
{
    function index(){
        $categories = Category::all();
        $subcategories = SubCategory::all();
        return view('admin.subcategory.index', [
            'categories'=>$categories,
            'subcategories'=>$subcategories,
        ]);
    }
    function store(Request $request){

        $request->validate([
            'subcategory_name'=>'required|unique:subcategories',
        ],[
            'subcategory_name.required'=>'Please, Enter Your Subcategory Name.',
            'subcategory_name.unique'=>'This Name is already entered.',
        ]);

        if(Subcategory::where('category_id', $request->category_id)->where('subcategory_name', $request->subcategory_name)->exists())
        {
            return back()->with('exist', 'subcategory already exist in this category');
        }
        else{
            Subcategory::insert([
                'category_id'=>$request->category_id,
                'subcategory_name'=>$request->subcategory_name,
            ]);
            return back();
        }

    }
    function edit($subcategory_id){
        $subcategory_info = Subcategory::find($subcategory_id);
        $categories = Category::all();

        return view('admin.subcategory.edit', [
            'subcategory_info'=>$subcategory_info,
            'categories' => $categories
        ]);
    }
    function update(Request $request){
        Subcategory::find($request->subcategory_id)->update([
            'subcategory_name'=>$request->subcategory_name,
        ]);
        return redirect('/subcategory')->with('success', 'Subcategory Updated Successfully');
    }
}
