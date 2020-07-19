<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use App\User;
use App\Chat;
use App\Session;
use App\Product;
use Auth;
use App\Events\MessageSend;

class ChatController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function user_list()
    {
        $sessions = Session::latest()->where('from_id', auth()->user()->id)->Orwhere('to_id', auth()->user()->id)->get();
        foreach($sessions as $session)
        {
            $user= $session->from_id != auth()->user()->id ? $session->from_id : $session->to_id;
            $session['user'] = User::findOrfail($user);
            $product = Product::where('id', $session->product_id)->first();
            $session['product']  = $product;
        }
        if(\Request::ajax()){
            return response()->json($sessions,200);
        }
        return abort(404);
    }


    public function user_message($id=null){
        if(!\Request::ajax()){
           return abort(404);
        }
        $session = Session::findOrFail($id);
        $user= $session->from_id != auth()->user()->id ? $session->from_id : $session->to_id;
        $session['user'] = User::findOrfail($user);
        $product = Product::where('id', $session->product_id)->first();
        $session['product']  = $product;
        $messages = $this->message_by_user_id($id);
        return response()->json([
            'messages'=> $messages,
            'session'=> $session,
        ]);
    }

    public function message_by_user_id($id){
        $messages = Chat::where('session_id',$id)->with('user')->get(); 
        return $messages;
    }


    public function send_message(Request $request){
        if(!$request->ajax()){
            abort(404);
        }
       $message = Chat::create([
           'message'=>$request->message,
           'from'=>auth()->user()->id,
           'to'=>$request->user_id,
           'session_id'=>$request->session_id,
           'type'=>0
       ]);
       broadcast(new MessageSend($message))->toOthers();
       return response()->json($message,201);
    }

    public function open_session(Request $request)
    {
        if(!$request->ajax()){
            abort(404);
        }
        $sessions = Session::where('from_id', auth()->user()->id)->get();
        $itfound = 0;
        if($request->to_id == auth()->user()->id)
            return response()->json(['status' => 'error', 'error' => 'You cant send to yourself message'], 422);
        foreach($sessions as $session)
        {
            if ($session->product_id == $request->product_id)
                $itfound = 1;  
        }
        if ($itfound)
             return response()->json(['status' => 'error', 'error' => 'Your send Message before to this seller You can Check your Messenger to found this conversation'], 422);
        $validation = Validator::make($request->all(),[
            'message' => 'required|min:3',
            'product_id' => 'required',
            'to_id' => 'required',
            'from_id' => 'required',
        ]);
        if  ($validation->fails())
        {
            return response()->json(['status' => 'error', 'errors' => $validation->errors()], 422);
        }
        $session = Session::create([
            'message' => $request->message,
            'from_id' => $request->from_id,
            'to_id' => $request->to_id,
            'product_id' => $request->product_id,
        ]);
        return response()->json($session,201);
    }
}
