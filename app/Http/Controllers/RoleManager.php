<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RoleManager extends Controller
{
    function role_manager(){
        $roles = Role::all();
        $all_permissions = Permission::all();
        $all_users = User::all();
        return view('admin.role.index', [
            'all_permissions'=>$all_permissions,
            'roles'=>$roles,
            'all_users'=>$all_users,
        ]);
    }
    function permission_store(Request $request){
        $permission = Permission::create(['name' => $request->permission_name]);
        return back();
    }
    function create_role(Request $request){
        $role = Role::create(['name' => $request->role_name]);
        $role->givePermissionTo($request->permission_name);
        return back();
    }
    function edit_permission($role_id){
        $all_permissions = Permission::all();
        $role = Role::find($role_id);
        return view('admin.role.edit_permission', [
            'all_permissions'=>$all_permissions,
            'role'=>$role,
        ]);
    }
    function role_permissions_update(Request $request){
        $role = Role::find($request->role_id);
        $role->syncPermissions($request->permission_name);

        return back();
    }
    function assign_role(Request $request){
        $user = User::find($request->user_id);
        $user->assignRole($request->role_id);

        return back();
    }
}
