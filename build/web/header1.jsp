<%-- 
    Document   : header1
    Created on : Jan 31, 2023, 2:18:04 AM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&amp;display=swap" rel="stylesheet">

        <link rel="stylesheet" href="Layout/header_layout/fonts/fonts_header/icomoon/style.css">

        <link rel="stylesheet" href="Layout/header_layout/css/header/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="Layout/header_layout/css/header/bootstrap.min.css">

        <!-- Style -->
        <link rel="stylesheet" href="Layout/header_layout/css/header/style.css">

        <title>JSP Page</title>

    </head>
    <body style="height: 100%">
        <!-- Header for Guest -->
        <c:if test="${admin == null  && user_account == null}">
            <header role="banner" style="position: inherit;">
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="container">
                        <a class="navbar-brand" href="index.html">Kat Planet</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarsExample05">
                            <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                                <li class="nav-item">
                                    <a class="nav-link active" href="homepage">Trang chủ</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản phẩm</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="allproduct">Tất cả sản phẩm</a>
                                        <a class="dropdown-item" href="list_product1">Cát vệ sinh</a>
                                        <a class="dropdown-item" href="list_product2">Dụng cụ vệ sinh</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Giới thiệu</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Shoppe</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Chăm sóc khách hàng</a>
                                </li>
                            </ul>

                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="account_setting" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Thông tin tài khoản</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="login">Đăng nhập</a>
                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                </nav>
            </header>
        </c:if>

        <!-- Header dành cho user -->
        <c:if test="${user_account != null }">
            <header role="banner" style="position: inherit">
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="container">
                        <a class="navbar-brand" href="#">Kat Planet</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarsExample05">
                            <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                                <li class="nav-item">
                                    <a class="nav-link active" href="homepage">Trang chủ</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản phẩm</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="allproduct">Tất cả sản phẩm</a>
                                        <a class="dropdown-item" href="list_product1">Cát vệ sinh</a>
                                        <a class="dropdown-item" href="list_product2">Dụng cụ vệ sinh</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Giới thiệu</a>
                                </li>                      
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Chăm sóc khách hàng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="cart.jsp">Giỏ hàng</a>
                                </li>
                            </ul>

                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hi,  ${user_account.displayname}</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="account_setting">Thông tin tài khoản</a>
                                        <a class="dropdown-item" href="history">Lịch sử giao dịch</a>
                                        <a class="dropdown-item" href="logout">Đăng xuất</a>
                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                </nav>
            </header>
        </c:if>

        <!-- Header dành cho admin -->
        <c:if test="${admin != null }">
            <header role="banner" style="position: inherit;">
                <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                    <div class="container">
                        <a class="navbar-brand" href="#">Kat Planet</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarsExample05">
                            <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                                <li class="nav-item">
                                    <a class="nav-link active" href="homepage">Trang chủ</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sản phẩm</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="allproduct">Tất cả sản phẩm</a>
                                        <a class="dropdown-item" href="list_product1">Cát vệ sinh</a>
                                        <a class="dropdown-item" href="list_product2">Dụng cụ vệ sinh</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Giới thiệu</a>
                                </li>                      
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Chăm sóc khách hàng</a>
                                </li>
                            </ul>

                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Hi,  ${admin.displayname}</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                                        <a class="dropdown-item" href="account_setting">Thông tin tài khoản</a>
                                        <a class="dropdown-item" href="addproduct">Thêm sản phẩm</a>
                                        <a class="dropdown-item" href="logout">Đăng xuất</a>
                                    </div>
                                </li>
                            </ul>

                        </div>
                    </div>
                </nav>
            </header>
        </c:if>

        <!-- END header -->
        <script src="Layout/header_layout/js/js_header/jquery-3.3.1.min.js"></script>
        <script src="Layout/header_layout/js/js_header/popper.min.js"></script>
        <script src="Layout/header_layout/js/js_header/bootstrap.min.js"></script>
        <script src="Layout/header_layout/js/js_header/jquery.sticky.js"></script>
        <script src="Layout/header_layout/js/js_header/main.js"></script>

    </body>
</html>
