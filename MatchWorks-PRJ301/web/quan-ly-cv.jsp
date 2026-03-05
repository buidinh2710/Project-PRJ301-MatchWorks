<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý CV - MatchWorks</title>
        <link rel="stylesheet" href="css/quan-ly-cv.css">
        <script src="js/header.js" defer></script>
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

        <div class="mw-overlay" hidden></div>
        <div class="page-wrapper ">
            <!-- RIGHT -->
            <div class="right-column left-column">
                <div class="card profile-card">
                    <div class="profile-header">
                        <img src="images/avatar-default.png" class="avatar">
                        <div>
                            <span class="verified">VERIFIED</span>
                            <p>Chào bạn trở lại,</p>
                            <strong>Lê Thị Thùy Linh</strong>
                        </div>
                    </div>
                </div>
            </div>
            <!-- LEFT -->
            <div class="left-column">
                <div class="card">
                    <div class="card-header">
                        <h3>CV đã tạo trên MatchWorks</h3>
                        <button class="btn-create">+ Tạo CV</button>
                    </div>

                    <div class="card-body empty">
                        <img src="images/quan-ly-cv/quan-ly-cv.png" alt="Empty CV">
                        <p>Chưa có CV nào được tạo.</p>
                    </div>
                </div>
            </div>

            

        </div>
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
                            <!-- bạn thay ảnh QR thật của bạn -->
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
</body>
</html>