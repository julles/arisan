<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;

class Person extends Model
{
    protected $table = 'person';

    public $guarded = ['username','password','verify_password','email'];

    public function user()
    {
    	return $this->belongsTo(User::class,'user_id');
    }

    public function rules($id="",$userId="")
    {
    	if(!empty($id))
    	{
    		$unique = ",person_nik,".$id;
    		$email = ",email,".$id;
    		$username = ",username,".$id;
    	}else{
    		$unique = "";
    		$email = "";
    		$username = "";
    	}

    	return [
    		'person_nik'	=>	'required|unique:person'.$unique,
    		'person_name'	=> 'required',
    		'email'			=> 'required|unique:users'.$email,
    		'username'		=> 'required|unique:users'.$username,
    		'password'		=> 'required',
    		'verify_password' => 'required|same:password',
    	];
    }
}
