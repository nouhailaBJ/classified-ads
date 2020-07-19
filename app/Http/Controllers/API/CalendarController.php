<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Calendar;
use Validator;
use App\Http\Resources\CalendarResource;

class CalendarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CalendarResource::collection(Calendar::all());
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
            'event_name' => 'required|string|max:255',
            'start_date' => 'required|date|before:end_date',
            'end_date' => 'required|date',
        ]);
        if  ($validation->fails())
        {
            return response()->json(['status' => 'error', 'errors' => $validation->errors()], 422);
        }
        return Calendar::create([
            'event_name' => $request['event_name'],
            'start_date' => $request['start_date'],
            'end_date' => $request['end_date']
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
        $calendar = Calendar::findOrFail($id);

        $validation = Validator::make($request->all(),[
            'event_name' => 'required|string|max:255',
            'start_date' => 'required|date|before:end_date',
            'end_date' => 'required|date',
        ]);
        if  ($validation->fails())
        {
            return response()->json(['status' => 'error', 'errors' => $validation->errors()], 422);
        }

        $calendar->update($request->all());

        return ['message' => 'update calendar'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $calendar = Calendar::findOrFail($id);
        $calendar->delete();
        
        return ['message' => 'delete calendar'];
    }
}
