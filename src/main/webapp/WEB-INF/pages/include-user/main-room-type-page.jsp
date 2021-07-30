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
    <!-- Container for the image gallery -->
    <div class="container">
        <div style=" margin-bottom: 20px"><h2>${roomTypes.name}</h2></div>
        <hr>
        <div class="row card-explore">
            <c:forEach var="i" items="${images}">
                <!-- Full-width images with number text -->
                <div class="mySlides">
                    <div class="numbertext"></div>
                    <img src="<c:url value="/resources/img/home/${i.name}" />" style="width:100%;">
                </div>
            </c:forEach>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>

        </div>
        <hr>
        <div class="row">
            <div class="col-7">
                <h4>Description </h4><br>
                <p>${roomTypes.description}</p>
            </div>
            <div class="col-5">
                <h4>Convenient </h4><br>
                <c:forEach var="c" items="${convenients}">
                    <p>${c.description} ${c.name}</p>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</section>
