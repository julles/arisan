<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Arisan;
use App\Models\ArisanDeposit;
use App\User;

class ArisanDetail extends Model
{	

	public $guarded = [];

	protected $table = 'arisan_details';
    
    public function arisan()
    {
    	return $this->belongsTo(Arisan::class);
    }

	public function user()
    {
    	return $this->belongsTo(User::class);
    }

    public function arisan_deposit()
    {
        return $this->hasMany(ArisanDeposit::class);
    }    
}
