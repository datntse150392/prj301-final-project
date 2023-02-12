<%-- 
    Document   : cart
    Created on : Jan 9, 2023, 10:02:18 PM
    Author     : nguyenthanhdat
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
        <!-- Bootstrap icon !-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

        <!-- Set Locate !-->
        <fmt:setLocale value="vi_VN"/>

        <title>Tất cả sản phẩm</title>
    </head>
    <body  class="hero" style="background-image: url('Layout/header_layout/images/images_header/hero_6.jpg'); height: auto">
        <section class="hero" style="min-height: 900px;">
            <%@include file="header1.jsp"%>
            <h4 style="color: white; text-align: center">${msg_purchase}</h4>
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-white">Đơn hàng của bạn</h3>
                        </div>

                        <c:forEach var="product" items="${list_purchase_history}">
                            <div class="card rounded-3 mb-4" style="background: transparent; border: 2px solid rgba(255,255,255,0.5); backdrop-filter: blur(15px);">
                                <div class="card-body p-4">                                        
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                src="${product.address_link}"
                                                class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p style="color: white">${product.name}</p>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <p style="color: white"><span">Số lượng: ${product.count}</span></p>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <p style="color: white">
                                                Thành tiền: <fmt:formatNumber value ="${product.price * product.count}" type = "currency"/>
                                            </p>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <form action="delete_cart" method="post">
                                                <input type="hidden" name="cart_pid" value="${product.pid}">
                                                <button type="submit" style="display:contents"><i class="bi bi-trash" style="color:white; font-size: 20px"></i></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach> 

                        <div class="card mb-4" style="background: transparent; border: 2px solid rgba(255,255,255,0.5); backdrop-filter: blur(15px);">
                            <div class="card-body p-4 d-flex flex-row" style="align-items: center;">
                                <div class="form-outline flex-fill">
                                    <h3 style="color: white">
                                        Tổng hóa đơn: <fmt:formatNumber value = "${total_price}" type = "currency"/>
                                    </h3>
                                </div>
                                <form action="cart" method="post">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-outline-warning btn-lg ms-3">Thanh toán</button>
                                    </div>
                                </form>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
