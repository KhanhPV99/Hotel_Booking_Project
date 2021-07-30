<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="welcome" style=" background: #f8f9fa" >
    <div class="form-search form-search-position" style="margin-top: 200px; width: 50%" >
        <div class="container" >

            <div class="row">
                <div class="container px-1 px-sm-5 mx-auto">
                    <form method="post" action="" >
                        <div class="flex-sm-row flex-column d-flex">
                            <div class="col-sm-12 col-12 px-0 mb-2">
                                <div class="input-group ">
                                    <input style="margin-right: 20px" type="text" name="check_in" value="${check_in}" class="form-control input-search" placeholder="${check_in}" readonly required >
                                    <input style="margin-right: 20px" type="text" name="check_out" value="${check_out}" class="form-control input-search" placeholder="${check_out}" readonly required >
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
            <form action="<c:url value="/view-booking" />" method="post">
                <button type="submit" class="btn btn-default" style="background-color: #CDA972; color: white">BACK</button>
            </form>
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

<section class="welcome">
    <div class=" shadow-lg p-3 mb-5 bg-white rounded" style="margin: 20px 300px" >
        <div class="container">

            <form action="<c:url value="/credit-card" />" method="POST" >
                <div style="margin-bottom: 20px">
                    <h4>Enter your details </h4>
                </div>
                <div class="row">
                    <div class="form-group col-8">
                        <label>Full Name <font color = "#ff0000">(*)</font> </label>
                        <input class="form-control" type="text" name="full_name" value="${booking.fullName}" >
                    </div>
                    <div class="form-group col-4">
                        <label>Gender <font color = "#ff0000">(*)</font> </label>
                        <select name="gender" class="custom-select" id="inputGroupSelect01">
                            <c:forEach var="genderEnum" items="${genders}">
                                <c:if test="${booking.gender != null}">
                                    <c:if test="${booking.gender == gender}">
                                        <option value="${genderEnum}" selected>${genderEnum}</option>
                                    </c:if>
                                    <c:if test="${booking.gender != gender}">
                                        <option value="${genderEnum}">${genderEnum}</option>
                                    </c:if>
                                </c:if>
                                <c:if test="${booking.gender == null}">
                                    <option value="${genderEnum}">${genderEnum}</option>
                                </c:if>
                            </c:forEach>

                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-7">
                        <label>Email <font color = "#ff0000">(*)</font> </label>
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" value="${booking.email}" 
                                   placeholder="Enter your email" aria-label="Enter your email" aria-describedby="basic-addon2" required >
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2">@example.com</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-5">
                        <label>Phone number <font color = "#ff0000">(*)</font> </label>
                        <input class="form-control" type="text" value="${booking.phoneNumber}" name="phone_number" maxlength="20" minlength="10" required >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-7">
                        <label>Address: </label>
                        <input class="form-control" type="text" value="${booking.address}" name="address" >
                    </div>
                    <div class="form-group col-5">
                        <label>Your birthday: </label>
                        <div class="input-group date" id="reservationdate" data-target-input="nearest">
                            <input type="date" name="birthdate" class="form-control" value="${birthdate}" placeholder="dd/MM/yyyy"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group" style=" margin: auto;">
                        <button type="submit" class="btn btn-default text-center" 
                                style="background-color: #CDA972; color: white; width: 150px">Submit</button> 
                    </div>
                </div>

            </form>
        </div>
    </div>
    <hr>
</section>