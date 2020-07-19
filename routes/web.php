<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
//Route::get('/signin', 'IndexController@signin')->middleware('guest');

/* Dashboard Index */
Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'admin']], function () {
    Route::get('{path?}', 'HomeController@dashboard')->where('path', '[\/\w\.-]*');
 });

 Route::get('{path?}', 'IndexController@index')->where('path', '[\/\w\.-]*');
 