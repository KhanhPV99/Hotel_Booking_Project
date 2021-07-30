<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="welcome" style=" background: #f8f9fa" >
    <div class="form-search form-search-position" style="margin-top: 200px; width: 50%" >
    </div>
    <div class="container">
        <div>
            <form action="<c:url value="/view-booking" />" method="post">
                <button type="submit" class="btn btn-default" style="background-color: #CDA972; color: white">BACK</button>
            </form>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Check In to Check Out</th>
                    <th scope="col">Room Type</th>
                    <th scope="col">Room Name</th>
                    <th scope="col">Price / Night</th>
                    <th scope="col">Night(s)</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Service</th>
                    <th scope="col">Unit Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bd" items="${bookingDetail}">
                    <tr>
                        <td>${bd.room.roomType.name}</td>
                        <td>${bd.room.roomNumber}</td>
                        <td>
                            <fmt:setLocale value = "vi_VN" scope="session"/>
                            <fmt:formatNumber type="currency" value="${bd.room.price}" />
                        </td>
                        <td>${nights}</td>
                        <td>
                            <fmt:formatNumber type = "percent" 
                                              maxIntegerDigits="3" value = "${bd.discount/100}" />
                        </td>
                        <td>
                            <ul class="list-unstyled">
                                <c:forEach var="sv"  items="${bd.serviceBookings}">
                                    <li>${sv.quantity} ${sv.service.name} 
                                        (<fmt:setLocale value = "vi_VN" scope="session"/>
                                        <fmt:formatNumber type="currency" value="${sv.service.price * sv.quantity}" />)
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                        <td>
                            <fmt:setLocale value = "vi_VN" scope="session"/>
                            <fmt:formatNumber type="currency" value="${bd.unitPrice}" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="row">
            <div class="col-9">
                <h4>Total:&emsp;
                    <fmt:setLocale value = "vi_VN" scope="session"/>
                    <fmt:formatNumber type="currency" value="${booking.totalPrice}" />
                </h4>
            </div>
        </div>
    </div>
    <hr>
</section>