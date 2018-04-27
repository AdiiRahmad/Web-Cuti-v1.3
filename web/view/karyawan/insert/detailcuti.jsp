<%-- 
    Document   : pengajuancuti
    Created on : Apr 16, 2018, 4:36:39 PM
    Author     : Siti Khusnul Azifah
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Cuti"%>
<%@page import="entities.Karyawan"%>
<%@page import="java.util.List"%>
<%@page import="entities.DetailCuti"%>
<%@page import="dao.DetailCutiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pengajuan Cuti</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link href="css/style.css" rel="stylesheet" />

        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="bootstrap/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="bootstrap/bower_components/Ionicons/css/ionicons.min.css">
        <!-- DataTables -->
        <!--<link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">-->
        <!-- Theme style -->
        <link rel="stylesheet" href="bootstrap/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="bootstrap/dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <!--Morris chart--> 
        <link rel="stylesheet" href="bootstrap/bower_components/morris.js/morris.css">
        <!--jvectormap--> 
        <link rel="stylesheet" href="bootstrap/bower_components/jvectormap/jquery-jvectormap.css">
        <!--Date Picker--> 
        <link rel="stylesheet" href="bootstrap/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
        <!--Daterange picker--> 
        <link rel="stylesheet" href="bootstrap/bower_components/bootstrap-daterangepicker/daterangepicker.css">
        <!--bootstrap wysihtml5 - text editor--> 
        <link rel="stylesheet" href="bootstrap/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <header class="main-header">
                <!-- Logo -->
                <a href="index2.html" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini" style="font-size: 12px;"><b>E-Cuti</b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg" style="font-size: 30px;"><b>E-Cuti</b></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>

                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav" style="margin: 12px 40px 0 0; font-size: 16px;">
                            <a href="logoutController" style="color: white;">Logout</a>
                        </ul>
                    </div>
                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li><a href="indexkaryawan.html"><i class="fa fa-building-o"></i> <span>Home</span></a></li>
                        <li><a href="detailCutiControllerKar"><i class="fa fa-upload"></i> <span>Pengajuan Cuti</span></a></li>
                        <li><a href="/view/laporan/LaporanPerorangan.jsp"><i class="fa fa-upload"></i> <span>Download Laporan</span></a></li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="box">
                                <div class="box-header" style="margin: 15px 0 15px -60px; font-size: 30px; text-align: center;">
                                    Form Pengajuan Cuti
                                </div>
                                <!-- /.box-header -->

                                <div class="box-body" style="color: #3f3f3f;">
                                    <% if (session.getAttribute("pesanI") != null) { %>
                                    <div class="alert alert-success alert-dismissible" role="alert">
                                        <%  out.print(session.getAttribute("pesanI") + "<br>");
                                            session.removeAttribute("pesanI");
                                        %>
                                    </div>    
                                    <% } %>
                                    <div class="col-sm-12 col-sm-offset-4">
                                        <%
                                            String autoid = (String) session.getAttribute("autoID");

                                            List<Object> datas1 = (List<Object>) session.
                                                    getAttribute("KaryawanList");

                                            List<Object> datas2 = (List<Object>) session.
                                                    getAttribute("CutiList");

                                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                            Date now = new Date();
                                            String tanggalmulai = dateFormat.format(now);
                                        %>

                                        <form action="detailCutiIPim">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="idDetailCuti">ID Detail Cuti</label>
                                                    <% if (autoid.equals("D")) {
                                                    %><input type="text" class="form-control" id="idDetailCuti" name="txtIDDetailCuti" value="<%= autoid%>001" placeholder="ID Detail Cuti" readonly="true" /><%
                                                    } else {%>
                                                    <input type="text" class="form-control" id="idDetailCuti" name="txtIDDetailCuti" value="<%= autoid%>" placeholder="ID Detail Cuti" readonly="true" />
                                                    <%}%>

                                                </div>
                                                <div class="form-group">
                                                    <label for="nik">NIK</label>
                                                    <select name="txtNik" class="form-control">
                                                        <% for (Object data : datas1) {
                                                                Karyawan k = (Karyawan) data;
                                                        %>
                                                        <option value="<%= k.getNik()%>"><%=k.getNik() + " - " + k.getNama()%></option> 
                                                        <%}
                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="jenisCuti">Jenis Cuti</label>
                                                    <select name="txtJenisCuti"  class="form-control">
                                                        <% for (Object data : datas2) {
                                                                Cuti cu = (Cuti) data;
                                                        %>
                                                        <option value="<%= cu.getIdCuti()%>"><%=cu.getJenisCuti()%></option> 
                                                        <%}
                                                        %>
                                                    </select>
                                                </div>

                                                <!--                <div class="form-group">
                                                                    <label for="keterangan">Durasi</label>
                                                                    <input type="text" class="form-control" id="durasi" name="txtDurasi" 
                                                                           value="" placeholder="Durasi Cuti" />
                                                
                                                                </div>-->
                                                <div class="form-group">
                                                    <label for="keterangan">Keterangan</label>
                                                    <input type="text" class="form-control" id="keterangan" name="txtKeteranganCuti" value="" placeholder="Keterangan" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="tanggalMulai">Tanggal Mulai</label>
                                                    <input type="date" class="form-control" id="tanggalMulai" name="txtTanggalMulai" value="<%= tanggalmulai%>" placeholder="Tanggal Mulai" />
                                                </div>
                                                <input class="btn btn-primary" style="color: white;" type="submit" value="Simpan" name="btnTambah"/><br><br><br>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- /.box -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <!--<b>Version</b> 2.4.0-->
                </div>
                Copyright &copy; 2018 Bootcamp MII Batch 15,&nbsp;All rights reserved.
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                    <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                </ul>

            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
                 immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>

        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
        <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!--             DataTables 
                    <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
                    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>-->
        <!-- FastClick -->
        <script src="bootstrap/bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="bootstrap/dist/js/adminlte.min.js"></script>
        <!-- Sparkline -->
        <script src="bootstrap/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
        <!-- jvectormap  -->
        <script src="bootstrap/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="bootstrap/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- SlimScroll -->
        <script src="bootstrap/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- ChartJS -->
        <script src="bootstrap/bower_components/chart.js/Chart.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="bootstrap/dist/js/pages/dashboard2.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="bootstrap/dist/js/demo.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- AdminLTE App -->
        <script src="bootstrap/dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="bootstrap/dist/js/demo.js"></script>

        <script>
$(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
        'paging': true,
        'lengthChange': false,
        'searching': false,
        'ordering': true,
        'info': true,
        'autoWidth': false
    })
})
        </script>
    </body>
</html>
