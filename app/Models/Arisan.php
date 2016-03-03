<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Models\ArisanMix;

class Arisan extends Model
{
    protected $table = 'arisans';

    public $guarded = [];
    
    public function users()
    {
    	return $this->belongsToMany(User::class,'arisan_details')
    		->withPivot(['id']);
    }

    public function arisan_mix()
    {
    	return $this->hasMany(ArisanMix::class,'id');
    }

}
