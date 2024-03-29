<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Hash;
use Exception;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\User;
class AuthController extends Controller
{
    public function login(Request $request)
    {
        $creds = $request->only(['email', 'password']);
        $token = auth()->attempt($creds);
        if(!$token)
        {
            return response()->json([
                'success' => false,
                'message' => 'Invaide credntials'
            ]);
        }
        return response()->json([
            'success' => true,
            'token' => $token,
            'user' => Auth::user()
        ]);
    }

    public function register(Request $request)
    {
        $encryptedPass = Hash::make($request->password);
        $user = new User;
        try{
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = $encryptedPass;
            $user->save();
            return $this->login($request);
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => ''.$e
            ]); 
        }
    }
    public function logout(Request $request)
    {
        try{
            JWTAuth::invalidate(JWTAuth::parseToken($request->token));
            return response()->json([
                'success' => true,
                'message' => 'logout success'
            ]); 
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => ''.$e
            ]); 
        }
    }
}
