<%-- 
    Document   : register
    Created on : Jan 30, 2023, 11:16:26 PM
    Author     : nguyenthanhdat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí tài khoản</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body style="background-color: black; height: 100%">
        <%@include file="header1.jsp" %>
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Đăng kí tài khoản</h2>
                        <form action="register" method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="displayname"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="displayname" id="displayname" placeholder="Họ và tên">
                            </div>
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" placeholder="Tên tài khoản" required>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Mật khẩu" required>
                            </div>
                            <div class="form-group">
                                <label for="re_password"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu" required>
                            </div>
                            <div class="form-group">
                                <select class="form-select" name="address_id" required>                          
                                    <c:forEach var="address" items="${list_address}">
                                        <option value="${address.address_id}">${address.address}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>Tôi đồng ý với các <a href="#" class="term-service">điều khoản và điều kiện</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register">
                            </div>


                            <!-- Thong bao -->
                            <p style="color: red">${msg}</p>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="img/signup-image.jpg" alt="sing up image"></figure>
                        <a href="login" class="signup-image-link">Đã có tài khoản</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
