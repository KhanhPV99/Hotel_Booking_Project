<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" 
           prefix="sec" %>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<c:url value="/admin/index"/>" class="brand-link">
        <img src="<c:url value="/resources-management/dist/img/AdminLTELogo.png" />" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<c:url value="/resources-management/dist/img/user2-160x160.jpg" />" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">${username}</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="<c:url value="#"/>" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                
                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/admin/view-users" class="nav-link">
                                <i class="nav-icon fas fa-tree"></i>
                                <p>
                                    Users
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/admin/user-add" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Add User</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/admin/view-users" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all users</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/admin/view-comments" class="nav-link">
                                <i class="nav-icon fas fa-comment-alt"></i>
                                <p>Comments</p>
                            </a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_MANAGER')">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/manager/view-roomtypes" class="nav-link">
                                <i class="nav-icon fas fa-tree"></i>
                                <p>
                                    Room Type
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/roomtype-add" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Add Room Type</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-roomtypes" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all room type</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                        
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/manager/view-rooms" class="nav-link">
                                <i class="nav-icon fas fa-procedures"></i>
                                <p>
                                    Room
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/room-add" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Room Add</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-rooms" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all rooms</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                        
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/manager/view-services" class="nav-link">
                                <i class="nav-icon fas fa-server"></i>
                                <p>
                                    Service
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/service-add" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Service Add</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-services" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all services</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                        
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/manager/view-booking-detail" class="nav-link">
                                <i class="nav-icon fas fa-book"></i>
                                <p>
                                    Booking
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-bookings" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View booking</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-booking-chart" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Statistical chart</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/manager/view-promotions" class="nav-link">
                                <i class="nav-icon fas fa-save"></i>
                                <p>
                                    Promotion
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/promotion-add" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Promotion Add</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/manager/view-promotions" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all promotions</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_RECEPTIONIST')">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/receptionist/view-bookings" class="nav-link">
                                <i class="nav-icon fas fa-chart-pie"></i>
                                <p>
                                    Booking
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/receptionist/view-bookings" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View booking</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="${pageContext.request.contextPath}/receptionist/view-available-rooms" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View all available rooms</p>
                                    </a>
                                </li>     
                            </ul>
                        </li>
                    </sec:authorize>
                </sec:authorize>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
