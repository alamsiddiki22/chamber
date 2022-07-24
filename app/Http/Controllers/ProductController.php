<?php

namespace App\Http\Controllers;
use App\Models\Subcategory;
use App\Models\Category;
use App\Models\Product;
use App\Models\Thumbnails;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    function add_product(){
        $categories = Category::all();
        $subcategories = Subcategory::all();
        return view('admin.product.index', [
            'categories'=>$categories,
            'subcategories'=>$subcategories,
        ]);
    }

    function getsubcategory(Request $request){
        $subcategories = Subcategory::where('category_id', $request->category_id)->get();

        $str = '<option value="">-- Select Sub Category --</option>';
        foreach($subcategories as $subcategory){
            $str .= '<option value="'.$subcategory->id.'">'.$subcategory->subcategory_name.'</option>';
        }
        echo $str;
    }
    function product_store(Request $request){

        $product_id = Product::insertGetId([
            'category_id'=>$request->category_id,
            'subcategory_id'=>$request->subcategory_id,
            'product_name'=>$request->product_name,
            'product_price'=>$request->product_price,
            'discount'=>$request->discount,
            'after_discount'=>$request->product_price - ($request->product_price * $request->discount / 100),
            'short_desp'=>$request->short_desp,
            'long_desp'=>$request->long_desp,
            'sku'=>substr($request->product_name, 0, 4) . '-' . Str::random(5) . rand(0, 1000),
            'slug'=>str_replace(' ', '-', Str::lower($request->product_name)) . '-' . rand(0, 1000000),
            'created_at'=>Carbon::now(),
        ]);
        $preview_image = $request->preview;
        $extension = $preview_image->getClientOriginalExtension();

        $preview_name = $product_id.'.'.$extension;
        Image::make($preview_image)->resize(680,680)->save(public_path('uploads/product/preview/'.$preview_name));

        Product::find($product_id)->update([
            'preview'=>$preview_name,
        ]);


        $sl = 1;
        $thumbnail_images = $request->thumbnails;

        foreach($thumbnail_images as $thumbnails){
            $extension = $thumbnails->getClientOriginalExtension();
            $thumbnail_name = $product_id.'-'. $sl.'.'.$extension;
            Image::make($thumbnails)->resize(680,680)->save(public_path('/uploads/product/thumbnails/'.$thumbnail_name));

            Thumbnails::insert([
                'product_id'=> $product_id,
                'thumbnails'=> $thumbnail_name,
                'created_at'=> Carbon::now(),
            ]);

            $sl++;
        }
        return back();
    }

    function product_list(){
        $all_products = Product::all();
        return view('admin.product.list',[
            'all_products'=> $all_products,
        ]);
    }



}
