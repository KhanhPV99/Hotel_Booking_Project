<%-- 
    Document   : promotion-add
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
        <title>Promotion Page</title>
        <jsp:include page="../include/management/manager/css-page.jsp" />
        <!-- daterange picker -->
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.css"/>">
        
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
                                <h1>Add Promotion</h1>
                            </c:if>
                            <c:if test="${action != 'add'}">
                                <h1>Update Promotion</h1>
                            </c:if>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/manager/index"/>">Home</a></li>
                                <c:if test="${action == 'add'}">
                                    <li class="breadcrumb-item active">Add Promotion</li>
                                </c:if>
                                <c:if test="${action != 'add'}">
                                    <li class="breadcrumb-item active">Update Promotion</li>
                                </c:if>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <mvc:form id="quickForm" action="${pageContext.request.contextPath}/manager/result-promotion" method="POST" 
                  modelAttribute="promotion" >
                    <c:if test="${action == 'edit'}">
                        <input type="text" name="id" value="${promotion.id}" hidden />
                    </c:if>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <a href="<c:url value="/manager/view-promotions"/>" class="btn btn-secondary">Cancel</a>
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
                                        <input type="text" id="inputName" class="form-control" name="name" value="${promotion.name}"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Status</label>
                                        <select name="status" class="form-control">
                                            <option selected disabled>Select one</option>
                                            <c:forEach items="${status}" var="s">
                                                <c:if test="${promotion.status == s}">
                                                    <option value="${s}" selected>${s}</option> 
                                                </c:if>
                                                <c:if test="${promotion.status != s}"> 
                                                    <option value="${s}">${s}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDiscount">Discount</label>
                                        <input type="number" id="inputDiscount" class="form-control" name="discount" value="${promotion.discount}"/>
                                    </div>
                                    <!-- Date -->
                                    <div class="form-group">
                                        <label>Date range:</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="dateRange" autocomplete="off"/>
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">
                                                  <i class="far fa-calendar-alt"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <c:if test="${action == 'add'}">
                                            <input type="hidden" id="startDate" name="startDate" value="${today}"/>
                                            <input type="hidden" id="endDate" name="endDate" value="${today}"/>
                                        </c:if>
                                        <c:if test="${action != 'add'}">
                                            <input type="hidden" id="startDate" name="startDate" value="${promotion.startDate}"/>
                                            <input type="hidden" id="endDate" name="endDate" value="${promotion.endDate}"/>
                                        </c:if>
                                        
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
                                        <div class="form-group">
                                            <label for="inputDescription">Promotion Description</label>
                                            <textarea id="inputDescription" class="form-control" rows="4" name="description">${promotion.description}</textarea>
                                        </div>
                                        <!-- Select multiple-->
                                        <div class="form-group">
                                            <label>Select Room Types</label>
                                            <select size="9" multiple name="roomtypesId" class="form-control">
                                                <c:forEach items="${roomtypes}" var="roomtype">
                                                    <option value="${roomtype.id}" ${roomtype.checked ? 'selected' : ''} >${roomtype.name}</option>
                                                </c:forEach>
                                            </select>
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
                                                    <input type="date" class="form-control datetimepicker-input" name="createDate" value="${promotion.createDate}"/>
                                                </c:if>
                                            </div>
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
        
        <!-- date-range-picker -->
        <script src="<c:url value="/resources-management/plugins/moment/moment.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/daterangepicker/daterangepicker.js"/>"></script>
        
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
              discount: {
                required: true,
                minlength: 0
              }
            },
            messages: {
              name: "Please enter a name",
              status: "Please select a status of promotion",
              discount: "Please enter discount of promotion"
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
        
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
//        console.log('You startDate: ' + startDate);
//        console.log('You startDate: ' + endDate);
    
        var $dateRange = $('#dateRange');
        $dateRange.daterangepicker({
            locale: {
                format: 'YYYY-MM-DD'
            },
            startDate: startDate,
            endDate: endDate
        });
        $dateRange.on('apply.daterangepicker', function (ev, picker) {
            $('input[name="startDate"]').val(picker.startDate.format('YYYY-MM-DD'));
            $('input[name="endDate"]').val(picker.endDate.format('YYYY-MM-DD'));
        });
        
        </script> 
    </body>
</html>
