<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Category;
use App\Product;
use App\ProductImg;
use App\User;
class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Category::latest()->with('parent')->paginate(12);
    }
    public function get_category($id)
    {
        $category = Category::findOrFail($id);
        //$announces = Product::orderBy('id', 'desc')->where('status', 1)->paginate(2);
        $announces = Product::orderBy('id', 'desc')
        ->where('status', 1)->where('sub_id', $category->id)->
        Orwhere('cat_id', $category->id)->where('status', 1)->paginate(12);
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
        return $announces;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'parents' => 'required|numeric',
            'icon' => 'required|min:3',
        ]);
        return Category::create([
            'name' => $request['name'],
            'icon' => $request['icon'],
            'parents' => $request['parents'],
        ]);
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
        $category = Category::findOrFail($id);
        $request->validate([
            'name' => 'required|string|max:255',
            'parents' => 'required|numeric',
            'icon' => 'required|min:3',
        ]);

        $category->update($request->all());
        return response()->json(['status' => 'success', 'data' => $category], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        
        return ['message' => 'delete category'];
    }
    public function cat_product()
    {
        return response()->json(['status' =>'success' , 'data' => Category::where('parents', 0)->get()]);
    }
    public function sub_cat($id)
    {
        $category = Category::findOrFail($id);
        if (!empty($category))
        {
            return response()->json(['status' =>'success' , 'data' => Category::where('parents', $category->id)->get()]);
        }else{
            return response()->json(['status' =>'error']);
        }
        
    }
    public function search()
    {
        if ($search = \Request::get('q')) {
            $category = Category::where(function($query) use ($search){
                $query->where('name','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $category = Category::latest()->paginate(12);
        }

        return $category;
    }
}
