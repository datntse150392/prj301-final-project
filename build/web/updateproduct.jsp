<%-- 
    Document   : updateproduct
    Created on : Jan 8, 2023, 2:03:00 AM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5">
            <h1 style="text-align: center">Vui lòng nhập thông tin để cập nhật lại thông tin sản phẩm</h1>
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="updateproduct" method="post" class="p-4 p-md-5 border rounded-3 bg-light">
                        <input type="hidden" name="update_pid" value="${product.pid}" >
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" name="update_name" value="${product.pname}"required></input>
                            <label for="floatingInput">Mời bạn nhập tên sản phẩm</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input class="form-control" type="number" name="update_price" value="${product.price}" required ></input>
                                   <label for="floatingPassword">Mời bạn nhập giá sản phẩm</label>
                        </div>
                            <!-- comment
                            <div class="form-floating mb-3">
                                <input class="form-control" type="number" name="update_count" value="${product.count}" required ></input>
                                       <label for="floatingPassword">Mời bạn nhập số lượng sản phẩm</label>
                            </div>
                            -->

                        <div class="form-floating mb-3">
                            <select class="form-select" name="update_lid" required>                          
                                <c:forEach var="listproduct1" items="${listproduct}">
                                    <option value="${listproduct1.lid}">${listproduct1.lname}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button class="w-100 btn btn-lg btn-primary" type="submit">Cập nhật</button>
                        <p>${msg}</p>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
