<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form class="job-search" action="${pageContext.request.contextPath}/views/jobs" method="GET">
                        <div class="job-search__field">
                            <span>🔎</span>
                            <input type="text" name="keyword" value="${keyword}"
                                   placeholder="Nhập vị trí, kỹ năng (VD: Java, Designer...)" />
                        </div>

                        <div class="job-search__field">
                            <span>📍</span>
                            <select name="city">
                                <option value="">Tất cả địa điểm</option>
                                <option value="Hà Nội" ${city == 'Hà Nội' ? 'selected' : ''}>Hà Nội</option>
                                <option value="TP. Hồ Chí Minh" ${city == 'TP.Hồ Chí Minh' ? 'selected' : ''}>Hồ Chí Minh</option>
                                <option value="Đà Nẵng" ${city == 'Đà Nẵng' ? 'selected' : ''}>Đà Nẵng</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn--primary">Tìm việc</button>
                    </form>
                </div>
            </div>
        </section>


        <!----------------------------------------- TIM KIEM VIEC ------------------------------------------->

        <div class="container">
            <!-- Cột trái: Bộ lọc -->
            <aside class="sidebar">
                <h3>Bộ lọc tìm kiếm</h3>
                <form action="${pageContext.request.contextPath}/views/jobs" method="GET">
                    <input type="hidden" name="keyword" value="${keyword}">
                    <input type="hidden" name="city" value="${city}">
                    <div class="filter-group">
                        <label>Mức lương</label>
                        <select name="salary">
                            <option value="">Tất cả mức lương</option>
                            <option value="Dưới 10 triệu" ${salary == 'Dưới 10 triệu' ? 'selected' : ''}>Dưới 10 triệu</option>
                            <option value="10 - 20 triệu" ${salary == '10 - 20 triệu' ? 'selected' : ''}>10 - 20 triệu</option>
                            <option value="20 - 30 triệu" ${salary == '20 - 30 triệu' ? 'selected' : ''}>20 - 30 triệu</option>
                            <option value="30 - 40 triệu" ${salary == '30 - 40 triệu' ? 'selected' : ''}>30 - 40 triệu</option>
                            <option value="40 - 50 triệu" ${salary == '40 - 50 triệu' ? 'selected' : ''}>40 - 50 triệu</option>
                            <option value="Trên 50 triệu" ${salary == 'Trên 50 triệu' ? 'selected' : ''}>Trên 50 triệu</option>
                            <option value="Thỏa thuận" ${salary == 'Thỏa thuận' ? 'selected' : ''}>Thỏa thuận</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label>Kinh nghiệm (năm)</label>
                        <select name="experience">
                            <option value="">Tất cả</option>
                            <option value="Dưới 1 năm" ${experience == 'Dưới 1 năm' ? 'selected' : ''}>Dưới 1 năm</option>
                            <option value="1 năm" ${experience == '1 năm' ? 'selected' : ''}>1 năm</option>
                            <option value="2 năm" ${experience == '2 năm' ? 'selected' : ''}>2 năm</option>
                            <option value="3 năm" ${experience == '3 năm' ? 'selected' : ''}>3 năm</option>
                            <option value="Trên 3 năm" ${experience == 'Trên 3 năm' ? 'selected' : ''}>Trên 3 năm</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-filter">Lọc kết quả</button>
                </form>
            </aside>

            <!-- Cột phải: Danh sách việc làm -->
            <div class="main-content">

                <c:forEach var="job" items="${jobs}">
                    <div class="job-card">
                        <div class="job-details">
                            <h2>${job.titleJob}</h2>
                            <p class="company">${job.companyName}</p>
                            <p><b>Kinh nghiệm:</b> ${job.experienceJob}</p>
                            <p class="city_name">Địa điểm: ${job.cityName}</p>
                            <p class="salary">Mức lương: ${job.salaryJob} </p>
                        </div>   
                        <div class="job-action">
                            <a href="${pageContext.request.contextPath}/views/job-detail?id=${job.jobId}">
                                <button class="btn-save">
                                    Chi tiết
                                </button>
                            </a>
                            <form action="${pageContext.request.contextPath}/views/save-job" method="post">
                                <input type="hidden" name="jobId" value="${job.jobId}">
                                <c:choose>
                                    <c:when test="${savedJobIds.contains(job.jobId)}">
                                        <button class="btn btn-save saved" type="submit">
                                            Đã lưu
                                        </button>
                                    </c:when>

                                    <c:otherwise>
                                        <button class="btn btn-save" type="submit">
                                            Lưu tin
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="pagination-container">
            <div class="pagination">
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <a href="${pageContext.request.contextPath}/views/jobs?page=${i}&keyword=${keyword}&city=${city}&salary=${salary}&experience=${experience}"
                       class="page-item ${i == currentPage ? 'active' : ''}">
                        ${i}
                    </a>
                </c:forEach>
            </div>
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