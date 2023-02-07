<%-- 
    Document   : login
    Created on : Jan 7, 2023, 1:02:28 AM
    Author     : nguyenthanhdat
--%>
<script src="https://kit.fontawesome.com/e8ce65bac5.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Link CSS Login layout -->
        <link rel="stylesheet" href="Layout/login_layout/layout.css">
        <title>Đăng nhập</title>
    </head>
    <body>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="login" method="post">
                        <h2>Đăng nhập</h2>
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
                        <h3 style="color: red">${msg}</h3>
                    </form>
                </div>
            </div>
        </section>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    </body>
</html>
