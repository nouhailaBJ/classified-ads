<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use App\ProductImg;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Product::latest()->paginate(12);
    }

    public function pro_image($id)
    {
        $data =  ProductImg::where('product_id', $id)->get();
        return response()->json(['status' =>'success' , 'data' => $data]);
    }
    public function upload_image(Request $request)
    {
        $uploadedFiles = $request->pics;
        foreach ($uploadedFiles as $file){
            if (!empty($file))
            {
                $ImageUpload = \Image::make($file);
                $originalPath = 'uploads/product/';
                $name = time().$file->getClientOriginalName();
                $ImageUpload->save($originalPath.$name);
                $media = ProductImg::create([
                    'image' => $name,
                    'product_id' => $request->proid
                ]);
            }
        }
        return response(['status'=>'success'],200);
    }
    public function delete_image($id)
    {
        $image = ProductImg::findOrFail($id);
        $image->delete();
        return ['message' => 'delete image'];
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    { 
            $validation = Validator::make($request->all(),[
                'title' => 'required|string|max:255',
                'description' => 'required|string|min:9',
                'tags' => 'required|string|min:3|max:255',
                'price' => 'required|string|max:255',
                'status' => 'required|numeric',
                'cat_id' => 'required|numeric',
                'sub_id' => 'required|numeric',
                'image' => 'required',
                'location' => 'required',
            ]);
            if  ($validation->fails())
            {
                return response()->json(['status' => 'error', 'errors' => $validation->errors()], 422);
            }
            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            \Image::make($request->image)->save(public_path('uploads/product/').$name);
            $product = Product::create([
                'title' => $request['title'],
                'description' => $request['description'],
                'tags' => $request['tags'],
                'price' => $request['price'],
                'status' => $request['status'],
                'cat_id' => $request['cat_id'],
                'sub_id' => $request['sub_id'],
                'location' => $request['location'],
                'user_id' => Auth('api')->user()->id,
                'image' => $name,
            ]);
            return response()->json(['status' => 'success', 'data' => $product], 201);
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
        $product = Product::findOrFail($id);

        $validation = Validator::make($request->all(),[
            'title' => 'required|string|max:255',
            'description' => 'required|string|min:9',
            'tags' => 'required|string|min:3|max:255',
            'price' => 'required|string|max:255',
            'status' => 'required|numeric',
            'cat_id' => 'required|numeric',
            'location' => 'required',
        ]);
        if(!empty($request->image))
        {
            $currentPhoto = $product->image;
            if($request->image != $currentPhoto)
            {
                $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save(public_path('uploads/product/').$name);
                $request->merge(['image' => $name]);
    
                // for remove te curent picture 
                $userPhoto = public_path('uploads/product/').$currentPhoto;
                if(file_exists($userPhoto)){
                    @unlink($userPhoto);
                }
            }
        }
        $product->update($request->all());
        return ['message' => 'update product'];
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $images = ProductImg::where('product_id', $product->id)->get();
        foreach($images as  $image)
        {
            $image->delete();
        }
        $product->delete();
        return ['message' => 'delete product'];
    }

    public function search()
    {
        if ($search = \Request::get('q')) {
            $products = Product::where(function($query) use ($search){
                $query->where('title','LIKE',"%$search%")
                        ->orWhere('description','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $products = Product::latest()->paginate(12);
        }

        return $products;
    }

    public function find_search(Request $request)
    {
        $result = Product::query();

        if (!empty($request->title)) {
            $result = $result->where('title', 'like', '%'.$request->title.'%');
        }

        if (!empty($request->category)) {
            $result = $result->where('cat_id', $request->category);
        }

        if (!empty($request->location)) {
            $result = $result->where('location', 'like', '%'.$request->location.'%');
        }

        $result = $result->get();
        return response()->json(['status' =>'success' , 'data' => $result]);
    }
}
