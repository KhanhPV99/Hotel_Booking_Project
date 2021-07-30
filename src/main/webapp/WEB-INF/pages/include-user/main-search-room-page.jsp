<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="blog-banner-area" id="about">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h1>Explore Our Rooms</h1>

            </div>
        </div>
    </div>
</section>

<div class="form-search form-search-position">
    <div class="container">
        <div class="row">
            <div class="container px-1 px-sm-5 mx-auto">
                <form action="<c:url value="search-room" />" method="post">
                    <div class="flex-sm-row flex-column d-flex">
                        <div class="col-sm-6 col-12 px-0 mb-2">
                            <div class="input-group ">
                                <input type="text" name="check_in" value="${check_in}" class="form-control input-search" placeholder="${check_in}" readonly required >
                                <input type="text" name="check_out" value="${check_out}" class="form-control input-search" placeholder="${check_out}" readonly required >
                            </div>
                        </div>
                        <div class="col-sm-4 col-12 px-0 mb-2">
                            <div  class="input-group input-daterange">
                                <select name="roomTypeId" class="form-control input-search">
                                    <!--<option value="${roomType.id}" selected disabled>${roomType.name}</option>-->
                                    <c:forEach var="rt" items="${roomTypes}">
                                        <c:if test="${roomType.id == rt.id}">
                                            <option value="${rt.id}" selected>${rt.name}</option>
                                        </c:if>
                                        <c:if test="${roomType.id != rt.id}">
                                            <option value="${rt.id}" >${rt.name}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>                            </div>
                        </div>
                        <div class="col-sm-2 col-12 px-0"> <button style="padding: 10px 15px;" type="submit" class="button-search home-banner-btn">Search</button> </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<section >
    <div class="container">
        <h5><a href="<c:url value="/" />" style="color: #000; ">HOME</a> / VACANCY</h5>
        <hr>
        <c:forEach var="r" items="${RoomSearch}">
            <div class="row card-explore" >
                <div class="col-5" >
                    <div class="card-explore__img">
                        <img class="card-img" src="<c:url value="/resources/img/home/${r.roomType.images[0].name}" />"   WIDTH="350" HEIGHT="340" alt="">

                    </div>
                </div>

                <div class="col-7">
                    <div style="line-height: 140%">
                        <c:if test="${discount == 0}">
                            <h3 class="card-explore__price">
                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                <fmt:formatNumber type="currency" value="${r.price}" />
                                <sub>/ Per Night</sub>
                            </h3>
                            <p style="color: #B22222"><i>${message}</i></p>
                                </c:if>

                        <c:if test="${discount != 0}" >
                            <h4 style="color: #B22222; text-decoration-line: line-through;">
                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                <fmt:formatNumber type="currency" value="${r.price}" />
                            </h4>
                            <h3 class="card-explore__price">
                                <fmt:setLocale value = "vi_VN" scope="session"/>
                                <fmt:formatNumber type="currency" value="${r.price * (100-discount)/100}" />
                                <sub>/ Per Night</sub>
                            </h3>
                        </c:if>
                        <h4 class="card-explore__title" style="color: #CDA972">${r.roomType.name} ${r.roomNumber}</h4>
                        <p>${r.roomType.description} </p>
                        <p>Guest: 
                            <c:forEach begin="1" end="${r.roomType.guests}">
                                <i class="fa fa-user" aria-hidden="true" style="color: #000"></i>
                            </c:forEach>
                        </p>
                        <p>Size: ${r.roomType.sizeRoom} m<sup>2</sup></p>
                        <p>Room Number: ${r.roomNumber}</p>
                        <a class="card-explore__link" href="<c:url value="/booking/${r.id}" />">Book Now <i class="ti-arrow-right"></i></a>
                    </div>
                </div>

            </div>
            <hr>
        </c:forEach>
    </div>
</section>