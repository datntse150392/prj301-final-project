<%-- 
    Document   : product
    Created on : Jan 6, 2023, 8:18:23 PM
    Author     : nguyenthanhdat
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dụng Cụ Vệ Sinh</title>
    </head>
    <body>
        <section>
            <main class="d-flex flex-nowrap">
                <%@include file="Sidebar.jsp"%>
                <div style="text-align: -webkit-center; width: 100%" >
                    <!-- Thong bao san pham vua them -->
                    <h4 style="color: red; text-align: center">${msg} </h4>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                        <thead style="font-size: 16px">
                            <tr>
                                <c:if test="${admin != null}">
                                    <th scope="col">ID</th>
                                    </c:if>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Loại</th>
                                <th scope="col">Hình ảnh minh họa </th>
                                    <c:if test="${user_account != null}">
                                    <th scope="col">Thêm vào giỏ hàng </th>
                                    </c:if>
                                    <c:if test="${admin != null}">
                                    <th scope="col">Cập nhật</th>
                                    <th scope="col">Thêm/giảm số lượng</th>
                                    <th scope="col">Xóa</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody style="font-size: 15px">
                            <c:forEach var="product" items="${list_product}">
                                <c:forEach var="lname_product" items="${listname_product}">
                                    <c:forEach var="img" items="${list_img}">
                                        <c:if test="${product.lid == lname_product.lid && img.imgid == product.imgid && product.lid == 2}">
                                            <tr>
                                                <c:if test="${admin != null}">
                                                    <td>${product.pid}</td>
                                                </c:if>
                                                <td>${product.pname}</td>
                                                <td>${product.price}</td>
                                                <td>${product.count}</td>
                                                <td>${lname_product.lname}</td>
                                                <td><img style="width: 100px; height: 100px" src="${img.address_link}" alt="alt"/></td>
                                                    <c:if test="${user_account != null}">
                                                    <td scope="col" >
                                                        <form action="cart" method="get" style=" display: flex">
                                                            <input type="hidden" name="pid" value="${product.pid}">
                                                            <input type="hidden" name="name" value="${product.pname}">
                                                            <input type="hidden" name="price" value="${product.price}">
                                                            <input type="hidden" name="address_link" value="${img.address_link}">
                                                            <input type="hidden" name="userid" value="${user_account.userid}">
                                                            <!-- Luu vao 1 bien de kiem qua xem trang vua click la trang nao de khi mua hang xong se chuyen ve trang do -->
                                                            <input type="hidden" name="type_page" value="1">
                                                            <input class="form-control" style="width: 30%; margin-right: 5%" type="number" name="count" required ></input>                           
                                                            <button type="submit">＋</button>                                                  
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <c:if test="${admin != null}">
                                                    <td scope="col">
                                                        <form action="updateproduct" method="get">
                                                            <input type="hidden" name="pid_update" value="${product.pid}">
                                                            <button type="submit">
                                                                <i class="fa-solid fa-pen"></i>
                                                            </button>
                                                        </form>
                                                    </td>

                                                    <td scope="col">
                                                        <form action="update_productcount" method="get">
                                                            <input type="hidden" name="pid_update" value="${product.pid}">
                                                            <button type="submit">
                                                                <i class="fa-solid fa-pen"></i>
                                                            </button>
                                                        </form>
                                                    </td>

                                                    <td scope="col">
                                                        <form action="delete" method="post">
                                                            <input type="hidden" name="pid_delete" value="${product.pid}">
                                                            <button type="submit">
                                                                <i class="fa-solid fa-trash"></i>
                                                            </button>
                                                        </form>                                            
                                                    </td>
                                                </c:if>
                                            </tr>                         
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
                    
                    <!-- LoadMore -->
                    <div style="display: inline-flex; list-style-type:none;">
                        <li>
                            <form action="list_product2">
                                <button type="submit" name="number_loadmore" value="${number_loadmore}">Load more</button>
                            </form>
                        </li>

                    </div>
                </div>
                </div>
            </main>
        </section>
    </body>
</html>
