<%-- 
    Document   : user-add
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <jsp:include page="../include/management/admin/css-page.jsp" />
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <jsp:include page="../include/management/menu-page.jsp" />
        <jsp:include page="../include/management/sidebar-container-page.jsp" />
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">   
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Add User</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/admin/index"/>">Home</a></li>
                                <li class="breadcrumb-item active">Add User</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <mvc:form id="quickForm" action="${pageContext.request.contextPath}/admin/result-user" method="POST" 
                  modelAttribute="user" >
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <a href="<c:url value="/admin/view-users"/>" class="btn btn-secondary">Cancel</a>
                                <button type="submit" class="btn btn-success float-right">Create</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">General</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputEmail">Email</label>
                                        <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Name" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword">Password</label>
                                        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputFullName">Full Name</label>
                                        <input type="text" id="inputFullName" class="form-control" name="fullName" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender">Gender</label>
                                        <select name="gender" class="form-control" >
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${gender}" var="g">
                                                <c:if test="${user.gender == g}">
                                                    <option value="${g}" selected>${g}</option> 
                                                </c:if>
                                                <c:if test="${user.gender != g}">
                                                    <option value="${g}">${g}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" id="inputAddress" class="form-control" name="address" />
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhoneNumber">Phone Number</label>
                                        <input type="text" id="inputPhoneNumber" class="form-control" name="phoneNumber" />
                                    </div>
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>BirthDate:</label>
                                        <div class="input-group date">
                                            <input type="date" class="form-control" name="birthDate" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputVote">Vote</label>
                                        <input type="number" id="inputVote" class="form-control" name="vote" />
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        <!-- /.card -->
                        </div>
                        <div class="col-md-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">Others</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputStatus">Status</label>
                                        <select name="status" class="form-control">
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${status}" var="s">
                                                <c:if test="${user.status == s}">
                                                    <option value="${s}" selected>${s}</option> 
                                                </c:if>
                                                <c:if test="${user.status != s}">
                                                    <option value="${s}">${s}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <!-- Select multiple-->
                                    <div class="form-group">
                                        <label>Select User Role</label>
                                        <select size="4" multiple name="userrolesId" class="form-control">
                                            <c:forEach items="${userroles}" var="userrole">
                                                <option value="${userrole.id}" ${userrole.checked ? 'selected' : ''} >${userrole.role}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                              <!-- /.card-body -->
                            </div>
                        <!-- /.card -->
                        </div>
                    </div>
                </mvc:form>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <jsp:include page="../include/management/footer-page.jsp" />
        <jsp:include page="../include/management/admin/js-page.jsp" />
        
        <!-- jquery-validation -->
        <script src="<c:url value="/resources-management/plugins/jquery-validation/jquery.validate.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/jquery-validation/additional-methods.min.js"/>"></script>
        
        <!-- Page specific script -->
        <script>
        $(function () {
//          $.validator.setDefaults({
//            submitHandler: function () {
//              alert( "Form successful submitted!" );
//            }
//          });
          $('#quickForm').validate({
            rules: {
              email: {
                required: true,
                email: true,
              },
              password: {
                required: true,
                minlength: 5
              },
              status: {
                required: true
              },
              fullName: {
                required: true
              },
              phoneNumber: {
                required: true,
                minlength: 9
              }
            },
            messages: {
              email: {
                required: "Please enter a email address",
                email: "Please enter a vaild email address"
              },
              password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
              },
              status: "Please select a status of room",
              fullName: "Please enter full name",
              phoneNumber: "Please enter number phone number",
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
              error.addClass('invalid-feedback');
              element.closest('.form-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
              $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
              $(element).removeClass('is-invalid');
            }
          });
        });
        </script>
    </body>
</html>
