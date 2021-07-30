<%-- 
    Document   : user-profile
    Created on : Jun 23, 2021, 3:05:03 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        
        <!-- Google Font: Source Sans Pro --> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome --> 
        <link rel="stylesheet" href="<c:url value="/resources-management/plugins/fontawesome-free/css/all.min.css"/>">
        <!-- Theme style --> 
        <link rel="stylesheet" href="<c:url value="/resources-management/dist/css/adminlte.min.css"/>">

    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <jsp:include page="include/management/menu-page.jsp" />
        <jsp:include page="include/management/sidebar-container-page.jsp" />
        
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>User Profile</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<c:url value="/user-profile"/>">Home</a></li>
                                <li class="breadcrumb-item active">User Profile</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <section class="content">
                <div class="container-fluid">
                    <c:if test="${type != null && type == 'error'}">
                        <div class="alert alert-warning alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h5><i class="icon fas fa-exclamation-triangle"></i> Alert!</h5>
                                ${message}
                        </div>
                    </c:if>
                    <div class="row">
                        <div class="col-md-3">

                          <!-- Profile Image -->
                          <div class="card card-primary card-outline">
                            <div class="card-body box-profile">
                              <div class="text-center">
                                <img class="profile-user-img img-fluid img-circle"
                                     src="<c:url value="/resources-management/dist/img/user1-128x128.jpg"/>"
                                     alt="User profile picture">
                              </div>

                              <h3 class="profile-username text-center">${user.fullName}</h3>

                              <p class="text-muted text-center">Software Engineer</p>

                              <p class="text-muted text-center">
                                <c:forEach items="${roles}" var="role">
                                    <span class="badge badge-success">${role}</span>
                                </c:forEach>
                              </p>

                              <ul class="list-group list-group-unbordered mb-3">
                                <li class="list-group-item">
                                  <b>Followers</b> <a class="float-right">1,322</a>
                                </li>
                                <li class="list-group-item">
                                  <b>Following</b> <a class="float-right">543</a>
                                </li>
                                <li class="list-group-item">
                                  <b>Friends</b> <a class="float-right">13,287</a>
                                </li>
                              </ul>

                              <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                            </div>
                            <!-- /.card-body -->
                          </div>
                          <!-- /.card -->

                          <!-- About Me Box -->
                          <div class="card card-primary">
                            <div class="card-header">
                              <h3 class="card-title">About Me</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <strong><i class="fas fa-book mr-1"></i> Education</strong>

                              <p class="text-muted">
                                B.S. in Computer Science from the University of Tennessee at Knoxville
                              </p>

                              <hr>

                              <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>

                              <p class="text-muted">${user.address}</p>

                              <hr>

                              <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>

                              <p class="text-muted">
                                <span class="tag tag-danger">UI Design</span>
                                <span class="tag tag-success">Coding</span>
                                <span class="tag tag-info">Javascript</span>
                                <span class="tag tag-warning">PHP</span>
                                <span class="tag tag-primary">Node.js</span>
                              </p>

                              <hr>

                              <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>

                              <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                            </div>
                            <!-- /.card-body -->
                          </div>
                          <!-- /.card -->
                        </div>
                    
                        <!-- /.col -->
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-header p-2">
                                  <ul class="nav nav-pills">
                                    <li class="nav-item"><a class="nav-link active" href="#changepassword" data-toggle="tab">Change Password</a></li>
<!--                                    <li class="nav-item"><a class="nav-link" href="#comments" data-toggle="tab">Comments</a></li>-->
                                    <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Settings</a></li>
