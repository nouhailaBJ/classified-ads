<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Product;
use App\ProductImg;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        return Auth('api')->user();
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
                'cat_id' => 'required|numeric',
                'sub_id' => 'required|numeric',
                'location' => 'required',
                'image' => 'required',
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
                'status' => '0',
                'cat_id' => $request['cat_id'],
                'sub_id' => $request['sub_id'],
                'location' => $request['location'],
                'user_id' => Auth('api')->user()->id,
                'image' => $name,
            ]);
            $uploadedFiles = $request->images;
            if (!empty($uploadedFiles))
            {
                foreach ($uploadedFiles as $file){
                    if (!empty($file))
                    {
                        $ImageUpload = \Image::make($file);
                        $originalPath = 'uploads/product/';
                        $name = time().$file->getClientOriginalName();
                        $ImageUpload->save($originalPath.$name);
                        $media = ProductImg::create([
                            'image' => $name,
                            'product_id' => $product->id
                        ]);
                    }
                }
            }
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
        $user = auth('api')->user();


        $request->validate([
            'name' => 'required|string|max:255',
            'number' => 'required|string|min:9',
            'email' => 'required|string|email|max:255|unique:users,email,'.$user->id,
            'password' => 'sometimes|required|string|min:8|confirmed',
            'avatar' => 'required'
        ]);

        $currentPhoto = $user->avatar;
        if($request->avatar != $currentPhoto)
        {
            $name = time().'.' . explode('/', explode(':', substr($request->avatar, 0, strpos($request->avatar, ';')))[1])[1];
            \Image::make($request->avatar)->save(public_path('uploads/avatar/').$name);
            $request->merge(['avatar' => $name]);

            // for remove te curent picture 
            $userPhoto = public_path('uploads/avatar/').$currentPhoto;
            if(file_exists($userPhoto)){
                @unlink($userPhoto);
            }
        }

        if(!empty($request->password)){
            $request->merge(['password' => Hash::make($request['password'])]);
        }

        $user->update($request->all());
        return ['message', 'success'];
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
