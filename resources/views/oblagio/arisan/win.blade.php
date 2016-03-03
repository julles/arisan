@extends('oblagio.layouts.layout')
@section('content')
<?php
$user = App\User::find($model->pemenang);
?>
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
		
		  <div class="box-body">
	      
	        @include('oblagio.common.error_validation')
	      
	        <div class="form-group">
              <h3>Selamat kepada <b>{{ $user->name }}</b> yang memenangkan arisan pada putaran ke {{ $model->putaran_ke }}</h3>
              <br/>

              <img src="{{ og()->assetUrl.'contents/'.$user->avatar }}">

            </div>

          </div><!-- /.box-body -->

        </div>	  
	</div>
</div>
    

@endsection