<!--                                    <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">Timeline</a></li>-->
                                  </ul>
                                </div><!-- /.card-header -->
                                <div class="card-body">
                                    <div class="tab-content">
                                        <div class="active tab-pane" id="changepassword">
                                            <form class="form-horizontal" action="${pageContext.request.contextPath}/change-password" method="POST">
                                                <input type="text" name="id" value="${user.id}" hidden />
                                                <div class="form-group row">
                                                  <label for="inputNewPassword" class="col-sm-3 col-form-label">New Password</label>
                                                  <div class="col-sm-9">
                                                      <input type="password" class="form-control" id="inputNewPassword" name="newPassword" placeholder="Type a new password">
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <label for="inputConfirmPassword" class="col-sm-3 col-form-label">Confirm Password</label>
                                                  <div class="col-sm-9">
                                                      <input type="password" class="form-control" id="inputConfirmPassword" name="confirmPassword" placeholder="Type the confirm password">
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <div class="offset-sm-3 col-sm-12">
                                                    <button type="submit" class="btn btn-danger">Submit</button>
                                                  </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- /.tab-pane -->
<!--                                        <div class="tab-pane" id="comments">
                                            <c:forEach items="${user.comments}" var="comment">
                                             Comment 
                                              <div class="post">
                                                <div class="user-block">
                                                  <img class="img-circle img-bordered-sm" src="<c:url value="/resources-management/dist/img/user1-128x128.jpg"/>" alt="user image">
                                                  <span class="username">
                                                    <a href="#">${user.fullName}</a>
                                                    <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                                                  </span>
                                                  <span class="description">Shared publicly - ${comment.createDate}</span>
                                                </div>
                                                 /.user-block 
                                                <p>${comment.content}</p>

                                                <p>
                                                  <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                                                  <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                                                  <span class="float-right">
                                                    <a href="#" class="link-black text-sm">
                                                      <i class="far fa-comments mr-1"></i> Comments (5)
                                                    </a>
                                                  </span>
                                                </p>
                                              </div>
                                               /.post 
                                            </c:forEach>
                                            <div class="post">
                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/comment-add" method="POST">
                                                    <input type="text" name="id" value="${user.id}" hidden />
                                                    <div class="input-group mb-3">
                                                        <input class="form-control rounded-0" type="text" name="content" placeholder="Type a comment">
                                                        <span class="input-group-prepend">
                                                            <button type="submit" class="btn btn-info btn-flat">Submit</button>
                                                        </span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>-->
                                        <!-- /.tab-pane -->
                                        <div class="tab-pane" id="settings">
                                            <form class="form-horizontal" action="${pageContext.request.contextPath}/result-user" method="POST">
                                                <input type="text" name="id" value="${user.id}" hidden />
                                                <div class="form-group row">
                                                  <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                                                  <div class="col-sm-10">
                                                      <input type="email" class="form-control" id="inputEmail" value="${user.email}" disabled />
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <label for="inputName2" class="col-sm-2 col-form-label">Name</label>
                                                  <div class="col-sm-10">
                                                      <input type="text" class="form-control" id="inputName2" name="fullName" value="${user.fullName}">
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <label for="inputPhoneNumber" class="col-sm-2 col-form-label">Phone Number</label>
                                                  <div class="col-sm-10">
                                                      <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber" value="${user.phoneNumber}">
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <label for="inputAddress" class="col-sm-2 col-form-label">Address</label>
                                                  <div class="col-sm-10">
                                                      <input type="text" class="form-control" id="inputAddress" name="address" value="${user.address}">
                                                  </div>
                                                </div>
                <!--                                <div class="form-group row">
                                                  <label for="inputExperience" class="col-sm-2 col-form-label">Experience</label>
                                                  <div class="col-sm-10">
                                                    <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <label for="inputSkills" class="col-sm-2 col-form-label">Skills</label>
                                                  <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                                                  </div>
                                                </div>
                                                <div class="form-group row">
                                                  <div class="offset-sm-2 col-sm-10">
                                                    <div class="checkbox">
                                                      <label>
                                                        <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                                                      </label>
                                                    </div>
                                                  </div>
                                                </div>-->
                                                <div class="form-group row">
                                                  <div class="offset-sm-2 col-sm-12">
                                                    <button type="submit" class="btn btn-danger">Submit</button>
                                                  </div>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- /.tab-pane -->
                                        
