<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm Kiếm Việc Làm</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/tim-kiem-viec.css">
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


        <!----------------------------------------- TIM KIEM VIEC ------------------------------------------->

        <div class="container">
            <!-- Cột trái: Bộ lọc -->
            <aside class="sidebar">
                <h3>Bộ lọc tìm kiếm</h3>
                <form action="tim-kiem-viec.jsp" method="GET">
                    <div class="filter-group">
                        <label>Mức lương</label>
                        <select name="salary">
                            <option value="">Tất cả mức lương</option>
                            <option value="1">Dưới 10 triệu</option>
                            <option value="2">10 - 20 triệu</option>
                            <option value="2">20 - 30 triệu</option>
                            <option value="2">30 - 40 triệu</option>
                            <option value="2">40 - 50 triệu</option>
                            <option value="3">Trên 50 triệu</option>
                            <option value="3">Thỏa thuận</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label>Kinh nghiệm (năm)</label>
                        <select name="exp">
                            <option value="">Tất cả</option>
                            <option value="1">Dưới 1 năm</option>
                            <option value="2">1 năm</option>
                            <option value="2">2 năm</option>
                            <option value="2">3 năm</option>
                            <option value="3">Trên 3 năm</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-filter">Lọc kết quả</button>
                </form>
            </aside>

            <!-- Cột phải: Danh sách việc làm -->
            <main class="main-content">
                <%
                    // Giả lập dữ liệu danh sách công việc
                    // Trong thực tế, bạn sẽ lấy dữ liệu từ Database thông qua DAO/Servlet
                    List<Map<String, String>> jobs = new ArrayList<>();
                    
                    Map<String, String> job1 = new HashMap<>();
                    job1.put("title", "Lập trình viên Java Senior");
                    job1.put("company", "Công ty Công Nghệ ABC");
                    job1.put("salary", "25 - 35 triệu");
                    job1.put("address", "Quận 1, TP. HCM");
                    job1.put("exp", "3 năm");
                    jobs.add(job1);

                    Map<String, String> job2 = new HashMap<>();
                    job2.put("title", "Nhân viên Marketing Online");
                    job2.put("company", "Tập đoàn Giải trí XYZ");
                    job2.put("salary", "12 - 18 triệu");
                    job2.put("address", "Cầu Giấy, Hà Nội");
                    job2.put("exp", "1 năm");
                    jobs.add(job2);

                    Map<String, String> job3 = new HashMap<>();
                    job3.put("title", "Kỹ sư Cầu nối (BrSE)");
                    job3.put("company", "FPT Software");
                    job3.put("salary", "40 - 60 triệu");
                    job3.put("address", "Đà Nẵng");
                    job3.put("exp", "5 năm");
                    jobs.add(job3);

                    // Duyệt danh sách và hiển thị
                    for(Map<String, String> job : jobs) {
                %>
                <div class="job-card">
                    <div class="job-details">
                        <h2><%= job.get("title") %></h2>
                        <p class="company"><%= job.get("company") %></p>
                        <p><b>Địa chỉ:</b> <%= job.get("address") %></p>
                        <p><b>Yêu cầu:</b> <%= job.get("exp") %> kinh nghiệm</p>
                        <p class="salary">Mức lương: <%= job.get("salary") %></p>
                    </div>
                    <div class="job-action">
                        <button class="btn-save" onclick="saveJob(this, '<%= job.get("title") %>')">
                            Lưu tin
                        </button>
                    </div>
                </div>
                <%
                    }
                %>
            </main>
        </div>

        <script>
            // Hàm xử lý khi nhấn nút lưu tin
            function saveJob(button, jobTitle) {
                if (button.classList.contains('active')) {
                    button.classList.remove('active');
                    button.innerText = 'Lưu tin';
                    alert('Đã bỏ lưu: ' + jobTitle);
                } else {
                    button.classList.add('active');
                    button.innerText = 'Đã lưu';
                    alert('Đã lưu tin tuyển dụng: ' + jobTitle);
                }
            }
        </script>

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
                <div class="site-footer__bottom_text">
                    © 2026 MatchWorks. All rights reserved.
                </div>
            </div>
        </footer>
    </body>
</html>