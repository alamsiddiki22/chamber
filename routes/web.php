<?php

use App\Http\Controllers\AccountController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\CustomerLoginController;
use App\Http\Controllers\CustomerRegisterController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\GithubController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SubcategoryController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\RoleManager;
use App\Http\Controllers\SslCommerzPaymentController;
use App\Http\Controllers\StripePaymentController;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

// Route::get('/', function () {
//     return view('welcome');
// });

//frontend
Auth::routes();
Route::get('/',[FrontendController::class, 'welcome'])->name('index');
Route::get('product/details/{slug}',[FrontendController::class, 'product_details'])->name('product.details');

//backend
Route::get('/home', [HomeController::class, 'index'])->name('home');

//users
Route::get('/users', [HomeController::class, 'users'])->name('users');
Route::get('/delete/user/{user_id}', [HomeController::class, 'delete'])->name('delete.user');
//Category
Route::get('/category', [CategoryController::class, 'index'])->name('category');
Route::post('/category/store', [CategoryController::class, 'store'])->name('category.store');
Route::get('/category/edit/{category_id}', [CategoryController::class, 'edit'])->name('category.edit');
Route::post('/category/update', [CategoryController::class, 'update'])->name('category.update');
Route::get('/category/delete/{category_id}', [CategoryController::class, 'delete'])->name('category.delete');
Route::post('/category/mark/delete/', [CategoryController::class, 'mark_delete'])->name('category.marked');
Route::get('/category/restore/{category_id}', [CategoryController::class, 'restore'])->name('category.restore');
Route::get('/category/per/delete/{category_id}', [CategoryController::class, 'pdelete'])->name('category.per.delete');

//SubCategory
Route::get('/subcategory', [SubcategoryController::class, 'index'])->name('subcategory');
Route::post('/subcategory/store', [SubcategoryController::class, 'store'])->name('subcategory.store');
Route::get('/subcategory/edit/{subcategory_id}', [SubcategoryController::class, 'edit'])->name('subcategory.edit');
Route::post('/subcategory/update', [SubcategoryController::class, 'update'])->name('subcategory.update');


//Product
Route::get('/add/product', [ProductController::class, 'add_product'])->name('add.product');
Route::post('/getsubcategory', [ProductController::class, 'getsubcategory'])->name('getsubcategory');
Route::post('/product/store', [ProductController::class, 'product_store'])->name('product.store');
Route::get('/product/list', [ProductController::class, 'product_list'])->name('product.list');

//Inventory
Route::get('/product/inventory/{product_id}', [InventoryController::class, 'inventory'])->name('inventory');
Route::get('/product/variation', [InventoryController::class, 'variation'])->name('variation');
Route::post('/add/color', [InventoryController::class, 'addcolor'])->name('add.color');
Route::post('/add/size', [InventoryController::class, 'addsize'])->name('add.size');
Route::post('/addinventory', [InventoryController::class, 'addinventory'])->name('add.inventory');

Route::post('/getSize', [FrontendController::class, 'getSize']);

//Customer
Route::get('/customer/register/login', [CustomerRegisterController::class, 'register_login'])->name('customer.register.login');
Route::post('/customer/register/store', [CustomerRegisterController::class, 'register_store'])->name('customer.register.store');
Route::post('/customer/login', [CustomerLoginController::class, 'customer_login'])->name('customer.login');
Route::get('/customer/logout', [CustomerController::class, 'customer_logout'])->name('customer.logout');
Route::get('/customer/email/verify/{token}', [AccountController::class, 'customeremail_verify']);

//Cart
Route::post('/cart/store', [CartController::class, 'cart_store'])->name('cart.store');
Route::get('/cart/remove/{cart_id}', [CartController::class, 'cart_remove'])->name('cart.remove');
Route::get('/cart', [CartController::class, 'cart'])->name('cart');
Route::post('/cart/update', [CartController::class, 'cart_update'])->name('cart.update');

//Coupon
Route::get('/coupon', [CouponController::class, 'coupon'])->name('add.coupon');
Route::post('/coupon/store', [CouponController::class, 'coupon_store'])->name('coupon.store');

//checkout
Route::get('/checkout', [CheckoutController::class, 'checkout'])->name('checkout');
Route::post('/getCity', [CheckoutController::class, 'getCity']);
Route::post('/order/store', [CheckoutController::class, 'order_store'])->name('order.store');
Route::get('/order/success', [CheckoutController::class, 'order_success'])->name('order.success');

//invioce download
Route::get('account', [AccountController::class, 'account'])->name('account');
Route::get('/invoice/download/{order_id}', [AccountController::class, 'invoice_download'])->name('invoice.download');


// SSLCOMMERZ Start
// Route::get('/example1', [SslCommerzPaymentController::class, 'exampleEasyCheckout']);
Route::get('/ssl/payment', [SslCommerzPaymentController::class, 'ssl_pay']);

Route::post('/pay', [SslCommerzPaymentController::class, 'index']);
Route::post('/pay-via-ajax', [SslCommerzPaymentController::class, 'payViaAjax']);

Route::post('/success', [SslCommerzPaymentController::class, 'success']);
Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);

Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);
//SSLCOMMERZ END

//stripe
Route::get('stripe', [StripePaymentController::class, 'stripe']);
Route::post('stripe', [StripePaymentController::class, 'stripePost'])->name('stripe.post');

//Review
Route::post('/review',[FrontendController::class, 'review'])->name('review.store');

//Password Reset
Route::get('/pass/reset/req',[AccountController::class, 'pass_reset_req'])->name('customer.pass.reset.req');
Route::post('/pass/reset/store',[AccountController::class, 'pass_reset_store'])->name('customer.pass.reset.store');
Route::get('/pass/reset/form/{token}',[AccountController::class, 'pass_reset_form'])->name('customer.pass.reset.form');
Route::post('/pass/reset/update',[AccountController::class, 'pass_reset_update'])->name('pass.reset.update');

//Role Manager
Route::get('/role/manager',[RoleManager::class, 'role_manager'])->name('role.manager');
Route::post('/permission/store',[RoleManager::class, 'permission_store'])->name('permission.store');
Route::post('/create/role',[RoleManager::class, 'create_role'])->name('create.role');
Route::get('/edit/permission/{role_id}',[RoleManager::class, 'edit_permission'])->name('edit.permission');
Route::post('/role/permissions/update',[RoleManager::class, 'role_permissions_update'])->name('role.permissions.update');
Route::post('/assign/role',[RoleManager::class, 'assign_role'])->name('assign.role');

// github login
Route::get('/github/redirect', [GithubController::class, 'github_redirect'])->name('github.redirect');
Route::get('/github/callback', [GithubController::class, 'github_callback'])->name('github.callback');


