<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="site-main" >

    <!-- ================ start banner area ================= --> 
    <section class="home-banner-area" id="home">
        <div class="container h-100">
            <div class="home-banner">
                <div class="text-center">
                    <h4>The best luxury hotel in the world</h4>
                    <h1>Luxury Hotel</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ end banner area ================= -->


    <!-- ================ start banner form ================= --> 
    <div class="form-search form-search-position">
        <div class="container">
            <div class="row">
                <jsp:include page="../include-user/date-search.jsp" />
            </div>
        </div>
    </div>
    <!-- ================ end banner form ================= --> 

    <!-- ================ welcome section start ================= --> 
    <section class="welcome">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="row no-gutters welcome-images">
                        <div class="col-sm-7">
                            <div class="card">
                                <img class="" src="<c:url value="/resources/img/home/welcomeBanner1.png" />" alt="Card image cap">
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="card">
                                <img class="" src="<c:url value="/resources/img/home/welcomeBanner2.png" />" alt="Card image cap">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <img class="" src="<c:url value="/resources/img/home/welcomeBanner3.png" />" alt="Card image cap">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="welcome-content">
                        <h2 class="mb-4"><span class="d-block">Welcome</span> to our residence</h2>
                        <p>Beginning blessed second a creepeth. Darkness wherein fish years good air whose after seed appear midst evenin, appear void give third bearing divide one so blessed moved firmament gathered </p>
                        <p>Beginning blessed second a creepeth. Darkness wherein fish years good air whose after seed appear midst evenin, appear void give third bearing divide one so blessed</p>
                        <a class="button button--active home-banner-btn mt-4" href="#">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ================ welcome section end ================= --> 


    <!-- ================ Explore section start ================= -->
    <section class="section-margin">
        <div class="container">
            <div class="section-intro text-center pb-80px">
                <div class="section-intro__style">
                    <img src="<c:url value="/resources/img/home/bed-icon.png" />" alt="">
                </div>
                <h2>Explore Our Rooms</h2>
            </div>

            <div class="row">
                <c:forEach var="rt" items="${roomTypes}">
                    <div class="col-md-6 col-lg-4 mb-4 mb-lg-0" style="padding-bottom: 10px;">
                        <div class="card card-explore">

                            <div class="card-explore__img">
                                <img class="card-img" src="<c:url value="/resources/img/home/${rt.images[0].name}" />"  WIDTH="350" HEIGHT="340" alt="">
                            </div>

                            <div class="card-body">
                                <%--<c:forEach var="r" items="${rooms}">
                                    <c:if test="${r.roomType} = ${r}">
                                        <h3 class="card-explore__price">$ ${r.price} <sub>/ Per Night</sub></h3>
                                    </c:if>
                                </c:forEach>--%>
                                <h4 class="card-explore__title"><a href="<c:url value="/room/${rt.id}" />">${rt.name}</a></h4>
                                <p>${rt.description} </p>
                                <p><b>Size: </b>${rt.sizeRoom} m<sup>2</sup></p>
                                <p><b>Guest: </b>
                                    <c:forEach begin="1" end="${rt.guests}">
                                        <i class="fa fa-user" aria-hidden="true" style="color: #000"></i>
                                    </c:forEach>
                                </p>
                                <a class="card-explore__link" href="<c:url value="/search/${rt.id}" />">Book Now <i class="ti-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- ================ news section start ================= -->
    <section class="section-margin">
        <div class="container">
            <div style="margin: 0 100px">
                <div class="section-intro text-center pb-80px">
                    <div class="section-intro__style">
                        <img src="<c:url value="/resources/img/home/bed-icon.png" />" alt="">
                    </div>
                    <h2>Promotion</h2>
                </div>

                <div class="row">
                    <div class="card card-news">
                        <div class="card-body ">
                            <c:forEach var="p" items="${promotion}">
                                <h4 class="card-news__title">${p.name} - Discount 
                                    <fmt:formatNumber type = "percent" 
                                                      maxIntegerDigits="3" value = "${p.discount / 100}" />
                                </h4>
                                <ul class="card-news__info">
                                    <li style="font-size: 16px"><span class="news-icon"><i class="ti-notepad"></i></span>Start date: ${p.startDate}</li>
                                    <li style="font-size: 16px"><span class="news-icon"><i class="ti-notepad"></i></span>End date: ${p.endDate}</li>
                                </ul>
                                <p>${p.description}</p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>