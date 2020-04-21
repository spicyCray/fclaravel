<?php

namespace App\Http\Controllers;
use App\Http\Requests\Api\ClientRequest;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\response;
use Illuminate\Validation\validate;
class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $client = new \App\Models\Client();

        $list = $client::all();

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
        // $request->validate([
        //         'title' => 'bail|required|string|between:2,32',
        //         'url' => 'sometimes|url|max:200',
        //         'picture' => 'nullable|string'
        //     ]);
        $rules = [
            'title'=>'required|string|max:100|min:5',
            'content'=>'required|min:10'
        ];

        $message = [
            'title.required' => '标题不能为空'
        ];

        return $this->validate($request,$rules,$message);
        echo 'store';
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        $client = new \App\Models\Client();

        $list = $client::find($id);

        return $list;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update()
    {
        echo 'update';
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        echo 'destroy';
    }
}
