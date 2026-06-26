<%-- 
    Document   : hd-viet-cv
    Created on : Mar 12, 2026, 3:56:06 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hướng Dẫn Viết CV</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/hd-viet-cv.css">
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
                    <!-- Dropdown: Jobs -->
                    <div class="nav-dropdown" data-dd="jobs">
                        <a class="primary-nav__link primary-nav__link--has-caret" type="button"
                           aria-haspopup="true" aria-expanded="false" data-dd-trigger href="${pageContext.request.contextPath}/views/viec-lam">
                            <span>Việc làm</span>
                        </a>

                        <div class="mega-menu mega-menu--jobs" role="menu" aria-label="Menu việc làm" data-dd-panel>
                            <div class="mega-menu__inner mega-menu__inner--single">
                                <div class="mega-menu__col">
                                    <div class="mega-menu__title">VIỆC LÀM</div>

                                    <a class="mega-menu__item" href="${pageContext.request.contextPath}/views/jobs?page=1">
                                        <span class="mega-menu__icon" aria-hidden="true">🔎</span>
                                        <span class="mega-menu__text">Tìm việc làm</span>
                                    </a>
                                        
                                    <a class="mega-menu__item" href="${pageContext.request.contextPath}/views/showsavejob">
                                        <span class="mega-menu__icon" aria-hidden="true">📌</span>
                                        <span class="mega-menu__text">Việc làm đã lưu</span>
                                    </a>

                                    <a class="mega-menu__item" href="${pageContext.request.contextPath}/views/showapplyjob">
                                        <span class="mega-menu__icon" aria-hidden="true">📩</span>
                                        <span class="mega-menu__text">Việc làm đã ứng tuyển</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Dropdown: CV -->
                    <div class="nav-dropdown" data-dd="cv">
                        <a class="primary-nav__link primary-nav__link--has-caret" type="button"
                           aria-haspopup="true" aria-expanded="false" data-dd-trigger href="${pageContext.request.contextPath}/views/checklogin">
                            <span>Tạo CV</span>
                        </a>

                        <div class="mega-menu mega-menu--cv" role="menu" aria-label="Menu tạo CV" data-dd-panel>
                            <div class="mega-menu__inner mega-menu__inner--single">
                                <div class="mega-menu__col">
                                    <div class="mega-menu__title">TẠO CV</div>

                                    <a class="mega-menu__item" href="${pageContext.request.contextPath}/views/cv">
                                        <span class="mega-menu__icon" aria-hidden="true">📁</span>
                                        <span class="mega-menu__text">Quản lí CV</span>
                                    </a>

                                    <a class="mega-menu__item" href="hd-viet-cv.jsp">
                                        <span class="mega-menu__icon" aria-hidden="true">📝</span>
                                        <span class="mega-menu__text">Hướng dẫn viết CV</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a class="primary-nav__link" href="${pageContext.request.contextPath}/views/company?category=all&page=1">Công ty</a>
                    <a class="primary-nav__link" href="cam-nang-nghe-nghiep.jsp">Cẩm nang nghề nghiệp</a>
                </nav>

                <!-- Actions -->
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

        <!-------------------------------------- CONTENT --------------------------------------->

        <section class="cv-guide-section">

            <!-- Header -->
            <div class="cv-guide-header">

                <div class="cv-guide-text">
                    <h2>Hướng dẫn viết CV chi tiết theo ngành</h2>

                    <p>
                        Trong chuyên mục này, bạn nhận được hướng dẫn chi tiết về nội dung và cách trình bày CV 
                        theo từng ngành khác nhau. Mỗi ngành nghề sẽ có những yêu cầu riêng về kỹ năng, kinh nghiệm 
                        và cách trình bày thông tin. Vì vậy, việc xây dựng một CV phù hợp với lĩnh vực bạn đang 
                        ứng tuyển sẽ giúp bạn tăng cơ hội gây ấn tượng với nhà tuyển dụng.
                    </p>

                    <p>
                        Một CV tốt không chỉ đơn giản là liệt kê thông tin cá nhân mà còn cần thể hiện rõ năng lực,
                        định hướng nghề nghiệp và những giá trị bạn có thể mang lại cho doanh nghiệp. Trong phần
                        hướng dẫn này, bạn sẽ được tìm hiểu cách trình bày từng mục trong CV một cách chuyên nghiệp,
                        rõ ràng và phù hợp với tiêu chuẩn tuyển dụng hiện nay.
                    </p>

                    <p>
                        Cho dù bạn là sinh viên mới ra trường, người đang tìm kiếm cơ hội việc làm mới hay muốn
                        chuyển hướng nghề nghiệp, những hướng dẫn dưới đây sẽ giúp bạn xây dựng một CV nổi bật
                        và tăng khả năng được mời phỏng vấn.
                    </p>
                </div>

                <div class="cv-guide-image">
                    <img src="${pageContext.request.contextPath}/static/images/quan-ly-cv/Banner4.jpg" alt="CV Guide Banner">
                </div>

            </div>


            <!-- Content giống cẩm nang nghề nghiệp -->
            <div class="cv-guide-grid">
                <div class="cv-guide-grid-left">
                    <img src="${pageContext.request.contextPath}/static/images/quan-ly-cv/CV-mau.png" alt="CV Guide Banner">
                </div>

                <div class="cv-guide-grid-right">
                    <div class="cv-guide-card">
                        <h3>Thông tin cá nhân</h3>
                        <p>
                            Phần thông tin cá nhân giúp nhà tuyển dụng nhanh chóng nhận biết và liên hệ với bạn.
                            Bạn nên điền đầy đủ họ tên, số điện thoại, email, địa chỉ và website cá nhân nếu có.
                            Hãy sử dụng email chuyên nghiệp và đảm bảo số điện thoại luôn hoạt động.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Mục tiêu nghề nghiệp</h3>
                        <p>
                            Đây là phần thể hiện định hướng phát triển nghề nghiệp của bạn. Hãy viết ngắn gọn
                            nhưng rõ ràng về mục tiêu trong ngắn hạn và dài hạn.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Học vấn</h3>
                        <p>
                            Trình bày quá trình học tập của bạn bao gồm tên trường, chuyên ngành và thời gian học.
                            Nếu bạn là sinh viên hoặc mới tốt nghiệp, phần này nên đặt ở vị trí nổi bật trong CV.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Kinh nghiệm làm việc</h3>
                        <p>
                            Liệt kê các công việc bạn đã từng tham gia, vai trò của bạn.
                            Hãy tập trung vào những kinh nghiệm liên quan đến vị trí bạn đang ứng tuyển.
                            Bạn có thể thêm các dự án cá nhân hoặc hoạt động câu lạc bộ.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Chứng chỉ</h3>
                        <p>
                            Nếu bạn có các chứng chỉ chuyên môn như IELTS, TOEIC, chứng chỉ lập trình,
                            chứng chỉ marketing hoặc các khóa học chuyên ngành, hãy liệt kê trong phần này.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Kỹ năng</h3>
                        <p>
                            Phần kỹ năng nên bao gồm cả kỹ năng chuyên môn và kỹ năng mềm. Ví dụ như kỹ năng lập trình,
                            phân tích dữ liệu, giao tiếp, làm việc nhóm hoặc quản lý thời gian.
                        </p>
                    </div>

                    <div class="cv-guide-card">
                        <h3>Sở thích</h3>
                        <p>
                            Hãy chọn những sở thích tích cực như đọc sách, thể thao, tham gia hoạt động cộng đồng
                            hoặc nghiên cứu công nghệ.
                        </p>
                    </div>
                </div>
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
                        <a class="site-footer__eco-link" href="${pageContext.request.contextPath}/views/checklogin">Tạo CV</a>
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
