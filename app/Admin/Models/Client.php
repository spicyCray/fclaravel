<?php

namespace App\admin\Models;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{

    //
    protected function create()
    {
    	echo "<pre>";
    		print_r('123123');
    	echo "</pre>";
    	die;
    }
}
