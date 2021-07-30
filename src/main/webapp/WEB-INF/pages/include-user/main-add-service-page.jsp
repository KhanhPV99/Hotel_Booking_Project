<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="welcome" background: #f8f9fa">
    <div class="container" style="margin-top: 100px; ">

        <div class="row">
            <div>
                <a href="<c:url value="/view-booking" /> "><button type="button" class="btn btn-default" style="background-color: #CDA972; width: 80px; color: white">Back</button></a>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="thead-dark" style="background-color: #CDA972; color: #ffffff">
                        <tr>
                            <th colspan="5">Service Booking</th>
                        </tr>
                    </thead>
                    <thead class="thead-light">
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total Price</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${serviceBooking}">
                            <tr>
                                <td>${s.service.name}</td>
                                <td>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <fmt:formatNumber type="currency" value="${s.service.price}" />
                                </td>
                                <td>
                                    <form action="<c:url value="/price-service/${s.service.id}" />" method="post">
                                        <input type="text" name="quantity" value="${s.quantity}" >
                                        <button type="submit" class="btn btn-default" style="background-color: #CDA972; color: #ffffff">Update</button>
                                    </form>
                                </td>
                                <td>
                                    <fmt:setLocale value = "vi_VN" scope="session"/>
                                    <fmt:formatNumber type="currency" value="${s.price}" />
                                </td>
                                <td>
                                    <button type="button" class="btn btn-default" style="background-color: #CDA972">
                                        <a href="<c:url value="/remove-service/${s.service.id}" />" class="far fa-trash-alt" style="color: white"></a>
                                    </button> 
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th colspan="4">Add New Service</th>
                        </tr>
                    </thead>
                    <thead class="thead-light">
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Open Time</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${service}">
                            <tr>
                                <td>${s.name}</td>
                                <td>
                                    <fmt:setLocale value = "vi_VN" scope="session" />
                                    <fmt:formatNumber type="currency" value="${s.price}" />
                                </td>
                                <td>${s.openTime}</td>
                                <td>
                                    <button type="button" onclick="" class="btn btn-default" style="background-color: #CDA972">
                                        <a href="<c:url value="/add-service-detail/${s.id}" />" style="color: white">Add Service</a>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</section>
<hr>