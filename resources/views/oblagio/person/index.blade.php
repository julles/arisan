@extends('oblagio.layouts.layout')
@section('content')
<div class="row">
	<div class="col-md-12">
	  <div class="box">
	    <div class="box-body">
	    
	    {!! og()->linkCreate() !!}
	    
	      	<hr/>
	      	@include('oblagio.common.all_flashes')
	      	<table class="table table-bordered" id="table">
		        <thead>
		            <tr>
		                <th width="35%">Nik</th>
		                <th width="35%">Name</th>
		                <th width="30%">Action</th>
		            </tr>
		        </thead>
		    </table>
	    </div><!-- /.box-body -->
	  </div><!-- /.box -->

	  
	</div><!-- /.col -->
    
 </div>

@endsection

@section('script')

<script type="text/javascript">
	$(function() {
	$.fn.dataTable.ext.errMode = 'none';
    $('#table').DataTable({
        processing: true,
        serverSide: true,
        ajax: '{{og()->urlBackendAction("data")}}',
        columns: [
            { data: 'person_nik', name: 'person_nik' },
            { data: 'person_name', name: 'person_name' },
            { data: 'action', name: 'action',"searchable": false ,'orderable' : false },
        ]
    });
});
</script>

@endsection