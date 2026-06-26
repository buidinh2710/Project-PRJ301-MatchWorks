<%-- 
    Document   : tao-CV
    Created on : Mar 5, 2026, 2:40:16 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks-TaoCV</title>

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

        <!-------------------------------------- CV BAR ------------------------------------- -->
        <section class="cvbar" aria-label="Thanh tên CV">
            <div class="container cvbar__inner">

                <div class="cvbar__left">
                    <span class="cvbar__icon" aria-hidden="true"></span>

                    <input
                        class="cvbar__title"
                        name="nameCv"
                        type="text"
                        form="cvForm"
                        value="${empty cv.nameCv ? '' : cv.nameCv}"
                        placeholder="CV chưa đặt tên"
                        />
                </div>

                <div class="cvbar__actions">
                    <button class="cvbar__btn cvbar__btn--primary" type="submit" form="cvForm" id="cvSaveBtn">
                        <span class="cvbar__btnText">💾 ${action == 'update' ? 'Cập nhật CV' : 'Lưu CV'}</span>
                    </button>
                </div>
            </div>
        </section>

        <form action="${pageContext.request.contextPath}/views/cv" id="cvForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="${action == 'update' ? 'update' : 'insert'}">
            <input type="hidden" name="resumeId" value="${cv.resumeId}">
            <!------------------------------------------- VIET CV ------------------------------------------ -->
            <section class="cv-builder">
                <div class="cv-container">
                    <!-- LEFT AVATAR -->
                    <div class="cv-avatar">

                        <div class="avatar-box">
                            <img class="avatar-preview" id="avatarPreview" alt="Ảnh đại diện">
                            <img style="width:100%; height:100%; object-fit:cover;" 
                                 src="${pageContext.request.contextPath}/static/images/Pic-CV/${cv.avatarCv}" width="150">
                        </div>

                        <input id="avatarInput" class="avatar-input" type="file" name="avatarCv" accept="image/*">

                        <input type="hidden" name="oldAvatar" value="${cv.avatarCv}">


                        <div class="avatar-actions">
                            <label for="avatarInput" class="avatar-upload-btn">
                                📷 Tải ảnh
                            </label>

                            <button class="avatar-remove" id="avatarRemove" type="button">
                                Xoá ảnh
                            </button>
                        </div>

                        <c:if test="${not empty error}">
                            <div style="color:red; text-align: center; margin-top: 10px;">
                                ${error}
                            </div>
                        </c:if>
                    </div>


                    <div class="cv-content">
                        <div class="cv-info">
                            <input name="fullName" placeholder="Họ Và Tên" class="cv-name" value="${empty cv.fullNameCv ? '' : cv.fullNameCv}" />

                            <div class="grid">
                                <input name="positionCv" placeholder="Vị trí ứng tuyển" value="${empty cv.positionCv ? '' : cv.positionCv}"/>
                                <input name="date" type="date" value="${cv.dob}"/>

                                <input name="gender" placeholder="Giới tính" value="${empty cv.gender ? '' : cv.gender}"/>
                                <input name="phone" placeholder="Số điện thoại" value="${empty cv.phone ? '' : cv.phone}"/>

                                <input name="email" type="email" placeholder="Email" value="${empty cv.email ? '' : cv.email}"/>
                                <input name="websiteCv" placeholder="Website" value="${empty cv.websiteCv ? '' : cv.websiteCv}"/>

                                <input name="locationCv" placeholder="Địa chỉ" class="full" value="${empty cv.locationCv ? '' : cv.locationCv}"/>
                            </div>
                        </div>

                        <div class="cv-section">
                            <h3>MỤC TIÊU NGHỀ NGHIỆP</h3>
                            <textarea name="careerGoalsCv" placeholder="Mục tiêu nghề nghiệp của bạn">${empty cv.careerGoalsCv ? '' : cv.careerGoalsCv}</textarea>
                        </div>

                        <div class="cv-section">
                            <h3>HỌC VẤN</h3>
                            <textarea name="educationCv" placeholder="Mô tả quá trình học tập">${empty cv.educationCv ? '' : cv.educationCv}</textarea>
                        </div>

                        <div class="cv-section">
                            <h3>KINH NGHIỆM LÀM VIỆC</h3>
                            <textarea name="experienceCv" placeholder="Mô tả kinh nghiệm">${empty cv.experienceCv ? '' : cv.experienceCv}</textarea>
                        </div>

                        <div class="cv-section">
                            <h3>CHỨNG CHỈ</h3>
                            <textarea name="certificateCv" placeholder="Tên chứng chỉ">${empty cv.certificateCv ? '' : cv.certificateCv}</textarea>
                        </div>

                        <div class="cv-section">
                            <h3>KỸ NĂNG</h3>
                            <textarea name="skillsCv" placeholder="Mô tả kỹ năng">${empty cv.skillsCv ? '' : cv.skillsCv}</textarea>
                        </div>

                        <div class="cv-section">
                            <h3>SỞ THÍCH</h3>
                            <textarea name="hobbiesCv" placeholder="Điền các sở thích của bạn">${empty cv.hobbiesCv ? '' : cv.hobbiesCv}</textarea>
                        </div>
                    </div>
                </div>
            </section>
        </form>

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
