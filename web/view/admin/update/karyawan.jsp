<%-- 
    Document   : karyawan
    Created on : Apr 16, 2018, 11:51:31 AM
    Author     : Siti Khusnul Azifah
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Karyawan"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Karyawan</title>
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
                        <li><a href="index.html"><i class="fa fa-building-o"></i> <span>Home</span></a></li>
                        <li class="active treeview">
                            <a href="#">
                                <i class="fa fa-bookmark"></i> <span>Master</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="karyawanController"><i class="fa fa-user"></i> Karyawan</a></li>
                                <li><a href="jabatanController"><i class="fa fa-suitcase"></i> Jabatan</a></li>
                                <li><a href="cutiController"><i class="fa fa-clock-o"></i> Cuti</a></li>
                            </ul>
                        </li>
                        <li><a href="detailCutiController"><i class="fa fa-upload"></i> <span>Pengajuan Cuti</span></a></li>
                        <li><a href="setujuCutiController"><i class="fa fa-calendar"></i> <span>Persetujuan Cuti</span></a></li>
                        <li class="active treeview">
                            <a href="#">
                                <i class="fa fa-folder-open-o"></i> <span> Laporan</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="laporanPengajuanCutiController"><i class="fa fa-edit"></i> Pengajuan Cuti</a></li>
                                <li><a href="laporanPersetujuanCutiController"><i class="fa fa-envelope-o"></i> Persetujuan Cuti</a></li>
                            </ul>
                        </li>
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
                                <div class="box-header" style="margin: 15px 0 15px 0; font-size: 30px; text-align: center;">
                                    &nbsp; Form Data Karyawan
                                </div>
                                <!-- /.box-header -->

                                <div class="box-body" style="color: #3f3f3f;">
                                    <div class="col-sm-12 col-sm-offset-3">
                                        <form action="prosesUpdateKaryawan">
                                            <%
                                                Object datas = session.getAttribute("karyawanU");
                                                Karyawan k = (Karyawan) datas;

                                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                                String tanggallahir = dateFormat.format(k.getTanggalLahir());
                                                String tanggalmulai = dateFormat.format(k.getTglMulaiKerja());
                                            %>  
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="nik">NIK</label>
                                                    <input type="text" class="form-control" id="nik" placeholder="NIK" name="txtNIK" value="<%= k.getNik()%>" readonly="true" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="nama">Nama</label>
                                                    <input type="text" class="form-control" id="nama" placeholder="Nama" name="txtNama" value="<%= k.getNama()%>"" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="alamat">Alamat</label>
                                                    <input type="text" class="form-control" id="alamat" placeholder="Alamat" name="txtAlamat" value="<%= k.getAlamat()%>" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="agama">Agama</label>
                                                    <input type="text" class="form-control" id="agama" placeholder="Agama" name="txtAgama" value="<%= k.getAgama()%>" />
                                                </div>

                                                <div class="form-group">
                                                    <label for="jenisKelamin">Jenis Kelamin</label>
                                                    <div class="radio">
                                                        <%
                                                            if (k.getJenisKelamin().equals("Laki-Laki")) {
                                                        %>
                                                        <label><input type="radio" name="gender" value="Laki-Laki" checked="checked">Laki-laki</label> &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label><input type="radio" name="gender" value="Perempuan"> Perempuan</label>
                                                            <% } else { %>
                                                        <label><input type="radio" name="gender" value="Laki-Laki"> Laki-laki</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label><input type="radio" name="gender" value="Perempuan" checked="checked"> Perempuan</label>
                                                            <%
                                                                }
                                                            %>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="tanggalLahir"> Tanggal Lahir </label>
                                                        <input type="date" class="form-control" id="tanggalLahir" placeholder="Tanggal Lahir" name="txtTglLahir" value="<%= tanggallahir%>" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <input class="btn btn-primary" href="karyawanController" type="submit" value="Update" name =" btnUpdate"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="tanggalMulaiBekerja"> </label>
                                                <input type="hidden" class="form-control" id="tanggalMulaiBekerja" placeholder="Tanggal Mulai Bekerja" name="txtTglMulaiKerja" value="<%= tanggalmulai%>" />
                                            </div>
                                            <div class="form-group">
                                                <label for="sisa"> </label>
                                                <input type="hidden" class="form-control" id="sisa" placeholder="Sisa Cuti" name="txtSisaCuti" value="<%= k.getSisa()%>" />
                                            </div>
                                            <div class="form-group">
                                                <label for="sisa"> </label>
                                                <input type="hidden" class="form-control" id="sisa" placeholder="Sisa Cuti" name="txtJabatan" value="<%= k.getIdJabatan()%>" />
                                            </div>
                                            <div class="form-group">
                                                <label for="sisa"> </label>
                                                <input type="hidden" class="form-control" id="sisa" placeholder="Sisa Cuti" name="txtStatus" value="<%= k.getStatus()%>" />
                                            </div>
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

        </div>
        <!-- ./wrapper -->

        <!-- jQuery 3 -->
        <script src="bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!--             DataTables 
                 <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
                    <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
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
