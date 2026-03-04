<%-- 
    Document   : Home
    Created on : Mar 1, 2026, 6:30:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks-Home</title>

        <link rel="stylesheet" href="css/home.css">
        <script src="js/home.js" defer></script>

    </head>
    <body>
        <!-------------------------------------- HEADER --------------------------------------->
        <header class="mw-header" role="banner">
            <div class="mw-container mw-header__inner">
                <!-- Brand -->
                <a class="mw-brand" href="#" aria-label="MatchWorks">
                    <img class="mw-brand__logo" src="images/Home/LogoMatchWorks.png" alt="MatchWorks" />
                </a>

                <!-- Burger (mobile) -->
                <button class="mw-burger" type="button"
                        aria-label="Mở menu"
                        aria-expanded="false"
                        aria-controls="mwNav">
                    <span class="mw-burger__bar"></span>
                    <span class="mw-burger__bar"></span>
                    <span class="mw-burger__bar"></span>
                </button>

                <!-- Desktop Nav -->
                <nav id="mwNav" class="mw-nav" aria-label="Điều hướng chính">
                    <!-- Dropdown: Jobs -->
                    <div class="mw-dd" data-dd="jobs">
                        <button class="mw-nav__link mw-nav__link--caret" type="button"
                                aria-haspopup="true" aria-expanded="false" data-dd-trigger>
                            Việc làm
                        </button>

                        <div class="mw-mega mw-mega--jobs" role="menu" aria-label="Menu việc làm" data-dd-panel>
                            <div class="mw-mega__inner mw-mega__inner--single">
                                <div class="mw-mega__col">
                                    <div class="mw-mega__title">VIỆC LÀM</div>

                                    <a class="mw-mega__item" href="#">
                                        <span class="mw-mega__icon" aria-hidden="true">🔎</span>
                                        <span class="mw-mega__text">Tìm việc làm</span>
                                    </a>

                                    <a class="mw-mega__item" href="#">
                                        <span class="mw-mega__icon" aria-hidden="true">📌</span>
                                        <span class="mw-mega__text">Việc làm đã lưu</span>
                                    </a>

                                    <a class="mw-mega__item" href="#">
                                        <span class="mw-mega__icon" aria-hidden="true">📩</span>
                                        <span class="mw-mega__text">Việc làm đã ứng tuyển</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Dropdown: CV -->
                    <div class="mw-dd" data-dd="cv">
                        <button class="mw-nav__link mw-nav__link--caret" type="button"
                                aria-haspopup="true" aria-expanded="false" data-dd-trigger>
                            Tạo CV
                        </button>

                        <div class="mw-mega mw-mega--cv" role="menu" aria-label="Menu tạo CV" data-dd-panel>
                            <div class="mw-mega__inner mw-mega__inner--single">
                                <div class="mw-mega__col">
                                    <div class="mw-mega__title">TẠO CV</div>

                                    <a class="mw-mega__item" href="#">
                                        <span class="mw-mega__icon" aria-hidden="true">📁</span>
                                        <span class="mw-mega__text">Quản lí CV</span>
                                    </a>

                                    <a class="mw-mega__item" href="#">
                                        <span class="mw-mega__icon" aria-hidden="true">📝</span>
                                        <span class="mw-mega__text">Hướng dẫn viết CV</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a class="mw-nav__link" href="#">Công ty</a>
                    <a class="mw-nav__link" href="#">Cẩm nang nghề nghiệp</a>
                </nav>

                <!-- Actions -->
                <div class="mw-actions">
                    <button class="mw-button mw-button--ghost" type="button">Đăng nhập</button>
                    <button class="mw-button mw-button--primary" type="button">Đăng ký</button>
                </div>
            </div>

            <!-- Mobile backdrop -->
            <div class="mw-backdrop" hidden></div>
        </header>

        <!-------------------------------------- BANNER --------------------------------------->
        <section class="banner">
            <img class="banner__bg" src="images/Home/Banner.png" alt="banner"/>

            <div class="container banner__grid">

                <div class="banner__content">
                    <span class="banner__badge">Nền tảng tìm việc thông minh</span>
                    <h1>Tìm công việc phù hợp chỉ trong vài phút</h1>
                    <p>
                        Tìm theo kỹ năng, vị trí, mức lương. Ứng tuyển nhanh — nhà tuyển dụng phản hồi sớm.
                    </p>

                    <!-- SEARCH BOX -->
                    <form class="search-box">
                        <div class="search-field">
                            <span>🔎</span>
                            <input type="text" placeholder="Nhập vị trí, kỹ năng (VD: Java, Designer...)" />
                        </div>

                        <div class="search-field">
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
                    <div class="chips">
                        <span class="chip active">IT</span>
                        <span class="chip">Marketing</span>
                        <span class="chip">Kế toán</span>
                        <span class="chip">Thiết kế</span>
                    </div>
                </div>
            </div>
        </section>

        <!-------------------------------------- VIEC LAM NOI BAT --------------------------------------->
        <section class="featured-jobs" id="featured-jobs">
            <div class="container">

                <div class="section-head">
                    <h2>Việc làm nổi bật</h2>
                    <a class="section-link" href="#">Xem tất cả</a>
                </div>

                <!-- FILTER BAR -->
                <div class="filter-bar">

                    <div class="filter-left">
                        <div class="filter-dropdown">
                            <span>☰ Lọc theo:</span>
                            <select id="filterType">
                                <option value="salary">Mức lương</option>
                                <option value="exp">Kinh nghiệm</option>
                            </select>
                        </div>
                    </div>

                    <div class="filter-right" id="filterOptions">
                        <!-- JS sẽ render option ở đây -->
                    </div>
                </div>

                <div class="jobs-grid">
                    <!-- Job 1 -->
                    <article class="job-card">
                        <div class="job-top">
                            <div class="job-logo">T</div>
                            <div class="job-info">
                                <h3>Frontend Developer (React)</h3>
                                <p class="job-sub">TechNext • Hồ Chí Minh</p>
                            </div>
                        </div>

                        <div class="job-tags">
                            <span class="tag">Full-time</span>
                            <span class="tag">Junior</span>
                            <span class="tag tag-blue">IT</span>
                        </div>

                        <div class="job-bottom">
                            <div class="job-salary">20–35 triệu</div>
                            <button class="btn btn--primary btn--sm" type="button"
                                    onclick="alert('Demo: Ứng tuyển Frontend Developer (React)')">
                                Ứng tuyển
                            </button>
                        </div>
                    </article>
                </div>
            </div>
        </section>

        <!-------------------------------------- COMPANY --------------------------------------->
        <section class="companies" id="companies">
            <div class="container">

                <!-- Top banner -->
                <div class="companies-hero">
                    <img class="hero-bg" src="images/Home/QCCompany.png" alt="">
                    <div class="companies-hero__text">
                        <h2>Thương hiệu lớn tiêu biểu</h2>
                        <p>Hàng trăm thương hiệu lớn tiêu biểu đang tuyển dụng trên MatchWorks</p>
                    </div>
                </div>

                <!-- Tabs -->
                <div class="company-tabs">

                    <div class="tabs-scroll" id="tabsScroll">
                        <button class="tab active" type="button" data-cat="all">Tất cả</button>
                        <button class="tab" type="button" data-cat="bank">Ngân hàng</button>
                        <button class="tab" type="button" data-cat="real">Bất động sản</button>
                        <button class="tab" type="button" data-cat="build">Xây dựng</button>
                        <button class="tab" type="button" data-cat="it">IT - Phần mềm</button>
                        <button class="tab" type="button" data-cat="finance">Tài chính</button>
                        <button class="tab" type="button" data-cat="fmcg">Bán lẻ - FMCG</button>
                        <button class="tab" type="button" data-cat="factory">Sản xuất</button>
                    </div>
                </div>

                <!-- Grid -->
                <div class="company-grid">

                    <!-- Big featured card (left) -->
                    <article class="company-card company-card--big" data-cat="bank">
                        <div class="big-logo">
                            <div class="logo-box">
                                <img src="https://dummyimage.com/220x140/ffffff/0b1b3a&text=LOGO" alt="Logo công ty" />
                            </div>
                        </div>

                        <div class="big-overlay">
                            <h3>NGÂN HÀNG TMCP VIỆT Á - VIETABANK</h3>
                            <p>Ngân hàng</p>
                            <div class="big-meta">
                                <span>💼 36 việc làm</span>
                            </div>
                            <span class="pro-pill">Pro Company</span>
                        </div>
                    </article>

                    <!-- Small cards (right) -->
                    <article class="company-card" data-cat="real">
                        <div class="company-row">
                            <div class="company-logo">
                                <img src="https://dummyimage.com/80x80/ffffff/0b1b3a&text=C" alt="Logo" />
                            </div>
                            <div class="company-info">
                                <h4>CÔNG TY CỔ PHẦN TẬP ĐOÀN C.E.O</h4>
                                <p>Bất động sản</p>
                                <div class="company-bottom">
                                    <span class="jobs-count">💼 3 việc làm</span>
                                    <button class="follow-btn" type="button">＋ Theo dõi</button>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>

        <!-------------------------------------- TAO CV --------------------------------------->
        <section class="cv-section" id="tao-cv">
            <div class="container">
                <h2 class="cv-section__title">Tạo CV chuyên nghiệp</h2>

                <div class="cv-layout">

                    <!-- LEFT -->
                    <div class="cv-left-card">
                        <img class="cv-paper" src="images/Home/Company.png" alt="alt"/>
                    </div>


                    <!-- RIGHT -->
                    <div class="cv-right">

                        <!-- top info -->
                        <div class="cv-topbar">
                            <h3>Tạo CV chuyên nghiệp</h3>
                            <p>Chọn mẫu, nhập thông tin, xuất CV — nhanh gọn và đúng chuẩn.</p>
                        </div>

                        <!-- actions -->
                        <div class="cv-actions">
                            <button class="mw-btn mw-btn--primary" type="button">Tạo CV</button>
                            <button class="mw-btn mw-btn--ghost" type="button">Công ty</button>
                        </div>

                        <!-- company suggest -->
                        <div class="cv-company-box">
                            <div class="cv-company-head">
                                <h4>Công ty gợi ý cho bạn</h4>
                                <a href="#" class="cv-more">Xem thêm</a>
                            </div>

                            <div class="cv-company-grid">
                                <div class="cv-company-card">
                                    <div class="logo-badge">FPT</div>
                                    <div class="c-info">
                                        <div class="c-name">FPT Software</div>
                                        <div class="c-meta">IT - Phần mềm • 22 việc làm</div>
                                    </div>
                                </div>

                                <div class="cv-company-card">
                                    <div class="logo-badge">VNG</div>
                                    <div class="c-info">
                                        <div class="c-name">VNG Corporation</div>
                                        <div class="c-meta">Công nghệ • 12 việc làm</div>
                                    </div>
                                </div>

                                <div class="cv-company-card">
                                    <div class="logo-badge">MB</div>
                                    <div class="c-info">
                                        <div class="c-name">Ngân hàng MB</div>
                                        <div class="c-meta">Tài chính • 9 việc làm</div>
                                    </div>
                                </div>

                                <div class="cv-company-card">
                                    <div class="logo-badge">VTP</div>
                                    <div class="c-info">
                                        <div class="c-name">Viettel Post</div>
                                        <div class="c-meta">Logistics • 6 việc làm</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-------------------------------------- FOOTER --------------------------------------->
        <footer class="mw-footer">
            <div class="container mw-footer__grid">

                <!-- LEFT -->
                <div class="mw-foot-col">
                    <div class="mw-foot-brand">
                        <div class="mw-foot-logo">
                            <img src="images/Home/LogoMatchWorks.png" alt="MatchWorks">
                        </div>
                    </div>

                    <div class="mw-foot-badges">
                        <span class="mw-badge">Google for Startups</span>
                        <span class="mw-badge">Accelerator 2020</span>
                        <span class="mw-badge">Top Brand</span>
                    </div>

                    <div class="mw-foot-block">
                        <h4>Liên hệ</h4>
                        <p><strong>Hotline:</strong> (024) 6680 5588 (Giờ hành chính)</p>
                        <p><strong>Email:</strong> support@matchworks.vn</p>
                    </div>

                    <div class="mw-foot-block">
                        <h4>Cộng đồng MatchWorks</h4>
                        <div class="mw-social">
                            <img src="images/Home/Facebook.jpg" alt="fb"/>
                            <img src="images/Home/Youtube.jpg" alt="yt"/>
                            <img src="images/Home/In.jpg" alt="in"/>
                            <img src="images/Home/Instargram.jpg" alt="ig"/>
                        </div>
                    </div>
                </div>

                <!-- MIDDLE -->
                <div class="mw-foot-col mw-foot-mid">
                    <h4>Công ty cổ phần MatchWorks Việt Nam</h4>
                    <ul class="mw-list">
                        <li>Giấy phép đăng ký kinh doanh số: 0123456789 (cấp ngày 01/01/2026).</li>
                        <li>Địa chỉ: Tầng 10, Tòa nhà A, 123 Nguyễn Trãi, Thanh Xuân, Hà Nội.</li>
                        <li>Chi nhánh HCM: 24C Phan Đăng Lưu, Phú Nhuận, TP.HCM.</li>
                    </ul>

                    <h4 class="mw-mt">Hệ sinh thái MatchWorks</h4>
                    <div class="mw-ecosystem">
                        <a class="mw-eco-card" href="#">Tuyển dụng</a>
                        <a class="mw-eco-card" href="#">Tạo CV</a>
                        <a class="mw-eco-card" href="#">Công Ty</a>
                    </div>
                </div>

                <!-- RIGHT -->
                <div class="mw-foot-col mw-foot-right">
                    <div class="mw-qr">
                        <div class="mw-qr-box">
                            <img src="images/Home/QRdownload.png" alt="QR MatchWorks">
                        </div>
                        <div class="mw-qr-note">Quét QR để tải app</div>
                    </div>

                    <div class="mw-download">
                        <h4>Ứng dụng tải xuống</h4>
                        <img src="images/Home/CH-AS.png" alt="download"/>
                    </div>
                </div>

            </div>

            <div class="mw-footer__bottom">
                <div class="container">
                    © 2026 MatchWorks. All rights reserved.
                </div>
            </div>
        </footer>
    </body>
</html>
