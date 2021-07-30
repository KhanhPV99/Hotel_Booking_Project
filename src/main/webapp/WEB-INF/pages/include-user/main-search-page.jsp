<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="welcome" style="height: 800px;
         background: url(<c:url value="/resources/img/home/header-bg.jpg" />);" >
    <div class="container" style="margin-top: 300px; " >
        <div class="form-search form-search-position" >

            <div class="row">
                <div class="container px-1 px-sm-5 mx-auto">
                    <form action="<c:url value="/search-room" />" method="post">
                        <div class="flex-sm-row flex-column d-flex">
                            <div class="col-sm-7 col-12 px-0 mb-2">
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
                                        <option value="${roomType.id}" selected disabled hidden>${roomType.name}</option>
                                        <c:forEach var="rt" items="${roomTypes}">
                                            <c:if test="${roomType.id == rt.id}">
                                                <option value="${rt.id}" selected>${rt.name}</option>
                                            </c:if>
                                            <c:if test="${roomType.id != rt.id}">
                                                <option value="${rt.id}" >${rt.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-2 col-12 px-0"> <button style="padding: 10px 15px; " type="submit" class="button-search home-banner-btn">Search</button> </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>