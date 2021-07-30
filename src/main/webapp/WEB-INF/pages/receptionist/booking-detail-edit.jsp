<%-- 
    Document   : booking-detail-edit
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail Page</title>
        <jsp:include page="../include/management/receptionist/css-page.jsp" />
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
                            <h1>Update Booking Detail</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/receptionist/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">Update Booking Detail</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <a href="<c:url value="/receptionist/booking-edit/${bookingId}"/>" class="btn btn-secondary">Back</a>
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
                                    <label for="inputPrice">List Price: </label>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <input type="price" id="inputPrice" class="form-control" value="<fmt:formatNumber type="currency" value="${bookingDetail.price}" />" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputDiscount">Discount</label>
                                    <input type="number" id="inputDiscount" class="form-control" value="${bookingDetail.discount}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputPrice">Net Price: </label>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <input type="price" id="inputPrice" class="form-control" value="<fmt:formatNumber type="currency" value="${bookingDetail.price * (1 - bookingDetail.discount/100)}" />" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="inputUnitPrice">Unit Price: </label>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <input type="price" id="inputUnitPrice" class="form-control" value="<fmt:formatNumber type="currency" value="${bookingDetail.unitPrice}" />" disabled>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    <!-- /.card -->
                    </div>
                                
                    <div class="col-md-9">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Service Booking</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table class="table table-striped">
                                  <thead>
                                    <tr>
                                      <th>Name</th>
                                      <th>Booking Date</th>
                                      <th>Price</th>
                                      <th>Quantity</th>
                                      <th>Total price</th>
                                      <th>Remove?</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach items="${bookingDetail.serviceBookings}" var="serviceBooking">
                                        <tr>
                                            <td>
                                                ${serviceBooking.service.name}
                                            </td>
                                            <td>
                                                ${serviceBooking.serviceBookDate}
                                            </td>
                                            <td>
                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                <fmt:formatNumber type="currency" value="${serviceBooking.price}" />
                                            </td>
                                            <td>
                                                <c:if test="${serviceBooking.serviceBookDate == today}">
                                                    <form action="${pageContext.request.contextPath}/receptionist/result-service-booking-quantity" method="post">
                                                        <input type="number" name="quantity" class="form-control" value="${serviceBooking.quantity}"/>
                                                        <input type="text" name="serviceBookingId" value="${serviceBooking.id}" hidden />
                                                        <input type="text" name="bookingDetailId" value="${bookingDetail.id}" hidden />
                                                        <input type="text" name="bookingId" value="${bookingId}" hidden />
                                                        <button type="submit" class="btn btn-sm btn-primary">Update quantity</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${serviceBooking.serviceBookDate != today}">
                                                    <input type="number" class="form-control" value="${serviceBooking.quantity}" disabled/>
                                                </c:if> 
                                            </td>
                                            <td>
                                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                                <fmt:formatNumber type="currency" value="${serviceBooking.price * serviceBooking.quantity}" />
                                            </td>
                                            <td>
                                                <c:if test="${serviceBooking.serviceBookDate == today}">
                                                    <a class="btn btn-danger btn-sm" href="<c:url value="/receptionist/service-booking-delete/${bookingId}/${bookingDetail.id}/${serviceBooking.id}" />">
                                                        <i class="fas fa-trash">
                                                        </i>
                                                        Delete
                                                    </a>
                                                </c:if>

                                            </td>
                                        </tr>
                                      </c:forEach>
                                  </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Add New Service?</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table class="table table-striped">
                                  <thead>
                                    <tr>
                                      <th>Name</th>
                                      <th>Price</th>
                                      <th>Open Time</th>
                                      <th>Action</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                      <c:forEach items="${services}" var="service">
                                        <mvc:form id="quickForm" action="${pageContext.request.contextPath}/receptionist/result-service-booking" method="POST" 
                                                modelAttribute="serviceBooking" >
                                                <tr>
                                                    <td>
                                                        ${service.name}
                                                    </td>
                                                    <td>
                                                        <fmt:setLocale value = "vi_VN" scope="session"/>
                                                        <fmt:formatNumber type="currency" value="${service.price}" />
                                                    </td>
                                                    <td>
                                                        ${service.openTime}
                                                    </td>
                                                    <td>
                                                        <input type="text" name="serviceId" value="${service.id}" hidden />
                                                        <input type="text" name="bookingDetailId" value="${bookingDetail.id}" hidden />
                                                        <input type="text" name="bookingId" value="${bookingId}" hidden />
                                                        <input type="text" name="serviceBookDate" value="${today}" hidden />
                                                        <input type="text" name="quantity" value="1" hidden />
                                                        <input type="text" name="price" value="${service.price}" hidden />
                                                        <button type="submit" class="btn btn-sm btn-primary">Add service</button>
                                                    </td>
                                                </tr>
                                         </mvc:form>   
                                      </c:forEach>
                                  </tbody>
                                </table>
                            </div>
                          <!-- /.card-body -->
                        </div>
                    <!-- /.card -->
                    </div>
                </div>
            </section>
            <!-- /.content -->
        
        </div>
        <!-- /.content-wrapper -->
        <jsp:include page="../include/management/footer-page.jsp" />
        <jsp:include page="../include/management/manager/js-page.jsp" />
    </body>
</html>
