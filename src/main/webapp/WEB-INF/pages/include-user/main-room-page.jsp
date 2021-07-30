<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="blog-banner-area" id="about">
    <div class="container h-100">
        <div class="blog-banner">
            <div class="text-center">
                <h4>The best luxury hotel in the world</h4>
                <h1>Luxury Hotel</h1>
            </div>
        </div>
    </div>
</section>

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
                <div class="col-md-6 col-lg-4 mb-4 mb-lg-0">
                    <div class="card card-explore">

                        <div class="card-explore__img">
                            <img class="card-img" src="<c:url value="/resources/img/home/${rt.images[0].name}" />"  WIDTH="350" HEIGHT="340" alt="">

                        </div>

                        <div class="card-body">
                            <!--                            <h3 class="card-explore__price">$150.00 <sub>/ Per Night</sub></h3>-->
                            <h4 class="card-explore__title"><a href="<c:url value="/room/${rt.id}" />">${rt.name}</a></h4>
                            <p>${rt.description} </p>
                            <p><b>Size: </b>${rt.sizeRoom} </p>
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