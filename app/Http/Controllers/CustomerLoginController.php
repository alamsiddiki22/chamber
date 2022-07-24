<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerLoginController extends Controller
{
    function customer_login(Request $request){
        $data = $request->all();

        if(Auth::guard('customerlogin')->attempt(['email' => $data['email'], 'password' => $data['password']])){
            if(Auth::guard('customerlogin')->user()->email_verified_at == null){
                Auth::guard('customerlogin')->logout();
                return redirect()->route('customer.register.login')->with('success', 'Please Verify Your Email');
            }
            else{
                return redirect('/');
            }
        }else{
            return redirect('/customer/register/login');
        }
    }
}
