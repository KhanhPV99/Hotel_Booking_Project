<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rooms</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">

        <link rel="stylesheet" href="<c:url value="/resources/css/date-search.css" />">
        <jsp:include page="../include-user/css-page.jsp" />
    </head>
    <body>
        <jsp:include page="../include-user/menu-page.jsp" />

        <jsp:include page="../include-user/main-search-page.jsp" />

        <jsp:include page="../include-user/footer-page.jsp" />

        <jsp:include page="../include-user/js-page.jsp" />
    </body>
</html>