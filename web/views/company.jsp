<%-- 
    Document   : company
    Created on : Mar 5, 2026, 7:46:38 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company - MatchWorks</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/company.css">
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

        <!--------------------------------------BANNER COMPANY --------------------------------------->
        <section class="discover">
            <img 
                class="discover__bg"
                src="${pageContext.request.contextPath}/static/images/company/Banner3.png"
                alt="company"
                aria-hidden="true"
                >

            <div class="container discover__inner">


                <div class="discover__content">
                    <h2 class="discover__title">
                        Khám phá 100.000+ công ty nổi bật
                    </h2>

                    <p class="discover__subtitle">
                        Tra cứu thông tin công ty và tìm kiếm nơi làm việc tốt nhất dành cho bạn
                    </p>

                    <form class="discover-search" action="${pageContext.request.contextPath}/views/company">

                        <span class="discover-search__icon">🔍</span>

                        <input 
                            class="discover-search__input"
                            name="keyword"
                            type="text"
                            placeholder="Nhập tên công ty"
                            value="${keyword}"
                            >
                        <input type="hidden" name="category" value="${category}">
                        <input type="hidden" name="page" value="1">
                        <button class="discover-search__btn">
                            Tìm kiếm
                        </button>

                    </form>
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
                    <div class="company-tabs__list">

                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="all">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='all'?'is-active':''}">
                                Tất cả
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="1">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='1'?'is-active':''}">
                                Ngân hàng
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="2">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='2'?'is-active':''}">
                                Bất động sản
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="3">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='3'?'is-active':''}">
                                Xây dựng
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="4">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='4'?'is-active':''}">
                                IT - Phần mềm
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="5">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='5'?'is-active':''}">
                                Tài chính
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="6">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='6'?'is-active':''}">
                                Bán lẻ -FMCG
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/company" method="get">
                            <input type="hidden" name="category" value="7">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='7'?'is-active':''}">
                                Sản xuất
                            </button>
                        </form>        
                    </div>
                </div>

                <div class="company-grid">
                    <c:forEach items="${companyList}" var="c">
                        <div>
                            <!-- Small cards (right) -->
                            <article class="company-card" data-cat="real">
                                <div class="company-card__row">
                                    <div class="company-card__logo">
                                        <img src="${pageContext.request.contextPath}/static/images/company/${c.avtCompany}" alt="Logo" />
                                    </div>
                                    <div class="company-card__info">
                                        <h4>${c.nameCompany}</h4>
                                        <p>${c.categoryName}</p>
                                        <div class="company-card__bottom">
                                            <span class="company-card__jobs-count">💼 ${c.totalJobs} việc làm</span>
                                            <a href="${pageContext.request.contextPath}/views/company-detail?id=${c.companyId}">
                                                <button class="company-card__follow" type="button">Xem Thông Tin</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>              

        <div class="pagination-container">
            <div class="pagination"">

                <c:forEach begin="1" end="${endPage}" var="i">

                    <a href="company?category=${category}&page=${i}&keyword=${keyword}"
                       class="page-item ${i==currentPage?'active':''}">
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
