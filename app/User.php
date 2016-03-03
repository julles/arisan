<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Models\Role;
use App\Models\User;

class User extends Authenticatable
{
    public $guarded = ['verify_password'];

    public function role()
    {
        return $this->belongsTo(Role::class,'role_id');
    }

    public function rules($id="")
    {

    	if(!empty($id))
    	{
    		$uniqueUsername = ',username,'.$id;
    		$uniqueEmail = ',email,'.$id;
            $uniqueNik = ',nik,'.$id;
    	}else{
    		$uniqueUsername = "";
    		$uniqueEmail = "";
            $uniqueNik = "";
    	}

    	return [
    		'name'				=>	'required',
    		'username'			=>	'required|unique:users'.$uniqueUsername,
    		'email'				=>	'required|email|unique:users'.$uniqueEmail,
    		'role_id'			=>	'required',
    		'password'			=>	'required|min:5',
    		'verify_password' 	=>	'same:password',
            'nik'               =>  'required|unique:users'.$uniqueNik
    	];
    }

    public function getUser()
    {
        return \Auth::user();
    }

    public function person()
    {
        return $this->hasOne(App\Models\Person::class,'id');
    }

    public function arisans()
    {
        return $this->belongsToMany(Arisan::class,'arisan_details');
    }
}
