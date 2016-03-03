<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Backend\CapsuleController;
use App\Models\Arisan;
use App\Models\ArisanDetail;
use App\Models\ArisanDeposit;
use App\Models\ArisanMix;
use App\User;
use DB;
use Table;

class ArisanController extends CapsuleController
{
    public function __construct(Arisan $model,User $user,ArisanDetail $detail,ArisanDeposit $deposit,ArisanMix $mix)
    {
    	parent::__construct();
    	$this->model = $model;
    	$this->user = $user;
    	$this->detail = $detail;
        $this->deposit = $deposit;
        $this->mix = $mix;
    }

    public function getData()
    {
    	$model = $this->model->select('id','name_group','due_date','deposit');

    	$tables = Table::of($model)
    		->addColumn('action',function($model){

                $view = '<a class = "btn btn-success" href = "'.og()->urlBackendAction('generate/'.$model->id).'">View</a>&nbsp;';
                $pay = '<a class = "btn btn-warning" href = "'.og()->urlBackendAction('pay/'.$model->id).'">Pay</a>&nbsp;';
                $mix = '<a class = "btn btn-primary" href = "'.og()->urlBackendAction('mix/'.$model->id).'">Mix</a>';

    			return og()->links($model->id,[],[$view,$pay,$mix]);
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
    			//'start_date'	=> \Carbon\Carbon::parse($request->start_date)->format("Y-m-d"),
    			//'due_date'		=> $request->due_date,
    			'name_group'     => $request->name_group,
                'deposit'		 => $request->deposit,
                'updated_by'     => \Auth::user()->id,
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

    public function getPay($id)
    {
        $model = $this->model->findOrFail($id);
        
        $deposit = $this->deposit;

        $lastPutaran =  $model->arisan_mix->count();
        
        return view('oblagio.arisan.pay',compact('model','lastPutaran','deposit'));
    }

    public function postPay(Request $request,$id)
    {
        $model = $this->model->findOrFail($id);
        
        $lastPutaran =  $model->arisan_mix->count();
        
        DB::beginTransaction();

        try
        {
            foreach($model->users as $row)
            {
                $delete = $this->deposit->whereArisanDetailId($row->pivot->id)->delete();
            }

            $count = count($request->arisan_detail_id);
            for($a=0;$a<$count;$a++)
            {
                if(!empty($request->arisan_detail_id[$a]))
                {
                    $this->deposit->create([
                        'arisan_detail_id'  => $request->arisan_detail_id[$a],
                        'putaran_ke'        => $lastPutaran + 1,
                    ]);
                }
            }

            DB::commit();

            return redirect()->back()->withSuccess('Data has been updated');
        }catch(\Exception $e){
            DB::rollback();
            return redirect()->back()->withInfo('Transaction Failed : '.$e->getMessage());
        }
    }

    public function getMix($id)
    {
        $model = $this->model->findOrFail($id);
        
        $mix = $this->mix;

        $lastPutaran =  $model->arisan_mix->count();
        
        return view('oblagio.arisan.mix',compact('model','lastPutaran','mix'));
    }

    public function postMix($id)
    {
        $model = $this->model->findOrFail($id);
        $lastPutaran =  $model->arisan_mix->count() + 1;
        $rand = $model->users()->orderBy(DB::raw('RAND()'))->first();

        $win = $this->mix->create([
            'arisan_id'     => $model->id,
            'putaran_ke'    => $lastPutaran,
            'pemenang'      => $rand->id,
        ]);

        return redirect(og()->urlBackendAction('win/'.$win->id));

    }

    public function getWin($id)
    {
        echo "Selamat";
    }
}
