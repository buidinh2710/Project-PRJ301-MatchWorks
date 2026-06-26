<%-- 
    Document   : admin
    Created on : Mar 16, 2026, 6:28:40 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - MatchWorks</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
        <script src="${pageContext.request.contextPath}/static/js/home.js" defer></script>
    </head>
    <body>
        <!-------------------------------------- HEADER --------------------------------------->
        <header class="site-header" role="banner">
            <div class="container site-header__inner">
                <!-- Brand -->
                <a class="brand" href="${pageContext.request.contextPath}/views/Home" aria-label="MatchWorks">
                    <img class="brand__logo" src="${pageContext.request.contextPath}/static/images/Home/LogoMatchWorks.png" 
                         alt="MatchWorks" />
                </a>

                <button class="nav-toggle" type="button"
                        aria-label="Mở menu"
                        aria-expanded="false"
                        aria-controls="mwNav">
                    <span class="nav-toggle__bar"></span>
                    <span class="nav-toggle__bar"></span>
                    <span class="nav-toggle__bar"></span>
                </button>

                <!-- Desktop Nav -->
                <nav id="mwNav" class="primary-nav" aria-label="Điều hướng chính">
                    <a class="primary-nav__link" href="${pageContext.request.contextPath}/views/apply">Ứng tuyển</a>
                </nav>
                <div class="header-actions">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <a href="sua-thongtin.jsp">
                                <button class="button button--ghost">
                                    ${sessionScope.user.fullName}
                                </button> 
                            </a>

                            <a href="${pageContext.request.contextPath}/views/logout"><button class="button button--ghost">Đăng xuất</button></a>
                        </c:when>

                        <c:otherwise>
                            <a href="Login.jsp">
                                <button class="button button--ghost">Đăng nhập</button>
                            </a>

                            <a href="SignIn.jsp">
                                <button class="button button--ghost">Đăng ký</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Mobile backdrop -->
            <div class="nav-backdrop" hidden></div> 
        </header>

        <!-------------------------------------- TABLE --------------------------------------->

        <section class="card user-section">

            <h2 class="block-title">Danh sách người ứng tuyển</h2>

            <form action="apply" method="get" style="margin-bottom: 15px;">
                <input type="hidden" name="action" value="locungvien"/>

                <select name="edu">
                    <option value="">Tất cả</option>
                    <option value="Đại học">Đại học</option>
                    <option value="Cao đẳng">Cao đẳng</option>
                </select>

                <button class="cv-button">Lọc ứng viên</button>
            </form>

            <div class="table-wrapper">
                <table class="user-table">

                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Họ và Tên</th>
                            <th>Công việc ứng tuyển</th>
                            <th>Công ty</th>
                            <th>Tác vụ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${listApply}">

                            <tr>
                                <td>${a.userId}</td>
                                <td>${a.fullName}</td>
                                <td>${a.titleJob}</td>
                                <td>${a.nameCompany}</td>
                                <td style="display: flex; justify-content:center; gap: 5px;">
                                    <a href="apply?action=delete&id=${a.applicationId}"
                                       onclick="return confirm('Bạn có chắc muốn xóa đơn ứng tuyển này?')">
                                        <button class="cv-button">Xóa</button>
                                    </a>

                                    <a href="cv?action=detail&id=${a.resumeId}">
                                        <button class="cv-button">Xem CV</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <div class="pagination-container">
                        <div class="pagination">
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <a href="${pageContext.request.contextPath}/views/jobs?page=${i}&keyword=${keyword}&city=${city}&salary=${salary}&experience=${experience}"
                                   class="page-item ${i == currentPage ? 'active' : ''}">
                                    ${i}
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </table>
            </div>

        </section>



        <!-------------------------------------- FOOTER --------------------------------------->
        <footer class="site-footer">
            <div class="container site-footer__grid">
                <!-- LEFT -->
                <div class="site-footer__col">
                    <div class="site-footer__brand">
                        <div class="site-footer__logo">
                            <img src="${pageContext.request.contextPath}/static/images/Home/LogoMatchWorks.png" alt="MatchWorks">
                        </div>
                    </div>

                    <div class="site-footer__badges">
                        <span class="badge">Google for Startups</span>
                        <span class="badge">Accelerator 2020</span>
                    </div>

                    <div class="site-footer__block">
                        <h4>Liên hệ</h4>
                        <p><strong>Hotline:</strong> (024) 6680 5588 (Giờ hành chính)</p>
                        <p><strong>Email:</strong> support@matchworks.vn</p>
                    </div>

                    <div class="site-footer__block">
                        <h4>Cộng đồng MatchWorks</h4>
                        <div class="site-footer__social">
                            <img src="${pageContext.request.contextPath}/static/images/Home/Facebook.jpg" alt="fb"/>
                            <img src="${pageContext.request.contextPath}/static/images/Home/Youtube.jpg" alt="yt"/>
                            <img src="${pageContext.request.contextPath}/static/images/Home/In.jpg" alt="in"/>
                            <img src="${pageContext.request.contextPath}/static/images/Home/Instargram.jpg" alt="ig"/>
                        </div>
                    </div>
                </div>

                <!-- MIDDLE -->
                <div class="site-footer__col site-footer__col--middle">
                    <h4>Công ty cổ phần MatchWorks Việt Nam</h4>
                    <ul class="site-footer__list">
                        <li>Giấy phép đăng ký kinh doanh số: 0123456789 (cấp ngày 01/01/2026).</li>
                        <li>Địa chỉ: Tầng 10, Tòa nhà A, 123 Nguyễn Trãi, Thanh Xuân, Hà Nội.</li>
                        <li>Chi nhánh HCM: 24C Phan Đăng Lưu, Phú Nhuận, TP.HCM.</li>
                    </ul>

                    <h4 class="u-mt">Hệ sinh thái MatchWorks</h4>
                    <div class="site-footer__ecosystem">
                        <a class="site-footer__eco-link" href="#">Tuyển dụng</a>
                        <a class="site-footer__eco-link" href="tao-CV.jsp">Tạo CV</a>
                        <a class="site-footer__eco-link" href="${pageContext.request.contextPath}/views/company">Công Ty</a>
                        <a class="site-footer__eco-link" href="cam-nang-nghe-nghiep.jsp">Cẩm Năng</a>
                    </div>
                </div>

                <!-- RIGHT -->
                <div class="site-footer__col site-footer__col--right">
                    <div class="site-footer__qr">
                        <div class="site-footer__qr-box">
                            <img src="${pageContext.request.contextPath}/static/images/Home/QRdownload.png" alt="QR MatchWorks">
                        </div>
                        <div class="site-footer__qr-note">Quét QR để tải app</div>
                    </div>

                    <div class="site-footer__download">
                        <h4>Ứng dụng tải xuống</h4>
                        <img src="${pageContext.request.contextPath}/static/images/Home/CH-AS.png" alt="download"/>
                    </div>
                </div>
            </div>

            <div class="site-footer__bottom">
                <div class="container">
                    © 2026 MatchWorks. All rights reserved.
                </div>
            </div>
        </footer>                                
    </body>
</html>
