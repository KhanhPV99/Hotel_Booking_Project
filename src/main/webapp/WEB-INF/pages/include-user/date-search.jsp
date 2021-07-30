<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">

    <link rel="stylesheet" href="<c:url value="/resources/css/date-search.css" />">
</head>
<div class="container px-1 px-sm-5 mx-auto">
    <form action="<c:url value="search-room" />" method="post">
        <div class="flex-sm-row flex-column d-flex">
            <div class="col-sm-5 col-12 px-0 mb-2">
                <div class="input-group input-daterange">
                    <c:if test="${sessionScope.booking != null}">
                        <input type="text" name="check_in" class="form-control input-search" value="${sessionScope.check_in}" placeholder="${sessionScope.check_in}" readonly required >
                        <input type="text" name="check_out" class="form-control input-search" value="${sessionScope.check_out}" placeholder="${sessionScope.check_out}" readonly required >
                    </c:if>
                    <c:if test="${sessionScope.booking == null}">
                        <input type="text" name="check_in" class="form-control input-search" placeholder="Check in date" readonly required >
                        <input type="text" name="check_out" class="form-control input-search" placeholder="Check out date" readonly required >
                    </c:if>
                </div>
            </div>
            <div class="col-sm-3 col-12 px-0 mb-2">
                <div class="input-group input-daterange">
                    <select name="roomTypeId" class="form-control input-search">
                        <c:forEach var="rt" items="${roomTypes}">
                            <option value="${rt.id}" >${rt.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-sm-2 col-12 px-0"> <button style="padding: 10px 15px; " type="submit" class="button-search home-banner-btn">Search</button> </div>
        </div>
    </form>
</div>
