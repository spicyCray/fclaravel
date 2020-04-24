<?php

use Illuminate\Http\Request;
use App\Http\Middleware\ApiJwt;
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
// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
// Route::apiResource('client', 'ClientController');

// Route::apiResource('client', 'Api\ClientController');
// Route::group(['prefix' => 'v1', 'namespace' => 'V1', 'middleware' => 'auth.api'], function () {
//     Route::prefix('auth')->group(function () {
//         Route::post('login', 'AuthController@login');
//         Route::post('register', 'AuthController@register');
//         Route::post('logout', 'AuthController@logout');
//         Route::post('refresh', 'AuthController@refresh');
//         Route::post('user', 'AuthController@user');
//     });
//     Route::post('sendSms', 'PublicController@sendSms')->name('sendSms');
//     Route::get('init', 'PublicController@init');
// });
// ,'middleware'=>'auth.jwt'
Route::group(['prefix'=>'v1','namespace'=>'Api\v1'],function () {
	Route::apiResource('photo', 'PhotoController')->middleware(ApiJwt::class);
	// Route::apiResource('client', 'ClientController')->middleware(ApiJwt::class);
	Route::get('client','ClientController@index')->name('client.index');//查询
	Route::get('client/{id}/name/{name}','ClientController@show')->name('client.show');//查询
	Route::post('client','ClientController@store')->name('client.store');//新增
	Route::put('client','ClientController@update')->name('client.update');//更新
	Route::delete('client/{id}','ClientController@destroy')->name('client.destroy');//删除
});

