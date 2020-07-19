<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Blog;
use App\Product;
use App\Message;
class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $message = Message::count();
        $user = User::count();
        $product = Product::count();
        $blog = Blog::count();
        $users = User::orderBy('id', 'desc')->take(8)->get();
        $messages = Message::orderBy('id', 'desc')->take(4)->get();
        $products = Product::orderBy('id', 'desc')->take(4)->get();
        $blogs = Blog::orderBy('id', 'desc')->take(4)->get();
        return ['message' => $message, 'user' => $user, 'product' => $product, 'blog' => $blog,
         'users' => $users, 'messages' => $messages, 'products' => $products, 'blogs' => $blogs];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
