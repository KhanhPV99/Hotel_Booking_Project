<%-- 
    Document   : invoice-print
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
        <title>Invoice Print</title>
        <jsp:include page="../include/management/receptionist/css-page.jsp" />
        
    </head>
    <body>
        <div class="wrapper">
        <!-- Main content -->
        <section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-12">
              <h2 class="page-header">
                <i class="fas fa-globe"></i> AdminLTE, Inc.
                <small class="float-right">Date: ${today}</small>
              </h2>
            </div>
            <!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              From
              <address>
                <strong>Admin, Inc.</strong><br>
                795 Folsom Ave, Suite 600<br>
                San Francisco, CA 94107<br>
                Phone: (804) 123-5432<br>
                Email: info@almasaeedstudio.com
              </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
              To
              <address>
                <strong>
                    <c:if test="${booking.user.id == null}">
                        ${booking.fullName}
                    </c:if>
                    <c:if test="${booking.user.id != null}">
                        ${booking.user.fullName}
                    </c:if>
                </strong>
                <br>
                    <c:if test="${booking.user.id == null}">
                        ${booking.address}
                    </c:if>
                    <c:if test="${booking.user.id != null}">
                        ${booking.user.address}
                    </c:if>
                <br>
                    <c:if test="${booking.user.id == null}">
                        ${booking.phoneNumber}
                    </c:if>
                    <c:if test="${booking.user.id != null}">
                        ${booking.user.phoneNumber}
                    </c:if>
                <br>
                    <c:if test="${booking.user.id == null}">
                        ${booking.email}
                    </c:if>
                    <c:if test="${booking.user.id != null}">
                        ${booking.user.email}
                    </c:if>
              </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <b>Invoice ${booking.bookingNumber}</b><br>
                <br>
                <b>Booking ID:</b> ${booking.id}<br>
                <b>Payment Due:</b> ${booking.bookingDate}<br>
                <b>Account:</b>
                  <c:if test="${booking.user.id == null}">
                      Hello
                  </c:if>
                  <c:if test="${booking.user.id != null}">
                      ${booking.user.email}
                  </c:if>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Room Number</th>
                        <th>Room Type</th>
                        <th>List Price</th>
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
                                <td>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <fmt:formatNumber type="currency" value="${bookingDetail.price}" />
                                </td>
                                <td>${bookingDetail.discount}</td>
                                <td>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
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
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->

          <div class="row">
            <!-- accepted payments column -->
            <div class="col-6">
              <p class="lead">Payment Methods:</p>
              <img src="<c:url value="../../resources-management/dist/img/credit/visa.png"/>" alt="Visa"/>
              <img src="<c:url value="../../resources-management/dist/img/credit/mastercard.png"/>" alt="Mastercard"/>
<!--              <img src="../../dist/img/credit/american-express.png" alt="American Express">
              <img src="../../dist/img/credit/paypal2.png" alt="Paypal">

              <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr
                jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
              </p>-->
            </div>
            <!-- /.col -->
            <div class="col-6">
              <p class="lead">Amount Due ${today}</p>

              <div class="table-responsive">
                <table class="table">
                  <tr>
                    <th style="width:50%">Subtotal:</th>
                    <td>
                        <fmt:setLocale value = "vi_VN" scope="session"/>
                        <fmt:formatNumber type="currency" value="${booking.totalPrice / 1.1}" />
                    </td>
                  </tr>
                  <tr>
                    <th>VAT (10%)</th>
                    <td>
                        <fmt:setLocale value = "vi_VN" scope="session"/>
                        <fmt:formatNumber type="currency" value="${booking.totalPrice - booking.totalPrice / 1.1}" />
                    </td>
                  </tr>
                  <tr>
                    <th>Total:</th>
                    <td>
                        <fmt:setLocale value = "vi_VN" scope="session"/>
                        <fmt:formatNumber type="currency" value="${booking.totalPrice}" />
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </section>
        <!-- /.content -->
      </div>
      <!-- ./wrapper -->
    <!-- Page specific script -->
    <script>
      window.addEventListener("load", window.print());
    </script>
    </body>
</html>
