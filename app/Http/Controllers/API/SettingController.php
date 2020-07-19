<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Setting;
use Redirect;
class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Setting::all()->toArray();
        return response()->json(['status' =>'success' , 'data' => $data ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Setting $siteSetting)
    {
        foreach(array_except($request->toArray(), ['_token' , 'submit']) as $key => $req ){
            $siteSettingUpdate = $siteSetting->where('namesetting', $key)->get()[0];
            $siteSettingUpdate->fill(['value' => $req])->save();
           }
           return response()->json(['status' =>'success' ]);
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
        $setting = Setting::findOrFail($id);
        $setting->update(['value' => $request->value]);
        return ['message' => 'update'];
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

    public function getsetting($namesetting)
    {
        return \App\Setting::where('namesetting' , $namesetting)->get()[0]->value;
    }

}
