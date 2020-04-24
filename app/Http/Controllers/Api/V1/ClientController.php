<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ClientRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\response;
use Illuminate\Validation\validate;
use App\Http\Middleware\ApiJwt;
use App\Models\User;
class ClientController extends Controller
{

    public function __construct()
    {
        $this->middleware(ApiJwt::class)->only('index');

        // $this->middleware('log')->only('index');

        // $this->middleware('subscribed')->except('store');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $client = new \App\Models\Client();

        $list = $client::withTrashed()->get();

        return $list;

    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        // echo "<pre>";
        //     print_r($request->post());
        // echo "</pre>";
        // die;

        $client = new \App\Models\Client();

        $client->name = $request->post('name');
        $client->content = $request->post('content');


        $client::create($request->post());
        echo 'store';
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id,$name)
    {
        $client = new \App\Models\Client();

        $res = $client::where('name','like','%'.$name.'%')->get();

        return $res;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $client = new \App\Models\Client();

        return $client::where('id',$request->all('id'))->update($request->all('name'));
        // $list = $client::where('id',);

        // return $list;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $client = new \App\Models\Client();

        $list = $client::destroy($id);

        return $list;
    }
}
