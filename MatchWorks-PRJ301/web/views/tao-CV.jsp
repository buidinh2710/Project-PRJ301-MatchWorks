<%-- 
    Document   : tao-CV
    Created on : Mar 5, 2026, 2:40:16 AM
    Author     : Admin
--%>

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
                <a class="brand" href="#" aria-label="MatchWorks">
                    <img class="brand__logo" src="${pageContext.request.contextPath}/static/images/Home/LogoMatchWorks.png" alt="MatchWorks" />
                </a>

                <!-- Burger (mobile) -->
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








        <!-------------------------------------- CV BAR ------------------------------------- -->
        <section class="cvbar" aria-label="Thanh tên CV">
            <div class="container cvbar__inner">

                <!-- Left: doc icon + title input -->
                <div class="cvbar__left">
                    <span class="cvbar__icon" aria-hidden="true"></span>

                    <input
                        class="cvbar__title"
                        id="cvTitleInput"
                        type="text"
                        value="CV chưa đặt tên"
                        placeholder="CV chưa đặt tên"
                        aria-label="Tên CV"
                        />
                </div>

                <!-- Right: actions -->
                <div class="cvbar__actions">
                    <button class="cvbar__btn cvbar__btn--ghost" type="button" id="cvPreviewBtn">
                        <span class="cvbar__btnIcon" aria-hidden="true">👁️‍️️</span>
                        <span class="cvbar__btnText">Xem trước</span>
                    </button>

                    <button class="cvbar__btn cvbar__btn--primary" type="button" id="cvSaveBtn">
                        <span class="cvbar__btnIcon" aria-hidden="true">💾</span>
                        <span class="cvbar__btnText">Lưu CV</span>
                    </button>
                </div>

            </div>
        </section>


        <!------------------------------------------- VIET CV ------------------------------------------ -->
        <section class="cv-builder">
            <div class="cv-container">
                <!-- LEFT AVATAR -->
                <div class="cv-avatar">

                    <!-- avatar hiển thị -->
                    <div class="avatar-box">
                        <img class="avatar-preview" id="avatarPreview" alt="Ảnh đại diện">
                        <span class="avatar-fallback" id="avatarFallback"></span>
                    </div>

                    <!-- input file -->
                    <input id="avatarInput" class="avatar-input" type="file" accept="image/*">

                    <!-- buttons -->
                    <div class="avatar-actions">

                        <label for="avatarInput" class="avatar-upload-btn">
                            📷 Tải ảnh
                        </label>

                        <button class="avatar-remove" id="avatarRemove" type="button" disabled>
                            Xoá ảnh
                        </button>

                    </div>

                </div>

                <!-- RIGHT CONTENT -->
                <div class="cv-content">
                    <div class="cv-info">
                        <input placeholder="Họ Tên" class="cv-name" />

                        <div class="grid">
                            <input placeholder="Vị trí ứng tuyển" />
                            <input type="date" />

                            <input placeholder="Giới tính" />
                            <input placeholder="Số điện thoại" />

                            <input placeholder="Email" />
                            <input placeholder="Website" />

                            <input placeholder="Địa chỉ" class="full" />
                        </div>
                    </div>

                    <div class="cv-section">
                        <h3>MỤC TIÊU NGHỀ NGHIỆP</h3>
                        <textarea placeholder="Mục tiêu nghề nghiệp của bạn"></textarea>
                    </div>

                    <div class="cv-section">
                        <h3>HỌC VẤN</h3>
                        <div class="row">
                            <input placeholder="Bắt đầu - Kết thúc" />
                            <input placeholder="Tên trường học" />
                        </div>
                        <input placeholder="Ngành học / Môn học" />
                        <textarea placeholder="Mô tả quá trình học tập"></textarea>
                    </div>

                    <div class="cv-section">
                        <h3>KINH NGHIỆM LÀM VIỆC</h3>
                        <textarea placeholder="Mô tả kinh nghiệm"></textarea>
                    </div>

                    <div class="cv-section">
                        <h3>CHỨNG CHỈ</h3>
                        <div class="row">
                            <input placeholder="Thời gian" />
                            <input placeholder="Tên chứng chỉ" />
                        </div>
                    </div>

                    <div class="cv-section">
                        <h3>KỸ NĂNG</h3>
                        <div class="row">
                            <input placeholder="Tên kỹ năng" />
                            <input placeholder="Mô tả kỹ năng" />
                        </div>
                    </div>

                    <div class="cv-section">
                        <h3>SỞ THÍCH</h3>
                        <textarea placeholder="Điền các sở thích của bạn"></textarea>
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
