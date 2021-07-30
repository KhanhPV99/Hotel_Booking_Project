<%-- 
    Document   : view-bookings
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Bookings</title>
        
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
        <!-- daterange picker -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.css"/>">
        
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
                            <h1>View All Bookings</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/receptionist/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">View All Bookings</li>
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
                                    <h3 class="card-title">View all bookings</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>Search bookings between:</label>
                                        <form class="form-horizontal" action="${pageContext.request.contextPath}/receptionist/search-booking" method="POST">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" id="dateRange" autocomplete="off"/>
                                                <c:if test="${checkinDate == null || checkoutDate == null}">
                                                    <input type="hidden" id="checkinDate" name="checkinDate" value="${today}"/>
                                                    <input type="hidden" id="checkoutDate" name="checkoutDate" value="${today}"/>
                                                </c:if>
                                                <c:if test="${checkinDate != null && checkoutDate != null}">
                                                    <input type="hidden" id="checkinDate" name="checkinDate" value="${checkinDate}"/>
                                                    <input type="hidden" id="checkoutDate" name="checkoutDate" value="${checkoutDate}"/>
                                                </c:if>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                      <i class="far fa-calendar-alt"></i>
                                                    </span>
                                                    <span class="input-group-prepend">
                                                        <button type="submit" class="btn btn-info btn-flat">Search</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Booking Number</th>
                                                <th>Name of Customer</th>
                                                <th>Booking Date</th>
                                                <th>Check in</th>
                                                <th>Check out</th>
                                                <th>Status</th>
                                                <th>Total Price</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${bookings != null && fn:length(bookings) > 0}">
                                                <c:forEach items="${bookings}" var="booking">
                                                    <tr>
                                                        <td>${booking.bookingNumber}</td>
                                                        <td>
                                                            <c:if test="${booking.user.id == null}">
                                                                ${booking.fullName}
                                                            </c:if>
                                                            <c:if test="${booking.user.id != null}">
                                                                ${booking.user.fullName}
                                                            </c:if>
                                                        </td>
                                                        <td>${booking.bookingDate}</td>
                                                        <td>${booking.checkinDate}</td>
                                                        <td>${booking.checkoutDate}</td>
                                                        <td>${booking.status}</td>
                                                        <td>
                                                            <fmt:setLocale value = "vi_VN" scope="session"/>
                                                            <fmt:formatNumber type="currency" value="${booking.totalPrice}" />
                                                        </td>
                                                        <td>
                                                            <c:if test="${booking.status != 'CHECKED_OUT' && booking.status != 'CANCELED'}">
                                                                <a class="btn btn-info btn-sm" href="<c:url value="/receptionist/booking-edit/${booking.id}" />">
                                                                    <i class="fas fa-pencil-alt">
                                                                    </i>
                                                                    Edit
                                                                </a>
                                                            </c:if>
                                                            <c:if test="${booking.status == 'CHECKED_OUT' || booking.status == 'CANCELED'}">
                                                                <a class="btn btn-info btn-sm" href="<c:url value="/receptionist/booking-view/${booking.id}" />">
                                                                    <i class="fas fa-folder-open">
                                                                    </i>
                                                                    View
                                                                </a>
                                                            </c:if>
<!--                                                            <a class="btn btn-danger btn-sm" href="<c:url value="/receptionist/booking-delete/${booking.id}" />">
                                                                <i class="fas fa-trash">
                                                                </i>
                                                                Delete
                                                            </a>-->
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${bookings == null || fn:length(bookings) <= 0}">
                                                 <tr><td colspan="12" style="color: red">No Value!!!</td></tr>
                                            </c:if>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Booking Number</th>
                                            <th>Name of Customer</th>
                                            <th>Booking Date</th>
                                            <th>Check in</th>
                                            <th>Check out</th>
                                            <th>Status</th>
                                            <th>Total Price</th>
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
        <!-- date-range-picker -->
        <script src="<c:url value="/resources-management/plugins/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.js"/>"></script>
        <!-- Page specific script -->
        <script>
          $(function () {
            $("#example1").DataTable({
              "responsive": true, "lengthChange": false, "autoWidth": true,
              "order": [[ 2, "desc" ]],
              "buttons": ["csv", "excel", "pdf"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
          });
        
        var checkinDate = $('#checkinDate').val();
        var checkoutDate = $('#checkoutDate').val();
    
        var $dateRange = $('#dateRange');
        $dateRange.daterangepicker({
            locale: {
                format: 'YYYY-MM-DD'
            },
            startDate: checkinDate,
            endDate: checkoutDate
        });
        $dateRange.on('apply.daterangepicker', function (ev, picker) {
            $('input[name="checkinDate"]').val(picker.startDate.format('YYYY-MM-DD'));
            $('input[name="checkoutDate"]').val(picker.endDate.format('YYYY-MM-DD'));
        });
        </script>
    </body>
</html>
