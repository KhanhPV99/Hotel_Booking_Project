<%-- 
    Document   : customer-add
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
        <title>Customer Page</title>
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
                            <c:if test="${action == 'add'}">
                                <h1>Add Customer</h1>
                            </c:if>
                            <c:if test="${action != 'add'}">
                                <h1>Update Customer</h1>
                            </c:if>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/receptionist/index"/>">Home</a></li>
                                <c:if test="${action == 'add'}">
                                    <li class="breadcrumb-item active">Add Customer</li>
                                </c:if>
                                <c:if test="${action != 'add'}">
                                    <li class="breadcrumb-item active">Update Customer</li>
                                </c:if>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <mvc:form id="quickForm" action="${pageContext.request.contextPath}/receptionist/result-customer" method="POST" 
                  modelAttribute="guest" >
                    <input type="text" name="bookingId" value="${bookingId}" hidden />
                    <input type="text" name="bookingDetailId" value="${bookingDetailId}" hidden />
                    <input type="text" name="action" value="${action}" hidden />
                    <c:if test="${action == 'edit'}">
                        <input type="text" name="id" value="${guest.id}" hidden />
                    </c:if>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <a href="<c:url value="/receptionist/customer-info-edit/${action}/${bookingId}/${bookingDetailId}"/>" class="btn btn-secondary">Cancel</a>
                                <c:if test="${action == 'add'}">
                                    <button type="submit" class="btn btn-success float-right">Create</button>
                                </c:if>
                                <c:if test="${action != 'add'}">
                                    <button type="submit" class="btn btn-success float-right">Update</button>
                                </c:if>
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
                                        <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Email" value="${guest.email}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputFullName">Full Name</label>
                                        <input type="text" id="inputFullName" class="form-control" name="fullName" value="${guest.fullName}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender">Gender</label>
                                        <select name="gender" class="form-control" >
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${gender}" var="g">
                                                <c:if test="${guest.gender == g}">
                                                    <option value="${g}" selected>${g}</option> 
                                                </c:if>
                                                <c:if test="${guest.gender != g}">
                                                    <option value="${g}">${g}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhoneNumber">Phone Number</label>
                                        <input type="text" id="inputPhoneNumber" class="form-control" name="phoneNumber" value="${guest.phoneNumber}"/>
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
                                        <label for="inputIdCard">ID Card</label>
                                        <input type="text" id="inputIdCard" class="form-control" name="idCard" value="${guest.idCard}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" id="inputAddress" class="form-control" name="address" value="${guest.address}"/>
                                    </div>
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>BirthDate:</label>
                                        <div class="input-group date">
                                            <input type="date" class="form-control" name="birthDate" value="${guest.birthDate}"/>
                                        </div>
                                    </div>
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>Create Date:</label>
                                        <div class="input-group date">
                                            <c:if test="${action == 'add'}">
                                                <input type="date" class="form-control datetimepicker-input" name="createDate" value="${today}" disabled/>
                                                <input type="date" class="form-control datetimepicker-input" name="createDate" value="${today}" hidden/>
                                            </c:if>
                                            <c:if test="${action != 'add'}">
                                                <input type="date" class="form-control datetimepicker-input" name="createDate" value="${guest.createDate}"/>
                                            </c:if>
                                        </div>
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
              fullName: {
                required: true
              },
              phoneNumber: {
                required: true,
                minlength: 9
              },
              idCard: {
                required: true
              }
            },
            messages: {
              email: {
                required: "Please enter a email address",
                email: "Please enter a vaild email address"
              },
              fullName: "Please enter full name",
              phoneNumber: "Please enter number phone number",
              idCard: "Please enter ID Card number"
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
