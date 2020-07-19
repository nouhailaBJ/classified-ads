<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources([
    'user' => 'API\UserController',
    'product' => 'API\ProductController',
    'category' => 'API\CategoryController',
    'media' => 'API\MediaController',
    'todo' => 'API\TodoController',
    'blog' => 'API\BlogController',
    'page' => 'API\PageController',
    'calendar' => 'API\CalendarController',
    'message' => 'API\MessageController',
    'setting' => 'API\SettingController',
    'dashboard' => 'API\DashboardController',
    'profile' => 'API\ProfileController',
    'announces' => 'API\AnnounceController',
    'location' => 'API\LocationController',
]); 

Route::get('/findUser', 'API\UserController@search');
Route::get('/findProduct', 'API\ProductController@search');
Route::get('/findCategory', 'API\CategoryController@search');
Route::get('/findBlog', 'API\BlogController@search');
Route::get('/findPage', 'API\PageController@search');
Route::get('/findMessage', 'API\MessageController@search');
Route::get('/findLocation', 'API\LocationController@search');
Route::get('/getsetting/{setting}', 'API\SettingController@getsetting');


Route::get('/cat_product', 'API\CategoryController@cat_product');
Route::get('/sub_cat/{id}', 'API\CategoryController@sub_cat');
Route::post('/upload', 'API\ProductController@upload');
Route::get('/pro_image/{id}', 'API\ProductController@pro_image');
Route::post('/pro_image', 'API\ProductController@upload_image');
Route::delete('/delete_image/{id}', 'API\ProductController@delete_image');
Route::get('/todo/status/{id}/{status}', 'API\TodoController@status');
Route::get('/message/status/{id}', 'API\MessageController@status');


//  site route api
Route::get('/welcome', 'API\SiteController@index');
Route::post('/contact/message', 'API\MessageController@store');
Route::get('/site/blog/{id}', 'API\BlogController@show');
Route::get('/site/page/{id}', 'API\PageController@show');

Route::get('/comment/{id}', 'API\BlogController@get_comment');
Route::post('/comment', 'API\BlogController@comment');

Route::get('/userList', 'API\ChatController@user_list');
Route::get('/userMessage/{id}', 'API\ChatController@user_message');
Route::post('/sendmessage', 'API\ChatController@send_message');

Route::post('/open_session', 'API\ChatController@open_session');

Route::get('/cat_product/{id}', 'API\CategoryController@get_category');
Route::get('/location', 'API\LocationController@location');

Route::get('/search', 'API\ProductController@find_search');
