<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Category;
use App\User;
use App\Product;
use App\Blog;
use App\ProductImg;
use Auth;
class SiteController extends Controller
{
    public function index()
    {
        $categories = Category::where('parents', 0)->get();
        foreach($categories as $cat)
        {
            $projects = Product::where('status', 1)->where('cat_id', $cat->id)->count();
            $cat['count'] = $projects;
        }
        $announces = Product::orderBy('id', 'desc')->where('status', 1)->take(10)->get();
        foreach($announces as $announce)
        {
            $cat_name = Category::where('id', $announce->cat_id)->first();
            $user = User::where('id', $announce->user_id)->first();
            $images = ProductImg::where('product_id', $announce->id)->get();
            if (!empty($cat_name))
                $announce['cat'] = $cat_name;
            if (!empty($user))
                $announce['user'] = $user;   
            $announce['images'] = $images;     
        }
        $blogs = Blog::orderBy('id', 'desc')->where('status', 1)->take(6)->get();
        return ['categories' => $categories, 'announces' => $announces, 'blogs' => $blogs];
    }
}

