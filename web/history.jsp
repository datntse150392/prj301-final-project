<%-- 
    Document   : history
    Created on : Jan 14, 2023, 1:25:32 AM
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
        <title>Lịch sử giao dịch</title>
    </head>
    <body  class="hero"style="background-image: url('header_layout/images/images_header/hero_5.jpg'); height: auto">
        <%@include file="header1.jsp"%>
        <div style="margin-top: -10%">
            <form action="cart" method="post">
                <section class="h-100">
                    <div class="container h-100 py-5">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-10">

                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h3 class="fw-normal mb-0 text-white">Lịch sử giao dịch của bạn</h3>
                                    <small class="fw-normal mb-0 text-white">2 đơn gần nhất</small>
                                </div>

                                <c:forEach var="purchase" items="${list}">
                                    <div class="card rounded-3 mb-4">
                                        <div class="card-body p-4">
                                            <div class="row d-flex justify-content-between align-items-center">
                                                <div class="col-md-2 col-lg-2 col-xl-2">
                                                    <img
                                                        src="${purchase.address_link}"
                                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                </div>
                                                <div class="col-md-3 col-lg-3 col-xl-3">
                                                    <p class="lead fw-normal mb-2">${purchase.name}</p>                                                                                 
                                                </div>
                                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                    <p><span class="text-muted">Số lượng: ${purchase.count}</span></p>
                                                </div>
                                                <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                    <p class="mb-0">Thành tiền: ${purchase.price * purchase.count}</p>
                                                </div>                                           
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach> 

                            </div>
                        </div>
                    </div>
                </section>
            </form>
        </div>
    </body>
</html>
