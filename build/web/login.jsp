<%-- 
    Document   : login
    Created on : Jan 7, 2023, 1:02:28 AM
    Author     : nguyenthanhdat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <!-- Link CSS Login layout -->
        <link rel="stylesheet" href="Layout/login_layout/layout.css">
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="login" method="post">
                        <h2>Đăng nhập</h2>
                        <h3 style="color: red">${msg}</h3>
                        <div class="inputbox">
                            <input type="text" name="username" value="${username}" required>
                            <label for="">Tên đăng nhập</label>
                        </div>
                        <div class="inputbox">
                            <input type="password" name="password" value="${password}" required >
                            <label for="">Mật khẩu</label>
                        </div>
                        <div class="forget">
                            <label for=""><input type="checkbox" required>Ghi nhớ mật khẩu</label>                 
                        </div>
                        <button type="submit">Đăng nhập</button>
                        <div class="register">
                            <p>Không có tài khoản <a href="register">đăng kí ngay</a></p>
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
