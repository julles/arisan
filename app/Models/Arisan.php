<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;

class Arisan extends Model
{
    protected $table = 'arisans';

    public $guarded = [];
    
    public function users()
    {
    	return $this->belongsToMany(User::class,'arisan_details')
    		->withPivot(['urutan_pemenang']);
    }

}
