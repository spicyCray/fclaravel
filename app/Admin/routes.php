<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');

    $router->resource('client', ClientController::class);

    // $router->get('client', 'ClientController@index')->name('admin.client');

    // $router->get('client/{id}', 'ClientController@detail')->name('admin.client.detail');

    // $router->get('client/{id}/edit', 'ClientController@detail')->name('admin.client.edit');
});