<!--                                        <div class="tab-pane" id="timeline">
                                           The timeline 
                                          <div class="timeline timeline-inverse">
                                             timeline time label 
                                            <div class="time-label">
                                              <span class="bg-danger">
                                                10 Feb. 2014
                                              </span>
                                            </div>
                                             /.timeline-label 
                                             timeline item 
                                            <div>
                                              <i class="fas fa-envelope bg-primary"></i>

                                              <div class="timeline-item">
                                                <span class="time"><i class="far fa-clock"></i> 12:05</span>

                                                <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                                                <div class="timeline-body">
                                                  Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                                  weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                                  jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                                  quora plaxo ideeli hulu weebly balihoo...
                                                </div>
                                                <div class="timeline-footer">
                                                  <a href="#" class="btn btn-primary btn-sm">Read more</a>
                                                  <a href="#" class="btn btn-danger btn-sm">Delete</a>
                                                </div>
                                              </div>
                                            </div>
                                             END timeline item 
                                             timeline item 
                                            <div>
                                              <i class="fas fa-user bg-info"></i>

                                              <div class="timeline-item">
                                                <span class="time"><i class="far fa-clock"></i> 5 mins ago</span>

                                                <h3 class="timeline-header border-0"><a href="#">Sarah Young</a> accepted your friend request
                                                </h3>
                                              </div>
                                            </div>
                                             END timeline item 
                                             timeline item 
                                            <div>
                                              <i class="fas fa-comments bg-warning"></i>

                                              <div class="timeline-item">
                                                <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                                                <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                                                <div class="timeline-body">
                                                  Take me to your leader!
                                                  Switzerland is small and neutral!
                                                  We are more like Germany, ambitious and misunderstood!
                                                </div>
                                                <div class="timeline-footer">
                                                  <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                                                </div>
                                              </div>
                                            </div>
                                             END timeline item 
                                             timeline time label 
                                            <div class="time-label">
                                              <span class="bg-success">
                                                3 Jan. 2014
                                              </span>
                                            </div>
                                             /.timeline-label 
                                             timeline item 
                                            <div>
                                              <i class="fas fa-camera bg-purple"></i>

                                              <div class="timeline-item">
                                                <span class="time"><i class="far fa-clock"></i> 2 days ago</span>

                                                <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                                                <div class="timeline-body">
                                                  <img src="https://placehold.it/150x100" alt="...">
                                                  <img src="https://placehold.it/150x100" alt="...">
                                                  <img src="https://placehold.it/150x100" alt="...">
                                                  <img src="https://placehold.it/150x100" alt="...">
                                                </div>
                                              </div>
                                            </div>
                                             END timeline item 
                                            <div>
                                              <i class="far fa-clock bg-gray"></i>
                                            </div>
                                          </div>
                                        </div>-->
                                        <!-- /.tab-pane -->
                                    </div><!-- /.tab-content -->
                                </div><!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>     
        <jsp:include page="include/management/footer-page.jsp" />

        <!-- jQuery -->
        <script src="<c:url value="/resources-management/plugins/jquery/jquery.min.js"/>"></script>
        <!-- Bootstrap 4 -->
        <script src="<c:url value="/resources-management/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <!-- DataTables  & Plugins -->
        <script src="<c:url value="/resources-management/plugins/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-responsive/js/dataTables.responsive.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/dataTables.buttons.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/jszip/jszip.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/pdfmake/pdfmake.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/pdfmake/vfs_fonts.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.html5.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.print.min.js"/>"></script>
        <script src="<c:url value="/resources-management/plugins/datatables-buttons/js/buttons.colVis.min.js"/>"></script>
        <!-- AdminLTE App -->
        <script src="<c:url value="/resources-management/dist/js/adminlte.min.js"/>"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="<c:url value="/resources-management/dist/js/demo.js"/>"></script>
        <!-- Page specific script -->
        <script>
          $(function () {
            $("#example1").DataTable({
              "responsive": true, "lengthChange": false, "autoWidth": false,
              "buttons": ["csv", "excel", "pdf"]
            }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
            $('#example2').DataTable({
              "paging": true,
              "lengthChange": false,
              "searching": false,
              "ordering": true,
              "info": true,
              "autoWidth": false,
              "responsive": true,
            });
          });
        </script>
    </body>
</html>
