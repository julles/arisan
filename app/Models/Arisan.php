<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Models\ArisanMix;
use App\Models\ArisanDetail;

class Arisan extends Model
{
    protected $table = 'arisans';

    public $guarded = [];
    
    public function users()
    {
    	return $this->belongsToMany(User::class,'arisan_details')
    		->withPivot(['id','arisan_id','urutan_pemenang','user_id','flag_win']);
    }

    public function arisan_mix()
    {
    	return $this->hasMany(ArisanMix::class,'id');
    }

    public function arisan_details()
    {
        return $this->hasMany(ArisanDetail::class,'id');
    }

}
