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
		                <th width="30%">Start Date</th>
		                <th width="20%">Due Date</th>
		                <th width="20%">Deposit</th>
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
            { data: 'start_date', name: 'start_date' },
            { data: 'due_date', name: 'due_date'},
            { data: 'deposit', name: 'deposit' },
            { data: 'action', name: 'action',"searchable": false ,'orderable' : false },
        ]
    });
});
</script>

@endsection