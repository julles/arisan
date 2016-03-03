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
		                <th width="40%">Name Group</th>
		                <th width="40%">Deposit</th>
		                <th width="20%">Action</th>
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
            { data: 'name_group', name: 'name_group' },
            { data: 'deposit', name: 'deposit' },
            { data: 'action', name: 'action',"searchable": false ,'orderable' : false },
        ]
    });
});
</script>

@endsection