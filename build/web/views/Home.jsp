<%-- 
    Document   : Home
    Created on : Mar 1, 2026, 6:30:29 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MatchWorks-Home</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/home.css">
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

        <!-------------------------------------- BANNER --------------------------------------->
        <section class="hero">
            <img class="hero__bg" src="${pageContext.request.contextPath}/static/images/Home/Banner.png" alt="banner"/>

            <div class="container hero__grid">
                <div class="hero__content">
                    <span class="hero__badge">Nền tảng tìm việc thông minh</span>
                    <h1>Tìm công việc phù hợp chỉ trong vài phút</h1>
                    <p>
                        Tìm theo kỹ năng, vị trí, mức lương. Ứng tuyển nhanh — nhà tuyển dụng phản hồi sớm.
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

        <!-------------------------------------- FEATURED JOBS --------------------------------------->
        <section class="featured-jobs" id="featured-jobs">
            <div class="container">
                <div class="section-header">
                    <h2>Việc làm nổi bật</h2>
                    <a class="section-header__link" href="${pageContext.request.contextPath}/views/jobs">Xem tất cả</a>
                </div>

                <!-- FILTER BAR -->
                <div class="job-filter">
                    <div class="job-filter__left">
                        <div class="job-filter__dropdown">
                            <span>☰ Lọc theo:</span>
                            <select id="filterType">
                                <option value="salary" ${filterType=="salary"?"selected":""}>Mức lương</option>
                                <option value="exp" ${filterType=="exp"?"selected":""}>Kinh nghiệm</option>
                            </select>
                        </div>
                    </div>
                    <div class="job-filter__right" id="filterOptions">
                        <!-- JS sẽ render option ở đây -->
                    </div>
                </div>

                <div class="job-grid">
                    <c:forEach var="j" items="${jobs}">
                        <article class="job-card">
                            <div class="job-card__top">
                                <div class="job-card__info">
                                    <h3>${j.titleJob}</h3>
                                    <p class="job-card__meta">${j.companyName}</p>
                                </div>
                            </div>

                            <div class="job-card__tags">
                                <span class="salary">${j.salaryJob}</span>
                                <span class="salary">${j.cityName}</span>
                            </div>

                            <a href="${pageContext.request.contextPath}/views/job-detail?id=${j.jobId}">
                                <button class="btn-save">
                                    Xem chi tiết
                                </button>
                            </a>
                        </article>
                    </c:forEach>
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

                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="all">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='all'?'is-active':''}">
                                Tất cả
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="1">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='1'?'is-active':''}">
                                Ngân hàng
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="2">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='2'?'is-active':''}">
                                Bất động sản
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="3">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='3'?'is-active':''}">
                                Xây dựng
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="4">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='4'?'is-active':''}">
                                IT - Phần mềm
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="5">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='5'?'is-active':''}">
                                Tài chính
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="6">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='6'?'is-active':''}">
                                Bán lẻ -FMCG
                            </button>
                        </form>
                        <form action="${pageContext.request.contextPath}/views/Home" method="get">
                            <input type="hidden" name="category" value="7">
                            <input type="hidden" name="page" value="1">
                            <button class="company-tabs__tab ${category=='7'?'is-active':''}">
                                Sản xuất
                            </button>
                        </form>        
                    </div>
                </div>

                <!-- Grid -->
                <div class="company-grid">
                    <c:forEach items="${companyList}" var="c">
                        <div>
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

                    <a href="Home?category=${category}&page=${i}&keyword=${keyword}"
                       class="page-item ${i==currentPage?'active':''}">
                        ${i}
                    </a>
                </c:forEach>

            </div>
        </div>

        <!-------------------------------------- TAO CV --------------------------------------->
        <section class="cv-section" id="tao-cv">
            <div class="container">
                <h2 class="cv-section__title">Tạo CV chuyên nghiệp</h2>

                <div class="cv-section__layout">
                    <!-- LEFT -->
                    <div class="cv-section__preview">
                        <img class="cv-section__image" src="${pageContext.request.contextPath}/static/images/Home/Company.png" alt="alt"/>
                    </div>

                    <!-- RIGHT -->
                    <div class="cv-section__content">
                        <!-- top info -->
                        <div class="cv-section__header">
                            <h3>Tạo CV chuyên nghiệp</h3>
                            <p>Chọn mẫu, nhập thông tin, xuất CV — nhanh gọn và đúng chuẩn.</p>
                        </div>

                        <!-- actions -->
                        <div class="cv-section__actions">
                            <a href="${pageContext.request.contextPath}/views/checklogin">
                                <button class="mw-btn mw-btn--primary" type="button">Tạo CV</button>
                            </a>
                            <a href="company">
                                <button class="mw-btn mw-btn--ghost" type="button">Công ty</button>
                            </a>
                        </div>

                        <!-- company suggest -->
                        <div class="cv-section__suggestions">
                            <div class="cv-section__suggestions-header">
                                <h4>Công ty gợi ý cho bạn</h4>
                                <a href="${pageContext.request.contextPath}/views/company" class="cv-section__more">Xem thêm</a>
                            </div>
                            <div class="company-grid_2">
                                <!-- VNPAY -->
                                <article class="company-card">
                                    <div class="company-card__row">
                                        <div class="company-card__logo">
                                            <img src="${pageContext.request.contextPath}/static/images/company/it2.png" />
                                        </div>
                                        <div class="company-card__info">
                                            <h4>Công ty CP Giải pháp Thanh toán Việt Nam (VNPAY)</h4>
                                            <div class="company-card__bottom">
                                                <a href="${pageContext.request.contextPath}/views/company-detail?id=17">
                                                    <button class="company-card__follow">Xem Thông Tin</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <!-- Home Credit -->
                                <article class="company-card">
                                    <div class="company-card__row">
                                        <div class="company-card__logo">
                                            <img src="${pageContext.request.contextPath}/static/images/company/tc2.png" />
                                        </div>
                                        <div class="company-card__info">
                                            <h4>Home Credit Việt Nam</h4>
                                            <div class="company-card__bottom">
                                                <a href="${pageContext.request.contextPath}/views/company-detail?id=22">
                                                    <button class="company-card__follow">Xem Thông Tin</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <!-- DOJILAND -->
                                <article class="company-card">
                                    <div class="company-card__row">
                                        <div class="company-card__logo">
                                            <img src="${pageContext.request.contextPath}/static/images/company/bds2.png" />
                                        </div>
                                        <div class="company-card__info">
                                            <h4>Công ty TNHH Đầu tư BĐS DOJILAND</h4>
                                            <div class="company-card__bottom">
                                                <a href="${pageContext.request.contextPath}/views/company-detail?id=7">
                                                    <button class="company-card__follow">Xem Thông Tin</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <!-- Đường sắt -->
                                <article class="company-card">
                                    <div class="company-card__row">
                                        <div class="company-card__logo">
                                            <img src="${pageContext.request.contextPath}/static/images/company/xd5.png" />
                                        </div>
                                        <div class="company-card__info">
                                            <h4>CÔNG TY CỔ PHẦN TỔNG CÔNG TY CÔNG TRÌNH ĐƯỜNG SẮT</h4>
                                            <div class="company-card__bottom">
                                                <a href="${pageContext.request.contextPath}/views/company-detail?id=15">
                                                    <button class="company-card__follow">Xem Thông Tin</button>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="chat-toggle" onclick="toggleChat()">💬Hỏi Đáp</div>

        <div id="chatbox">
            <div id="chat-header">AI Job Assistant 🤖</div>
            <div id="messages"></div>

            <div class="input-area">
                <input id="input" placeholder="Nhập câu hỏi..." />
                <button onclick="send()">➤</button>
            </div>
        </div>

        <script>
            function toggleChat() {
                let box = document.getElementById("chatbox");
                box.style.display = box.style.display === "flex" ? "none" : "flex";
            }

            function send() {
                let msg = document.getElementById("input").value;
                addMessage("user", msg);

                let loading = addMessage("bot", `
                            <div class="typing-indicator">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                            `);

                fetch("chatbot", {
                    method: "POST",
                    headers: {"Content-Type": "application/x-www-form-urlencoded"},
                    body: "message=" + encodeURIComponent(msg)
                })
                        .then(res => res.text())
                        .then(data => {
                            loading.remove();
                            addMessage("bot", data);
                        });
                document.getElementById("input").value = "";
            }

            function addMessage(type, text) {
                let div = document.createElement("div");
                div.className = "msg " + type;
                div.innerHTML = text;
                let messages = document.getElementById("messages");
                messages.appendChild(div);
                messages.scrollTop = messages.scrollHeight;
                return div;
            }

            function goDetail(id) {
                window.location.href = "job-detail?id=" + id;
            }

            document.getElementById("input").addEventListener("keypress", function (e) {
                if (e.key === "Enter") {
                    send();
                }
            });
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
                        <a class="site-footer__eco-link" href="${pageContext.request.contextPath}/views/jobs?page=1">Tuyển dụng</a>
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const filterTypeEl = document.getElementById("filterType");
                const filterOptions = document.getElementById("filterOptions");

                if (!filterTypeEl || !filterOptions)
                    return;

                const params = new URLSearchParams(window.location.search);
                let currentType = params.get("filterType") || "salary";
                let currentValue = params.get("filterValue") || "Tất cả";

                filterTypeEl.value = currentType;

                const salaryOptions = [
                    "Tất cả", "Dưới 10 triệu", "10 - 20 triệu",
                    "20 - 30 triệu", "30 - 50 triệu",
                    "Trên 50 triệu", "Thỏa thuận"
                ];

                const expOptions = [
                    "Tất cả", "Dưới 1 năm", "1 năm",
                    "2 năm", "3 năm", "Trên 3 năm"
                ];

                function renderFilters(type) {
                    const options = type === "salary" ? salaryOptions : expOptions;
                    filterOptions.innerHTML = "";

                    options.forEach((text) => {
                        const chip = document.createElement("button");
                        chip.type = "button";
                        chip.className = "filter-chip";

                        // giữ active
                        if (text === currentValue) {
                            chip.classList.add("active");
                        }

                        chip.textContent = text;

                        chip.onclick = function (e) {
                            e.preventDefault();

                            // 🔥 FIX QUAN TRỌNG
                            window.location.href =
                                    "${pageContext.request.contextPath}/views/Home" +
                                    "?filterType=" + filterTypeEl.value +
                                    "&filterValue=" + encodeURIComponent(text);
                        };

                        filterOptions.appendChild(chip);
                    });
                }

                filterTypeEl.addEventListener("change", function () {
                    currentValue = "Tất cả";
                    renderFilters(filterTypeEl.value);
                });

                renderFilters(currentType);
            });
        </script>            
    </body>
</html>