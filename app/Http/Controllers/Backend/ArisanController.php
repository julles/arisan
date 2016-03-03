<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Backend\CapsuleController;
use App\Models\Arisan;
use App\Models\ArisanDetail;
use App\User;
use DB;
use Table;
class ArisanController extends CapsuleController
{
    public function __construct(Arisan $model,User $user,ArisanDetail $detail)
    {
    	parent::__construct();
    	$this->model = $model;
    	$this->user = $user;
    	$this->detail = $detail;
    }

    public function getData()
    {
    	$model = $this->model->select('id','start_date','due_date','deposit');

    	$tables = Table::of($model)
    		->addColumn('action',function($model){
    			return og()->links($model->id,[],['<a class = "btn btn-success" href = "'.og()->urlBackendAction('generate/'.$model->id).'">View</a>']);
    		})
    		->make(true);
    	
    	return $tables;
    }

    public function getIndex()
    {
    	return view('oblagio.arisan.index');
    }

    public function getCreate()
    {
    	$model = $this->model;
    	
    	$user = $this->user->where('role_id','!=',1)->get();

    	return view('oblagio.arisan._form',compact('model','user'));
    }

    public function postCreate(Request $request)
    {
    	//$this->validate($request);
    	DB::beginTransaction();
    	try
    	{
    		
    		$save = $this->model->create([
    			'start_date'	=> \Carbon\Carbon::parse($request->start_date)->format("Y-m-d"),
    			'due_date'		=> $request->due_date,
    			'deposit'		=> $request->deposit,
    		]);

    		$count = count($request->user_id);

    		
    		for($a=0;$a<$count;$a++)
			{
				if(!empty($request->user_id[$a]))
				{
					$detail = $this->detail->create([
						'arisan_id'			=> $save->id,
						'user_id'			=> $request->user_id[$a],
						'urutan_pemenang'	=> 0,
					]);
				}
    		}

    		$detail_updates = $this->detail->whereArisanId($save->id)->orderBy(DB::raw('RAND()'))->get();

    		$no = 0;
    		foreach($detail_updates as $r)
    		{
    			$no++;

    			$this->detail->find($r->id)->update(['urutan_pemenang' => $no]);
    		}

    		DB::commit();

    		return redirect(og()->urlBackendAction('generate/'.$save->id));

    	}catch(\Exception $e){
    		
    		DB::rollback();
    		return redirect()->back()->with('warning','Transaction Failed :'.$e->getMessage());
    	}
    }

    public function getGenerate($id)
    {
    	$model = $this->model->find($id);

    	$followers = $model->users()->orderBy('urutan_pemenang','asc')->get();

    	return view('oblagio.arisan.generate',compact('model','followers'));
    }
}
