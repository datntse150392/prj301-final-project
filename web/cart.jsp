<%-- 
    Document   : cart
    Created on : Jan 9, 2023, 10:02:18 PM
    Author     : nguyenthanhdat
--%>
<!-- Font Awesome -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    rel="stylesheet"
    />
<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
    />
<!-- MDB -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
    rel="stylesheet"
    />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
    </head>
    <body style="background-color: black; height: 100%">
        <section class="hero">
            <%@include file="header1.jsp"%>
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-10">

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="fw-normal mb-0 text-white">Đơn hàng của bạn</h3>
                        </div>

                        <c:forEach var="product" items="${list_purchase_history}">
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">                                        
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                src="${product.address_link}"
                                                class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p class="lead fw-normal mb-2">${product.name}</p>
                                            <!-- comment -->                                              
                                            <p><span class="text-muted" >Đơn giá: ${product.price}</span> /1 sản phẩm</p>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <p><span class="text-muted">Số lượng: ${product.count}</span></p>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <p class="mb-0">Thành tiền: ${product.price * product.count}</p>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <form action="delete_cart" method="post">
                                                <input type="hidden" name="cart_pid" value="${product.pid}">
                                                <button type="submit" style="display:contents"><i class="fas fa-trash fa-lg"></i></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach> 

                        <!-- Voucher form                    
                        <div class="card mb-4">
                            <div class="card-body p-4 d-flex flex-row">
                                <div class="form-outline flex-fill">
                                    <input type="text" id="form1" class="form-control form-control-lg" />
                                    <label class="form-label" for="form1">Mã khuyến mãi</label>
                                </div>
                                <button type="button" class="btn btn-outline-warning btn-lg ms-3">Áp dụng</button>
                            </div>
                        </div>
                        -->   


                        <div class="card">
                            <form action="cart" method="post">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-warning btn-block btn-lg">Thanh toán</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
