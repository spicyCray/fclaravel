<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class ClientRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return [
        //     'name'=>'required',
        //     'image'=>'required',
        //     'age'=>'required',
        //     'sex'=>'required',
        // ];
       return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'=>'required',
            'image'=>'required',
            'age'=>'required',
            'sex'=>'required',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => '标题字段不能为空',
            'image.string' => '标题字段仅支持字符串',
            'age.between' => '标题长度必须介于2-32之间',
            'sex.url' => 'URL格式不正确，请输入有效的URL'
        ];
    }

    // protected function failedValidation(Validator $validator)
    // {
    //     $error= $validator->errors()->all();
    //     throw new HttpResponseException($this->fail(400, $error));
    // }

    // protected function fail(int $code, array $errors) : JsonResponse
    // {
    //     return response()->json(
    //         [
    //             'code' => $code,
    //             'errors' => $errors,
    //         ]
    //     );
    // }
}
