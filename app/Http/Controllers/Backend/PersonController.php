<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Person;
use App\Models\Country;
use App\Models\State;
use App\User;
use Table;
use Image;
use DB;

class PersonController extends CapsuleController
{
    public function __construct(Person $model,User $user,Country $country,State $state)
	{
		parent::__construct();

		$this->model = $model;
		$this->user = $user;
		$this->country = $country;
		$this->state = $state;
		view()->share('countries',$this->country->comboBox());	
	}

	public function getData()
	{
		$model = Crud::select('id','person_nik','person_name');

		$tables = Table::of($model)
			->addColumn('action',function($model){
					return og()->links($model->id , ['update','delete']);
    		})
			->make(true);

		return $tables;
	}

	public function getIndex()
	{
		return view('oblagio.person.index');
	}

	public function getCreate()
	{
		$model = $this->model;

		return view('oblagio.person._form',compact('model'));
	}

	public function postCreate(Request $request)
	{
		$this->validate($request,$this->model->rules());

		$inputs = $request->all();

		DB::beginTransaction();

		try
		{
			$user = $this->user->create([
				'role_id'	=> 3,
				'username'	=> $request->username,
				'password'	=> \Hash::make($request->password),
				'status'	=> 'y',
				'name'		=> $request->person_name,	
			]);

			$inputs['user_id'] = $user->id;

			$this->model->create($request->all());

			
			$inputs['person_birthday'] = \Carbon\Carbon::parse($request->person_birthday)->format("Y-m-d");

			$this->model->create($inputs);

			DB::commit();

			return og()->flashSuccess('Data has been saved!');
		}catch(\Exception $e){
			DB::rollback();

			return og()->flashInfo('Transaction Faild : '.$e->getMessage());
		}

			
	}

	
}
