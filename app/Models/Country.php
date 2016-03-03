<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\State;
class Country extends Model
{
    protected $table = 'country';

    public function comboBox()
    {
    	return $this->lists('name_country','code_country')->toArray();
    }

    public function states()
    {
    	return $this->hasMany(State::class,'code_country');
    }
}
