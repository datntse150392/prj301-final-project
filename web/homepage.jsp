<%-- 
    Document   : homepage
    Created on : Jan 7, 2023, 2:41:26 AM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS !-->
        <link rel="stylesheet" href="Layout/homepage_layout/style.css"/>
        <title>Trang chủ</title>
    </head>
    <body>
        <div class="hero" style="background-image: url('Layout/header_layout/images/images_header/hero_6.jpg'); height: 100%">
            <%@include file="header1.jsp"%>
            <div class="content">
                <h1>Đồng hành cùng BOSS không lo về GIÁ</h1>
                <p style="margin: 20px auto;font-weight: 100;line-height: 25px; color:#fff">Cung cấp các sản phẩm cát vệ sinh, đồ ăn, phụ kiện, chăm sóc cho Boss.</p>
                <div>
                    <button style="border-radius: 25px;margin: 20px 10px;" type="button"><span></span>
                        <a  style="margin: 20px auto;font-weight: 100;line-height: 25px; color:#fff" href="https://shopee.vn/kat_planet_petshop">Xem thêm</a>
                    </button>
                    <button style="border-radius: 25px;margin: 20px 10px;" type="button"><span></span>
                        <a  style="margin: 20px auto;font-weight: 100;line-height: 25px; color:#fff" href="allproduct">Mua ngay tại đây</a>
                    </button>
                </div>          
            </div>
        </div>
    </div>
</body>
</html>
