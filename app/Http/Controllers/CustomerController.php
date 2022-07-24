<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
{
    function customer_logout(){
        Auth::guard('customerlogin')->logout();
        return redirect()->route('customer.register.login');
    }
}
