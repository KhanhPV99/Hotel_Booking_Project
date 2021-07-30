<%-- 
    Document   : customer-view
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Customers</title>
        
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
                            <h1>View All Customers</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/receptionist/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">View All Customers</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <c:if test="${action != null && action == 'add'}">
                                <a href="<c:url value="/receptionist/booking-detail-add/${bookingId}"/>" class="btn btn-secondary">Back</a>
                            </c:if>
                            <c:if test="${action != null && action == 'edit'}">
                                <a href="<c:url value="/receptionist/booking-edit/${bookingId}"/>" class="btn btn-secondary">Back</a>
                            </c:if>
                            <a href="<c:url value="/receptionist/customer-add/${bookingId}/${bookingDetailId}"/>" class="btn btn-success float-right">Add New Customer</a>
                        </div>
                    </div>
                </div>
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
                    <div class="col-md-3">
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">General</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="inputRoomNum">Room Number</label>
                                    <input type="text" id="inputRoomNum" class="form-control" value="${bookingDetail.room.roomNumber}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputRoomType">Room Type</label>
                                    <input type="text" id="inputRoomType" class="form-control" value="${bookingDetail.room.roomType.name}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputNumOfBed">Number of bed</label>
                                    <input type="number" id="inputNumOfBed" class="form-control" value="${bookingDetail.room.numberOfBed}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputSize">Size</label>
                                    <input type="text" id="inputSize" class="form-control" value="${bookingDetail.room.roomType.sizeRoom}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputMaxGuests">Max of guests</label>
                                    <input type="number" id="inputMaxGuests" class="form-control" value="${bookingDetail.room.roomType.guests}" disabled>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    <!-- /.card -->
                    </div>
                    <div class="col-md-9">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">View all customers in room booking</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th> #</th>
                                            <th>Email</th>
                                            <th>Full Name</th>
                                            <th>ID Card</th>
                                            <th>Gender</th>
                                            <th>Birth Date</th>
                                            <th>Create Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${guests != null && fn:length(guests) > 0}">
                                            <c:forEach items="${guests}" var="guest" varStatus="sta">
                                                <tr>
                                                    <td>${sta.count}</td>
                                                    <td>${guest.email}</td>
                                                    <td>${guest.fullName}</td>
                                                    <td>${guest.idCard}</td>
                                                    <td>${guest.gender}</td>
                                                    <td>${guest.birthDate}</td>
                                                    <td>${guest.createDate}</td>
                                                    <td>
                                                        <a class="btn btn-info btn-sm" href="<c:url value="/receptionist/customer-edit/${bookingId}/${bookingDetailId}/${guest.id}" />">
                                                            <i class="fas fa-pencil-alt">
                                                            </i>
                                                            Edit
                                                        </a>
                                                        <a class="btn btn-danger btn-sm" href="<c:url value="/receptionist/customer-remove/${action}/${bookingId}/${bookingDetailId}/${guest.id}" />">
                                                            <i class="fas fa-trash">
                                                            </i>
                                                            Remove
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${guests == null || fn:length(guests) <= 0}">
                                             <tr><td colspan="12" style="color: red">No Value!!!</td></tr>
                                        </c:if>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th> #</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>ID Card</th>
                                        <th>Gender</th>
                                        <th>Birth Date</th>
                                        <th>Create Date</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">View all registered customers</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example2" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th> #</th>
                                            <th>Email</th>
                                            <th>Full Name</th>
                                            <th>ID Card</th>
                                            <th>Gender</th>
                                            <th>Birth Date</th>
                                            <th>Create Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${registeredCustomers != null && fn:length(registeredCustomers) > 0}">
                                            <c:forEach items="${registeredCustomers}" var="registeredCustomer" varStatus="sta">
                                                <mvc:form action="${pageContext.request.contextPath}/receptionist/result-customer" method="POST" 
                                                    modelAttribute="guest" >
                                                    <tr>
                                                        <td>${sta.count}</td>
                                                        <td>
                                                            ${registeredCustomer.email}
                                                            <input type="email" name="email" value="${registeredCustomer.email}" hidden />
                                                        </td>
                                                        <td>
                                                            ${registeredCustomer.fullName}
                                                            <input type="text" name="fullName" value="${registeredCustomer.fullName}" hidden />
                                                        </td>
                                                        <td>
                                                            ${registeredCustomer.idCard}
                                                            <input type="text" name="idCard" value="${registeredCustomer.idCard}" hidden />
                                                        </td>
                                                        <td>
                                                            ${registeredCustomer.gender}
                                                            <input type="text" name="gender" value="${registeredCustomer.gender}" hidden />
                                                        </td>
                                                        <td>
                                                            ${registeredCustomer.birthDate}
                                                            <input type="date" name="birthDate" value="${registeredCustomer.birthDate}" hidden />
                                                        </td>
                                                        <td>
                                                            ${registeredCustomer.createDate}
                                                            <input type="date" name="createDate" value="${registeredCustomer.createDate}" hidden />
                                                        </td>
                                                        <td>
                                                            <input type="text" name="registeredCustomerId" value="${registeredCustomer.id}" hidden />
                                                            <input type="text" name="address" value="${registeredCustomer.address}" hidden />
                                                            <input type="text" name="phoneNumber" value="${registeredCustomer.phoneNumber}" hidden />
                                                            <input type="text" name="bookingId" value="${bookingId}" hidden />
                                                            <input type="text" name="bookingDetailId" value="${bookingDetail.id}" hidden />
                                                            <input type="text" name="action" value="${action}" hidden />
                                                            <button type="submit" class="btn btn-sm btn-primary">Add customer</button>
                                                            <a class="btn btn-danger btn-sm" href="<c:url value="/receptionist/customer-delete/${action}/${bookingId}/${bookingDetailId}/${registeredCustomer.id}" />">
                                                                <i class="fas fa-trash">
                                                                </i>
                                                                Delete
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </mvc:form>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${registeredCustomers == null || fn:length(registeredCustomers) <= 0}">
                                             <tr><td colspan="12" style="color: red">No Value!!!</td></tr>
                                        </c:if>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th> #</th>
                                        <th>Email</th>
                                        <th>Full Name</th>
                                        <th>ID Card</th>
                                        <th>Gender</th>
                                        <th>Birth Date</th>
                                        <th>Create Date</th>
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
              "order": [[ 6, "desc" ]],
              "buttons": ["csv", "excel", "pdf"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $("#example2").DataTable({
              "responsive": true, "lengthChange": false, "autoWidth": true,
              "order": [[ 6, "desc" ]],
              "buttons": ["csv", "excel", "pdf"]
            }).buttons().container().appendTo('#example2_wrapper .col-md-6:eq(0)');
          });
        </script>
    </body>
</html>
