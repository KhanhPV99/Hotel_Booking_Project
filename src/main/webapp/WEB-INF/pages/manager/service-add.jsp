<%-- 
    Document   : service-add
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
        <title>Service Page</title>
        <jsp:include page="../include/management/manager/css-page.jsp" />
        <!-- Ekko Lightbox -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/ekko-lightbox/ekko-lightbox.css"/>">
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
                                <h1>Add Service</h1>
                            </c:if>
                            <c:if test="${action != 'add'}">
                                <h1>Update Service</h1>
                            </c:if>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/manager/index"/>">Home</a></li>
                                <c:if test="${action == 'add'}">
                                    <li class="breadcrumb-item active">Add Service</li>
                                </c:if>
                                <c:if test="${action != 'add'}">
                                    <li class="breadcrumb-item active">Update Service</li>
                                </c:if>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <mvc:form id="quickForm" action="${pageContext.request.contextPath}/manager/result-service" method="POST" 
                  modelAttribute="service" enctype="multipart/form-data">
                    <c:if test="${action == 'edit'}">
                        <input type="text" name="id" value="${service.id}" hidden />
                    </c:if>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <a href="<c:url value="/manager/view-services"/>" class="btn btn-secondary">Cancel</a>
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
                                        <label for="inputName">Name</label>
                                        <input type="text" id="inputName" class="form-control" name="name" value="${service.name}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Status</label>
                                        <select name="status" class="form-control">
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${status}" var="s">
                                                <c:if test="${service.status == s}">
                                                    <option value="${s}" selected>${s}</option> 
                                                </c:if>
                                                <c:if test="${service.status != s}">
                                                    <option value="${s}">${s}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPrice">Price</label>
                                        <input type="number" id="inputPrice" class="form-control" name="price" value="${service.price}">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputOpenTime">Open Time</label>
                                        <input type="text" id="inputOpenTime" class="form-control" name="openTime" value="${service.openTime}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLocation">Location</label>
                                        <input type="text" id="inputLocation" class="form-control" name="location" value="${service.location}"/>
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
                                                <input type="date" class="form-control datetimepicker-input" name="createDate" value="${service.createDate}"/>
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
                                    <div class="col-sm-12" >
                                        <div class="form-group">
                                            <label for="inputDescription">Service Description</label>
                                            <textarea id="inputDescription" class="form-control" rows="5" name="description">${service.description}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPhoneNumber">Phone number</label>
                                            <input type="text" id="inputPhoneNumber" class="form-control" name="phoneNumber" value="${service.phoneNumber}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>Upload images</label>
                                            <br><input type="file" name="imagesUpload" accept="image/png, image/jpeg" multiple />
                                        </div>
                                    </div>
                                    
                                </div>
                              <!-- /.card-body -->
                            </div>
                        <!-- /.card -->
                        </div>
                    </div>
                </mvc:form>                        
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h4 class="card-title">Gallery</h4>
                                </div>
                                <div class="card-body">
                                    <div class="filter-container p-0 row">
                                        <c:forEach items="${service.images}" var="image">
                                            <div class="filtr-item col-sm-6" data-category="1">
                                                <a href="<c:url value="../../resources-management/images/${image.name}"/>"" data-toggle="lightbox" data-title="${image.name}">
                                                    <img src="<c:url value="../../resources-management/images/${image.name}"/>" class="img-fluid mb-2 rounded" style="width: 100%;""/>
                                                </a>
                                                <a class="btn btn-danger btn-sm" href="<c:url value="/deleteImageFromService/${image.id}"/>">
                                                    <i class="fas fa-trash">
                                                    </i>
                                                    Delete
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <jsp:include page="../include/management/footer-page.jsp" />
        <jsp:include page="../include/management/manager/js-page.jsp" />
        
        <!-- jquery-validation -->
        <script src="<c:url value="/resources-management/plugins/jquery-validation/jquery.validate.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/jquery-validation/additional-methods.min.js"/>"></script>
        
        <!-- Ekko Lightbox -->
        <script src="<c:url value="/resources-management/plugins/ekko-lightbox/ekko-lightbox.min.js"/>"></script>
        
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
              name: {
                required: true
              },
              status: {
                required: true
              },
              openTime: {
                required: true
              }
            },
            messages: {
              name: "Please enter a name",
              status: "Please select a status of service",
              openTime: "Please enter open time"
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
          
          $(document).on('click', '[data-toggle="lightbox"]', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox({
              alwaysShowClose: true
            });
          });

          $('.filter-container').filterizr({gutterPixels: 3});
          $('.btn[data-filter]').on('click', function() {
            $('.btn[data-filter]').removeClass('active');
            $(this).addClass('active');
          });
          
        });
        </script>
    </body>
</html>
