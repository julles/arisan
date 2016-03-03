<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Arisan;
use App\User;

class ArisanMix extends Model
{
    public $guarded = [];
    
    protected $table = 'arisan_mix';
    
    public function arisan()
    {
    	return $this->belongsTo(Arisan::class,'arisan_id');
    }

    public function pemenang()
    {
    	return $this->belongsTo(User::class,'pemenang');
    }

}
