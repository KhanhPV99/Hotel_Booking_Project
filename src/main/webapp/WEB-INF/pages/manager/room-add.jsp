<%-- 
    Document   : room-add
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
        <title>Room Page</title>
        <jsp:include page="../include/management/manager/css-page.jsp" />
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
                                <h1>Add Room</h1>
                            </c:if>
                            <c:if test="${action != 'add'}">
                                <h1>Update Room</h1>
                            </c:if>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/manager/index"/>">Home</a></li>
                                <c:if test="${action == 'add'}">
                                    <li class="breadcrumb-item active">Add Room</li>
                                </c:if>
                                <c:if test="${action != 'add'}">
                                    <li class="breadcrumb-item active">Update Room</li>
                                </c:if>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <mvc:form id="quickForm" action="${pageContext.request.contextPath}/manager/result-room" method="POST" 
                  modelAttribute="room" >
                    <c:if test="${action == 'edit'}">
                        <input type="text" name="id" value="${room.id}" hidden />
                    </c:if>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                            <a href="<c:url value="/manager/view-rooms"/>" class="btn btn-secondary">Cancel</a>
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
                                        <label for="inputRoomNum">Room Number</label>
                                        <input type="text" id="inputRoomNum" class="form-control" name="roomNumber" value="${room.roomNumber}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Status</label>
                                        <select name="status" class="form-control">
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${status}" var="s">
                                                <c:if test="${room.status == s}">
                                                    <option value="${s}" selected>${s}</option> 
                                                </c:if>
                                                <c:if test="${room.status != s}">
                                                    <option value="${s}">${s}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPrice">Price</label>
                                        <input type="number" id="inputPrice" class="form-control" name="price" value="${room.price}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputNumberOfBed">Number Of Bed</label>
                                        <input type="number" id="inputNumberOfBed" class="form-control" name="numberOfBed" value="${room.numberOfBed}">
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
                                                <input type="date" class="form-control datetimepicker-input" name="createDate" value="${room.createDate}"/>
                                            </c:if>
                                        </div>
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
                                    <div class="col-sm-12">
                                        <!-- select -->
                                        <div class="form-group">
                                            <label>Select Room Type</label>
<!--                                            <select name="roomType.id" class="form-control">
                                                <c:forEach items="${roomtypes}" var="roomtype">
                                                    <option value="${roomtype.id}">${roomtype.name}</option> 
                                                </c:forEach>
                                            </select>-->
                                            <select name="roomType.id" class="form-control">
                                                <option selected disabled>Select one</option>
                                                <c:forEach items="${roomtypes}" var="roomtype">
                                                    <c:if test="${room.roomType.name == roomtype.name}">
                                                        <option value="${roomtype.id}" selected>${roomtype.name}</option> 
                                                    </c:if>
                                                    <c:if test="${room.roomType.name != roomtype.name}">
                                                        <option value="${roomtype.id}">${roomtype.name}</option> 
                                                    </c:if>
                                                </c:forEach>
                                            </select>
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
        <jsp:include page="../include/management/manager/js-page.jsp" />
        
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
              roomNumber: {
                required: true
              },
              status: {
                required: true
              },
              price: {
                required: true,
                minlength: 0
              },
              numberOfBed: {
                required: true,
                minlength: 1
              },
              roomType: {
                required: true
              }
            },
            messages: {
              roomNumber: "Please enter a room number",
              status: "Please select a status of room",
              price: "Please enter price of room",
              numberOfBed: "Please enter number of beds of room",
              roomType: "Please select room type"
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
