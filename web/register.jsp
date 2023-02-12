<%-- 
    Document   : register
    Created on : Jan 30, 2023, 11:16:26 PM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí tài khoản</title>
        <!-- Link CSS Login layout -->
        <link rel="stylesheet" href="Layout/register_layout/layout.css">
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="register" method="post">
                        <h2>Đăng kí tài khoản</h2>
                        <h3 style="color: red">${msg}</h3>
                        <div class="inputbox">
                            <input type="text" name="displayname" required>
                            <label for="">Họ và tên</label>
                        </div>
                        <div class="inputbox">
                            <input type="text" name="username" required >
                            <label for="">Tên tài khoản</label>
                        </div>
                        <div class="inputbox">
                            <input type="password" name="password" value="${password}" required >
                            <label for="">Mật khẩu</label>
                        </div>
                        <div class="inputbox">
                            <input type="password" name="re_password" required >
                            <label for="">Nhập lại mật khẩu</label>
                        </div>
                        <div class="selectbox">
                            <select name="address_id" required>                          
                                <c:forEach var="address" items="${list_address}">
                                    <option value="${address.address_id}">${address.address}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit">Đăng kí</button>
                        <div class="login">
                            <p>Đã có tài khoản <a href="login">đăng nhập</a></p>
                        </div>
                        <div class="homepage">
                            <a href="homepage">Trang chủ</a>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
