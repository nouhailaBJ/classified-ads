@extends('layouts.layout')

@section('content')
<?php 
    $categories = App\Category::where('parents', 0)->get();
    foreach($categories as $category)
    {
        $sub_cat = App\Category::where('parents', $category->id)->get(); 
        $category['sub_cat'] = $sub_cat;
    }
    $pages = App\Page::where('status', 1)->get();
?>
<not-found></not-found>
@endsection