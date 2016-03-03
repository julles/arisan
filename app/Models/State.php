<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Country;

class State extends Model
{
    protected $table = 'state';

    public function country()
    {
    	return $this->hasMany(Country::class,'country_id');
    }

    public function comboState($codeCountry)
    {
    	return $this->whereCodeCountry($codeCountry)->lists('name_state','code_country');
    }
}
