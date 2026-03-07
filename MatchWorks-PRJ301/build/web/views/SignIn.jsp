<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký - MatchWorks</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/SignIn.css">
</head>
<body>

<div class="register-wrapper">

    <!-- LEFT -->
    <div class="register-left">
        <div class="register-infor">
        <h2>Chào mừng bạn đến với MatchWorks</h2>
        <p class="subtitle">
            Cùng xây dựng hồ sơ nổi bật và tiếp cận những cơ hội phù hợp
        </p>

        <form action="register" method="post">

            <label>Họ và tên</label>
            <input type="text" name="fullname" placeholder="Nhập họ tên" required>

            <label>Email</label>
            <input type="email" name="email" placeholder="Nhập email" required>

            <label>Mật khẩu</label>
            <input type="password" name="password" placeholder="Nhập mật khẩu" required>

            <label>Xác nhận mật khẩu</label>
            <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>

            <div class="policy">
                <input type="checkbox" required>
                <span>
                    Tôi đã đọc và đồng ý với
                    <a href="#">Điều khoản dịch vụ</a> và
                    <a href="#">Chính sách bảo mật</a>
                </span>
            </div>

            <button type="submit">Đăng ký</button>
        </form>

        <div class="login-link">
            Bạn đã có tài khoản?
            <a href="login.jsp">Đăng nhập ngay</a>
        </div>
        </div>
    </div>

    <!-- RIGHT -->
    <div class="register-right">
        <img src="${pageContext.request.contextPath}/static/images/Login-SignIn/login-signin.png" class="photo">
    </div>

</div>

</body>
</html>