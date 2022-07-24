<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function users()
    {
        // $all_users = User::all();
        // $all_users = User::where('id', '!=', Auth::id())->get();
        // $all_users = User::simplePaginate(3);
        $all_users = User::paginate(3);
        $total_user = User::count();
        return view('admin.users.index', compact('all_users', 'total_user'));
    }
    function delete($user_id){
        User::find($user_id)->delete();
        return back();
    }

}

