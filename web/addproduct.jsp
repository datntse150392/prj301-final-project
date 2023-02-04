<%-- 
    Document   : addproduct
    Created on : Jan 7, 2023, 2:40:12 PM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5" style="width: 100%">
            <h1 style="text-align: center">Vui lòng nhập thông tin để thêm sản phẩm</h1>
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="addproduct" method="post" class="p-4 p-md-5 border rounded-3 bg-light">
                        <div class="form-floating mb-3">
                            <input  style="height: 100px;" class="form-control" type="text" name="add_name" required></input>
                            <label for="floatingInput">Mời bạn nhập tên sản phẩm</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input class="form-control" type="number" name="add_price" required ></input>
                            <label for="floatingPassword">Mời bạn nhập giá sản phẩm</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input class="form-control" type="number" name="add_count" required ></input>
                            <label for="floatingPassword">Mời bạn nhập số lượng sản phẩm</label>
                        </div>

                        <div class="form-floating mb-3">
                            <select class="form-select" name="add_lid" required>                          
                                <c:forEach var="listproduct" items="${listproduct}">
                                    <option value="${listproduct.lid}">${listproduct.lname}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button class="w-100 btn btn-lg btn-primary" type="submit">Thêm vào danh sách</button>
                        <p>${msg}</p>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="rooter.jsp"%>
    </body>
</html>
