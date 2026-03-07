<%-- 
    Document   : viec-lam
    Created on : Mar 5, 2026, 7:27:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks - ViecLam</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/viec-lam.css">
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


        <!------------------------------------------ BANNER -------------------------------------------->
        <section class="hero">
            <img class="hero__bg" src="${pageContext.request.contextPath}/static/images/mota/Banner2.png" alt="banner"/>

            <div class="container hero__grid">
                <div class="hero__content">
                    <h1>Tìm công việc phù hợp chỉ trong vài phút</h1>
                    <p>
                        Tiếp cận 60.000+ tin tuyển dụng việc làm mỗi ngày từ hàng nghìn doanh nghiệp uy tín tại Việt Nam.
                    </p>

                    <!-- SEARCH BOX -->
                    <form class="job-search">
                        <div class="job-search__field">
                            <span>🔎</span>
                            <input type="text" placeholder="Nhập vị trí, kỹ năng (VD: Java, Designer...)" />
                        </div>

                        <div class="job-search__field">
                            <span>📍</span>
                            <select>
                                <option>Tất cả địa điểm</option>
                                <option>Hồ Chí Minh</option>
                                <option>Hà Nội</option>
                                <option>Đà Nẵng</option>
                                <option>Remote</option>
                            </select>
                        </div>

                        <button class="btn btn--primary">Tìm việc</button>
                    </form>

                    <!-- CHIPS -->
                    <div class="category-chips">
                        <span class="category-chips__item is-active">IT</span>
                        <span class="category-chips__item">Marketing</span>
                        <span class="category-chips__item">Kế toán</span>
                        <span class="category-chips__item">Thiết kế</span>
                    </div>
                </div>
            </div>
        </section>

        <!-------------------------------------- COMPANY --------------------------------------->
        <section class="company-section" id="companies">
            <div class="container">
                <!-- Top banner -->
                <div class="company-hero">
                    <img class="company-hero__bg" src="${pageContext.request.contextPath}/static/images/Home/QCCompany.png" alt="">
                    <div class="company-hero__content">
                        <h2>Thương hiệu lớn tiêu biểu</h2>
                        <p>Hàng trăm thương hiệu lớn tiêu biểu đang tuyển dụng trên MatchWorks</p>
                    </div>
                </div>

                <!-- Tabs -->
                <div class="company-tabs">
                    <div class="company-tabs__list" id="tabsScroll">
                        <button class="company-tabs__tab is-active" type="button" data-cat="all">Tất cả</button>
                        <button class="company-tabs__tab" type="button" data-cat="bank">Ngân hàng</button>
                        <button class="company-tabs__tab" type="button" data-cat="real">Bất động sản</button>
                        <button class="company-tabs__tab" type="button" data-cat="build">Xây dựng</button>
                        <button class="company-tabs__tab" type="button" data-cat="it">IT - Phần mềm</button>
                        <button class="company-tabs__tab" type="button" data-cat="finance">Tài chính</button>
                        <button class="company-tabs__tab" type="button" data-cat="fmcg">Bán lẻ - FMCG</button>
                        <button class="company-tabs__tab" type="button" data-cat="factory">Sản xuất</button>
                    </div>
                </div>

                <!-- Grid -->
                <div class="company-grid">
                    <!-- Big featured card (left) -->
                    <article class="company-card company-card--featured" data-cat="bank">
                        <div class="company-card__featured-logo">
                            <div class="company-card__logo-box">
                                <img src="https://dummyimage.com/220x140/ffffff/0b1b3a&text=LOGO" alt="Logo công ty" />
                            </div>
                        </div>

                        <div class="company-card__overlay">
                            <h3>NGÂN HÀNG TMCP VIỆT Á - VIETABANK</h3>
                            <p>Ngân hàng</p>
                            <div class="company-card__meta">
                                <span>💼 36 việc làm</span>
                            </div>
                            <span class="company-card__pill company-card__pill--pro">Pro Company</span>
                        </div>
                    </article>

                    <!-- Small cards (right) -->
                    <article class="company-card" data-cat="real">
                        <div class="company-card__row">
                            <div class="company-card__logo">
                                <img src="https://dummyimage.com/80x80/ffffff/0b1b3a&text=C" alt="Logo" />
                            </div>
                            <div class="company-card__info">
                                <h4>CÔNG TY CỔ PHẦN TẬP ĐOÀN C.E.O</h4>
                                <p>Bất động sản</p>
                                <div class="company-card__bottom">
                                    <span class="company-card__jobs-count">💼 3 việc làm</span>
                                    <button class="company-card__follow" type="button">＋ Theo dõi</button>
                                </div>
                            </div>
                        </div>
                    </article>
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
