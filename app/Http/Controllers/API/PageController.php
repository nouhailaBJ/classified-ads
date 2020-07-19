<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Page;
class PageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Page::latest()->paginate(12);
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
            'title' => 'required|string|max:255',
            'tags' => 'required|string|max:255',
            'status' => 'required|numeric',
            'description' => 'required|string|min:9',
        ]);
        return Page::create([
            'title' => $request['title'],
            'tags' => $request['tags'],
            'status' => $request['status'],
            'description' => $request['description'],
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
        $page = Page::find($id);
        $page = Page::where('id' , $page->id)->where('status', 1)->first();
        if(empty($page))
            $check = 0;
        else
            $check = 1;
         return ['page'=> $page, 'check' => $check];
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
        $page = Page::findOrFail($id);
        $request->validate([
            'title' => 'required|string|max:255',
            'tags' => 'required|string|max:255',
            'status' => 'required|numeric',
            'description' => 'required|string|min:9',
        ]);
        $page->update($request->all());
        return ['message' => 'update page'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $page = Page::findOrFail($id);
        $page->delete();
        
        return ['message' => 'delete page'];
    }
    public function search()
    {
        if ($search = \Request::get('q')) {
            $page = Page::where(function($query) use ($search){
                $query->where('title','LIKE',"%$search%")
                        ->orWhere('description','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $page = Page::latest()->paginate(5);
        }

        return $page;
    }
}
