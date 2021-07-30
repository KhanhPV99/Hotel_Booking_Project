<%-- 
    Document   : login
    Created on : Jun 21, 2021, 7:05:53 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <jsp:include page="include/management/css-login-page.jsp" />
    </head>
    <body class="hold-transition login-page">
        <!-- /login?error=true -->
        <c:if test="${message != null && message != ''}">
            <p style="color: red">${message}</p>
        </c:if>
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
              <div class="card-header text-center">
                <a href="<c:url value="/login"/>" class="h1"><b>Admin</b>LTE</a>
              </div>
              <div class="card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form action="<c:url value="j_spring_security_check"/>" method="post">
                  <div class="input-group mb-3">
                    <input type="email" name="username" class="form-control" placeholder="Email">
                    <div class="input-group-append">
                      <div class="input-group-text">
                        <span class="fas fa-envelope"></span>
                      </div>
                    </div>
                  </div>
                  <div class="input-group mb-3">
                    <input type="password" name="password" class="form-control" placeholder="Password">
                    <div class="input-group-append">
                      <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-8">
                      <div class="icheck-primary">
                        <input type="checkbox" id="remember">
                        <label for="remember">
                          Remember Me
                        </label>
                      </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                      <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                    </div>
                    <!-- /.col -->
                  </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <div class="social-auth-links text-center mt-2 mb-3">
                  <a href="#" class="btn btn-block btn-primary">
                    <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
                  </a>
                  <a href="#" class="btn btn-block btn-danger">
                    <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
                  </a>
                </div>
                <!-- /.social-auth-links -->

                <p class="mb-1">
                  <a href="<c:url value="/forgot-password"/>">I forgot my password</a>
                </p>
                <p class="mb-0">
                  <a href="<c:url value="/register"/>" class="text-center">Register a new membership</a>
                </p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.login-box -->
          
          <jsp:include page="include/management/js-login-page.jsp" />
    </body>
</html>
