<%-- 
    Document   : cam-nang-nghe-nghiep
    Created on : Mar 12, 2026, 3:27:34 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cẩm Năng Nghề Nghiệp</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/cam-nang-nghe-nghiep.css">
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

        <!-------------------------------------- CONTENT --------------------------------------->
        <section class="career-guide">

            <div class="container">

                <div class="career-header">
                    <h2>Cẩm nang nghề nghiệp</h2>
                    <p>
                        Khám phá những lời khuyên, kinh nghiệm thực tế và chiến lược phát triển sự nghiệp
                        giúp bạn tự tin bước vào thị trường lao động hiện đại. Tại MatchWorks, chúng tôi
                        tin rằng mỗi người đều có tiềm năng phát triển nếu được định hướng đúng đắn và
                        trang bị đầy đủ kỹ năng cần thiết cho công việc trong tương lai.
                    </p>
                </div>

                <div class="career-grid">

                    <div class="career-card">
                        <img src="${pageContext.request.contextPath}/static/images/mota/Banner2.png" alt="">
                        <div class="career-content">
                            <h3>Cách viết CV gây ấn tượng với nhà tuyển dụng</h3>
                            <p>
                                Hướng dẫn từng bước để tạo một CV chuyên nghiệp, giúp bạn nổi bật
                                giữa hàng trăm ứng viên khác khi ứng tuyển vào các vị trí mong muốn.
                            </p>
                            <a href="../views/hd-viet-cv.jsp">Đọc thêm →</a>
                        </div>
                    </div>

                </div>


                <div class="career-article">

                    <h3 id="cv">Định hướng nghề nghiệp trong thời đại mới</h3>

                    <p>
                        Trong bối cảnh xã hội hiện đại và sự phát triển nhanh chóng của công nghệ, 
                        việc định hướng nghề nghiệp đã trở thành một yếu tố vô cùng quan trọng đối 
                        với mỗi cá nhân. Trước đây, nhiều người thường lựa chọn công việc dựa trên 
                        bằng cấp hoặc xu hướng phổ biến của xã hội. Tuy nhiên, trong thời đại ngày nay, 
                        thị trường lao động thay đổi liên tục và đòi hỏi mỗi người phải có sự chuẩn bị kỹ 
                        lưỡng hơn về kỹ năng, kiến thức cũng như khả năng thích nghi với môi trường làm việc mới.
                    </p>
                    <p>
                        Việc định hướng nghề nghiệp không chỉ đơn giản là chọn một công việc mà còn là 
                        quá trình tìm hiểu bản thân, xác định điểm mạnh, điểm yếu và những lĩnh vực mà 
                        bạn thực sự đam mê. Khi hiểu rõ năng lực và mục tiêu của mình, bạn sẽ dễ dàng xây
                        dựng được một lộ trình phát triển phù hợp, từ việc lựa chọn ngành học, tích lũy kinh 
                        nghiệm cho đến việc phát triển kỹ năng cần thiết cho công việc trong tương lai.
                    </p>
                    <p>
                        Bên cạnh đó, trong thời đại số hóa, nhiều ngành nghề mới liên tục xuất hiện cùng với 
                        những cơ hội việc làm đa dạng. Điều này mở ra nhiều lựa chọn hơn cho người lao động 
                        nhưng cũng đồng thời đặt ra thách thức về việc cập nhật kiến thức và kỹ năng mới. 
                        Vì vậy, việc học tập suốt đời, chủ động tìm hiểu xu hướng nghề nghiệp và không ngừng
                        nâng cao năng lực bản thân sẽ giúp bạn duy trì lợi thế cạnh tranh trong thị trường lao động.
                    </p>
                    <p>
                        Ngoài các kỹ năng chuyên môn, những kỹ năng mềm như giao tiếp, làm việc nhóm, tư duy phản biện
                        và quản lý thời gian cũng ngày càng được các doanh nghiệp đánh giá cao. Những kỹ năng này 
                        không chỉ giúp bạn làm việc hiệu quả hơn mà còn giúp bạn thích nghi nhanh với môi trường 
                        làm việc năng động và nhiều thay đổi.

                        MatchWorks mong muốn trở thành người đồng hành đáng tin cậy trên hành trình phát triển sự 
                        nghiệp của bạn. Thông qua các bài viết trong cẩm nang nghề nghiệp, chúng tôi cung cấp những 
                        kiến thức thực tế và hữu ích nhằm giúp bạn hiểu rõ hơn về thị trường lao động, từ đó đưa ra 
                        những quyết định nghề nghiệp phù hợp với mục tiêu và định hướng phát triển của bản thân trong 
                        tương lai.
                    </p>

                    <h3>Cách viết CV gây ấn tượng với nhà tuyển dụng</h3>

                    <p>
                        CV là bước đầu tiên giúp bạn tiếp cận với nhà tuyển dụng và cũng là yếu tố quyết định
                        liệu bạn có được mời tham gia phỏng vấn hay không. Một CV tốt cần được trình bày
                        rõ ràng, dễ đọc và tập trung vào những thông tin quan trọng nhất như trình độ học vấn,
                        kinh nghiệm làm việc, kỹ năng chuyên môn và các dự án bạn đã tham gia.
                    </p>

                    <p>
                        Thay vì chỉ liệt kê những công việc bạn đã làm, hãy cố gắng nhấn mạnh vào những
                        thành tích cụ thể hoặc kết quả mà bạn đạt được trong quá trình học tập và làm việc.
                        Ví dụ như cải thiện hiệu suất công việc, hoàn thành dự án đúng thời hạn hoặc
                        đóng góp ý tưởng giúp nhóm đạt được kết quả tốt hơn. Những chi tiết này sẽ giúp
                        nhà tuyển dụng đánh giá được giá trị thực sự của bạn.
                    </p>

                    <h3>Chuẩn bị cho buổi phỏng vấn</h3>

                    <p>
                        Sau khi CV của bạn được nhà tuyển dụng chú ý, bước tiếp theo sẽ là buổi phỏng vấn.
                        Đây là cơ hội để bạn thể hiện bản thân một cách trực tiếp, không chỉ thông qua kiến thức
                        chuyên môn mà còn qua cách giao tiếp, thái độ làm việc và khả năng giải quyết vấn đề.
                    </p>

                    <p>
                        Trước khi tham gia phỏng vấn, bạn nên dành thời gian tìm hiểu về công ty,
                        lĩnh vực hoạt động, văn hóa doanh nghiệp và vị trí công việc mà bạn đang ứng tuyển.
                        Điều này sẽ giúp bạn tự tin hơn khi trả lời các câu hỏi và thể hiện được sự
                        quan tâm của mình đối với công việc.
                    </p>

                    <h3>Phát triển kỹ năng trong môi trường làm việc</h3>

                    <p>
                        Trong môi trường làm việc hiện đại, kỹ năng chuyên môn là điều cần thiết,
                        nhưng kỹ năng mềm cũng đóng vai trò vô cùng quan trọng. Những kỹ năng như
                        giao tiếp hiệu quả, làm việc nhóm, quản lý thời gian và tư duy giải quyết vấn đề
                        sẽ giúp bạn làm việc hiệu quả hơn và dễ dàng hòa nhập với môi trường công sở.
                    </p>

                    <p>
                        Ngoài ra, việc liên tục học hỏi và cập nhật kiến thức mới cũng là yếu tố
                        giúp bạn duy trì lợi thế cạnh tranh trên thị trường lao động. Bạn có thể
                        tham gia các khóa học trực tuyến, workshop chuyên ngành hoặc các dự án thực tế
                        để nâng cao kỹ năng và mở rộng kinh nghiệm của mình.
                    </p>

                    <p>
                        Một trong những kỹ năng quan trọng nhất trong môi trường làm việc là kỹ năng giao tiếp. Giao tiếp hiệu quả giúp bạn truyền đạt ý tưởng rõ ràng, xây dựng mối quan hệ tốt với đồng nghiệp và phối hợp công việc một cách thuận lợi. Bên cạnh đó, kỹ năng làm việc nhóm cũng đóng vai trò quan trọng vì hầu hết các dự án trong doanh nghiệp đều yêu cầu sự hợp tác giữa nhiều cá nhân với các vai trò khác nhau.
                    </p>

                    <p>
                        Ngoài ra, kỹ năng quản lý thời gian giúp bạn sắp xếp công việc hợp lý, hoàn thành nhiệm vụ đúng hạn và duy trì hiệu suất làm việc ổn định. Những người có khả năng quản lý thời gian tốt thường dễ dàng cân bằng giữa nhiều nhiệm vụ khác nhau và giảm thiểu áp lực trong công việc.
                        Không chỉ dừng lại ở các kỹ năng mềm, việc liên tục cập nhật kiến thức và nâng cao kỹ năng chuyên môn cũng là yếu tố quan trọng giúp bạn duy trì lợi thế cạnh tranh trong thị trường lao động. Tham gia các khóa học trực tuyến, workshop chuyên ngành, hoặc thực hiện các dự án thực tế là những cách hiệu quả để tích lũy kinh nghiệm và mở rộng hiểu biết của bản thân.
                        Bên cạnh đó, tinh thần học hỏi và thái độ tích cực trong công việc cũng là những yếu tố giúp bạn phát triển nhanh hơn trong sự nghiệp. Những người sẵn sàng học hỏi từ đồng nghiệp, tiếp nhận phản hồi và cải thiện bản thân thường có nhiều cơ hội thăng tiến và phát triển lâu dài trong tổ chức.
                        MatchWorks mong muốn hỗ trợ bạn trong quá trình phát triển kỹ năng nghề nghiệp thông qua các bài viết, hướng dẫn và nguồn tài nguyên hữu ích trong cẩm nang nghề nghiệp. Với sự chuẩn bị tốt về kỹ năng và kiến thức, bạn sẽ tự tin hơn khi bước vào môi trường làm việc chuyên nghiệp và từng bước xây dựng con đường sự nghiệp bền vững cho tương lai.
                    </p>
                    <h3>Xây dựng thương hiệu cá nhân</h3>

                    <p>
                        Trong thời đại số, thương hiệu cá nhân trở thành một yếu tố quan trọng
                        giúp bạn nổi bật trong mắt nhà tuyển dụng. Một hồ sơ cá nhân chuyên nghiệp
                        trên các nền tảng nghề nghiệp như LinkedIn hoặc portfolio cá nhân sẽ giúp
                        bạn dễ dàng thể hiện năng lực và kinh nghiệm của mình.
                    </p>

                    <p>
                        Bên cạnh đó, việc chia sẻ kiến thức, tham gia cộng đồng chuyên môn và
                        thực hiện các dự án cá nhân cũng là cách hiệu quả để xây dựng hình ảnh
                        chuyên nghiệp và tạo ra nhiều cơ hội phát triển trong tương lai.
                    </p>
                    <p>
                        Việc xây dựng thương hiệu cá nhân giúp bạn tạo được dấu ấn riêng trong mắt nhà tuyển dụng và đồng nghiệp. Khi một cá nhân có hình ảnh chuyên nghiệp, rõ ràng về mục tiêu và định hướng nghề nghiệp, họ thường được đánh giá cao hơn trong quá trình tuyển dụng cũng như trong quá trình phát triển sự nghiệp. Một thương hiệu cá nhân mạnh mẽ cũng giúp bạn mở rộng mạng lưới quan hệ, tìm kiếm cơ hội hợp tác và tiếp cận nhiều cơ hội việc làm tiềm năng hơn.
                    </p>
                    <p>
                        Để xây dựng thương hiệu cá nhân hiệu quả, trước hết bạn cần hiểu rõ điểm mạnh, kỹ năng và lĩnh vực mà mình muốn phát triển. Từ đó, bạn có thể tập trung vào việc phát triển chuyên môn, tích lũy kinh nghiệm thực tế và chia sẻ những kiến thức hoặc dự án mà mình đã thực hiện. Những hoạt động như tham gia các dự án cá nhân, đóng góp cho cộng đồng chuyên môn hoặc xây dựng portfolio cá nhân đều là những cách tốt để thể hiện năng lực của bản thân.
                    </p>
                    <p>
                        Bên cạnh đó, việc duy trì một hình ảnh chuyên nghiệp trên các nền tảng trực tuyến như hồ sơ nghề nghiệp, website cá nhân hoặc mạng xã hội chuyên môn cũng đóng vai trò quan trọng. Khi bạn thường xuyên cập nhật thành tích, chia sẻ kinh nghiệm học tập và làm việc, bạn sẽ dần tạo được sự tin tưởng và uy tín trong lĩnh vực của mình.
                    </p>
                    <p>
                        Ngoài ra, thái độ làm việc tích cực, tinh thần trách nhiệm và khả năng hợp tác với người khác cũng là những yếu tố góp phần xây dựng thương hiệu cá nhân bền vững. Một người không chỉ giỏi chuyên môn mà còn có thái độ chuyên nghiệp và đáng tin cậy sẽ dễ dàng tạo được thiện cảm và nhận được nhiều cơ hội phát triển trong tương lai.
                    </p>
                    <p>
                        Thông qua cẩm nang nghề nghiệp của MatchWorks, chúng tôi mong muốn giúp bạn hiểu rõ hơn về tầm quan trọng của thương hiệu cá nhân và cung cấp những định hướng hữu ích để bạn có thể từng bước xây dựng hình ảnh chuyên nghiệp của mình trong hành trình phát triển sự nghiệp.
                    </p>

                    <h3>MatchWorks – Đồng hành cùng sự nghiệp của bạn</h3>

                    <p>
                        MatchWorks không chỉ là một nền tảng tìm kiếm việc làm mà còn là nơi cung cấp
                        các tài nguyên hữu ích giúp bạn phát triển sự nghiệp một cách bền vững.
                        Thông qua các bài viết, hướng dẫn và cẩm nang nghề nghiệp, chúng tôi mong muốn
                        giúp bạn tự tin hơn khi bước vào thị trường lao động và đạt được những mục tiêu
                        nghề nghiệp mà mình mong muốn.
                    </p>

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
