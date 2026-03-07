<%-- 
    Document   : mo-ta
    Created on : Mar 4, 2026, 3:59:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks-Mota</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mota.css">
        <script src="${pageContext.request.contextPath}/static/js/mota.js" defer></script>
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







        <!------------------------------------------ JOB-DETAIL-------------------------------------------->
        <section class="job-detail">
            <div class="job-container">

                <!-- LEFT -->
                <div class="job-left">
                    <div class="card job-header">
                        <div class="job-head">
                            <div class="job-head__text">
                                <h2 class="job-title">Chuyên Viên PR Marketing Và Sự Kiện</h2>
                            </div>
                        </div>

                        <div class="job-meta">
                            <div class="meta">
                                <div class="meta__label">Mức lương</div>
                                <div class="meta__value">10 - 15 triệu</div>
                            </div>
                            <div class="meta">
                                <div class="meta__label">Địa điểm</div>
                                <div class="meta__value meta__value--accent">Hà Nội</div>
                            </div>
                            <div class="meta">
                                <div class="meta__label">Kinh nghiệm</div>
                                <div class="meta__value">1 năm</div>
                            </div>
                        </div>

                        <!-- ACTIONS -->
                        <div class="job-actions">
                            <button class="btn btn-primary" type="button">
                                Ứng tuyển ngay
                            </button>

                            <button class="btn btn-save" id="saveBtn" type="button" aria-pressed="false" data-saved="false">
                                <span class="save-ico" aria-hidden="true">♡</span>
                                <span class="save-text">Lưu tin</span>
                            </button>
                        </div>
                    </div>

                    <h1 class="detail-title">Chi tiết tin tuyển dụng</h1>

                    <!-- Mô tả công việc -->
                    <div class="card block">
                        <h3 class="block-title">Mô tả công việc</h3>

                        <!-- bạn thay bằng c:forEach, mỗi item 1 dòng -->
                        <div class="job-line">Xây dựng và quản lý nội dung trên Fanpage, website và các kênh social của Công ty.</div>
                        <div class="job-line">Lên ý tưởng, viết bài PR cho chiến dịch bán hàng, truyền thông thương hiệu và các hoạt động marketing.</div>
                        <div class="job-line">Lập kế hoạch nội dung theo tuần/tháng, phối hợp thiết kế để sản xuất ấn phẩm truyền thông.</div>
                        <div class="job-line">Theo dõi hiệu quả nội dung (reach, engagement, leads), đề xuất cải tiến theo mục tiêu.</div>
                        <div class="job-line">Phối hợp với các phòng ban triển khai sự kiện, truyền thông nội bộ và đối ngoại.</div>
                    </div>

                    <!-- Yêu cầu -->
                    <div class="card block">
                        <h3 class="block-title">Yêu cầu ứng viên</h3>

                        <div class="job-line">Tốt nghiệp Đại học chuyên ngành Marketing/Báo chí/Truyền thông hoặc lĩnh vực liên quan.</div>
                        <div class="job-line">Có kinh nghiệm viết nội dung, hiểu các định dạng content theo nền tảng (Facebook/TikTok/Web).</div>
                        <div class="job-line">Có tư duy hình ảnh, biết phối hợp team design/video để ra sản phẩm tốt.</div>
                        <div class="job-line">Chủ động, trách nhiệm, làm việc nhóm tốt; chịu được deadline.</div>
                    </div>

                    <!-- Quyền lợi -->
                    <div class="card block">
                        <h3 class="block-title">Quyền lợi được hưởng</h3>

                        <div class="job-line">Lương cơ bản + thưởng KPI; xét tăng lương định kỳ theo hiệu quả công việc.</div>
                        <div class="job-line">Được đào tạo nâng cao chuyên môn (content/campaign/performance) và phát triển lộ trình nghề nghiệp.</div>
                        <div class="job-line">Môi trường trẻ, năng động; có cơ hội tham gia các chiến dịch thương hiệu lớn.</div>
                        <div class="job-line">Đóng BHXH, phép năm, team building và các chế độ theo quy định.</div>
                    </div>
                </div>

                <!-- RIGHT -->
                <aside class="job-right">
                    <div class="card company-card">
                        <div class="company-top">
                            <img
                                class="company-logo"
                                src="https://via.placeholder.com/64x64.png?text=LOGO"
                                alt="Logo công ty"
                                />
                            <div class="company-name">
                                <div class="company-name__title">CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ VEXERE</div>
                            </div>
                        </div>

                        <div class="company-info">
                            <div class="info-row">
                                <div class="info-label">Lĩnh vực</div>
                                <div class="info-value">Thương mại điện tử</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Địa điểm</div>
                                <div class="info-value">Lầu 2 CirCO Hoàng Diệu, Ba Đình, Hà Nội</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Mô tả</div>
                                <div class="info-value">
                                    Nền tảng kết nối người dùng với hệ thống nhà xe/đối tác, tập trung trải nghiệm đặt vé nhanh, tiện và minh bạch.
                                </div>
                            </div>

                            <button class="btn btn-outline" type="button" onclick="window.location.href = '#company'">
                                Xem trang công ty ↗
                            </button>
                        </div>
                    </div>

                    <div class="card stat-card">
                        <div class="stat-title">Số lượng tuyển</div>
                        <div class="stat-number">3</div>
                        <div class="stat-sub">Ưu tiên ứng viên nộp sớm</div>
                    </div>
                </aside>
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
