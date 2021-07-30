<%-- 
    Document   : view-roomtypes
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Room Type</title>
        
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/fontawesome-free/css/all.min.css"/>">
        <!-- DataTables -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>">
        <!-- Theme style -->
        <link rel="stylesheet" href="<c:url value="/resources-management/dist/css/adminlte.min.css"/>">
        
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <jsp:include page="../include/management/menu-page.jsp" />
        <jsp:include page="../include/management/sidebar-container-page.jsp" />
        
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>View All Room Type</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/manager/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">View All Room Type</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <c:if test="${type != null && type == 'error'}">
                                <div class="alert alert-danger">
                                    ${message}
                                </div>
                            </c:if>
                            <c:if test="${type != null && type == 'success'}">
                                <div class="alert alert-success">
                                    ${message}
                                </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">View all room types</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Create Date</th>
                                                <th>Images</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${roomtypes != null && fn:length(roomtypes) > 0}">
                                                <c:forEach items="${roomtypes}" var="roomtype">
                                                    <tr>
                                                        <td>${roomtype.name}</td>
                                                        <td>${roomtype.status}</td>
                                                        <td>${roomtype.createDate}</td>
                                                        <td>
                                                            <img src="<c:url value="../resources-management/images/${roomtype.images[0].name}"/>"  WIDTH="100" HEIGHT="100" style="border:1px solid black""/>
                                                            <%-- 
                                                            <c:forEach items="${product.images}" var="image">
                                                                <img src="<c:url value="resources/images/${image.name}"/>"  WIDTH="100" HEIGHT="100" style="border:1px solid black""/>
                                                            </c:forEach>
                                                            --%>
                                                        </td>

                                                        <td>
<!--                                                            <button class="btn btn-info"
                                                                    onclick="location.href = '<c:url value="/manager/roomtype-edit/${roomtype.id}" />'">Edit</button>-->
                                                            <a class="btn btn-info btn-sm" href="<c:url value="/manager/roomtype-edit/${roomtype.id}" />">
                                                                <i class="fas fa-pencil-alt">
                                                                </i>
                                                                Edit
                                                            </a>
<!--                                                            <button class="btn btn-danger"
                                                                    onclick="location.href = '<c:url value="/manager/roomtype-delete/${roomtype.id}" />'">Delete</button>-->
                                                            <a class="btn btn-danger btn-sm" href="<c:url value="/manager/roomtype-delete/${roomtype.id}" />">
                                                                <i class="fas fa-trash">
                                                                </i>
                                                                Delete
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${roomtypes == null || fn:length(roomtypes) <= 0}">
                                                 <tr><td colspan="12" style="color: red">No Value!!!</td></tr>
                                            </c:if>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Create Date</th>
                                            <th>Images</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>     
        <jsp:include page="../include/management/footer-page.jsp" />

        <!-- jQuery -->
        <script src="<c:url value="/resources-management/plugins/jquery/jquery.min.js"/>"></script>
        <!-- Bootstrap 4 -->
        <script src="<c:url value="/resources-management/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <!-- DataTables  & Plugins -->
        <script src="<c:url value="/resources-management/plugins/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-responsive/js/dataTables.responsive.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/dataTables.buttons.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/jszip/jszip.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/pdfmake/pdfmake.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/pdfmake/vfs_fonts.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.html5.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.print.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.colVis.min.js"/>"></script>
        <!-- AdminLTE App -->
        <script src="<c:url value="/resources-management/dist/js/adminlte.min.js"/>"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="<c:url value="/resources-management/dist/js/demo.js"/>"></script>
        <!-- Page specific script -->
        <script>
          $(function () {
            $("#example1").DataTable({
              "responsive": true, "lengthChange": false, "autoWidth": true,
              "order": [[ 2, "desc" ]],
              "buttons": ["csv", "excel", "pdf"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
          });
        </script>
    </body>
</html>
