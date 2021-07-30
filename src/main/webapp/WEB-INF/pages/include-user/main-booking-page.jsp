<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="welcome" style=" background: #f8f9fa" >
    <div class="form-search form-search-position" style="margin-top: 200px;" >
        <div class="container" >

            <div class="row">
                <div class="container px-1 px-sm-5 mx-auto">
                    <form method="post" action="" >
                        <div class="flex-sm-row flex-column d-flex">
                            <div class="col-sm-9 col-12 px-0 mb-2">
                                <div class="input-group ">
                                    <input style="margin-right: 20px" type="text" name="check_in" value="${check_in}" class="form-control input-search" placeholder="${check_in}" readonly required >
                                    <input style="margin-right: 20px" type="text" name="check_out" value="${check_out}" class="form-control input-search" placeholder="${check_out}" readonly required >
                                </div>
                            </div>
                            <div class="col-sm-3 col-12 px-0 mb-2">
                                <div class="input-group">
                                    <select name="roomTypeId" disabled="disabled" class="form-control input-search">
                                        <option value="${roomType.id}" selected disabled>${roomType.name}</option>
                                    </select>                                
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <div class="container">
        <div>
            <form action="<c:url value="search-room?check_in=${check_in}&check_out=${check_out}&roomTypeId=${roomType.id}" />" method="post">
                <button type="submit" class="btn btn-default" style="background-color: #CDA972; color: white">ADD NEW ROOM</button>
            </form>
        </div>
                <div style="margin-top: 10px">
            <p>Booking Date: ${booking.bookingDate}</p>
        </div>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">Room Name</th>
                    <th scope="col">Room Type</th>
                    <th scope="col">Price / Night</th>
                    <th scope="col">Night(s)</th>
                    <th scope="col">Discount</th>
                    <th scope="col">Service</th>
                    <th scope="col">Unit Price</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bd" items="${booking.bookingDetails}">
                    <tr>
                        <td>${bd.room.roomNumber}</td>
                        <td>${bd.room.roomType.name}</td>
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
                        <td>
                            <button type="button" class="btn btn-default" style="background-color: #CDA972"><a href="<c:url value="/remove/${bd.room.id}" />" class="far fa-trash-alt" style="color: white"></a></button> 
                            <button type="button" class="btn btn-default" style="background-color: #CDA972"><a href="<c:url value="/add-service/${bd.room.id}" />" style="color: white">SERVICE</a></button>
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
            <div class="col-3">
                &emsp;<button type="button" class="btn btn-default" style="background-color: #CDA972"><a href="<c:url value="/confirm-booking" />" style="color: white">CONFIRM BOOKING >></a></button>
            </div>

        </div>
    </div>
</section>
<hr>