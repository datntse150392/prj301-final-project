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
        <title>Trang chủ</title>
    </head>
    <body>
        <div class="hero" style="background-image: url('header_layout/images/images_header/hero_6.jpg'); height: 100%">
            <%@include file="header1.jsp"%>
            <div style="text-align: center; padding-top: 15%">
                <p class="lead fw-normal" style="color:white; font-size: 1.5rem">Cung cấp các sản phẩm cát vệ sinh, đồ ăn, phụ kiện, chăm sóc cho Boss.</p>
                <a class="btn btn-outline-secondary" style="color:white; border-color:white" href="https://shopee.vn/kat_planet_petshop">Tham khảo thêm tại đây</a>
            </div>
        </div>
    </div>
</body>
</html>
