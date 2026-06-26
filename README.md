# 💼 MatchWorks - Hệ Sinh Thái Tìm Việc Làm & Tạo CV Thông Minh

\[cite_start\]**MatchWorks** là một nền tảng web tìm kiếm việc làm trực tuyến và hỗ trợ quản lý, tạo CV chuyên nghiệp dành cho ứng viên, đồng thời cung cấp công cụ lọc và quản lý hồ sơ ứng tuyển hiệu quả dành cho nhà tuyển dụng/admin\[cite: 1, 12, 58, 393\]. \[cite_start\]Dự án được phát triển dựa trên kiến trúc **Java Web (Servlet/JSP)** theo mô hình MVC\[cite: 485, 523\].

---

## Các Tính Năng Chính

### 1. Đối với Ứng viên (Job Seekers)

- **Trang chủ & Tìm kiếm thông minh:** Tìm kiếm việc làm nhanh chóng theo từ khóa kỹ năng, vị trí địa lý (Hà Nội, TP.HCM, Đà Nẵng). Bộ lọc nâng cao hỗ trợ phân loại theo mức lương và kinh nghiệm làm việc.
- **Khám phá Doanh nghiệp:** Tra cứu thông tin hơn 100.000+ công ty tiêu biểu, xem thông tin chi tiết về lĩnh vực hoạt động, địa chỉ, mô tả và danh sách các tin tuyển dụng đang mở của công ty đó.
- **Hệ sinh thái Quản lý CV:** \* Hướng dẫn viết CV chi tiết theo từng ngành nghề.
  - Tạo mới, chỉnh sửa, xem chi tiết và xóa CV.
- **Ứng tuyển & Lưu tin:** Cho phép ứng viên lưu lại các tin tuyển dụng yêu thích và nộp CV ứng tuyển trực tiếp vào vị trí mong muốn.
- **AI Job Assistant:** Tích hợp Chatbot AI hỗ trợ giải đáp thắc mắc, tư vấn nghề nghiệp trực tuyến.

### 2. Đối với Nhà tuyển dụng / Admin

- **Quản lý đơn ứng tuyển:** Xem toàn bộ danh sách các ứng viên đã nộp đơn vào hệ thống.
- **Lọc ứng viên nâng cao:** Bộ lọc ứng viên theo trình độ học vấn (Đại học, Cao đẳng) giúp tối ưu quá trình sàng lọc.
- **Tác vụ phê duyệt:** Cho phép xem trực tiếp CV chi tiết của ứng viên hoặc xóa bỏ các đơn ứng tuyển không phù hợp.

### 3. Hệ thống & Bảo mật

- **Xác thực người dùng:** Chức năng Đăng ký, Đăng nhập, Đăng xuất và cập nhật thông tin cá nhân bảo mật.
- **Bảo vệ biểu mẫu:** Tích hợp mã **Google reCAPTCHA** và mã **Captcha hình ảnh** (tự động thay đổi) giúp ngăn chặn spam và bot tự động đăng nhập.

---

## Công Nghệ Sử Dụng

- **Backend:** Java (Servlet, Java Server Pages - JSP).
- **Library/Framework:** JSTL (JavaServer Pages Standard Tag Library).
- **Frontend:** HTML5, CSS3 (Bố cục Responsive cho Mobile/Desktop), JavaScript thuần (ES6).
- **Security:** Image Captcha Servlet & Google reCAPTCHA Integration.

---

## 📂 Cấu Trúc Thư Mục Giao Diện (JSP)

Dưới đây là vai trò của các tệp giao diện chính trong dự án:

| Tên Tệp `.jsp` | Vai Trò / Chức Năng |
| --- | --- |
| `Home.jsp` | Trang chủ hệ thống: Tìm kiếm việc làm, lọc tin tuyển dụng, danh sách việc làm nổi bật và gợi ý công ty. |
| `admin.jsp` | Trang quản trị: Xem danh sách ứng viên, lọc theo trình độ học vấn và phê duyệt/xóa đơn ứng tuyển. |
| `company.jsp` | Danh bạ doanh nghiệp: Phân loại công ty theo danh mục ngành nghề (Ngân hàng, Bất động sản, IT...). |
| `gioi-thieu-company.jsp` | Trang thông tin chi tiết của một công ty cùng các vị trí tuyển dụng hiện tại của họ. |
| `mo-ta.jsp` | Chi tiết tin tuyển dụng: Hiển thị mô tả công việc, yêu cầu ứng viên, quyền lợi và nút ứng tuyển ngay. |
| `quan-ly-cv.jsp` | Bảng điều khiển cá nhân: Nơi ứng viên quản lý danh sách các CV đã tạo. |
| `selectCV.jsp` | Giao diện cho phép ứng viên lựa chọn một trong các CV hiện có của mình để tiến hành xác nhận ứng tuyển. |
| `cam-nang-nghe-nghiep.jsp` | Chuyên mục chia sẻ kiến thức định hướng nghề nghiệp, cách viết CV và chuẩn bị phỏng vấn. |
| `hd-viet-cv.jsp` | Hướng dẫn chi tiết từng bước hoàn thiện các phần trong một CV chuẩn. |
| `Login.jsp` | Giao diện đăng nhập đi kèm hệ thống xác thực mã Captcha. |

---

## 💻 Hướng Dẫn Cài Đặt

### 📋 Yêu cầu hệ thống

- JDK 11 hoặc mới hơn.
- Apache Tomcat 9.0 hoặc các Servlet Container tương thích.
- Hệ quản trị cơ sở dữ liệu (ví dụ: MySQL / SQL Server).
- IDE: NetBeans, Eclipse, hoặc IntelliJ IDEA.

### 🛠️ Các bước triển khai

1. **Clone dự án:**

   ```bash
   git clone [https://github.com/username/MatchWorks.git](https://github.com/username/MatchWorks.git)
   ```

2. **Cấu hình Cơ sở dữ liệu:**

   - Tạo cơ sở dữ liệu mới trong DBMS của bạn.

   - Tìm và cấu hình lại thông số kết nối Database (URL, username, password) trong các file cấu hình Java (ví dụ: `DBContext.java` hoặc tệp tương đương của bạn).

3. **Mở dự án trên IDE:**

   - Mở IDE của bạn và chọn *Open Project*, trỏ tới thư mục vừa clone.

4. **Chạy ứng dụng:**

   - Cấu hình server **Apache Tomcat** trong IDE của bạn.

   - Chuột phải vào dự án và chọn **Run** hoặc **Deploy**.

   - Truy cập ứng dụng qua đường dẫn mặc định: `http://localhost:8080/MatchWorks/views/Home`.
