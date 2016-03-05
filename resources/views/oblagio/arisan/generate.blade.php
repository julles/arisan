@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true]) !!}
        
          <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	         @include('oblagio.common.all_flashes')
	      
	        <h3>Daftar Peserta</h3>

            <table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		               <th width="">Name</th>
		               <th width="">Username</th>
		               <th width="">Nomor Urut</th>
		               <th width="">Total Pembayaran 1 bulan</th>

		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($followers as $row)
		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
		       			<td>
			       			<?php
			       			$detailna = $detail->whereArisanId($row->pivot->arisan_id)->whereUserId($row->pivot->user_id);
			       				$str = "";
			       				foreach($detailna->get() as $r)
			       				{
			       					$str.=$r->urutan_pemenang.',';
			       				}
			       				echo substr($str ,0,-1);
			       			?>
		       			</td>
		       			<td>{{ Rp($model->deposit * $detailna->count()) }}</td> 
		       	 	</tr>

		        	@endforeach
		        </tbody>
		    </table>

          </div><!-- /.box-body -->



          <div class="box-footer">
            <a class="btn btn-success" href = "{{ og()->urlBackendAction('index') }}">Finish</a>
          </div>
        {!! Form::close() !!}
		
		</div>	  
	</div>
</div>
    

@endsection

@section('script')
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			$("#table").DataTable({
				ordering:false, 
			});
		});

	</script>

@endsection