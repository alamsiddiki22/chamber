<?php

namespace App\Http\Controllers;

use App\Mail\InvoiceSend;
use App\Models\BillingDetails;
use App\Models\Cart;
use App\Models\City;
use App\Models\Country;
use App\Models\Inventory;
use App\Models\Order;
use App\Models\OrderProduct;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    function checkout(){
        $countries = Country::all();
        $carts = Cart::where('customer_id', Auth::guard('customerlogin')->id())->get();
        $cart_total = 0;
        foreach($carts as $cart){
            $cart_total += $cart->rel_to_product->after_discount * $cart->quantity;
        }
        return view('frontend.checkout', [
            'sub_total'=>$cart_total,
            'countries'=>$countries,
        ]);
    }
    function getCity(Request $request){
        $str = '<option value="">Select City</option>';
        $cities = City::where('country_id', $request->country_id)->get();
        foreach($cities as $city){
            $str.= '<option value="'.$city->id.'">'.$city->name.'</option>';
        }
        echo $str;
    }
    function order_store(Request $request){
        if($request->payment_method == 1){
            $order_id = Order::insertGetId([
                'user_id'=>Auth::guard('customerlogin')->id(),
                'subtotal'=>$request->sub_total,
                'discount'=>$request->discount,
                'charge'=>$request->charge,
                'total'=>$request->total,
                'created_at'=>Carbon::now(),
            ]);
            BillingDetails::insert([
                'order_id'=>$order_id,
                'user_id'=>Auth::guard('customerlogin')->id(),
                'name'=>$request->name,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'company'=>$request->company,
                'country_id'=>$request->country_id,
                'city_id'=>$request->city_id,
                'address'=>$request->address,
                'notes'=>$request->notes,
                'created_at'=>Carbon::now(),
            ]);

            $carts = Cart::where('customer_id', Auth::guard('customerlogin')->id())->get();

            foreach($carts as $cart){
                OrderProduct::insert([
                    'user_id'=>Auth::guard('customerlogin')->id(),
                    'order_id'=>$order_id,
                    'product_id'=>$cart->product_id,
                    'color_id'=>$cart->color_id,
                    'size_id'=>$cart->size_id,
                    'price'=>$cart->rel_to_product->after_discount,
                    'quantity'=>$cart->quantity,
                    'created_at'=>Carbon::now(),
                ]);
                Inventory::where ('product_id', $cart->product_id)->where('color_id', $cart->color_id)->where('size_id', $cart->size_id)->decrement('quantity', $cart->quantity);
            }
            //sms send
            $url = "http://66.45.237.70/api.php";
            $number=$request->phone;
            $text="Thank You for Purchasing Our Product, Your Total Amount is:".$request->total;
            $data= array(
            'username'=>"Rahimmia",
            'password'=>"FP9Y78D4",
            'number'=>"$number",
            'message'=>"$text"
            );
            $ch = curl_init(); // Initialize cURL
            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $smsresult = curl_exec($ch);
            $p = explode("|",$smsresult);
            $sendstatus = $p[0];

            //invoice send
            Mail::to($request->email)->send(new InvoiceSend($order_id));

            // return view('invoice.invoice');

            Cart::where('customer_id', Auth::guard('customerlogin')->id())->delete();
            return redirect()->route('order.success')->with('success', $request->name);
        }
        else if($request->payment_method == 2){
            return view('ssl_pay', [
                'data'=>$request->all(),
            ]);
        }
        else{
            return view('stripe', [
                'data'=>$request->all(),
            ]);
        }
    }
    function order_success(){
        return view('order_success');
    }
}
