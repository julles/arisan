@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true,'id'=>'form']) !!}
        
          <div class="box-body">
	      
	        @include('oblagio.common.all_flashes')
	      
	        <h3>Daftar Peserta {{ $model->name_group }}</h3>

	        <h4>Pembayaran Arisan ke : {{ $lastPutaran + 1 }}</h4>

			<h5>Deposit : {{ Rp($model->deposit) }}</h5>
	        

			<hr/>

            <table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		                <th width="30%">Name</th>
		                <th width="30%">Username</th>
		                <th width="40%">Status</th>
		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($model->users as $row)

		        	<?php
		        		$find = $deposit->whereArisanDetailId($row->pivot->id)->wherePutaranKe($lastPutaran+1)->first();
		        		if(!empty($find))
		        		{
		        			$ceklis = 'checked';
		        		}else{
		        			$ceklis = '';
		        		}
		        	?>

		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
		       			<td><input {{ $ceklis }} type = 'checkbox' name = 'arisan_detail_id[]' value = '{{ $row->pivot->id }}' /></td>
		       	 	</tr>

		        	@endforeach
		        </tbody>
		    </table>

          </div><!-- /.box-body -->



          <div class="box-footer">
            <button class = 'btn btn-success' id = "cmd" type="button">Update</button>
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

			$("#cmd").on('click',function(){
				var ask = confirm("Are you sure to update this data ?");

				if(ask)
				{
					$("#form").submit();
				}
			});

		});

	</script>

@endsection