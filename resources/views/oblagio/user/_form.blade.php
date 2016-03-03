@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">

		{!! Form::model($model,['files'=>true]) !!}

          <div class="box-body">

	        @include('oblagio.common.error_validation')

            <div class="form-group">
              <label>Role</label>
              {!! Form::select('role_id',$roles,null,['class'=>'form-control']) !!}
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
              <label>Name</label>
              {!! Form::text('name',null,['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Avatar</label>
              {!! Form::file('avatar') !!}
              @if(!empty($model->avatar))
                <br/>Old Avatar<br/>
                <img src = "{{ og()->assetUrl.'contents/'.$model->avatar }}?dummy=8484744"/>
                <br/>
              @endif
            </div>

            <div class="form-group">
              <label>Password</label>
              {!! Form::password('password',['class'=>'form-control']) !!}
            </div>

            <div class="form-group">
              <label>Verify Password</label>
              {!! Form::password('verify_password',['class'=>'form-control']) !!}
            </div>

         

          <div class="form-group">
              <label>Nik</label>
              {!! Form::text('nik',null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Address</label>
              {!! Form::textarea('address',null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Postal Code</label>
              {!! Form::text('postal_code',null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Phone</label>
              {!! Form::text('phone',null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Birthday</label>
              {!! Form::text('birthday',null,['class'=>'form-control','id'=>'datepicker']) !!}
          </div>

          <div class="form-group">
              <label>Birthplace</label>
              {!! Form::text('birthplace',null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Sex</label>
              {!! Form::select('sex',['m'=>'Male','f'=>'Female'],null,['class'=>'form-control']) !!}
          </div>

          <div class="form-group">
              <label>Marital</label>
              {!! Form::select('marital',['s'=>'Single','m'=>'Married'],null,['class'=>'form-control']) !!}
          </div>


          <div class="form-group">
              <label>Job</label>
              {!! Form::text('job',null,['class'=>'form-control']) !!}
          </div>
           </div><!-- /.box-body -->
          <div class="box-footer">
            <button class="btn btn-primary" type="submit">{{ !empty($model->id) ? 'Update' : 'Create' }}</button>
          </div>
        {!! Form::close() !!}

		</div>
	</div>
</div>


@endsection
