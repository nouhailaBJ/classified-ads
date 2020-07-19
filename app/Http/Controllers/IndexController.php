<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;
use App\Page;
class IndexController extends Controller
{
    public function index()
    {
        $categories = Category::where('parents', 0)->get();
        foreach($categories as $category)
        {
            $sub_cat = Category::where('parents', $category->id)->get(); 
            $category['sub_cat'] = $sub_cat;
        }
        $pages = Page::where('status', 1)->get();
        return view('welcome', compact('categories', 'pages'));
    }

    public function signin()
    {
        $categories = Category::where('parents', 0)->get();
        foreach($categories as $category)
        {
            $sub_cat = Category::where('parents', $category->id)->get(); 
            $category['sub_cat'] = $sub_cat;
        }
        $pages = Page::where('status', 1)->get();
        return view('signin', compact('categories', 'pages'));
    }
}
