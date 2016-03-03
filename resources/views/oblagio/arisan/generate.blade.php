@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true]) !!}
        
          <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	      
	        <h3>Daftar Peserta</h3>

            <table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		                <th width="50%">Name</th>
		                <th width="50%">Username</th>
		               <?php /* <th width="20%">Bulan ke</th> */?>
		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($followers as $row)

		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
		       			<?php /*<td>{{ $row->pivot->urutan_pemenang }}</td> */?>
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