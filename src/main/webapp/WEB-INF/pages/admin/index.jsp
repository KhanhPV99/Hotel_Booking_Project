<%-- 
    Document   : index
    Created on : Jun 21, 2021, 7:00:48 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Page</title>
        <jsp:include page="../include/management/admin/css-page.jsp" />
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">
            <jsp:include page="../include/management/menu-page.jsp" />
            <jsp:include page="../include/management/sidebar-container-page.jsp" />
            <jsp:include page="../include/management/admin/main-page.jsp" />
            <jsp:include page="../include/management/footer-page.jsp" />
        </div>
        <jsp:include page="../include/management/admin/js-page.jsp" />   
    </body>
</html>
