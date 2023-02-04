<%-- 
    Document   : update_productcount
    Created on : Jan 9, 2023, 10:02:14 AM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm/giảm số lượng</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5">
            <h1 style="text-align: center">Vui lòng nhập số lượng cần thêm hoặc giảm</h1>
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="update_productcount" method="post" class="p-4 p-md-5 border rounded-3 bg-light">
                        <input type="hidden" name="update_pid" value="${product.pid}" >   
                        <div class="form-floating mb-3">
                            <input class="form-control" type="number" value="${product.count}" required ></input>
                            <label for="floatingPassword">Số lượng hiện tại</label>
                        </div>
                            
                        <div class="form-floating mb-3">
                            <input class="form-control" type="number" name="update_count" required ></input>
                            <label for="floatingPassword">Nhập số lượng cần thêm hoặc giảm</label>
                        </div>
                        <button class="w-100 btn btn-lg btn-primary" type="submit">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
