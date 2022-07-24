<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Inventory;
use App\Models\OrderProduct;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function welcome()
    {
        $all_products = Product::simplePaginate(6);
        $new_arrivals = Product::orderBy('updated_at', 'DESC')->get();//ok
        $new_arrivals = Product::latest()->take(4)->get();
        $top_categories = Category::take(6)->get();
        return view('frontend.index', [
            'all_products'=>$all_products,
            'new_arrivals'=>$new_arrivals,
            'top_categories'=>$top_categories,
        ]);
    }
    function product_details($slug){
        $product_details = Product::where('slug', $slug)->get();
        $product_id = $product_details->first()->id;
        $category_id = $product_details->first()->category_id;

        $related_products = Product::where('category_id',$category_id)->where('id', '!=', $product_id)->get();
        $product_review = OrderProduct::where('product_id',$product_id)->whereNotNull('review')->get();
        $total_review = OrderProduct::where('product_id',$product_id)->whereNotNull('review')->count();
        $total_star = OrderProduct::where('product_id',$product_id)->whereNotNull('star')->sum('star');


        $available_colors = Inventory::where('product_id', $product_id)
            ->selectRaw('color_id, count(*) as total')
            ->groupBy('color_id')
            ->get();
        return view('frontend.product_details', [
            'product_details'=>$product_details,
            'available_colors'=>$available_colors,
            'related_products'=>$related_products,
            'product_review'=>$product_review,
            'total_review'=>$total_review,
            'total_star'=>$total_star,
        ]);
    }

    function getSize(Request $request){

        $sizes = Inventory::where('product_id', $request->product_id)->where('color_id', $request->color_id)->get();
        $str = '<option>Choose A Option</option>';
        foreach($sizes as $size){
            $str .= '<option value="'.$size->size_id.'">'.$size->rel_to_size->size_name.'</option>';
        }
        echo $str;
    }

    function review(Request $request){
        OrderProduct::where('user_id', $request->user_id)->where('product_id', $request->product_id)->update([
            'review'=>$request->review,
            'star'=>$request->star,
            'updated_at'=>Carbon::now(),
        ]);

        return back();
    }
}
