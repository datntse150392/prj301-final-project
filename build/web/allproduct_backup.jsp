<%-- 
    Document   : allproduct_backup
    Created on : Feb 3, 2023, 9:55:35 PM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <body></body>
    <section>

        <main class="d-flex flex-nowrap">
            <%@include file="Sidebar.jsp"%>
            <div class="album py-5 bg-light">
                <div class="container">                     
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <c:forEach var="product" items="${list_product}">
                            <c:forEach var="lname_product" items="${listname_product}">
                                <c:forEach var="img" items="${list_img}">
                                    <c:if test="${product.lid == lname_product.lid && img.imgid == product.imgid}">
                                        <div class="col">
                                            <div class="card shadow-sm">
                                                <svg class="bd-placeholder-img card-img-top" style="height:0"> <img style="width: 100%; height: 100%" src="${img.address_link}" alt="alt"/> </svg>
                                                <div class="card-body">
                                                    <small class="text-muted">${lname_product.lname}</small>
                                                    <p class="card-text">${product.pname} </p>
                                                    <p class="card-text">SL: ${product.count}</p>
                                                    <p class="card-text">Giá: ${product.price}</p>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <c:if test="${user_account != null}">
                                                            <td scope="col" >
                                                                <form action="cart" method="get" class="btn-group">
                                                                    <input type="hidden" name="pid" value="${product.pid}">
                                                                    <input type="hidden" name="name" value="${product.pname}">
                                                                    <input type="hidden" name="price" value="${product.price}">
                                                                    <input type="hidden" name="address_link" value="${img.address_link}">
                                                                    <input type="hidden" name="userid" value="${user_account.userid}">
                                                                    <!-- Luu vao 1 bien de kiem qua xem trang vua click la trang nao de khi mua hang xong se chuyen ve trang do -->
                                                                    <input type="hidden" name="type_page" value="1">
                                                                    <input class="form-control" style="width: 30%; margin-right: 5%" type="number" name="count" required ></input>                           
                                                                    <button type="submit" class="btn btn-sm btn-outline-secondary">Thêm vào giỏ hàng</button>                                                 
                                                                </form>
                                                            </td>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </c:forEach>                       
                    </div>
                </div>
            </div>               
        </main>
    </section>
    <div style="margin-left: 50%; margin-bottom: 20px; margin-top: 20px;list-style-type:none;">
        <li>
            <form action="allproduct">
                <button type="submit" name="number_loadmore" value="${number_loadmore}">Load more</button>
            </form>
        </li>
    </body>
</body>
</html>
