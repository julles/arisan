<footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> Dev
        </div>
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="{{ og()->assetLte }}plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    

    <!-- Bootstrap 3.3.2 JS -->
    <script src="{{ og()->assetLte }}bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="{{ og()->assetLte }}plugins/slimScroll/jquery.slimScroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='{{ og()->assetLte }}plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="{{ og()->assetLte }}dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="{{ og()->assetLte }}dist/js/demo.js" type="text/javascript"></script>

    <script src="{{ og()->assetUrl }}sweetalert/dist/sweetalert.min.js"></script>



    @if(Session::has('warning'))
        <script type="text/javascript">
            swal({
                  title: "Warning",
                  text: "{{ Session::get('warning') }}",
                  type: "warning"
            });
        </script>
    @endif

    @if(Session::has('sweetsuccess'))
        <script type="text/javascript">
            swal({
                  title: "Success",
                  text: "{{ Session::get('sweetsuccess') }}",
                  type: "success"
            });
        </script>
    @endif

    <script type="text/javascript">
        $(function() {
          $( "#datepicker" ).datepicker({
                  changeMonth: true,
                  changeYear: true
          });
        });
    </script>

    <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>



    @yield('script')
  </body>
</html>
