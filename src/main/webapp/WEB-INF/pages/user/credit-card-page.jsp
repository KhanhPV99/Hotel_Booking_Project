<%-- 
    Document   : credit-card-page
    Created on : Jul 20, 2021, 11:21:28 PM
    Author     : USER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card</title>
        <jsp:include page="../include-user/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="../include-user/menu-page.jsp" />

        <section class="welcome">
            <div class=" shadow-lg p-3 mb-5 bg-white rounded" style="margin: 100px 300px 30px" >
                <div class="container">

                    <form action="<c:url value="/credit-card" />" method="POST" >
                        <div style="margin-bottom: 20px">
                            <h4>Enter your details </h4>
                        </div>
                        <div class="row">
                            <div class="form-group col-8">
                                <label>Full Name <font color = "#ff0000">(*)</font> </label>
                                <input class="form-control" type="text" name="full_name" value="${booking.fullName}" readonly >
                            </div>
                            <div class="form-group col-4">
                                <label>Gender <font color = "#ff0000">(*)</font> </label>
                                <select name="gender" class="custom-select" id="inputGroupSelect01" disabled="disabled" >
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
                                           placeholder="Enter your email" aria-label="Enter your email" aria-describedby="basic-addon2" required readonly >
                                    <div class="input-group-append">
                                        <span class="input-group-text" id="basic-addon2">@example.com</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-5">
                                <label>Phone number <font color = "#ff0000">(*)</font> </label>
                                <input class="form-control" type="text" value="${booking.phoneNumber}" name="phone_number" maxlength="20" minlength="10" required readonly >
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-7">
                                <label>Address: </label>
                                <input class="form-control" type="text" value="${booking.address}" name="address" readonly >
                            </div>
                            <div class="form-group col-5">
                                <label>Your birthday: </label>
                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                    <input type="date" name="birthdate" class="form-control" value="${birthdate}" placeholder="dd/MM/yyyy" readonly/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <hr>
        </section>
        <section class="welcome">
            <div style="margin: 0px 300px" >
                <div>
                    <a href="<c:url value="/confirm-booking" />">
                        <button type="button" class="btn btn-default" 
                                style="background-color: #CDA972; color: white; width: 90px">BACK</button>
                    </a>
                </div>
                <div class="container shadow-lg p-3 mb-5 bg-white rounded">
                    <form action="<c:url value="/result-booking" />" method="POST" >
                        <div style="margin-bottom: 25px">
                            <h4>Customer's Credit Card: </h4>
                        </div>
                        <div class="row">
                            <div class="form-group col-6">
                                <label>Cardholder Name <font color = "#ff0000">(*)</font> </label>
                                <input class="form-control" type="text" name="name" required >
                            </div>
                            <div class="form-group col-6">
                                <label>Card Number <font color = "#ff0000">(*)</font></label>
                                <input class="form-control" type="text" name="cardNumber" maxlength="19" minlength="12" required >
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-6">
                                <label>Expiration Date <font color = "#ff0000">(*)</font> </label>
                                <input type="date" class="form-control" name="expireDate" required >
                            </div>
                            <div class="form-group col-6">
                                <label>CVV <font color = "#ff0000">(*)</font> </label>
                                <input class="form-control" type="password" name="cvv" maxlength="3" minlength="3" required >
                            </div>
                        </div>
                        <div >
                            <div class="form-group">
                                <button type="submit" class="btn btn-default" 
                                        style="background-color: #CDA972; color: white; width: 150px">
                                    <i class="fas fa-credit-card"></i>&ensp;Payment
                                </button> 
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <hr>
        </section>

        <jsp:include page="../include-user/footer-page.jsp" />

        <script>

        </script>
        <jsp:include page="../include-user/js-page.jsp" />
    </body>
</html>
