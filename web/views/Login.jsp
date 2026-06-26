<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập - MatchWorks</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/Login.css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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

                    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">

                        <label>Email</label>
                        <input type="email" name="gmail" placeholder="Nhập email" required>

                        <label>Mật khẩu</label>
                        <input type="password" name="password" placeholder="Nhập mật khẩu" required>

                        <div class="forgot">
                            <a href="#">Quên mật khẩu?</a>
                        </div>
                        <c:if test="${not empty error}">
                            <p style="color:red">${error}</p>
                        </c:if>
                        <label>Nhập mã captcha</label>

                        <div style="display:flex; align-items:center; gap:10px;">
                            <img src="${pageContext.request.contextPath}/views/captcha" id="captchaImg">

                            <!-- reload captcha -->
                            <button type="button" onclick="reloadCaptcha()">↻</button>
                        </div>
                        <script>
                            function reloadCaptcha() {
                                document.getElementById("captchaImg").src =
                                        "${pageContext.request.contextPath}/views/captcha?time=" + new Date().getTime();
                            }
                        </script>

                        <input type="text" name="captchaInput" placeholder="Nhập captcha" required>
                        <button type="submit">Đăng nhập</button>
                    </form>
                    <div class="register-link">
                        Bạn chưa có tài khoản?
                        <a href="SignIn.jsp">Đăng ký ngay</a>
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