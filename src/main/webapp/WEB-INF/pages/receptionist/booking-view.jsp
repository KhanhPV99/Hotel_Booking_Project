<%-- 
    Document   : booking-view
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
        <title>Booking View Page</title>
        <jsp:include page="../include/management/receptionist/css-page.jsp" />
        <!-- daterange picker -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.css"/>">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <jsp:include page="../include/management/menu-page.jsp" />
        <jsp:include page="../include/management/sidebar-container-page.jsp" />
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">   
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>View Booking</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/receptionist/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">View Booking</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                    <input type="text" name="id" value="${booking.id}" hidden />
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <a href="<c:url value="/receptionist/view-bookings"/>" class="btn btn-secondary">Back</a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
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
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>Booking Date:</label>
                                        <div class="input-group date">
                                            <input type="date" class="form-control datetimepicker-input" name="bookingDate" id="bookingDate" value="${booking.bookingDate}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Check in - Check out date:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="dateRange" autocomplete="off" disabled/>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                  <i class="far fa-calendar-alt"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <input type="hidden" id="checkinDate" name="checkinDate" value="${booking.checkinDate}"/>
                                        <input type="hidden" id="checkoutDate" name="checkoutDate" value="${booking.checkoutDate}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Status</label>
                                        <input type="text" class="form-control" value="${booking.status}" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTotalPrice">Total Price: </label>
                                        <fmt:setLocale value = "vi_VN" scope="session"/>
                                        <input type="price" id="inputUnitPrice" class="form-control" value="<fmt:formatNumber type="currency" value="${booking.totalPrice}" />" disabled>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        <!-- /.card -->
                        </div>
                        <div class="col-md-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Information</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <c:if test="${booking.user.id == null}">
                                                <input type="text" name="address" value="${booking.address}" hidden/>
                                                <input type="date" name="birthDate" value="${booking.birthDate}" hidden/>
                                                <div class="form-group">
                                                    <label for="inputEmail">Email</label>
                                                    <input type="text" id="inputEmail" name="email" class="form-control" value="${booking.email}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName">Full Name</label>
                                                    <input type="text" id="inputName" name="fullName" class="form-control" value="${booking.fullName}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputGender">Gender</label>
                                                    <input type="text" id="inputGender" name="gender" class="form-control" value="${booking.gender}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhoneNumber">Phone Number</label>
                                                    <input type="text" id="inputPhoneNumber" name="phoneNumber" class="form-control" value="${booking.phoneNumber}" disabled/>
                                                </div>
                                            </c:if>
                                            <c:if test="${booking.user.id != null}">
                                                <input type="text" id="inputId" name="user.id" class="form-control" value="${booking.user.id}" hidden />
                                                <div class="form-group">
                                                    <label for="inputEmail">Email</label>
                                                    <input type="text" id="inputEmail" name="user.email" class="form-control" value="${booking.user.email}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputName">Full Name</label>
                                                    <input type="text" id="inputName" name="user.fullName" class="form-control" value="${booking.user.fullName}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputGender">Gender</label>
                                                    <input type="text" id="inputGender" name="user.gender" class="form-control" value="${booking.user.gender}" disabled/>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhoneNumber">Phone Number</label>
                                                    <input type="text" id="inputPhoneNumber" name="user.phoneNumber" class="form-control" value="${booking.user.phoneNumber}" disabled/>
                                                </div>
                                            </c:if>  
                                        </div>
                                    </div>
                                </div>
                              <!-- /.card-body -->
                            </div>
                        <!-- /.card -->
                        </div>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                  <h3 class="card-title">List of Booking Detail</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                  <table class="table table-striped">
                                    <thead>
                                      <tr>
                                        <th>Room Number</th>
                                        <th>Room Type</th>
                                        <th>Discount (%)</th>
                                        <th>Net Price</th>
                                        <th>Service Booking</th>
                                        <th>Unit Price</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${bookingDetails}" var="bookingDetail">
                                            <tr>
                                                <td>${bookingDetail.room.roomNumber}</td>
                                                <td>${bookingDetail.room.roomType.name}</td>
                                                <td>${bookingDetail.discount}</td>
                                                <td>
                                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                                    <strike><fmt:formatNumber type="currency" value="${bookingDetail.price}" /></strike>
                                                    <fmt:formatNumber type="currency" value="${bookingDetail.price * (1 - bookingDetail.discount/100)}" />
                                                </td>
                                                <td>
                                                    <ul>
                                                        <c:forEach items="${bookingDetail.serviceBookings}" var="serviceBooking">
                                                            <li>${serviceBooking.service.name}&nbsp;(
                                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                                <fmt:formatNumber type="currency" value="${serviceBooking.service.price}" />
                                                                x ${serviceBooking.quantity}
                                                            )</li>
                                                        </c:forEach>
                                                    </ul>
                                                </td>
                                                <td>
                                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                                    <fmt:formatNumber type="currency" value="${bookingDetail.unitPrice}" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="5" style="color:blue;font-weight:bold;text-align: right" >SUB TOTAL PRICE</td>
                                            <td colspan="2" style="color: blue;font-weight:bold">
                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                <fmt:formatNumber type="currency" value="${booking.totalPrice / 1.1}" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" style="color:blue;font-weight:bold;text-align: right" >VAT (10%)</td>
                                            <td colspan="2" style="color: blue;font-weight:bold">
                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                <fmt:formatNumber type="currency" value="${booking.totalPrice - booking.totalPrice / 1.1}" />
                                            </td>  
                                        </tr>
                                        <tr>
                                            <td colspan="5" style="color:blue;font-weight:bold;text-align: right" >TOTAL PRICE</td>
                                            <td colspan="2" style="color: blue;font-weight:bold">
                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                <fmt:formatNumber type="currency" value="${booking.totalPrice}" />
                                            </td>  
                                        </tr>
                                    </tbody>
                                  </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        
                                            
                        
                                            
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                  <h3 class="card-title">List of Payments</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body p-0">
                                  <table class="table table-striped">
                                    <thead>
                                      <tr>
                                        <th>Booking Number</th>
                                        <th>Payment Date</th>
                                        <th>Amount</th>
                                        <th>Credit Card Number</th>
                                        <th>Description</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${payments != null && fn:length(payments) > 0}">
                                            <c:forEach items="${payments}" var="payment">
                                                <tr>
                                                    <td>${booking.bookingNumber}</td>
                                                    <td>${payment.paymentDate}</td>
                                                    <td>
                                                        <fmt:setLocale value = "vi_VN" scope="session"/>
                                                        <fmt:formatNumber type="currency" value="${payment.amount}" />
                                                    </td>
                                                    <td>${payment.creditCard.cardNumber}</td>
                                                    <td>${payment.description}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${payments == null || fn:length(payments) <= 0}">
                                            <tr><td colspan="12" style="color: red">No Value!!!</td></tr>
                                        </c:if>
                                    </tbody>
                                  </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                    </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <jsp:include page="../include/management/footer-page.jsp" />
        <jsp:include page="../include/management/receptionist/js-page.jsp" />
        
        <!-- date-range-picker -->
        <script src="<c:url value="/resources-management/plugins/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.js"/>"></script>
        
        <!-- Page specific script -->
        <script>
        var checkinDate = $('#checkinDate').val();
        var checkoutDate = $('#checkoutDate').val();
//        console.log('You startDate: ' + startDate);
//        console.log('You startDate: ' + endDate);
    
        var bookingDate = $('#bookingDate').val();
    
        var $dateRange = $('#dateRange');
        $dateRange.daterangepicker({
            locale: {
                format: 'YYYY-MM-DD'
            },
            startDate: checkinDate,
            endDate: checkoutDate,
            minDate: bookingDate
        });
        $dateRange.on('apply.daterangepicker', function (ev, picker) {
            $('input[name="checkinDate"]').val(picker.startDate.format('YYYY-MM-DD'));
            $('input[name="checkoutDate"]').val(picker.endDate.format('YYYY-MM-DD'));
        });
        </script>
    </body>
</html>
