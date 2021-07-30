<%-- 
    Document   : forgot-password
    Created on : Jun 22, 2021, 8:49:41 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password Page</title>
        <jsp:include page="include/management/css-login-page.jsp" />
    </head>
    <body class="hold-transition login-page">
        <div class="login-box">
          <div class="card card-outline card-primary">
            <div class="card-header text-center">
              <a href="<c:url value="/login"/>" class="h1"><b>Admin</b>LTE</a>
            </div>
            <div class="card-body">
              <p class="login-box-msg">You forgot your password? Here you can easily retrieve a new password.</p>
              <form action="recover-password.html" method="post">
                <div class="input-group mb-3">
                  <input type="email" class="form-control" placeholder="Email">
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <span class="fas fa-envelope"></span>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <button type="submit" class="btn btn-primary btn-block">Request new password</button>
                  </div>
                  <!-- /.col -->
                </div>
              </form>
              <p class="mt-3 mb-1">
                <a href="<c:url value="/login"/>">Login</a>
              </p>
            </div>
            <!-- /.login-card-body -->
          </div>
        </div>
        <!-- /.login-box -->
        
        <jsp:include page="include/management/js-login-page.jsp" />
    </body>
</html>
