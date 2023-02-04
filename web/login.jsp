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
        <title>Đăng nhập</title>
    </head>
    <body  class="hero"style="background-image: url('images/images_header/hero_5.jpg'); height: auto">
        <%@include file="header1.jsp"%>
        <div class="container col-xl-10 col-xxl-8 px-4 py-5">
            <div class="row align-items-center g-lg-5 py-5">
                <div class="col-md-10 mx-auto col-lg-5">
                    <form action="login" method="post" class="p-4 p-md-5 border rounded-3 bg-light">
                        <h1 class="display-4 fw-bold lh-1 mb-3" style="text-align: center;">Kat Planet</h1>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="text" name="username" value="${username}" required></input>
                            <label for="floatingInput">Tên đăng nhập</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input class="form-control" type="password" name="password" value="${password}" required ></input>
                            <label for="floatingPassword">Mật khẩu</label>
                        </div>
                        <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"> Ghi nhớ mật khẩu
                            </label>
                        </div>
                        <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
                        <p style="color:red">${msg}</p>
                        <hr class="my-4">
                        <a href="register">
                            <small class="text-muted">Đăng kí tài khoản</small>
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
