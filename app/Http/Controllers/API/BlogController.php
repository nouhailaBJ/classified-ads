<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Blog;
use App\Category;
use App\comment;
use App\User;
use Auth;
class BlogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Blog::latest()->paginate(12);
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
            'image' => 'required'
        ]);
        $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
        \Image::make($request->image)->save(public_path('uploads/blogs/').$name);
        return Blog::create([
            'title' => $request['title'],
            'tags' => $request['tags'],
            'status' => $request['status'],
            'description' => $request['description'],
            'image' => $name,
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
        $blog = Blog::findOrFail($id);
        if (!empty($blog))
        {
            $blog = Blog::where('id' , $blog->id)->where('status', 1)->first();
            $categories = Category::orderBy('id', 'desc')->where('parents', 0)->take(10)->get();
            $blogs = Blog::orderBy('id', 'desc')->where('status', 1)->take(6)->get();
            if(empty($blog))
                $check = 0;
            else
                $check = 1;
             return ['blog'=> $blog, 'check' => $check, 'categories' => $categories, 'blogs' => $blogs];
        }

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
        $blog = Blog::findOrFail($id);
        $request->validate([
            'title' => 'required|string|max:255',
            'tags' => 'required|string|max:255',
            'status' => 'required|numeric',
            'description' => 'required|string|min:9',
        ]);

        if(!empty($request->image))
        {
            $currentPhoto = $blog->image;
            if($request->image != $currentPhoto)
            {
                $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save(public_path('uploads/blogs/').$name);
                $request->merge(['image' => $name]);
    
                // for remove te curent picture 
                $Photo = public_path('uploads/blogs/').$currentPhoto;
                if(file_exists($Photo)){
                    @unlink($Photo);
                }
            }
        }
        $blog->update($request->all());
        return ['message' => 'update blog'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);
        $blog->delete();
        
        return ['message' => 'delete blog'];
    }

    public function search()
    {
        if ($search = \Request::get('q')) {
            $blogs = Blog::where(function($query) use ($search){
                $query->where('title','LIKE',"%$search%")
                        ->orWhere('description','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $blogs = Blog::latest()->paginate(5);
        }

        return $blogs;
    }

    public function comment(Request $request)
    {
        $request->validate([
            'comment' => 'required|string|max:255',
            'blog_id' => 'required',
        ]);
        return Comment::create([
            'comment' => $request['comment'],
            'blog_id' => $request['blog_id'],
            'user_id' => Auth('api')->user()->id,
        ]);
    }
    public function get_comment($id)
    {
        $blog = Blog::find($id);
        if (!empty($blog))
        {
            $comments = comment::where('blog_id', $blog->id)->get();
            foreach($comments as $comment)
            {
                $user = User::where('id', $comment->user_id)->first();
                if (!empty($user))
                    $comment['user'] = $user;
            }
            return ['comments'=> $comments];
        }
    }
}
