@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true,'id'=>'form']) !!}
        
           <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	         @include('oblagio.common.all_flashes')
	      
	        <h3>Daftar Peserta Pengocokan</h3>

            <table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		               <th width="">Name</th>
		               <th width="">Username</th>
		               <th width="">Nomor Urut</th>
		               
		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($followers as $row)
		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
		       			<td>
			       			<?php
			       			$detailna = $detail->whereArisanId($row->pivot->arisan_id)->whereRaw("flag_win = 'n'")->whereUserId($row->pivot->user_id);
			       				$str = "";
			       				foreach($detailna->get() as $r)
			       				{
			       					$str.=$r->urutan_pemenang.',';
			       				}
			       				echo substr($str ,0,-1);
			       			?>
		       			</td>
		       	 	</tr>

		        	@endforeach
		        </tbody>
		    </table>

          </div><!-- /.box-body -->



          <div class="box-footer">
            <button class = 'btn btn-success' id = "cmd" type="button">Mix</button>
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
				var ask = confirm("Are you sure to mix this data ?");

				if(ask)
				{
					swal({
					  title: "Arisan Generated",
					  text: "Please Wait",
					  imageUrl: "{{ og()->assetUrl.'loading.gif' }}",
					  showConfirmButton: false
					});
					setTimeout(submitForm, 4000);
				}
			});

				
			

		});

		function submitForm()
		{
			$("#form").submit();
		}

	</script>

@endsection