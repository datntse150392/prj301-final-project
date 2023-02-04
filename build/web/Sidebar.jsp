<%-- 
    Document   : Sidebar
    Created on : Feb 4, 2023, 2:05:26 AM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">





        <link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">

        <title>Sidebar</title>
    </head>
    <body>
        <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
            <p class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                <img style="width: 40%" src="logo/sidebar/logo2.png" alt="alt"/>
                KatPlanet Petshop
            </p>
            <ul class="list-unstyled ps-0">
                <li class="mb-1">
                    <a href="homepage" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Trang chủ</a>
                </li>
                <li class="mb-1">
                    <a href="allproduct" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Tất cả sản phẩm</a>
                </li>
                <li class="mb-1">
                    <a href="list_product1" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Cát vệ sinh</a>

                </li>
                <li class="mb-1">
                    <a href="list_product2" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Dụng cụ vệ sinh</a>

                </li>
                <li class="border-top my-3">
                <c:if test="${admin != null}">
                    <li class="mb-1">
                        <a href="addproduct" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Thêm sản phẩm</a>  
                    </li>
                    <li class="mb-1">
                        <a href="logout" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Đăng xuất</a>    
                    </li>   
                </c:if>   
                <c:if test="${user_account != null }">
                    <li class="mb-1">
                        <a href="cart.jsp" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Giỏ hàng</a>  
                    </li>
                    <li class="mb-1">
                        <a href="logout" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Đăng xuất</a>  
                    </li>
                </c:if>    
                <c:if test="${admin == null  && user_account == null}">
                    <li class="mb-1">
                        <a href="login" class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed">Đăng nhập</a>  
                    </li>
                </c:if>
            </ul>
        </div>
    </body>
</html>
