<%-- 
    Document   : xem-truoc.jsp
    Created on : Mar 16, 2026, 3:17:45 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks - Xem trước CV</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/tao-CV.css">
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

        <!-------------------------------------- CV --------------------------------------->               
        <h1 style="text-align: center; margin: 30px; font-size: 50px; font-weight: 800;">${cv.nameCv}</h1>

        <section style="padding-bottom: 35px;">
            <div class="cv-container">
                <!-- LEFT AVATAR -->
                <div class="cv-avatar">
                    <div class="avatar-box">
                        <img style="width:100%; height:100%; object-fit:cover;" 
                             src="${pageContext.request.contextPath}/static/images/Pic-CV/${cv.avatarCv}" width="150">
                    </div>
                </div>

                <div class="cv-content">
                    <div class="cv-info">

                        <div class="cv-name" style="font-size: 30px;">${cv.fullNameCv}</div>
                        <p style="width: 100%; margin-top: 5px">${cv.positionCv}</p>
                        <div class="grid">
                            <h3>Thông tin cá nhân</h3>
                            <br>
                            <p>Phone: ${cv.phone}</p>
                            <p>Ngày sinh: ${cv.dob}</p>
                            <p>Gender: ${cv.gender}</p>
                            <p>Website: ${cv.websiteCv}</p>
                            <p>Location: ${cv.locationCv}</p>
                            <p>Email: ${cv.email}</p>
                        </div>
                    </div>

                    <div class="cv-section">
                        <h3>MỤC TIÊU NGHỀ NGHIỆP</h3>
                        <p style="white-space: pre-line;">${cv.careerGoalsCv}</p>
                    </div>

                    <div class="cv-section">
                        <h3>HỌC VẤN</h3>
                        <p style="white-space: pre-line;">${cv.educationCv}</p>
                    </div>

                    <div class="cv-section">
                        <h3>KINH NGHIỆM LÀM VIỆC</h3>
                        <p style="white-space: pre-line;">${cv.experienceCv}</p>
                    </div>

                    <div class="cv-section">
                        <h3>CHỨNG CHỈ</h3>
                        <p style="white-space: pre-line;">${cv.certificateCv}</p>
                    </div>

                    <div class="cv-section">
                        <h3>KỸ NĂNG</h3>
                        <p style="white-space: pre-line;">${cv.skillsCv}</p>
                    </div>

                    <div class="cv-section">
                        <h3>SỞ THÍCH</h3>
                        <p style="white-space: pre-line;">${cv.hobbiesCv}</p>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <div style="text-align:center; margin-bottom: 25px; display:flex; gap:15px; justify-content:center;">
        <a href="${pageContext.request.contextPath}/views/cv">
            <button type="button"
                    style="background: var(--mw-blue);
                    color:#fff;
                    border:none;
                    padding:8px 14px;
                    border-radius:20px;
                    cursor:pointer;
                    font-weight:700;">
                ⬅ Quản lý CV
            </button>
        </a>
        <a href="cv?action=edit&id=${cv.resumeId}">
            <button type="button"
                    style="background: var(--mw-blue);
                    color:#fff;
                    border:none;
                    padding:8px 14px;
                    border-radius:20px;
                    cursor:pointer;
                    font-weight:700;">
                ✏️ Sửa CV
            </button>
        </a>
    </div>

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

