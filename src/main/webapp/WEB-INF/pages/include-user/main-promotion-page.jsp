<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="site-main">
    <section class="blog-banner-area" id="about">
        <div class="container h-100">
            <div class="blog-banner">
                <div class="text-center">
                    <h1>Luxury Hotel</h1>
                    <nav aria-label="breadcrumb" class="banner-breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value="/" />">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Promotion</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>


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