@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		{!! Form::model($model,['files'=>true]) !!}
        
          <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	      
	        <div class="form-group">
              <label>Nik</label>
              {!! Form::text('person_nik',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Name</label>
              {!! Form::text('person_name',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Country</label>
              {!! Form::select('country',$countries,null,['class'=>'form-control','id'=>'country']) !!}
            </div>

            <div class="form-group">
              <label>State</label>
              {!! Form::select('state',[''=> 'Select State'],null,['class'=>'form-control','id'=>'state']) !!}
            </div>

            <div class="form-group">
              <label>Address</label>
              {!! Form::textarea('person_address',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Phone</label>
              {!! Form::text('person_phone',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Birthday</label>
              {!! Form::text('person_birthday',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Birthplace</label>
              {!! Form::text('person_birthplace',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Sex</label>
              {!! Form::select('person_sex',['m'=>'Male','f'=>'Female'],null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Marital</label>
              {!! Form::select('person_marital',['s'=>'Single','m'=>'Married'],null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Status</label>
              {!! Form::select('person_status',['1'=>'Active','0'=>'InActive'],null,['class'=>'form-control']) !!}
            </div>
            <div class="form-group">
              <label>Username</label>
              {!! Form::text('username',null,['class'=>'form-control']) !!}
	          </div>

	          <div class="form-group">
	              <label>Email</label>
	              {!! Form::text('email',null,['class'=>'form-control']) !!}
	          </div>

	          <div class="form-group">
	              <label>Password</label>
	              {!! Form::password('password',['class'=>'form-control']) !!}
	          </div>

	          <div class="form-group">
	              <label>Verify Password</label>
	              {!! Form::password('verify_password',['class'=>'form-control']) !!}
	          </div>
          </div><!-- /.box-body -->

          

          <div class="box-footer">
            <button class="btn btn-primary" type="submit">{{ ucfirst(request()->segment(3)) }}</button>
          </div>
        {!! Form::close() !!}
		
		</div>	  
	</div>
</div>
    
@endsection

@section('script')

  <script type="text/javascript">
    $(document).ready(function(){
      $("#country").on('change',function(){
        $.ajax({
          url : '{{ og()->urlBackendAction('state') }}',
          data : {
            countryId : $(this).val(),
          },
          success : function(data)
          {
            alert('oke');
          }
        });
      });
    });
  </script>

@endsection

