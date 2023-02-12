<%-- 
    Document   : product
    Created on : Jan 6, 2023, 8:18:23 PM
    Author     : nguyenthanhdat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Site Icon -->
        <link rel="shortcut Icon" type="image/png" href="img/favicon.png">

        <!-- Font Awesome Icons -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

        <!-- Custom CSS -->
        <link href="Layout/product_layout/layout.css" rel="stylesheet">

        <!-- Bootstrap icon !-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

        <!-- Set Locate !-->
        <fmt:setLocale value="vi_VN"/>

        <title>Dụng cụ vệ sinh</title>
    </head>
    <body style="overflow-x: hidden; height: auto">
        
        
        <jsp:include page="header1.jsp"/>
        <section>
            <div class="container">
                <div class="row" style="place-content: center; width: auto">
                    <div class="col-lg-9" style="padding-left: 30px;">
                        <div class="row" style="padding-bottom: 15px">
                            <div class="col" style="color:white">
                                <h2>Dụng cụ vệ sinh</h2>
                            </div>

                            <!-- Sắp xếp trang !-->
                            <div class="col">
                                <select class="form-control" name="sort_option">
                                    <option value="">Default Sorting</option>
                                    <option value="popularity">Sorting by popularity</option>
                                    <option value="average">Sorting by average</option>
                                    <option value="latest">Sorting by latest</option>
                                    <option value="low">Sorting by low</option>
                                    <option value="high">Sorting by high</option>
                                </select>
                            </div>
                        </div>

                        <!-- Hiển thị sản phẩm !-->
                        <div class="row">
                            <c:forEach var="product" items="${list_product}">
                                <c:forEach var="lname_product" items="${listname_product}">
                                    <c:forEach var="img" items="${list_img}">
                                        <c:if test="${product.lid == lname_product.lid && img.imgid == product.imgid && product.lid == 2}">
                                            <div class="col-sm-3 col-md-6 col-lg-4" style="padding: 15px 15px; ">
                                                <!-- Hiển thị sản phẩm dành cho khách !-->
                                                <c:if test="${user_account == null && admin == null}">
                                                    <div class="card" style="height: 320px;">
                                                        <div class="card-body text-center">
                                                            <img style="width: 150px; height: 150px; padding-bottom: 10px" src="${img.address_link}" class="product-image">
                                                            <h5 class="card-title" style="font-size: 15px">${product.pname}</h5>
                                                            <p class="card-text small" style="color: black">Số lượng: ${product.count}</p>
                                                            <p class="tags" style="color: black">Giá: ${product.price}</p>                                                                                                                                                                 
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <!-- Hiển thị sản phẩm dành cho người dùng !-->
                                                <c:if test="${user_account != null}">
                                                    <div class="card" style="height: 370px;">
                                                        <div class="card-body text-center">
                                                            <img style="width: 150px; height: 150px; padding-bottom: 10px" src="${img.address_link}" class="product-image">
                                                            <h5 class="card-title" style="font-size: 15px">${product.pname}</h5>
                                                            <p class="card-text small" style="color: black">Số lượng: ${product.count}</p>
                                                            <p class="tags" style="color: black">                                                               
                                                                Giá: <fmt:formatNumber value = "${product.price}" type = "currency"/>
                                                            </p>                                                        
                                                            <form action="cart">
                                                                <input type="hidden" name="pid" value="${product.pid}">
                                                                <input type="hidden" name="name" value="${product.pname}">
                                                                <input type="hidden" name="price" value="${product.price}">
                                                                <input type="hidden" name="address_link" value="${img.address_link}">
                                                                <input type="hidden" name="userid" value="${user_account.userid}">
                                                                <!-- Luu vao 1 bien de kiem qua xem trang vua click la trang nao de khi mua hang xong se chuyen ve trang do -->
                                                                <input type="hidden" name="type_page" value="1">
                                                                <button class="btn btn-success button-text" type="submit"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Thêm vào giỏ hàng</button>
                                                            </form>                                                                                                                                                                      
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <!-- Hiển thị sản phẩm dành cho quản trị viên !-->
                                                <c:if test="${admin != null}">
                                                    <div class="card" style="height: 370px;">
                                                        <div class="card-body text-center">
                                                            <img style="width: 150px; height: 150px; padding-bottom: 10px" src="${img.address_link}" class="product-image">
                                                            <h5 class="card-title" style="font-size: 15px">
                                                                <small>${product.pid}</small>
                                                                ${product.pname}
                                                            </h5>
                                                            <p class="card-text small" style="color: black">Số lượng: ${product.count}</p>
                                                            <p class="tags" style="color: black">                                                               
                                                                Giá: <fmt:formatNumber value = "${product.price}" type = "currency"/>
                                                            </p>    
                                                            <div style="display: inline-flex">
                                                                <!-- Update thông tin sản phẩm !-->
                                                                <form action="updateproduct" method="get" style="margin: 0px 10px">
                                                                    <input type="hidden" name="pid_update" value="${product.pid}">
                                                                    <button type="submit">
                                                                        <i class="bi bi-pencil"></i>
                                                                    </button>
                                                                </form>  
                                                                <!-- Update số lượng sản phẩm !-->
                                                                <form action="update_productcount" method="get" style="margin: 0px 10px">
                                                                    <input type="hidden" name="pid_update" value="${product.pid}">
                                                                    <button type="submit">
                                                                        <i class="bi bi-123"></i>
                                                                    </button>
                                                                </form>
                                                                <!-- Xóa sản phẩm !-->
                                                                <form action="delete" method="post" style="margin: 0px 10px">
                                                                    <input type="hidden" name="pid_delete" value="${product.pid}">
                                                                    <button type="submit">
                                                                        <i class="bi bi-trash"></i>
                                                                    </button>
                                                                </form>     
                                                            </div>                                       
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                        </div>

                        <!-- Phân trag !-->                  
                        <div class="row" style="margin: 30px 0px; background-color: white">
                            <a class="col" style="color: black" href="list_product2?index_page=1">Trang đầu</a>
                            <c:forEach begin="1" end="${endPage}" var="i">
                                <a class="col" style="color: black" href="list_product2?index_page=${i}">${i}</a>
                            </c:forEach>
                            <a class="col" style="color: black" href="list_product2?index_page=${endPage}">Trang cuối</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bootstrap JavaScript -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>


        <!-- JS của header  -->
        <script src="Layout/header_layout/js/js_header/jquery-3.3.1.min.js"></script>
        <script src="Layout/header_layout/js/js_header/popper.min.js"></script>
        <script src="Layout/header_layout/js/js_header/bootstrap.min.js"></script>
        <script src="Layout/header_layout/js/js_header/jquery.sticky.js"></script>
        <script src="Layout/header_layout/js/js_header/main.js"></script>

    </body>
</html>
