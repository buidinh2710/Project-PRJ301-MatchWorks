<%-- 
    Document   : gioi-thieu-company
    Created on : Mar 7, 2026, 2:20:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks - Giới Thiệu Công Ty</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/gioi-thieu-company.css">
        <script src="${pageContext.request.contextPath}/static/js/home.js" defer></script>
    </head>
    <body>
        <!-------------------------------------- HEADER --------------------------------------->
        <header class="site-header" role="banner">
            <div class="container site-header__inner">
                <!-- Brand -->
                <a class="brand" href="#" aria-label="MatchWorks">
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
                        <button class="primary-nav__link primary-nav__link--has-caret" type="button"
                                aria-haspopup="true" aria-expanded="false" data-dd-trigger>
                            Việc làm
                        </button>

                        <div class="mega-menu mega-menu--jobs" role="menu" aria-label="Menu việc làm" data-dd-panel>
                            <div class="mega-menu__inner mega-menu__inner--single">
                                <div class="mega-menu__col">
                                    <div class="mega-menu__title">VIỆC LÀM</div>

                                    <a class="mega-menu__item" href="#">
                                        <span class="mega-menu__icon" aria-hidden="true">🔎</span>
                                        <span class="mega-menu__text">Tìm việc làm</span>
                                    </a>

                                    <a class="mega-menu__item" href="#">
                                        <span class="mega-menu__icon" aria-hidden="true">📌</span>
                                        <span class="mega-menu__text">Việc làm đã lưu</span>
                                    </a>

                                    <a class="mega-menu__item" href="#">
                                        <span class="mega-menu__icon" aria-hidden="true">📩</span>
                                        <span class="mega-menu__text">Việc làm đã ứng tuyển</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Dropdown: CV -->
                    <div class="nav-dropdown" data-dd="cv">
                        <button class="primary-nav__link primary-nav__link--has-caret" type="button"
                                aria-haspopup="true" aria-expanded="false" data-dd-trigger>
                            Tạo CV
                        </button>

                        <div class="mega-menu mega-menu--cv" role="menu" aria-label="Menu tạo CV" data-dd-panel>
                            <div class="mega-menu__inner mega-menu__inner--single">
                                <div class="mega-menu__col">
                                    <div class="mega-menu__title">TẠO CV</div>

                                    <a class="mega-menu__item" href="#">
                                        <span class="mega-menu__icon" aria-hidden="true">📁</span>
                                        <span class="mega-menu__text">Quản lí CV</span>
                                    </a>

                                    <a class="mega-menu__item" href="#">
                                        <span class="mega-menu__icon" aria-hidden="true">📝</span>
                                        <span class="mega-menu__text">Hướng dẫn viết CV</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a class="primary-nav__link" href="#">Công ty</a>
                    <a class="primary-nav__link" href="#">Cẩm nang nghề nghiệp</a>
                </nav>

                <!-- Actions -->
                <div class="header-actions">
                    <button class="button button--ghost" type="button">Đăng nhập</button>
                    <button class="button button--primary" type="button">Đăng ký</button>
                </div>
            </div>

            <!-- Mobile backdrop -->
            <div class="nav-backdrop" hidden></div>
        </header>

        <!-------------------------------------- GIOI THIEU COMPANY --------------------------------------->
        <section class="company-section">

            <!-- Header -->
            <div class="company-header">
                <img src="logo-company.png" class="company-logo">

                <h2 class="company-name">
                    Công ty cổ phần Dịch Vụ và Địa Ốc Kiến Hưng
                </h2>
            </div>


            <!-- Lĩnh vực -->
            <div class="company-card">
                <p class="card-label">Lĩnh vực</p>
                <p>Thương mại điện tử</p>
            </div>


            <!-- Địa điểm -->
            <div class="company-card">
                <p class="card-label">Địa điểm</p>
                <p>Lầu 2 CirCO Hoàng Diệu, Ba Đình, Hà Nội</p>
            </div>


            <!-- Giới thiệu -->
            <div class="company-card">

                <div class="card-title">
                    Giới thiệu công ty
                </div>

                <p class="card-text">
                    ACB là một trong những ngân hàng thương mại cổ phần hàng đầu Việt Nam,
                    với hệ thống mạng lưới chi nhánh rộng khắp và gần 9.000 nhân viên làm việc...
                </p>

            </div>


            <!-- Tuyển dụng -->
            <div class="company-card">

                <div class="card-title">
                    Tuyển dụng
                </div>

                <div class="job-card">

                    <div class="job-info">
                        <h3>Lập trình viên Java Senior</h3>
                        <p>Công ty Công Nghệ ABC</p>
                        <p>Địa chỉ: Quận 1, TP.HCM</p>
                        <p>Yêu cầu: 3 năm kinh nghiệm</p>

                        <span class="salary">
                            Mức lương: 25 - 35 triệu
                        </span>
                    </div>

                    <button class="btn-save">
                        Lưu tin
                    </button>

                </div>
                
                <div class="job-card">

                    <div class="job-info">
                        <h3>Lập trình viên Java Senior</h3>
                        <p>Công ty Công Nghệ ABC</p>
                        <p>Địa chỉ: Quận 1, TP.HCM</p>
                        <p>Yêu cầu: 3 năm kinh nghiệm</p>

                        <span class="salary">
                            Mức lương: 25 - 35 triệu
                        </span>
                    </div>

                    <button class="btn-save">
                        Lưu tin
                    </button>

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
                        <a class="site-footer__eco-link" href="#">Tạo CV</a>
                        <a class="site-footer__eco-link" href="#">Công Ty</a>
                        <a class="site-footer__eco-link" href="#">Cẩm Năng</a>
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
