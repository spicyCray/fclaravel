<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Client extends Model
{
	use SoftDeletes;//配置软删除
	protected $fillable = ['name','content'];
	//获取器
    // public function getNameAttribute()
    // {

    // 	return '123';
    // }
    public function getSexAttribute($value)
    {

    	switch ($value) {
    		case 0:
    			return '男';
    			break;
    		case 1:
    			return '女';
    			break;
    		case 2:
    			return '未设置';
    			break;

    		default:
    			// code...
    			break;
    	}
    }
}
