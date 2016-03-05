@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true,'id'=>'form-generate']) !!}
        
          <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	      	<?php /*
            
	        <div class="form-group">
              <label>Start Date</label>
              {!! Form::text('start_date',null,['class'=>'form-control','id'=>'datepicker','readonly'=>true]) !!}
            </div>

            <div class="form-group">
              <label>Due Date</label>
              {!! Form::text('due_date',null,['class'=>'form-control']) !!}
            </div>

            */ ?>

            <div class="form-group">
              <label>Group Name</label>
              {!! Form::text('name_group',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Deposit/Mont</label>
              {!! Form::text('deposit',null,['class'=>'form-control']) !!}
            </div>

            <hr/>

            <h3>Members</h3>

            <table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		                <th width="">Name</th>
		                <th width="">Username</th>
		                <th width="">Invite</th>
		                <th width="">Total Kepesertaan</th>
		            </tr>
		        </thead>
		        <tbody>
		        	@foreach($user as $row)

		        	<tr>
		        		<td>{{ $row->name }}</td>
		       			<td>{{ $row->username }}</td>
		       			<td><input type = 'checkbox' name = 'user_id[]' value = '{{ $row->id }}' /></td>
		       			<td><input type = 'text' name = 'total[]'  /></td>
		       	 	</tr>

		        	@endforeach
		        </tbody>
		    </table>

          </div><!-- /.box-body -->



          <div class="box-footer">
            <button class="btn btn-primary"  id  = 'generate'>Generate</button>
          </div>
        {!! Form::close() !!}
		
		</div>	  
	</div>
</div>
    

@endsection

@section('script')
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#table").DataTable();

			$("#generate").click(function(){
				swal({
				  title: "Arisan Generated",
				  text: "Please Wait",
				  imageUrl: "{{ og()->assetUrl.'loading.gif' }}"
				});
			});

		});
	</script>

@endsection