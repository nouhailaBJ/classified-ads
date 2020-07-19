<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Hash;
use Auth;
use Validator;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    { 
        return User::latest()->paginate(12);
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
            'number' => 'required|string|min:9',
            'admin' => 'required',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
            'location' => 'required',
            'avatar' => 'required'
        ]);
        $name = time().'.' . explode('/', explode(':', substr($request->avatar, 0, strpos($request->avatar, ';')))[1])[1];
        \Image::make($request->avatar)->save(public_path('uploads/avatar/').$name);
        return User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'number' => $request['number'],
            'admin' => $request['admin'],
            'location' => $request['location'],
            'avatar' => $name,
            'password' => Hash::make($request['password']),
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
        $user = User::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'number' => 'required|string|min:9',
            'admin' => 'required',
            'email' => 'required|string|email|max:255|unique:users,email,'.$user->id,
            'password' => 'sometimes|required|string|min:8|confirmed',
        ]);

        if(!empty($request->avatar))
        {
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
        }
        $user->update($request->all());
        return ['message' => 'update user'];
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        
        return ['message' => 'delete user'];
    }

    public function search()
    {
        if ($search = \Request::get('q')) {
            $users = User::where(function($query) use ($search){
                $query->where('name','LIKE',"%$search%")
                        ->orWhere('email','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $users = User::latest()->paginate(5);
        }

        return $users;
    }
}
