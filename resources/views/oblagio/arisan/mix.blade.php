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
		                <th width="50%">Name</th>
		                <th width="50%">Username</th>
		                
		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($model->users as $row)

		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
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