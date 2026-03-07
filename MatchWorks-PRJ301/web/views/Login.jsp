<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập - MatchWorks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/Login.css">
</head>
<body>

<div class="login-wrapper">

    <!-- LEFT -->
    <div class="login-left">
        <div class="login-content">

            <h2>Chào mừng bạn quay trở lại</h2>
            <p class="subtitle">
                Đăng nhập để tiếp tục kết nối với những cơ hội phù hợp
            </p>

            <form action="login" method="post">

                <label>Email</label>
                <input type="email" name="email" placeholder="Nhập email" required>

                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu" required>

                <div class="forgot">
                    <a href="#">Quên mật khẩu?</a>
                </div>

                <button type="submit">Đăng nhập</button>
            </form>
            <div class="register-link">
                Bạn chưa có tài khoản?
                <a href="register.jsp">Đăng ký ngay</a>
            </div>

        </div>
    </div>

    <!-- RIGHT -->
    <div class="login-right">
        <img src="${pageContext.request.contextPath}/static/images/Login-SignIn/login-signin.png" class="photo">
    </div>

</div>

</body>
</html>