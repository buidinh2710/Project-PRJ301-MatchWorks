<%-- 
    Document   : mo-ta
    Created on : Mar 4, 2026, 3:59:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks-Mota</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mota.css">
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
                                <h2 class="job-title">${job.titleJob}</h2>
                            </div>
                        </div>

                        <div class="job-meta">
                            <div class="meta">
                                <div class="meta__label">Mức lương</div>
                                <div class="meta__value">${job.salaryJob}</div>
                            </div>
                            <div class="meta">
                                <div class="meta__label">Địa điểm</div>
                                <div class="meta__value meta__value--accent">${job.cityName}</div>
                            </div>
                            <div class="meta">
                                <div class="meta__label">Kinh nghiệm</div>
                                <div class="meta__value">${job.experienceJob}</div>
                            </div>
                        </div>

                        <!-- ACTIONS -->
                        <div class="job-actions">
                            <form action="${pageContext.request.contextPath}/views/applyjob" method="get">
                                <input type="hidden" name="jobId" value="${job.jobId}">
                                <button class="btn btn-primary" type="submit">
                                    Ứng tuyển ngay
                                </button>

                            </form>
                            <form action="${pageContext.request.contextPath}/views/save-job" method="post">
                                <input type="hidden" name="jobId" value="${job.jobId}">
                                <c:choose>
                                    <c:when test="${savedJobIds.contains(job.jobId)}">
                                        <button class="btn btn-save saved" type="submit">
                                            ❤️ Đã lưu
                                        </button>
                                    </c:when>

                                    <c:otherwise>
                                        <button class="btn btn-save" type="submit">
                                            🤍 Lưu tin
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>

                    <h1 class="detail-title">Chi tiết tin tuyển dụng</h1>

                    <!-- Mô tả công việc -->
                    <div class="card block">
                        <h3 class="block-title">Mô tả công việc</h3>

                        <!-- bạn thay bằng c:forEach, mỗi item 1 dòng -->
                        <div class="job-line">${job.descriptionJob}</div>
                    </div>

                    <!-- Yêu cầu -->
                    <div class="card block">
                        <h3 class="block-title">Yêu cầu ứng viên</h3>

                        <div class="job-line">${job.requirementJob}</div>
                    </div>

                    <!-- Quyền lợi -->
                    <div class="card block">
                        <h3 class="block-title">Quyền lợi được hưởng</h3>

                        <div class="job-line">${job.benefitJob}</div>
                    </div>
                </div>

                <!-- RIGHT -->
                <aside class="job-right">
                    <div class="card company-card">
                        <div class="company-top">
                            <img
                                class="company-logo"
                                src="${pageContext.request.contextPath}/static/images/company/${job.avtCompany}"
                                alt="Logo công ty"
                                />
                            <div class="company-name">
                                <div class="company-name__title">${job.companyName}</div>
                            </div>
                        </div>

                        <div class="company-info">
                            <div class="info-row">
                                <div class="info-label">Lĩnh vực</div>
                                <div class="info-value">${job.categoryName}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Địa điểm</div>
                                <div class="info-value">${job.companyAddress}</div>
                            </div>
                            <a class="btn btn-outline" type="button" href = "${pageContext.request.contextPath}/views/company-detail?id=${job.companyId}">
                                Xem trang công ty ↗
                            </a>
                        </div>
                    </div>

                    <div class="card stat-card">
                        <div class="stat-title">Số lượng tuyển</div>
                        <div class="stat-number">${job.hiringQuantity}</div>
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
