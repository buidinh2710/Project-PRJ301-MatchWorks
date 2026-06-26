create database MatchWorks;
use MatchWorks;

create table role (
    role_id int primary key,
    role_name nvarchar(50)
);

create table company_category (
    category_id int primary key,
    category_name nvarchar(255)
);

create table company_city (
    city_id int primary key,
    city_name nvarchar(255)
);

create table company (
    company_id int primary key,
    avt_company nvarchar(max),
    name_company nvarchar(255),
    description_company nvarchar(max),
    location_id nvarchar(255),
	city_id int,

    foreign key (city_id) references company_city(city_id)
);

create table field_company (
    company_id int,
    category_id int,

    primary key (company_id, category_id),

    foreign key (company_id) references company(company_id),
    foreign key (category_id) references company_category(category_id)
);

create table users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    company_id int,
    role_id int,
    gmail nvarchar(255),
    password nvarchar(255),
    full_name nvarchar(255),

    foreign key (company_id) references company(company_id),
    foreign key (role_id) references role(role_id)
);

create table cv (
    resume_id int  IDENTITY(1,1) primary key,
    user_id int,
    name_cv nvarchar(255),
    avatar_cv nvarchar(max),
	full_name_cv nvarchar(255),
    position_cv nvarchar(255),
	phone nvarchar(20),
    dob date,
    gender nvarchar(10),
	email varchar(255),
    website_cv nvarchar(255),
    location_cv nvarchar(255),
    career_goals_cv nvarchar(max),
    education_cv nvarchar(max),
    experience_cv nvarchar(max),
    certificate_cv nvarchar(max),
    skills_cv nvarchar(max),
    hobbies_cv nvarchar(max)
);

create table jobs (
    job_id int primary key,
    company_id int,
    title_job nvarchar(255),
    description_job nvarchar(max),
    requirement_job nvarchar(max),
    benefit_job nvarchar(max),
    salary_job nvarchar(max),
    experience_job nvarchar(255),
    hiring_quantity int,

    foreign key (company_id) references company(company_id)
);

create table job_application (
    application_id int  IDENTITY(1,1) primary key,
    job_id int,
    user_id int,
    resume_id int,

    foreign key (job_id) references jobs(job_id),
    foreign key (user_id) references users(user_id),
    foreign key (resume_id) references cv(resume_id)
);

create table savedjobs (
    savejobs_id int  IDENTITY(1,1) primary key,
    user_id int,
    job_id int,

    foreign key (user_id) references users(user_id),
    foreign key (job_id) references jobs(job_id)
);

insert into role (role_id, role_name)
values 
(1, 'admin'),
(2, 'employer'),
(3, 'job-seeker');


insert into company_category (category_id, category_name)
values
(1, N'Ngân hàng'),
(2, N'Bất động sản'),
(3, N'Xây dựng'),
(4, N'IT - Phần mềm'),
(5, N'Tài chính'),
(6, N'Bán lẻ - FMCG'),
(7, N'Sản xuất');

insert into company_city (city_id, city_name)
values
(1, N'Hà Nội'),
(2, N'Đà Nẵng'),
(3, N'TP. Hồ Chí Minh');

insert into company (company_id, avt_company, name_company, description_company, location_id, city_id)
values
-- Ngân hàng
(1,'bank1.png',
N'NGÂN HÀNG THƯƠNG MẠI CỔ PHẦN QUÂN ĐỘI - CHI NHÁNH BẮC SÀI GÒN',
N'Ngân hàng thương mại cổ phần Quân đội (tên giao dịch tiếng Anh là Military Commercial Joint Stock Bank), hay gọi tắt là Ngân hàng Quân đội, hay viết tắt là ngân hàng TMCP Quân đội hoặc MB, là một ngân hàng thương mại cổ phần của Việt Nam, một doanh nghiệp của Quân đội Nhân dân Việt Nam trực thuộc Bộ Quốc phòng.
Ngoài dịch vụ ngân hàng, Ngân hàng Quân đội còn tham gia vào các dịch vụ môi giới chứng khoán, quản lý quỹ, kinh doanh địa ốc bằng cách nắm cổ phần chi phối của một số doanh nghiệp trong lĩnh vực này. Hiện nay, Ngân hàng Quân đội đã có mạng lưới khắp cả nước với trên 100 chi nhánh và 180 điểm giao dịch trải dài khắp 48 tỉnh thành phố.Ngân hàng còn có chi nhánh tại Lào và Campuchia.',
N'3 Nguyễn Oanh, Phường 10, Gò Vấp, ',
3),

(2,'bank2.png',
N'Woori Bank Vietnam',
N'Năm 1997 đánh dấu sự kiện Ngân hàng Woori trở thành tổ chức tài chính Hàn Quốc đầu tiên mở chi nhánh tại Hà Nội, Việt Nam. Ngân hàng Woori Việt Nam kết nối với khách hàng dựa trên “Văn hóa lấy khách hàng làm trung tâm”, thông qua những đổi mới để thích nghi với điều kiện và xu hướng thị trường nội địa. Với tổng số vốn điều lệ 12.500 tỷ đồng, Woori Bank trở thành Ngân hàng nước ngoài có vốn điều lệ lớn nhất Việt Nam. Tính đến đầu năm 2025, mạng lưới kinh doanh của Woori Bank tại Việt Nam đã lên tới 28 chi nhánh và phòng giao dịch trên toàn quốc.
Với gần 30 năm hoạt động tại Việt Nam cùng với quy mô nhân sự lên tới 900 nhân viên, Ngân hàng Woori đang có những bước chuyển mình mạnh mẽ trở thành một đối tác tài chính lâu dài và đáng tin cậy, góp phần vào sự phát triển và thịnh vượng của Việt Nam.',
N'34F Keangnam Landmark 72, E6 Phạm Hùng, Mễ Trì, Từ Liêm, ',
1),

(3,'bank3.png',
N'NGÂN HÀNG TMCP ĐẦU TƯ VÀ PHÁT TRIỂN VIỆT NAM (BIDV)',
N'Chúng tôi chào đón Bạn với một môi trường làm việc hội tụ:
1. Những con người thông minh, năng động và sáng tạo
Bạn sẽ có hạnh phúc và niềm vui công việc trong một môi trường được tạo nên bởi những người đồng nghiệp thông minh. Môi trường đó sẽ giúp bạn không ngừng sáng tạo, không ngừng học hỏi để nâng cao giá trị của bản thân. Môi trường đó cũng giúp bạn năng động hơn trước những sự thay đổi “chóng mặt” của thế kỷ thông tin.
2. Ban lãnh đạo với 2 chữ “Tâm và Tầm”
BIDV được so sánh như một con Tàu lớn giương cánh buồm đỏ thắm ra khơi. Con tàu đó vượt biển lớn qua sự “lèo lái” của những người Thuyền trưởng tài năng, tự tin và lạc quan. Hai chữ “Tâm và Tầm” bạn sẽ nhận thấy rõ khi bạn lựa chọn môi trường làm việc của chúng tôi.
3. Luôn coi trọng yếu tố con người
- Chúng tôi coi con người là tài sản quý báu nhất của ngân hàng. Nguồn nhân lực là một trong những nguồn lực chúng tôi ưu tiên hàng đầu trong việc “đầu tư để phát triển” thông qua: Chính sách đãi ngộ nhân viên và Chương trình đào tạo.',
N'194 Trần Quang Khải, Quận Hoàn Kiếm, ',
1),

(4,'bank4.png',
N'Ngân Hàng TNHH MTV Shinhan Việt Nam',
N'Ngân hàng TNHH MTV Shinhan VN (“Ngân hàng Shinhan”) là ngân hàng trực thuộc Ngân hàng Shinhan Hàn Quốc – thành viên của Tập đoàn Tài chính Shinhan (Shinhan Financial Group - SFG). SFG là tập đoàn tài chính hàng đầu tại Hàn Quốc, được thành lập trên nền tảng của Ngân hàng Shinhan Hàn Quốc, Quỹ đầu tư Shinhan và Công ty Quản lý Đầu tư Shinhan. SFG được niêm yết trên Sở Giao dịch Chứng khoán Hàn Quốc (KRX) và Sở Giao dịch Chứng khoán New York (NYSE). SFG và Ngân hàng Shinhan Hàn Quốc là top 10 ngân hàng quan trọng trong hệ thống Ngân hàng Hàn Quốc (D-SIBs).
Từ năm 1993, Ngân hàng Shinhan đã có đại diện thương mại tại Việt Nam dưới hình thức văn phòng đại diện đầu tiên tại TP. Hồ Chí Minh. Sau hơn 32 năm thành lập và phát triển, Ngân hàng Shinhan đã mở rộng mạng lưới hoạt động khắp miền Bắc, Trung và Nam. Hiện nay, Ngân hàng Shinhan cung cấp danh mục các sản phẩm đa dạng và giải pháp tài chính ưu việt cho cả khối khách hàng cá nhân và doanh nghiệp.',
N'03 - 05 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, ',
2),

(5,'bank5.png',
N'Ngân hàng TMCP Phát triển TP. HCM (HDBank)',
N'HDBank là một trong những Ngân hàng TMCP đầu tiên của cả nước, được thành lập từ năm 1990. Trên nền tảng phát triển vững chắc, hiệu quả, an toàn, HDBank là ngân hàng có tốc độ tăng trưởng cao, bền vững trong thị trường tài chính ngân hàng. 
Với đà tăng trưởng mạnh mẽ trong những năm gần đây, HDBank đã đạt được những thành quả vượt bậc. Đến cuối năm 2013 HDBank có gần 200 điểm giao dịch trên toàn quốc, có mặt tại hầu hết các trung tâm kinh tế lớn của cả nước. ',
N'25bis Nguyễn Thị Minh Khai, Bến Nghé, Quận 1, ',
3),

-- Bất động sản
(6,'bds1.png',
N'CÔNG TY CỔ PHẦN BẤT ĐỘNG SẢN THẾ KỶ',
N'Tập đoàn CEN là tập đoàn lớn bao gồm nhiều công ty thành viên, cung cấp đầy đủ các loại hình kinh doanh và dịch vụ bất động sản như: Đầu tư, hợp tác đầu tư phát triển BĐS; phân phối và tiếp thị BĐS chuyên nghiệp; tư vấn truyền thông và marketing trọn gói, phát triển mạng lưới Connector, Mentor môi giới BĐS; tổng thầu vật liệu hoàn thiện; cung cấp dịch vụ thẩm định giá tài sản; cung cấp dịch vụ golf hàng đầu tại Việt Nam – đáp ứng các yêu cầu khắt khe của luật định và thỏa mãn mọi yêu cầu, lòng tin của Chủ Đầu Tư và Khách hàng.
Trụ sở chính của Tập đoàn CEN được đặt tại Hà Nội và các Văn phòng Chi nhánh được đặt tại Đà Nẵng, Sài Gòn. Đội ngũ nhân viên gần 3000 người cùng với hàng ngàn đại lý và cộng tác viên trên toàn quốc. Tập đoàn CEN cung cấp giải pháp bán hàng hiệu quả cho các nhà phát triển dự án, các chủ đầu tư: miễn phí môi giới cho khách hàng thuê, mua bán bất động sản cùng nhiều dịch vụ bất động sản khác.',
N'Tòa nhà The Golden Palm – 21 Lê Văn Lương – Phường Nhân Chính – Quận Thanh Xuân – ',
1),

(7,'bds2.png',
N'Công ty TNHH Đầu tư BĐS DOJILAND',
N'DOJILAND được “khai sinh” bởi Tập đoàn Vàng bạc đá quý DOJI – một Tập đoàn kinh doanh đa ngành với lĩnh vực then chốt là Vàng bạc đá quý. Thừa hưởng từ DOJI Uy tín sản phẩm, thương hiệu đẳng cấp, Tiềm lực tài chính hùng mạnh, Năng lực quản trị vượt trội là tiền đề giúp DOJILAND khẳng định được sức mạnh trong các dự án đầu tư. Cùng với dự án The Sapphire Residence, DOJILAND đã và đang triển khai nhiều dự án bất động sản tiềm năng, hứa hẹn thu hút sự quan tâm đặc biệt của khách hàng cũng như giới đầu tư địa ốc.',
N'Tầng 9, tòa nhà DOJI, số 5 Lê Duẩn, Ba Đình, ',
1),

(8,'bds3.png',
N'CÔNG TY CỔ PHẦN DỊCH VỤ BẤT ĐỘNG SẢN ĐẤT XANH',
N'Dat Xanh Services đơn vị nắm giữ mảng dịch vụ bất động sản của Tập đoàn Đất Xanh. Quản trị xuyên suốt hoạt động của hệ thống các công ty BĐS từ Bắc chí Nam: Đất Xanh Miền Bắc, Đất Xanh Miền Trung, Đất Xanh Miền Tây,… cùng hàng chục công ty thành viên trực thuộc các công ty con các vùng miền trên toàn quốc.
Với tiềm lực mạnh về tài chính, đội ngũ cán bộ nhân viên được đào tạo bài bản, lực lượng kinh doanh hùng hậu, thiện chiến, cộng với kinh nghiệm và năng lực triển khai, chiến lược bán hàng hợp lý, ứng dụng công nghệ bán hàng BĐS, Dat Xanh Services đã và đang khẳng định vị thế “Nhà cung cấp giải pháp dịch vụ bất động sản và tài chính toàn diện số 1 Việt Nam” với việc tổng thầu phân phối và môi giới hàng loạt dự án lớn của các chủ đầu tư trên toàn quốc.',
N'2W Ung Văn Khiêm, Phường 25, Bình Thạnh, ',
3),

(9,'bds4.png',
N'Công ty Cổ phần Tập đoàn C.E.O',
N'Trên hành trình 21 năm (26/10/2001 - 26/10/2022) không ngừng lớn mạnh, Tập đoàn CEO luôn lấy sứ mệnh vì cuộc sống chất lượng hơn, đóng góp cho sự phát triển bền vững của đất nước cũng như góp phần làm cho thế giới phồn vinh.Hướng đến mục tiêu trở thành một trong những doanh nghiệp tư nhân đa ngành hàng đầu Việt Nam, Tập đoàn CEO tập trung vào 3 trụ cột kinh doanh cốt lõi bao gồm: Bất động sản, Xây dựng, Dịch vụ....',
N'Tầng 5, Tháp CEO, HH2-1 Khu đô thị Mễ Trì Hạ, Phạm Hùng, Nam Từ Liêm, ',
1),

(10,'bds5.png',
N'Công ty CP Vinhomes',
N'VINHOMES - Nơi hạnh phúc ngập tràn
Vinhomes - Hệ thống căn hộ và biệt thự với dịch vụ đẳng cấp của Tập đoàn Vingroup  
Vinhomes cung cấp đến khách hàng một tiêu chuẩn sống đẳng cấp vượt trội mới, đây là sự kết hợp hoàn chỉnh giữa bất động sản nhà ở và hệ thống dịch vụ tiêu chuẩn cao tại những khu đô thị quy mô hàng đầu Việt Nam mang đẳng cấp quốc tế do Vingroup đầu tư.
Với tầm nhìn chiến lược và phát triển bền vững, mỗi khu đô thị trong hệ thống Vinhomes đều tọa lạc tại các vị trí trung tâm Hà Nội và thành phố Hồ Chí Minh, hội tụ những giá trị vượt trội:
Sản phẩm nhà ở chất lượng cao;
Dịch vụ tại gia chuyên nghiệp;
Môi trường sống xanh, sạch;
Văn hóa cộng đồng nhân văn;
An ninh – An toàn được đảm bảo;
Tiện ích đồng bộ, đầy đủ.',
N'Tòa nhà Symphony, Đường Chu Huy Mân, KĐT Vinhomes Riverside, Long Biên, ',
1);

insert into company (company_id, avt_company, name_company, description_company, location_id, city_id)
values
-- Xây dựng
(11,'xd1.png',
N'Công ty Cổ phần Ecoba Việt Nam',
N'Công ty Cổ phần Ecoba Việt Nam là đơn vị tổng thầu thi công độc lập và chuyên nghiệp. Trải qua hơn 10 năm xây dựng và không ngừng phát triển, Ecoba đã khẳng định vị thế của mình trên thị trường trong nước và quốc thế với các lĩnh vực XÂY DỰNG VÀ PHÁT TRIỂN ĐÔ THỊ - NĂNG LƯỢNG TÁI TẠO - CÔNG NGHỆ MÔI TRƯỜNG. Ecoba đã có những bước nhảy vượt trội, 03 năm liên tiếp đạt mức tăng trưởng vàng lớn hơn 50%. Đặc biệt giai đoạn 2017 - 2018 tăng trưởng đạt mức 100%. Cũng trong giai đoạn này, Ecoba vinh dự lọt top 500 doanh nghiệp tư nhân lớn nhất Việt Nam và Top 10 Doanh nghiệp xây dựng tư nhân trên Bảng xếp hạng VNR500. Năm 2019, Ecoba đạt giải thưởng “Nhà thầu của năm” tại lễ trao giải Ashui Awards.
Những thành công đạt được là minh chứng cho sự đúng đắn của tầm nhìn và giá trị cốt lõi mà Ecoba theo đuổi trong suốt hơn 10 năm qua. Ecoba là một trong số những công ty đầu tiên tại Việt Nam xây dựng lộ trình thăng tiến rõ ràng cho từng vị trí chức danh đảm bảo tính cạnh tranh lành mạnh và công bằng.',
N'Tầng 5, sảnh C, tòa nhà UDIC Complex, N04 Hoàng Đạo Thúy, Cầu Giấy, ',
1),

(12,'xd2.png',
N'CÔNG TY CỔ PHẦN TẬP ĐOÀN HÒA PHÁT',
N'Tập đoàn Hòa Phát là một trong những Tập đoàn sản xuất công nghiệp hàng đầu Việt Nam. Khởi đầu từ một Công ty chuyên buôn bán các loại máy xây dựng từ tháng 8/1992, Hòa Phát lần lượt mở rộng sang các lĩnh vực Nội thất (1995), Ống thép (1996), Thép (2000), Điện lạnh (2001), Bất động sản (2001). Năm 2007, Hòa Phát tái cấu trúc theo mô hình Tập đoàn, trong đó Công ty Cổ phần Tập đoàn Hòa Phát giữ vai trò là Công ty mẹ cùng các Công ty thành viên và Công ty liên kết. Ngày 15/11/2007, Hòa Phát chính thức niêm yết cổ phiếu trên thị trường chứng khoán Việt Nam với mã chứng khoán HPG. Đến tháng 3/2017, Hòa Phát có 11 công ty thành viên.',
N'66 Nguyễn Du, phường Nguyễn Du, quận Hai Bà Trưng, ',
1),

(13,'xd3.png',
N'Tú PMA',
N'Giám đốc Anh Tú Atus điều hành công ty, đã cho Công ty có mặt tại thị trường xây dựng hiện nay. Tú Atus luôn nỗ lực mang tới nơi làm việc lý tưởng với môi trường chuyên nghiệp, năng động, các chế độ phúc lợi công bằng, minh bạch để mỗi cá nhân có thể thỏa sức sáng tạo, thể hiện năng lực bản thân. Từ đó, chúng tôi sẽ cùng bạn thực hiện hóa những mơ ước nghề nghiệp mà bạn đang ấp ủ bấy lâu nay.',
N'Bà Nà Hill ',
2),

(14,'xd4.png',
N'Công ty Cổ Phần Đầu Tư Phan Vũ',
N'TẬP ĐOÀN PHAN VŨ (PHAN VŨ GROUP) : UY TÍN – CHẤT LƯỢNG – HIỆU QUẢ
Tập đoàn Phan Vũ thành lập từ năm 1996. Sau gần 30 năm phát triển, Phan Vũ Group là Đơn vị dẫn đầu trong lĩnh vực sản xuất và thi công cọc nền móng tại thị trường Việt Nam. Ngoài ra Phan Vũ Group còn phát triển mạnh tại các mảng Dịch vụ thi công, Hạ tầng, sản phẩm trong ngành vật liệu xây dựng như Cọc nền móng, cấu kiện bê tông đúc sẵn, tấm tường Eurowall … cho công trình hạ tầng kỹ thuật, hạ tầng giao thông, dân dụng hoặc công nghiệp
Trụ sở chính: Tòa nhà Phan Vũ, A2 Trường Sơn, Phường 2, Quận Tân Bình, Tp.HCM
Phan Vũ Group liên tục nằm trong Top 500 Doanh nghiệp lớn nhất Việt Nam (VNR500) và Top 500 Doanh nghiệp tang trưởng nhanh nhất tại Việt Nam (FAST500).',
N'A2 Trường Sơn, Phường 2, Quận Tân Bình, ',
3),

(15,'xd5.png',
N'CÔNG TY CỔ PHẦN TỔNG CÔNG TY CÔNG TRÌNH ĐƯỜNG SẮT',
N'Tốc độ - Sáng tạo - Hiệu quả trong từng hành động
Với hơn 48 năm hình thành và phát triển, Công ty cổ phần Tổng công ty Công trình đường sắt trở thành một trong những doanh nghiệp xây dựng Hàng đầu Việt Nam. Để đạt được những thành tựu ấy, RCC luôn coi con người chính là yếu tố cốt lõi tạo nên sự thành công ngày nay.
Môi trường làm việc
Cơ hội thăng tiến
Trở thành doanh nghiệp mạnh hàng đầu uy tín cao trong ngành cơ khí xây dựng, là điểm đến ưa thích của khách hàng.
Tập thể đoàn kết
Xây dựng chất lượng, đúng hẹn,thúc đẩy quá trình công nghiệp hóa, hiện đại hóa đất nước, nâng cao điều kiện sống cho con người.',
N'Tòa nhà số 33, đường Láng Hạ, Phường Thành Công, Quận Ba Đình, ',
1),

-- IT - Phần mềm
(16,'it1.png',
N'Công ty TNHH Phân Phối Synnex FPT',
N'Với quy mô doanh số dự kiến khoảng 2 tỉ USD vào 2024 và số lượng nhân sự khoảng 1000 người, Synnex FPT sẽ cung cấp sản phẩm & dịch vụ hoàn chỉnh qua hệ thống kênh 3800 đại lý với khoảng 8000 cửa hàng trên toàn lãnh thổ Việt Nam.
1993-2003: khởi sự kinh doanh, lần lượt ra đời công ty FPT Distribution FPT Mobile, FPT Retail, FPT Elead.​
2004-2014: FPT Distribution ‘lấn sân’ sang lĩnh vực thiết bị thông minh, vươn ra thị trường khu vực và thế giới.​
2005-2025: thương vụ sáp nhập với Synnex Đài Loan, chuyển mình lên tầm cao mới, khẳng định vị trí số 1 tại Việt Nam.',
N'Tòa nhà FPT Cầu Giấy, số 17 phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, ',
1),

(17,'it2.png',
N'Công ty CP Giải pháp Thanh toán Việt Nam (VNPAY)',
N'Công ty Cổ phần Giải pháp Thanh toán Việt Nam (VNPAY) thành lập tháng 03/2007 là công ty hàng đầu trong lĩnh vực Thanh toán điện tử tại Việt Nam.
VNPAY hiện đang tập trung vào 2 lĩnh vực kinh doanh cốt lõi là Tài chính - Ngân hàng, Công nghệ Thông tin - Viễn thông với các sản phẩm nổi bật như ứng dụng Ngân hàng trên di động (Mobile Banking), SMS Banking, Nạp tiền điện thoại VnTopup, Thanh toán hóa đơn VnPayBill, Ví điện tử VNPAY, giải pháp thanh toán qua mã VNPAY-QR, VNPAY-POS giải pháp thanh toán và quản lý bán hàng...
Cùng năng lực vượt trội và lợi thế cạnh tranh bền vững, VNPAY cung cấp dịch vụ tới hơn 40 ngân hàng, các tổ chức thanh toán tại Việt Nam & Quốc tế, 5 công ty viễn thông cùng hàng nghìn doanh nghiệp, đưa ra nhiều giải pháp thanh toán hiện đại, đa dạng và tiện lợi.',
N'123 Nguyễn Trãi, Phường Bến Thành, Quận 1, ',
3),

(18,'it3.png',
N'Tập đoàn FPT',
N'FPT tự hào là tập đoàn công nghệ hàng đầu Việt Nam.
Thành lập ngày 13/09/1988, FPT hoạt động trong 03 lĩnh vực kinh doanh cốt lõi gồm: Công nghệ, Viễn thông và Giáo dục. FPT sở hữu hạ tầng viễn thông phủ khắp 59/63 tỉnh thành tại Việt Nam và không ngừng mở rộng hoạt động trên thị trường toàn cầu với 48 văn phòng tại 26 quốc gia và vùng lãnh thổ bên ngoài Việt Nam.
Trong suốt quá trình hoạt động, FPT luôn nỗ lực với mục tiêu cao nhất là mang lại sự hài lòng cho khách hàng thông qua những dịch vụ, sản phẩm và giải pháp công nghệ tối ưu nhất. Đồng thời, FPT không ngừng nghiên cứu và tiên phong trong các xu hướng công nghệ mới góp phần khẳng định vị thế của Việt Nam trong cuộc cách mạng công nghiệp lần thứ 4 - Cuộc cách mạng số. FPT sẽ tiên phong cung cấp dịch vụ chuyển đổi số toàn diện cho các tổ chức, doanh nghiệp trên quy mô toàn cầu.',
N'56 Phan Xích Long, Phường 2, Quận Phú Nhuận, ',
3),

(19,'it4.png',
N'Viettel Media',
N'Viettel Media là công ty hoạt động trong lĩnh vực công nghệ và nội dung số, cung cấp các dịch vụ trên nền Internet, lấy nền tảng mobile làm trọng tâm, thị trường là toàn cầu.
Một số sản phẩm nổi bật: Kênh QPVN, Tiin.vn, Keeng.vn, Mocha, Onbox.vn, Netnews.vn',
N'15 Nguyễn Hữu Thọ, Phường Tân Hưng, Quận 7, ',
3),

(20,'it5.png',
N'Trung tâm Dịch vụ số MobiFone - Chi nhánh Tổng Công ty Viễn Thông Mobifone',
N'Trung tâm Dịch vụ số MobiFone là đơn vị trực thuộc Tổng Công ty Viễn thông MobiFone với chức năng phát triển và kinh doanh các dịch vụ giá trị gia tăng, đa phương tiện, quảng cáo, thanh toán, tài chính trên mạng viễn thông MobiFone.
Tầm nhìn
Với những thay đổi mang tính chiến lược, tầm nhìn của MobiFone được thể hiện rõ nét trong thông điệp “Kết nối giá trị, khơi dậy tiềm năng”. Tầm nhìn này phản ánh cam kết của chúng tôi hướng đến sự phát triển toàn diện và bền vững dựa trên ba mối quan hệ trụ cột: với khách hàng, với đối tác, và với từng nhân viên.
Sứ mệnh
Với MobiFone, sứ mệnh của chúng tôi là đem lại những sản phẩm và dịch vụ kết nối mỗi người dân, gia đình, doanh nghiệp trong một hệ sinh thái, nơi những nhu cầu trong cuộc sống, công việc, học tập và giải trí được phát hiện, đánh thức và thỏa mãn nhằm đạt được sự hài lòng, phát triển và hạnh phúc. Phát triển trong nhận thức, trong các mối quan hệ, trong cơ hội kinh doanh và hạnh phúc vì được quan tâm, được chăm sóc, được khuyến khích và được thỏa mãn. Tăng trưởng và hạnh phúc là động lực phát triển của các cá nhân cũng như toàn xã hội.',
N'Tầng 8, toà nhà MobiFone số 5/82 Duy Tân, Cầu Giấy, ',
1);

insert into company (company_id, avt_company, name_company, description_company, location_id, city_id)
values
-- Tài chính
(21,'tc1.png',
N'FE Credit',
N'Tiền thân là Khối Tín dụng tiêu dùng trực thuộc Ngân hàng TMCP Việt Nam Thịnh Vượng (VPBank), FE CREDIT đã thành công trong việc chuyển đổi hoạt động Tín dụng tiêu dùng sang một pháp nhân độc lập mới với tên gọi Công ty Tài chính TNHH MTV Ngân hàng Việt Nam Thịnh Vượng (được nhận diện với Thương hiệu FE CREDIT) vào tháng 02/2015.
Tháng 10/2021, VPBank hoàn tất việc bán 49% vốn điều lệ của FE CREDIT cho Công ty Tài chính Tiêu dùng SMBC (SMBCCF), một công ty con do tập đoàn Sumitomo Mitsui Financial Group của Nhật Bản sở hữu 100% vốn. Đồng thời, Công ty Tài chính TNHH MTV Ngân hàng Việt Nam Thịnh Vượng cũng được đổi tên thành Công ty Tài chính TNHH Ngân hàng Việt Nam Thịnh Vượng SMBC.
Sau 11 năm hoạt động, với sứ mệnh hiện thực hóa hàng triệu ước mơ, FE CREDIT đã thiết lập một nền tảng vững chắc và liên tục giữ vững vị trí dẫn đầu thị phần tài chính tiêu dùng với mạng lưới trải dài trên toàn quốc tại hơn 21.000 điểm bán hàng cùng hơn 16.000 nhân viên. Với hơn 12 triệu người dân Việt Nam được giải quyết khó khăn tài chính, trong đó có 30% hợp đồng vay mới mỗi năm, FE CREDIT đã góp phần đẩy lùi tín dụng đen, nâng cao mức sống của người dân lao động và thúc đẩy kinh tế tiêu dùng.',
N'Tầng 4, Tòa FS, Gold Season, 47 Nguyễn Tuân, Thanh Xuân, ',
1),

(22,'tc2.png',
N'Home Credit',
N'Home Credit Việt Nam là công ty thuộc tập đoàn tài chính hàng đầu Châu Âu – tập đoàn Home Credit. Với sự phát triển mạnh mẽ tại thị trường Việt Nam, chúng tôi tự hào mang đến cho khách hàng những giải pháp hỗ trợ tài chính tiêu dùng đơn giản, nhanh chóng và tiện lợi như vay trả góp, mua hàng điện máy, xe máy, cho vay tiền mặt, thẻ tín dụng,...
Là ngôi nhà chung của gần 10,000 nhân viên trên toàn quốc, Home Credit luôn sẵn sàng phục vụ hơn 11 triệu khách hàng khắp 63 tỉnh thành. Nhu cầu phát triển và mở rộng thị trường là lý do chúng tôi trao cho bạn nhiều cơ hội việc làm đáng mong đợi.
Hãy gia nhập Home Credit và nhận những quyền lợi hấp dẫn:
- Thu nhập cạnh tranh cùng Bonus tháng 13
- Dành thời gian nghỉ dưỡng và nạp năng lượng với 15 ngày phép/ năm
- Bảo vệ sức khỏe suốt 365 ngày với gói Bảo hiểm toàn diện 100%, Bảo hiểm Tai nạn 24/7 và Khám sức khỏe hằng năm
- Cơ hội thể hiện bản thân và gắn kết đồng đội qua các hoạt động Team Building, Year-End/ New-Year Party.
ĐỪNG BỎ LỠ CƠ HỘI ỨNG TUYỂN vị trí bạn yêu thích nhất tại: https://vieclam.homecredit.vn/',
N'Số 02, Hồng Hà, Phường 2, Q. Tân Bình, ',
3),

(23,'tc3.png',
N'HD Saison',
N'Công ty Tài chính TNHH HD SAISON là công ty tài chính tiêu dùng có mặt sớm nhất ở thị trường Việt Nam. Đến nay, đồng hành cùng với HD SAISON là hơn 8000 nhân viên, 12 triệu khách hàng và với hơn 23.000 điểm giới thiệu dịch vụ tại tất cả 63 tỉnh thành toàn quốc. Ở HD SAISON, chúng tôi luôn nỗ lực xây dựng môi trường làm việc như ngôi nhà thứ hai, nơi mỗi người đều có cơ hội ngang bằng và được đánh giá dựa trên sự trung thực, lòng nhiệt huyết và hiệu quả công việc.
Hãy đến với chúng tôi nếu bạn muốn tham gia cùng xây dựng ngôi nhà HD SAISON này nhé!
Hãy để HD SAISON đồng hành cùng con đường sự nghiệp của bạn!',
N'Tầng 3, tòa nhà VIT, số 519 Kim Mã, Phường Ngọc Khánh, Quận Ba Đình, ',
1),

(24,'tc4.png',
N'Shinhan Finance',
N'Shinhan Finance là thành viên của Tổng công ty Shinhan Card, doanh nghiệp kinh doanh thẻ Tín dụng số 1 tại Hàn Quốc, thuộc Tập đoàn tài chính Shinhan Financial Group, xếp ở vị trí 44 trên tổng số 500 Thương hiệu Ngân hàng lớn toàn cầu. Với sự kết hợp vững chắc giữa nền tảng công nghệ và các sản phẩm tài chính vượt trội của Shinhan Card cùng di sản hơn 11 năm kinh nghiệm phát triển thị trường cho vay tiêu dùng của công ty, Shinhan Finance cam kết nỗ lực để trở thành Công ty tài chính hỗ trợ khách hàng tốt nhất Việt Nam. Với mạng lưới kinh doanh phát triển rộng khắp trên toàn quốc, Công ty luôn tích cực tiếp cận, tư vấn và hỗ trợ khách hàng với những giải pháp tài chính cá nhân linh hoạt, giúp khách hàng hiện thực hóa ước mơ, nâng cao chất lượng cuộc sống. Shinhan Finance tự hào đã và đang được phục vụ hàng trăm ngàn khách hàng và ngày càng có thêm nhiều khách hàng tín nhiệm lựa chọn các sản phẩm và dịch vụ của Công ty. Công ty sẽ tiếp tục phát huy lợi thế kinh doanh, nâng cao chất lượng dịch vụ, đảm bảo chất lượng quản trị tín dụng và quản trị rủi ro, cam kết trở thành công ty tài chính tiêu dùng minh bạch và uy tín trên thị trường Việt Nam.',
N'Hải Châu, ',
2),

(25,'tc5.png',
N'Mirae Asset',
N'Công ty Tài chính Mirae Asset (Việt Nam) đến từ Hàn Quốc, trực thuộc Tập đoàn tài chính toàn cầu Mirae Asset. Công ty cung cấp cho khách hàng các dịch vụ tài chính vay tiêu dùng tín chấp, vay mua xe ô tô, thủ tục đơn giản, giải ngân nhanh chóng với mức lãi suất cạnh tranh. Sau nhiều năm hoạt động tại thị trường Việt Nam, Mirae Asset đã nhận được sự tín nhiệm, tin yêu của khách hàng với các sản phẩm vay tiêu dùng ngày một hoàn thiện, đây chính là cơ hội để khách hàng tiếp cận thêm một nguồn vốn hiệu quả, hợp pháp và an toàn. Chúng tôi hướng đến sự phát triển bền vững, gắn kết với cộng đồng, cam kết nâng cao chất lượng cuộc sống cho người Việt Nam.',
N'220 Nguyễn Hữu Thọ Hoà Cường Bắc, Hải Châu, ',
2),

-- Bán lẻ - FMCG
(26,'fmcg1.png',
N'VinMart',
N'Hệ thống siêu thị VinMart và chuỗi các cửa hàng tiện ích VinMart+ là những Thương hiệu chủ lực của công ty Cổ phần Dịch vụ Thương mại Tổng hợp WinCommerce - Tập đoàn Masan
VinMart và VinMart+ cam kết cao nhất về chất lượng phục vụ và dịch vụ đi kèm, Đảm bảo cung cấp tới khách hàng các sản phẩm với nguồn gốc, xuất xứ rõ ràng, từ các đối tác uy tín trong nước và quốc tế, được kiểm soát kỹ lưỡng theo quy trình quản lý chất lượng nghiêm ngặt.
Được bố trí hợp lý tại các khu vực đông dân cư, vị trí giao thông thuận lợi, các siêu thị VinMart có quy mô lớn với diện tích lên đến hơn 10.000m2, với hơn 40 ngàn mặt hàng đa dạng. Trong khi đó, các cửa hàng tiện ích VinMart+ có diện tích dưới 1.000m2 và đầy đủ mọi mặt hàng thiết yếu. Với độ phủ rộng khắp toàn quốc, VinMart và VinMart+ sẽ đáp ứng mọi nhu cầu tiêu dùng của mỗi gia đình.',
N'Tổ 18 khu phố 3, phường Đông Hưng Thuận, Quận 12, ',
3),

(27,'fmcg2.png',
N'Co.opmart',
N'Khởi nghiệp từ năm 1989, Saigon Co.op không ngừng phấn đấu trở thành tập đoàn kinh tế dẫn đầu lĩnh vực bán lẻ tại Việt Nam, tập trung phát triển bền vững chuỗi Co.opmart và hướng đến phát triển nhiều loại hình bán lẻ khác theo yêu cầu thị trường. Tính đến nay, Saigon Co.op đã phát triển thành công hệ thống bán lẻ gồm Co.opmart, Co.op Food, Sense City và đặc biệt là mô hình mới cửa hàng tạp hóa hiện đại Co.op Smile. Đồng thời, nâng cấp các cửa hàng Co.op bằng việc thay đổi phương thức mua bán, cung cách phục vụ, giúp các HTX thành viên liên kết xây dựng cửa hàng Co.op và Co.op Food. Với lòng tận tâm phục vụ và khát khao vươn lên, Co.opmart khẳng định Thương hiệu siêu thị dẫn đầu tại Việt Nam và phát triển ra khu vực, nhằm đem lại lợi ích tốt nhất cho khách hàng và cộng đồng',
N'18 Nguyễn Bình, xã Phú Xuân, huyện Nhà Bè, ',
3),

(28,'fmcg3.png',
N'Circle K',
N'Tại Việt Nam, chúng tôi chú trọng vào việc phát triển nhanh chóng trong lĩnh vực kinh doanh chuỗi cửa hàng tiện lợi theo giấy phép nhượng quyền thương hiệu của Circle K Mỹ.
Circle K tự hào giới thiệu rằng chúng tôi là chuỗi cửa hàng tiện lợi quốc tế đầu tiên tại Việt Nam, và cửa hàng đầu tiên được khai trương vào 20 tháng 12 năm 2008.
Circle K Việt Nam hiện đã có gần 400 cửa hàng tại các thành phố lớn như Hà Nội, Hồ Chí Minh và Vũng Tàu, và sẽ còn tiếp tục phát triển để đáp ứng nhu cầu của khách hàng ở khắp mọi nơi.
Cam Kết Dịch Vụ của chúng tôi đối với khách hàng được gói gọn trong 4 chữ F (4Fs) (Tươi, Thân Thiện, Nhanh, và Đầy Đủ).
Tầm Nhìn của chúng tôi là mong muốn trở thành chuỗi cửa hàng tiện lợi được ưa chuộng nhất tại Việt Nam.
Sứ Mệnh của chúng tôi là mang đến một không gian mua sắm thú vị, thân thiện và đáng tin cậy cho khách hàng với những mặt hàng, dịch vụ, món ăn phong phú, đa dạng được phục vụ nhanh chóng và niềm nở.',
N'Lô II, Hồng Lĩnh Plaza, Đường Số 9A, Khu Trung Sơn, P. Bình Hưng, Bình Chánh, ',
3),

(29,'fmcg4.png',
N'Guardian',
N'Guardian – chuỗi cửa hàng bán lẻ các sản phẩm chăm sóc sức khỏe và sắc đẹp thuộc tập đoàn Dairy Farm, một nhà bán lẻ hàng đầu Châu Á về chuỗi cửa hàng sức khỏe và sắc đẹp, cửa hàng tiện lợi, siêu thị và đại siêu thị. Tập đoàn Dairy Farm hoạt động kinh doanh với hơn 6.000 cửa hàng bán lẻ đa dạng tại hơn 12 quốc gia khắp châu Á.
Guardian luôn cam kết mang lại cho bạn những sản phẩm đa dạng, chất lượng cao và chính hãng từ các nhà sản xuất hàng đầu tại Việt Nam và trên toàn thế giới. Các ngành hàng của chúng tôi bao gồm sản phẩm chăm sóc da mặt, mỹ phẩm, chăm sóc da, chăm sóc cá nhân, chăm sóc sức khỏe và tại một số cửa hàng, chúng tôi còn kinh doanh nhà thuốc. Phương châm của chúng tôi là giúp người tiêu dùng có một cuộc sống khỏe mạnh và tươi đẹp hơn. Ngoài ra, đội ngũ nhân viên bán hàng được đào tạo bài bản và thân thiện cùng hệ thống cửa hàng hiện đại sẽ đưa trải nghiệm mua sắm của bạn lên một tầm cao mới.
Tại Việt Nam, cửa hàng đầu tiên đã được khai trương vào tháng 09/2011 và đến hiện tại Guardian đã có hơn 90 cửa hàng tại thành phố Hồ Chí Minh, thành phố Hà Nội, Đồng Nai, Vũng Tàu, và sắp tới là tại thành phố Đà Nẵng.',
N'Tầng 1, 346 Bến Vân Đồn, P.1, Q.4, ',
2),

(30,'fmcg5.png',
N'Công ty cổ phần thương mại Bách Hóa Xanh',
N'Bách Hóa Xanh là thành viên của Tập đoàn Thế Giới Di Động (MWG), chuỗi bán lẻ thực phẩm tươi sống và nhu yếu phẩm hàng đầu Việt Nam, được thành lập từ cuối năm 2015. Hiện nay, Bách Hóa Xanh sở hữu hơn 2.500 cửa hàng phủ khắp gần 20 tỉnh, thành trên cả ba miền Bắc - Trung - Nam. Hệ thống cung cấp đa dạng hàng tiêu dùng, thực phẩm và đồ uống có nguồn gốc rõ ràng, giá cả hợp lý, không gian mua sắm sạch sẽ, thân thiện. Năm 2024, Bách Hóa Xanh dẫn đầu doanh thu ngành bán lẻ bách hóa hiện đại. Bước sang năm 2026, Bách Hóa Xanh mở rộng mạnh mẽ tại miền Bắc, tìm kiếm đội ngũ Quản lý siêu thị cùng đồng hành trong giai đoạn phát triển mới.',
N'Tòa nhà MWG Lô T2-1.2, Đường D1, Khu Công Nghệ Cao, Phường Tân Phú, Quận 9, ',
3),

-- Sản xuất
(31,'sx1.png',
N'VinFast Đà Nẵng',
N'Vinfast Đà Nẵng là đại lý chính hãng của Vinfast tại Miền Trung chuyên cung cấp tất cả các dòng xe Vinfast. Vinfast Đà Nẵng là đại lý Vinfast chính hãng lớn nhất miền trung chúng tôi cam kết báo giá đầy đủ và chính xác nhất tới Quý khách hàng. Dưới đây là phần giới thiệu Vinfast Đà Nẵng khách hàng cùng tìm hiểu nhé.
Giới thiệu Vinfast Việt Nam
VINFAST là Công ty thành viên của Tập đoàn Vingroup
Vinfast kết nối từ chuỗi viết tắt của các từ: Việt Nam – Phong cách – An toàn – Sáng tạo – Tiên phong với ý nghĩa tôn vinh xe thương hiệu Việt.
Sự ra đời của VinFast thể hiện khát vọng xây dựng một thương hiệu Việt Nam có tầm thế giới.
Khẳng định khả năng làm chủ các công nghệ hiện đại của người Việt.
Thông qua lĩnh vực sản xuất ô tô, xe máy- một trong những ngành công nghiệp mang tính dẫn dắt.
Vingroup mong muốn tham gia góp phần thúc đẩy sự phát triển của ngành công nghiệp nặng và chế tạo tại Việt Nam, góp phần thực hiện công nghiệp hóa, hiện đại hóa đất nước.
Là công ty con của Tập đoàn Vingroup.',
N'910 Ngô Quyền, ',
2),

(32,'sx2.png',
N'Samsung Việt Nam',
N'Tập đoàn Samsung là một tập đoàn đa quốc gia của Hàn Quốc có tổng hành dinh đặt tại Samsung Town, Seoul. Tập đoàn có nhiều công ty con, hầu hết hoạt động dưới thương hiệu Samsung, là tập đoàn thương mại lớn nhất Hàn Quốc.
Samsung được sáng lập bởi Lee Byung-Chul năm 1938, được khởi đầu là một công ty buôn bán nhỏ. 3 thập kỉ sau, tập đoàn Samsung đa dạng hóa các ngành nghề bao gồm chế biến thực phẩm, dệt may, bảo hiểm, chứng khoán và bán lẻ. Samsung tham gia vào lĩnh vực công nghiệp điện tử vào cuối thập kỉ 60, xây dựng và công nghiệp đóng tàu vào giữa thập kỉ 70. Sau khi Lee mất năm 1987, Samsung tách ra thành 4 tập đoàn - tập đoàn Samsung, Shinsegae, CJ và Hansol. Từ thập kỉ 90, Samsung mở rộng hoạt động trên quy mô toàn cầu, tập trung vào lĩnh vực điện tử, điện thoại di động và chất bán dẫn, đóng góp chủ yếu vào doanh thu của tập đoàn.
Những chi nhánh quan trọng của Samsung bao gồm Samsung Electronics (công ty điện tử lớn nhất thế giới theo doanh thu, và lớn thứ 4 thế giới theo giá trị thị trường năm 2012), Samsung Heavy Industries (công ty đóng tàu lớn thứ 2 thế giới theo doanh thu năm 2010), Samsung Engineering và Samsung C&T (lần lượt là công ty xây dựng lớn thứ 13 và 36 thế giới). Những chi nhánh chú ý khác bao gồm Samsung Life Insurance (công ty bảo hiểm lớn thứ 14 thế giới), Samsung Everland (quản lý Everland Resort, công viên chủ đề lâu đời nhất Hàn Quốc), Samsung Techwin (công ty không gian vũ trụ, thiết bị giám sát, bảo vệ) và Cheil Worldwide (công ty quảng cáo lớn thứ 16 thế giới theo doanh thu năm 2011).
Samsung có tầm ảnh hưởng lớn trong phát triển kinh tế, chính trị, truyền thông, văn hóa ở Hàn Quốc, và là động lực thúc đẩy chính đằng sau "Kì tích sông Hàn". Đóng góp 1/5 tổng kim ngạch xuất khẩu của Hàn Quốc. Doanh thu chiếm 17% tổng sản phẩm quốc nội (GDP) của Hàn Quốc.',
N'333 Điện Biên Phủ, Phường 15, Quận Bình Thạnh, ',
3),

(33,'sx3.png',
N'Savimex Corporation',
N'Savimex là một trong những đơn vị hàng đầu tại Việt Nam trong việc sản xuất và xuất khẩu các sản phẩm gỗ chất lượng cao. Thành lập năm 1985 trên tổng diện tích hơn 5 ha, nhà máy được trang bị dây chuyền máy móc thiết bị và công nghệ hiện đại, đáp ứng tiêu chuẩn xuất khẩu vào các thị trường hàng đầu: Nhật Bản, Mỹ, Châu Âu… Hệ thống Quản Lý Chất Lượng luôn được áp dụng xuyên suốt quá trình sản xuất để đảm bảo chất luợng sản phẩm tốt nhất và Hệ thống Quản Lý Môi trường được quan tâm triệt để nhằm bảo vệ nguồn tài nguyên. Lực lượng lao động của nhà máy trên 1200 người bao gồm những kỹ sư, chuyên viên kỹ thuật giàu kinh nghiệm cùng với đội ngũ công nhân lành nghề luôn sẵn sàng đáp ứng các yêu cầu của khách hàng.',
N'162 HT17, Phường Hiệp Thành, Quận 12, ',
3),

(34,'sx4.png',
N'Panasonic Vietnam Co., Ltd.',
N'Công ty Panasonic Việt Nam (PV) là công ty 100% vốn nước ngoài đầu tiên giữ vai trò Công ty Chủ Quản tại Việt Nam.
Tập đoàn Panasonic tại Việt Nam gồm tám công ty bao gồm Panasonic Việt Nam và bộ phận kinh doanh trực thuộc Panasonic Sales Việt Nam (PSV), Trung tâm nghiên cứu và phát triển (PRDCV), năm công ty sản xuất bao gồm Panasonic AVC Networks Việt Nam (PAVCV), Panasonic Appliances Việt Nam (PAPVN), Panasonic System Networks Việt Nam (PSNV), Panasonic Industrial Devices Việt Nam (PIDVN), Panasonic Life Solutions Việt Nam (PLSVN), và công ty bảo hiểm Panasonic Insurance Service Việt Nam (PISVN). Tập đoàn có tổng số nhân lực khoảng 7,000 người.
Panasonic lấy yếu tố con người làm trung tâm. Vì vậy chế độ phúc lợi của chúng tôi đảm bảo rằng công dân Panasonic được chăm lo về mặt cá nhân, tài chính, và nghiệp vụ. Bạn quan tâm muốn trở thành một phần của Tập đoàn Panasonic tại Việt Nam có thể gửi hồ sơ (Tiếng Anh) về địa chỉ email của phòng Nhân sự  kết nối và nhận những thông tin nghề nghiệp hấp dẫn nhất!',
N'Plot J1-J2 Thang Long Industrial Park, Dong Anh District, ',
1),

(35,'sx5.png',
N'CÔNG TY CỔ PHẦN TẬP ĐOÀN TRƯỜNG HẢI',
N'CÔNG TY CỔ PHẦN TẬP ĐOÀN TRƯỜNG HẢI (TRUONG HAI GROUP) tiền thân là Công ty Cổ phần Ô tô Trường Hải (THACO) được thành lập vào ngày 29/04/1997, tại Đồng Nai. Người sáng lập là ông Trần Bá Dương, hiện là Chủ tịch Hội đồng quản trị. 
Trải qua 27 năm hình thành và phát triển, từ một công ty chuyên nhập khẩu xe cũ, cung cấp vật tư phụ tùng sửa chữa ô tô, THACO đã phát triển vượt bậc, trở thành Tập đoàn công nghiệp đa ngành gồm 6 Tập đoàn thành viên: THACO AUTO (Ô tô), THACO INDUSTRIES (Cơ khí & Công nghiệp hỗ trợ), THACO AGRI (Nông nghiệp), THADICO (Đầu tư & Xây dựng), THISO (Thương mại & Dịch vụ) và THILOGI (Logistics), trong đó các ngành bổ trợ cho nhau và có tính tích hợp cao.
Các trụ cột chính yếu: Nhân sự phù hợp; Chiến lược khác biệt; Triết lý giá trị; Quản trị tối ưu; Môi trường làm việc văn hóa thuận tiện.',
N'Số 10 Mai Chí Thọ, Phường Thủ Thiêm, TP. Thủ Đức, ',
3);

insert into field_company (company_id, category_id) 
values
(1,1),(2,1),(3,1),(4,1),(5,1),
(6,2),(7,2),(8,2),(9,2),(10,2),
(11,3),(12,3),(13,3),(14,3),(15,3),
(16,4),(17,4),(18,4),(19,4),(20,4),
(21,5),(22,5),(23,5),(24,5),(25,5),
(26,6),(27,6),(28,6),(29,6),(30,6),
(31,7),(32,7),(33,7),(34,7),(35,7);

insert into users values
(null,1,N'admin1@gmail.com',N'123456',N'Bùi Cửu Đỉnh'),
(null,1,N'admin2@gmail.com',N'123456',N'Lê Thị Thùy Linh'),

(1,2,N'employer1@gmail.com',N'123456',N'Phạm Tuấn Anh'),
(5,2,N'employer2@gmail.com',N'123456',N'Lê Thị Lan'),
(10,2,N'employer3@gmail.com',N'123456',N'Đặng Quốc Bảo'),

(null,3,N'user1@gmail.com',N'123456',N'Nguyễn Văn Nam'),
(null,3,N'user2@gmail.com',N'123456',N'Lê Thị Hồng'),
(null,3,N'user3@gmail.com',N'123456',N'Trần Đức Minh'),
(null,3,N'user4@gmail.com',N'123456',N'Phạm Quỳnh Anh'),
(null,3,N'user5@gmail.com',N'123456',N'Đỗ Thành Công');


insert into jobs
(job_id, company_id, title_job, description_job, requirement_job, benefit_job, salary_job, experience_job, hiring_quantity)
values

(1,1,
N'Giao Dịch Viên Ngân Hàng',
N'Thực hiện các giao dịch tiền gửi và rút tiền cho khách hàng tại quầy.
Hướng dẫn khách hàng mở tài khoản ngân hàng.
Xử lý các giao dịch chuyển khoản trong và ngoài hệ thống.
Kiểm tra và xác minh thông tin khách hàng.
Giải đáp các thắc mắc liên quan đến dịch vụ ngân hàng.
Quản lý tiền mặt tại quầy giao dịch.
Lập báo cáo giao dịch hàng ngày.
Thực hiện các nhiệm vụ khác theo yêu cầu của trưởng bộ phận.',
N'Tốt nghiệp Cao đẳng hoặc Đại học ngành Tài chính - Ngân hàng hoặc Kế toán.
Có kỹ năng giao tiếp tốt.
Thành thạo tin học văn phòng.
Trung thực và cẩn thận trong công việc.
Ưu tiên ứng viên có kinh nghiệm làm việc tại ngân hàng.',
N'Được đào tạo nghiệp vụ ngân hàng.
Lương thưởng hấp dẫn theo hiệu quả công việc.
Được tham gia đầy đủ bảo hiểm theo quy định.
Môi trường làm việc chuyên nghiệp.
Cơ hội thăng tiến rõ ràng.',
N'10 - 20 triệu',
N'1 năm',
3),

(2,1,
N'Chuyên Viên Tín Dụng Cá Nhân',
N'Tư vấn các sản phẩm vay vốn cho khách hàng cá nhân.
Thẩm định hồ sơ vay vốn.
Đánh giá khả năng tài chính của khách hàng.
Hướng dẫn khách hàng hoàn thiện hồ sơ vay.
Theo dõi và quản lý các khoản vay.
Chăm sóc khách hàng trong quá trình vay vốn.
Phối hợp với các phòng ban liên quan để xử lý hồ sơ.',
N'Tốt nghiệp Đại học chuyên ngành Tài chính - Ngân hàng.
Có kỹ năng phân tích tài chính.
Kỹ năng giao tiếp và tư vấn tốt.
Có tinh thần trách nhiệm trong công việc.',
N'Lương cạnh tranh + thưởng doanh số.
Được đào tạo nghiệp vụ tín dụng.
Tham gia bảo hiểm đầy đủ.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'1 năm',
2),

(3,2,
N'Nhân Viên Quan Hệ Khách Hàng',
N'Tìm kiếm và phát triển khách hàng sử dụng dịch vụ ngân hàng.
Tư vấn các sản phẩm tài chính như tiền gửi và vay vốn.
Chăm sóc khách hàng hiện tại của ngân hàng.
Hỗ trợ khách hàng trong quá trình giao dịch.
Theo dõi và cập nhật thông tin khách hàng.
Phối hợp với các phòng ban để giải quyết yêu cầu khách hàng.
Báo cáo kết quả công việc định kỳ.',
N'Tốt nghiệp Đại học chuyên ngành Tài chính - Ngân hàng hoặc Quản trị kinh doanh.
Có kỹ năng giao tiếp tốt.
Có khả năng tư vấn và thuyết phục khách hàng.
Có tinh thần trách nhiệm cao.',
N'Lương cơ bản + thưởng doanh số.
Được đào tạo kỹ năng bán sản phẩm tài chính.
Chế độ bảo hiểm đầy đủ.
Môi trường làm việc năng động.',
N'10 - 20 triệu',
N'Dưới 1 năm',
3),

(4,2,
N'Chuyên Viên Phân Tích Tín Dụng',
N'Phân tích hồ sơ tín dụng của khách hàng.
Đánh giá rủi ro tín dụng.
Đề xuất hạn mức cho vay phù hợp.
Phối hợp với bộ phận tín dụng để xử lý hồ sơ vay.
Theo dõi chất lượng các khoản vay.
Lập báo cáo phân tích tài chính.',
N'Tốt nghiệp Đại học Tài chính - Ngân hàng hoặc Kế toán.
Có kiến thức về phân tích tài chính.
Sử dụng tốt Excel.
Có tư duy phân tích tốt.',
N'Lương cạnh tranh.
Thưởng hiệu quả công việc.
Môi trường làm việc chuyên nghiệp.
Cơ hội phát triển lâu dài.',
N'20 - 30 triệu',
N'2 năm',
2),

(5,3,
N'Chuyên Viên Thanh Toán Quốc Tế',
N'Xử lý các giao dịch thanh toán quốc tế.
Kiểm tra chứng từ xuất nhập khẩu.
Hỗ trợ khách hàng thực hiện chuyển tiền quốc tế.
Tư vấn các dịch vụ thanh toán quốc tế.
Phối hợp với ngân hàng đối tác nước ngoài.
Theo dõi và báo cáo giao dịch.',
N'Tốt nghiệp Đại học Tài chính - Ngân hàng hoặc Kinh tế quốc tế.
Có kiến thức về thanh toán quốc tế.
Tiếng Anh giao tiếp tốt.
Cẩn thận và trách nhiệm.',
N'Lương cạnh tranh theo năng lực.
Được đào tạo chuyên môn.
Chế độ bảo hiểm đầy đủ.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'1 năm',
2),

(6,3,
N'Nhân Viên Kiểm Soát Nội Bộ',
N'Kiểm tra và giám sát các giao dịch trong ngân hàng.
Đảm bảo tuân thủ quy trình nghiệp vụ.
Phát hiện và báo cáo các rủi ro trong hệ thống.
Kiểm tra hồ sơ tín dụng và giao dịch tài chính.
Phối hợp với các phòng ban để khắc phục sai sót.',
N'Tốt nghiệp Đại học Tài chính, Ngân hàng hoặc Kiểm toán.
Có kiến thức về kiểm soát nội bộ.
Tư duy phân tích tốt.
Cẩn thận và trung thực.',
N'Lương hấp dẫn.
Môi trường làm việc ổn định.
Chế độ phúc lợi đầy đủ.
Cơ hội phát triển lâu dài.',
N'Dưới 10 triệu',
N'Dưới 1 năm',
2),

(7,4,
N'Nhân Viên Tư Vấn Tài Chính',
N'Tư vấn các sản phẩm tài chính cho khách hàng.
Hướng dẫn khách hàng đầu tư và tiết kiệm.
Phân tích nhu cầu tài chính của khách hàng.
Đề xuất giải pháp tài chính phù hợp.
Chăm sóc khách hàng sau bán hàng.',
N'Tốt nghiệp Đại học chuyên ngành Tài chính.
Kỹ năng giao tiếp tốt.
Có khả năng tư vấn khách hàng.
Tinh thần trách nhiệm cao.',
N'Lương cơ bản + thưởng doanh số.
Được đào tạo chuyên môn.
Chế độ bảo hiểm đầy đủ.',
N'10 - 20 triệu',
N'1 năm',
3),

(8,4,
N'Chuyên Viên Quản Lý Rủi Ro',
N'Phân tích và đánh giá rủi ro tài chính.
Xây dựng các chính sách quản lý rủi ro.
Giám sát các hoạt động tín dụng.
Báo cáo rủi ro cho ban lãnh đạo.
Đề xuất các biện pháp giảm thiểu rủi ro.',
N'Tốt nghiệp Đại học ngành Tài chính hoặc Ngân hàng.
Có kiến thức về quản trị rủi ro.
Kỹ năng phân tích tốt.',
N'Lương cạnh tranh.
Thưởng hiệu suất.
Môi trường làm việc chuyên nghiệp.',
N'20 - 30 triệu',
N'2 năm',
2),

(9,5,
N'Nhân Viên Hỗ Trợ Tín Dụng',
N'Hỗ trợ chuẩn bị hồ sơ vay vốn.
Kiểm tra tính hợp lệ của hồ sơ tín dụng.
Theo dõi tiến độ xử lý hồ sơ.
Phối hợp với bộ phận tín dụng.
Lưu trữ hồ sơ khách hàng.',
N'Tốt nghiệp Cao đẳng hoặc Đại học ngành Tài chính.
Thành thạo tin học văn phòng.
Cẩn thận và có trách nhiệm.',
N'Lương cạnh tranh.
Môi trường làm việc ổn định.
Được đào tạo nghiệp vụ.',
N'Dưới 10 triệu',
N'Không yêu cầu',
3),

(10,5,
N'Chuyên Viên Phân Tích Tài Chính',
N'Phân tích tình hình tài chính của khách hàng.
Đánh giá khả năng trả nợ của khách hàng.
Lập báo cáo tài chính định kỳ.
Hỗ trợ bộ phận tín dụng trong việc ra quyết định cho vay.
Theo dõi hiệu quả tài chính.',
N'Tốt nghiệp Đại học ngành Tài chính hoặc Kế toán.
Có kỹ năng phân tích số liệu.
Sử dụng tốt Excel.',
N'Lương hấp dẫn.
Thưởng hiệu suất công việc.
Cơ hội thăng tiến.',
N'30 - 50 triệu',
N'3 năm',
2),

(11,1,
N'Chuyên Viên Phân Tích Tài Chính',
N'Phân tích báo cáo tài chính của khách hàng doanh nghiệp trước khi cấp tín dụng.
Đánh giá khả năng trả nợ và dòng tiền của doanh nghiệp.
Thẩm định các hồ sơ vay vốn trung và dài hạn.
Phối hợp với bộ phận tín dụng để hoàn thiện hồ sơ cho vay.
Theo dõi hiệu quả tài chính của các khoản vay đang hoạt động.
Xây dựng báo cáo phân tích tài chính định kỳ cho quản lý.
Đề xuất các phương án quản lý rủi ro tín dụng.
Cập nhật các quy định tài chính và chính sách ngân hàng.
Hỗ trợ đào tạo nội bộ về phân tích tài chính.
Thực hiện các nhiệm vụ khác theo yêu cầu của cấp trên.',
N'Tốt nghiệp Đại học ngành Tài chính - Ngân hàng hoặc Kế toán.
Có kiến thức về phân tích báo cáo tài chính doanh nghiệp.
Sử dụng thành thạo Excel và các công cụ phân tích dữ liệu.
Có khả năng tư duy logic và phân tích số liệu tốt.
Có khả năng làm việc độc lập và làm việc nhóm.
Ưu tiên ứng viên có kinh nghiệm trong lĩnh vực ngân hàng.',
N'Lương cạnh tranh theo năng lực.
Thưởng theo hiệu quả công việc hàng quý.
Được đào tạo nghiệp vụ tài chính chuyên sâu.
Môi trường làm việc chuyên nghiệp.
Tham gia đầy đủ các chế độ bảo hiểm theo quy định.
Cơ hội thăng tiến lên vị trí quản lý.',
N'30 - 50 triệu',
N'3 năm',
2),

(12,1,
N'Nhân Viên Hỗ Trợ Tín Dụng',
N'Tiếp nhận và kiểm tra hồ sơ vay vốn của khách hàng.
Hỗ trợ chuyên viên tín dụng chuẩn bị hồ sơ cho vay.
Theo dõi tiến độ xử lý hồ sơ tín dụng.
Lưu trữ và quản lý hồ sơ khách hàng.
Phối hợp với các phòng ban để xử lý hồ sơ nhanh chóng.
Kiểm tra tính hợp lệ của các chứng từ tài chính.
Cập nhật dữ liệu khách hàng vào hệ thống ngân hàng.
Lập báo cáo tình trạng hồ sơ vay vốn.
Hỗ trợ khách hàng hoàn thiện hồ sơ.
Thực hiện các nhiệm vụ khác theo phân công.',
N'Tốt nghiệp Cao đẳng hoặc Đại học ngành Tài chính hoặc Kế toán.
Có kiến thức cơ bản về nghiệp vụ ngân hàng.
Sử dụng thành thạo tin học văn phòng.
Cẩn thận và trung thực trong công việc.
Có khả năng làm việc nhóm tốt.',
N'Lương cạnh tranh.
Được đào tạo nghiệp vụ ngân hàng.
Môi trường làm việc ổn định.
Chế độ bảo hiểm đầy đủ.
Cơ hội phát triển nghề nghiệp.',
N'Dưới 10 triệu',
N'Không yêu cầu',
3),

(13,2,
N'Chuyên Viên Quan Hệ Khách Hàng Doanh Nghiệp',
N'Tìm kiếm và phát triển khách hàng doanh nghiệp mới.
Tư vấn các sản phẩm tài chính và tín dụng cho doanh nghiệp.
Phân tích nhu cầu tài chính của khách hàng.
Xây dựng và duy trì mối quan hệ lâu dài với khách hàng.
Hỗ trợ khách hàng trong quá trình vay vốn.
Theo dõi các khoản vay của khách hàng doanh nghiệp.
Phối hợp với bộ phận tín dụng để xử lý hồ sơ.
Lập báo cáo kinh doanh định kỳ.
Đề xuất các giải pháp tài chính cho khách hàng.
Thực hiện các nhiệm vụ khác theo yêu cầu của quản lý.',
N'Tốt nghiệp Đại học ngành Tài chính - Ngân hàng hoặc Quản trị kinh doanh.
Có kỹ năng giao tiếp và đàm phán tốt.
Có khả năng phân tích nhu cầu khách hàng.
Tinh thần trách nhiệm cao trong công việc.
Ưu tiên ứng viên có kinh nghiệm bán sản phẩm tài chính.',
N'Lương cơ bản + thưởng doanh số.
Được đào tạo kỹ năng bán hàng tài chính.
Môi trường làm việc năng động.
Cơ hội thăng tiến rõ ràng.
Tham gia đầy đủ bảo hiểm.',
N'20 - 30 triệu',
N'1 năm',
3),

(14,2,
N'Chuyên Viên Thanh Toán Quốc Tế',
N'Thực hiện các giao dịch thanh toán quốc tế cho khách hàng.
Kiểm tra chứng từ xuất nhập khẩu theo quy định ngân hàng.
Hỗ trợ khách hàng thực hiện chuyển tiền quốc tế.
Tư vấn các dịch vụ thanh toán quốc tế.
Theo dõi và kiểm soát các giao dịch ngoại tệ.
Phối hợp với ngân hàng đối tác nước ngoài.
Xử lý các vấn đề phát sinh trong thanh toán quốc tế.
Lập báo cáo giao dịch định kỳ.
Cập nhật các quy định liên quan đến thanh toán quốc tế.
Thực hiện các nhiệm vụ khác theo phân công.',
N'Tốt nghiệp Đại học ngành Tài chính - Ngân hàng hoặc Kinh tế quốc tế.
Có kiến thức về thanh toán quốc tế.
Tiếng Anh giao tiếp tốt.
Sử dụng tốt tin học văn phòng.
Có tinh thần trách nhiệm cao.',
N'Lương hấp dẫn theo năng lực.
Được đào tạo nghiệp vụ quốc tế.
Môi trường làm việc chuyên nghiệp.
Tham gia đầy đủ bảo hiểm.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'2 năm',
2),

(15,3,
N'Chuyên Viên Quản Lý Rủi Ro Ngân Hàng',
N'Phân tích và đánh giá các rủi ro tài chính của ngân hàng.
Xây dựng các chính sách kiểm soát rủi ro tín dụng.
Theo dõi các khoản vay có dấu hiệu rủi ro.
Đề xuất các biện pháp giảm thiểu rủi ro.
Phối hợp với các phòng ban để kiểm soát rủi ro.
Lập báo cáo rủi ro định kỳ cho ban lãnh đạo.
Đánh giá hiệu quả các chính sách quản trị rủi ro.
Cập nhật các quy định pháp lý liên quan.
Tham gia xây dựng hệ thống kiểm soát nội bộ.
Thực hiện các nhiệm vụ khác theo phân công.',
N'Tốt nghiệp Đại học ngành Tài chính hoặc Ngân hàng.
Có kiến thức về quản trị rủi ro.
Có khả năng phân tích số liệu tốt.
Sử dụng thành thạo Excel.
Có tinh thần trách nhiệm cao.',
N'Lương cạnh tranh.
Thưởng hiệu quả công việc.
Môi trường làm việc chuyên nghiệp.
Cơ hội thăng tiến.
Chế độ phúc lợi đầy đủ.',
N'Thỏa thuận',
N'Trên 3 năm',
2);

insert into jobs
(job_id, company_id, title_job, description_job, requirement_job, benefit_job, salary_job, experience_job, hiring_quantity)
values

-- Bất động sản (company 6)
(16,6,
N'Chuyên Viên Kinh Doanh Bất Động Sản',
N'Tìm kiếm khách hàng có nhu cầu mua hoặc đầu tư bất động sản.
Tư vấn các dự án bất động sản của công ty cho khách hàng.
Giới thiệu thông tin chi tiết về dự án, giá bán và chính sách thanh toán.
Hỗ trợ khách hàng tham quan dự án thực tế.
Đàm phán và ký kết hợp đồng mua bán bất động sản.
Chăm sóc khách hàng trước và sau khi bán hàng.
Cập nhật thông tin thị trường bất động sản.
Báo cáo kết quả kinh doanh định kỳ cho quản lý.',
N'Tốt nghiệp Trung cấp trở lên.
Có kỹ năng giao tiếp và tư vấn khách hàng tốt.
Có khả năng đàm phán và thuyết phục.
Ưu tiên ứng viên có kinh nghiệm sales.
Có tinh thần cầu tiến và chịu áp lực doanh số.',
N'Lương cơ bản + hoa hồng cao.
Thưởng theo doanh số bán hàng.
Được đào tạo kỹ năng sales chuyên nghiệp.
Môi trường làm việc năng động.
Cơ hội thu nhập cao.',
N'Trên 50 triệu',
N'Trên 3 năm',
5),

(17,6,
N'Nhân Viên Marketing Bất Động Sản',
N'Lập kế hoạch marketing cho các dự án bất động sản.
Quản lý nội dung trên website và mạng xã hội.
Chạy quảng cáo Facebook Ads và Google Ads.
Phối hợp với bộ phận kinh doanh để triển khai chiến dịch marketing.
Nghiên cứu thị trường và khách hàng mục tiêu.
Đề xuất các chiến lược marketing mới.
Theo dõi hiệu quả chiến dịch quảng cáo.
Báo cáo kết quả marketing cho quản lý.',
N'Tốt nghiệp chuyên ngành Marketing hoặc liên quan.
Có kinh nghiệm chạy quảng cáo online.
Biết sử dụng các công cụ marketing.
Có khả năng sáng tạo nội dung.',
N'Lương cạnh tranh.
Thưởng theo hiệu quả chiến dịch.
Được đào tạo nâng cao kỹ năng.
Môi trường làm việc trẻ trung.',
N'10 - 20 triệu',
N'1 năm',
2),

-- Xây dựng (company 11)
(18,11,
N'Kỹ Sư Xây Dựng',
N'Giám sát tiến độ thi công tại công trình.
Kiểm tra chất lượng vật liệu xây dựng.
Đọc và triển khai bản vẽ kỹ thuật.
Phối hợp với đội thi công để đảm bảo tiến độ dự án.
Kiểm soát chi phí và vật tư.
Đảm bảo an toàn lao động tại công trường.
Báo cáo tiến độ công trình cho quản lý.
Thực hiện các nhiệm vụ kỹ thuật khác.',
N'Tốt nghiệp Đại học ngành Xây dựng.
Có khả năng đọc bản vẽ kỹ thuật.
Có kinh nghiệm làm việc tại công trình.
Chịu được áp lực công việc.',
N'Lương hấp dẫn theo năng lực.
Tham gia các dự án lớn.
Chế độ bảo hiểm đầy đủ.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'2 năm',
3),

-- IT (company 16)
(19,16,
N'Frontend Developer',
N'Phát triển giao diện người dùng cho website và ứng dụng web.
Chuyển đổi thiết kế UI/UX thành mã HTML, CSS và JavaScript.
Tối ưu hóa hiệu năng website.
Phối hợp với backend developer để tích hợp API.
Kiểm tra và sửa lỗi giao diện.
Đảm bảo website hiển thị tốt trên nhiều thiết bị.
Tham gia cải tiến trải nghiệm người dùng.
Cập nhật các công nghệ frontend mới.',
N'Tốt nghiệp ngành Công nghệ thông tin hoặc liên quan.
Thành thạo HTML, CSS và JavaScript.
Có kinh nghiệm ReactJS hoặc VueJS.
Hiểu biết về REST API.
Có tư duy logic tốt.',
N'Lương cạnh tranh theo năng lực.
Thưởng dự án.
Được tham gia bảo hiểm đầy đủ.
Môi trường làm việc năng động.',
N'20 - 30 triệu',
N'1 năm',
2),

(20,16,
N'Backend Developer',
N'Phát triển hệ thống backend cho website và ứng dụng.
Thiết kế và xây dựng API cho hệ thống.
Quản lý và tối ưu cơ sở dữ liệu.
Đảm bảo tính bảo mật và hiệu năng của hệ thống.
Phối hợp với frontend developer để tích hợp chức năng.
Kiểm tra và sửa lỗi hệ thống.
Viết tài liệu kỹ thuật cho dự án.
Tham gia phát triển các tính năng mới.',
N'Tốt nghiệp ngành Công nghệ thông tin.
Thành thạo Java, NodeJS hoặc .NET.
Có kiến thức về SQL và hệ quản trị cơ sở dữ liệu.
Hiểu biết về RESTful API.
Có khả năng làm việc nhóm.',
N'Lương cạnh tranh.
Thưởng dự án.
Môi trường làm việc hiện đại.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'1 năm',
2),


-- IT (company 17)
(21,17,
N'Fullstack Developer',
N'Phát triển và bảo trì các ứng dụng web của công ty.
Thiết kế và triển khai cả frontend và backend cho hệ thống.
Làm việc với RESTful API để kết nối giữa các dịch vụ.
Tối ưu hiệu suất hệ thống và trải nghiệm người dùng.
Tham gia phân tích yêu cầu và thiết kế giải pháp kỹ thuật.
Kiểm tra và sửa lỗi trong quá trình phát triển.
Phối hợp với các nhóm QA và DevOps.
Cập nhật công nghệ mới nhằm cải thiện sản phẩm.',
N'Tốt nghiệp ngành Công nghệ thông tin hoặc liên quan.
Thành thạo JavaScript, HTML, CSS.
Có kinh nghiệm với NodeJS hoặc Java Spring.
Hiểu biết về cơ sở dữ liệu SQL.
Có khả năng làm việc nhóm tốt.',
N'Lương cạnh tranh theo năng lực.
Thưởng theo dự án và hiệu quả công việc.
Được tham gia các khóa đào tạo chuyên môn.
Môi trường làm việc năng động.
Chế độ bảo hiểm đầy đủ.',
N'20 - 30 triệu',
N'2 năm',
2),

(22,17,
N'QA Tester',
N'Kiểm thử phần mềm trước khi triển khai.
Viết test case và test plan cho sản phẩm.
Thực hiện kiểm thử chức năng và hiệu năng.
Phát hiện lỗi và báo cáo cho nhóm phát triển.
Theo dõi quá trình sửa lỗi.
Đảm bảo chất lượng phần mềm trước khi release.
Phối hợp với developer để cải thiện chất lượng sản phẩm.
Tham gia cải tiến quy trình kiểm thử.',
N'Tốt nghiệp ngành CNTT hoặc liên quan.
Có kiến thức về kiểm thử phần mềm.
Biết sử dụng các công cụ test.
Cẩn thận và có tư duy logic.',
N'Lương cạnh tranh.
Thưởng hiệu suất.
Đào tạo kỹ năng kiểm thử.
Môi trường làm việc chuyên nghiệp.',
N'10 - 20 triệu',
N'Dưới 1 năm',
2),

-- IT (company 18)
(23,18,
N'DevOps Engineer',
N'Quản lý hệ thống triển khai phần mềm.
Thiết lập CI/CD cho các dự án phần mềm.
Quản lý server và hạ tầng cloud.
Giám sát hiệu suất hệ thống.
Đảm bảo hệ thống hoạt động ổn định.
Tự động hóa các quy trình triển khai.
Phối hợp với developer để tối ưu hệ thống.
Xử lý các sự cố kỹ thuật khi xảy ra.',
N'Tốt nghiệp CNTT hoặc ngành liên quan.
Có kinh nghiệm với Linux server.
Biết Docker hoặc Kubernetes.
Hiểu về CI/CD pipeline.',
N'Lương cạnh tranh.
Thưởng theo dự án.
Được đào tạo công nghệ mới.
Môi trường làm việc hiện đại.',
N'30 - 50 triệu',
N'2 năm',
2),

(24,18,
N'UI UX Designer',
N'Thiết kế giao diện cho website và ứng dụng.
Nghiên cứu trải nghiệm người dùng.
Tạo wireframe và prototype cho sản phẩm.
Phối hợp với developer để triển khai thiết kế.
Cải tiến trải nghiệm người dùng.
Phân tích phản hồi của khách hàng.
Thiết kế hệ thống design guideline.
Tham gia cải tiến sản phẩm.',
N'Tốt nghiệp ngành Thiết kế hoặc CNTT.
Biết sử dụng Figma hoặc Adobe XD.
Có tư duy thiết kế tốt.
Có khả năng sáng tạo.',
N'Lương cạnh tranh.
Thưởng theo hiệu quả công việc.
Môi trường sáng tạo.
Cơ hội phát triển nghề nghiệp.',
N'10 - 20 triệu',
N'1 năm',
2),

-- Tài chính (company 21)
(25,21,
N'Chuyên Viên Phân Tích Tài Chính',
N'Phân tích báo cáo tài chính của doanh nghiệp.
Đánh giá hiệu quả đầu tư của các dự án.
Thu thập dữ liệu tài chính từ nhiều nguồn.
Xây dựng mô hình dự báo tài chính.
Phân tích rủi ro tài chính.
Đề xuất chiến lược đầu tư.
Hỗ trợ lãnh đạo trong việc ra quyết định tài chính.
Lập báo cáo phân tích định kỳ.',
N'Tốt nghiệp Đại học Tài chính hoặc Kế toán.
Có kiến thức về phân tích tài chính.
Thành thạo Excel.
Có tư duy phân tích tốt.',
N'Lương hấp dẫn.
Thưởng hiệu suất.
Được đào tạo nâng cao chuyên môn.
Chế độ bảo hiểm đầy đủ.',
N'20 - 30 triệu',
N'2 năm',
2),

(26,21,
N'Nhân Viên Kế Toán',
N'Quản lý sổ sách kế toán của công ty.
Theo dõi thu chi và dòng tiền.
Lập báo cáo tài chính định kỳ.
Kiểm tra chứng từ kế toán.
Phối hợp với các phòng ban khác.
Hỗ trợ kiểm toán nội bộ.
Thực hiện các nghiệp vụ kế toán.
Lưu trữ hồ sơ tài chính.',
N'Tốt nghiệp ngành Kế toán.
Có kiến thức về chuẩn mực kế toán.
Thành thạo Excel.
Cẩn thận và trung thực.',
N'Lương ổn định.
Thưởng theo hiệu quả công việc.
Được đào tạo chuyên môn.
Bảo hiểm đầy đủ.',
N'10 - 20 triệu',
N'Dưới 1 năm',
2),

(27,22,
N'Chuyên Viên Tư Vấn Tài Chính',
N'Tư vấn các giải pháp đầu tư tài chính cho khách hàng cá nhân.
Phân tích nhu cầu tài chính của khách hàng.
Giới thiệu các sản phẩm tài chính của công ty.
Hỗ trợ khách hàng xây dựng kế hoạch đầu tư dài hạn.
Theo dõi danh mục đầu tư của khách hàng.
Cập nhật thông tin thị trường tài chính.
Chăm sóc khách hàng và duy trì mối quan hệ lâu dài.
Báo cáo kết quả kinh doanh định kỳ.',
N'Tốt nghiệp Đại học chuyên ngành Tài chính hoặc Kinh tế.
Có kỹ năng giao tiếp tốt.
Có khả năng phân tích tài chính.
Ưu tiên ứng viên có kinh nghiệm tư vấn.
Có tinh thần trách nhiệm cao.',
N'Lương cơ bản + hoa hồng.
Thưởng theo doanh số.
Được đào tạo nghiệp vụ tài chính.
Môi trường làm việc chuyên nghiệp.',
N'20 - 30 triệu',
N'2 năm',
3),

(28,22,
N'Nhân Viên Phân Tích Đầu Tư',
N'Nghiên cứu thị trường tài chính và chứng khoán.
Phân tích dữ liệu đầu tư.
Đánh giá rủi ro tài chính.
Lập báo cáo phân tích đầu tư.
Đề xuất chiến lược đầu tư cho công ty.
Theo dõi biến động thị trường.
Phối hợp với bộ phận quản lý quỹ.
Hỗ trợ ra quyết định đầu tư.',
N'Tốt nghiệp ngành Tài chính hoặc Kinh tế.
Thành thạo Excel và các công cụ phân tích.
Có tư duy phân tích tốt.
Có kiến thức về thị trường chứng khoán.',
N'Lương hấp dẫn.
Thưởng theo hiệu quả đầu tư.
Cơ hội thăng tiến.
Được đào tạo chuyên sâu.',
N'20 - 30 triệu',
N'2 năm',
2),

-- Tài chính (company 23)
(29,23,
N'Nhân Viên Kiểm Soát Nội Bộ',
N'Kiểm tra và giám sát các hoạt động tài chính của công ty.
Đảm bảo tuân thủ các quy định tài chính.
Phát hiện và báo cáo các sai sót.
Đánh giá rủi ro trong hoạt động kinh doanh.
Đề xuất các biện pháp cải thiện quy trình.
Kiểm tra chứng từ tài chính.
Lập báo cáo kiểm soát nội bộ.
Phối hợp với các phòng ban liên quan.',
N'Tốt nghiệp Đại học Kế toán hoặc Tài chính.
Có kiến thức về kiểm toán.
Cẩn thận và trung thực.
Có khả năng phân tích tốt.',
N'Lương ổn định.
Chế độ bảo hiểm đầy đủ.
Môi trường làm việc chuyên nghiệp.
Cơ hội phát triển nghề nghiệp.',
N'20 - 30 triệu',
N'2 năm',
2),

(30,23,
N'Chuyên Viên Quản Lý Rủi Ro',
N'Phân tích rủi ro trong hoạt động tài chính.
Xây dựng chiến lược quản lý rủi ro.
Theo dõi các chỉ số rủi ro của doanh nghiệp.
Đánh giá hiệu quả các biện pháp kiểm soát.
Báo cáo tình hình rủi ro cho lãnh đạo.
Phối hợp với các phòng ban liên quan.
Đề xuất cải tiến quy trình quản lý rủi ro.
Nghiên cứu các mô hình quản trị rủi ro.',
N'Tốt nghiệp ngành Tài chính hoặc Kinh tế.
Có kinh nghiệm phân tích dữ liệu.
Hiểu biết về quản trị rủi ro.
Có khả năng làm việc nhóm.',
N'Lương cạnh tranh.
Thưởng hiệu suất.
Được đào tạo chuyên môn.
Môi trường làm việc hiện đại.',
N'20 - 30 triệu',
N'2 năm',
2),

-- Tài chính (company 24)
(31,24,
N'Chuyên Viên Tín Dụng',
N'Thẩm định hồ sơ vay vốn của khách hàng.
Phân tích khả năng tài chính của khách hàng.
Đề xuất hạn mức tín dụng.
Theo dõi tình trạng khoản vay.
Hỗ trợ khách hàng hoàn thiện hồ sơ.
Quản lý danh mục tín dụng.
Báo cáo kết quả hoạt động tín dụng.
Đảm bảo tuân thủ quy định của công ty.',
N'Tốt nghiệp ngành Tài chính hoặc Ngân hàng.
Có kiến thức về nghiệp vụ tín dụng.
Có khả năng phân tích tài chính.
Kỹ năng giao tiếp tốt.',
N'Lương hấp dẫn.
Thưởng doanh số.
Đào tạo nghiệp vụ chuyên sâu.
Bảo hiểm đầy đủ.',
N'20 - 30 triệu',
N'1 năm',
3),

(32,24,
N'Nhân Viên Hỗ Trợ Khách Hàng Tài Chính',
N'Hỗ trợ khách hàng về các sản phẩm tài chính.
Giải đáp thắc mắc của khách hàng.
Hướng dẫn khách hàng sử dụng dịch vụ.
Xử lý các yêu cầu hỗ trợ.
Ghi nhận phản hồi của khách hàng.
Phối hợp với các phòng ban liên quan.
Cập nhật thông tin khách hàng.
Báo cáo công việc hàng ngày.',
N'Tốt nghiệp Cao đẳng trở lên.
Có kỹ năng giao tiếp tốt.
Thái độ phục vụ khách hàng tốt.
Có tinh thần trách nhiệm.',
N'Lương ổn định.
Thưởng theo hiệu quả công việc.
Môi trường làm việc thân thiện.
Được đào tạo kỹ năng.',
N'Dưới 10 triệu',
N'Không yêu cầu',
3),

-- Bán lẻ FMCG (company 26)
(33,26,
N'Quản Lý Cửa Hàng',
N'Quản lý hoạt động kinh doanh của cửa hàng.
Theo dõi doanh thu và chi phí.
Quản lý nhân viên bán hàng.
Đảm bảo hàng hóa luôn đầy đủ.
Kiểm soát tồn kho.
Đảm bảo chất lượng dịch vụ khách hàng.
Triển khai các chương trình khuyến mãi.
Báo cáo kết quả kinh doanh cho công ty.',
N'Tốt nghiệp Cao đẳng trở lên.
Có kinh nghiệm quản lý bán lẻ.
Kỹ năng giao tiếp tốt.
Có khả năng quản lý nhân viên.',
N'Lương hấp dẫn.
Thưởng doanh số.
Chế độ bảo hiểm đầy đủ.
Cơ hội thăng tiến.',
N'20 - 30 triệu',
N'2 năm',
1),

(34,26,
N'Nhân Viên Bán Hàng',
N'Tư vấn sản phẩm cho khách hàng.
Giới thiệu chương trình khuyến mãi.
Sắp xếp hàng hóa trên kệ.
Kiểm tra tồn kho.
Thanh toán cho khách hàng.
Giữ gìn vệ sinh khu vực bán hàng.
Hỗ trợ khách hàng lựa chọn sản phẩm.
Báo cáo doanh số bán hàng.',
N'Tốt nghiệp THPT trở lên.
Có kỹ năng giao tiếp.
Thái độ phục vụ tốt.
Chăm chỉ và trung thực.',
N'Lương + thưởng doanh số.
Được đào tạo bán hàng.
Môi trường làm việc năng động.',
N'Dưới 10 triệu',
N'Không yêu cầu',
4);

insert into jobs
(job_id, company_id, title_job, description_job, requirement_job, benefit_job, salary_job, experience_job, hiring_quantity)
values

-- FMCG (company 27)
(35,27,
N'Nhân Viên Marketing FMCG',
N'Lập kế hoạch marketing cho các sản phẩm tiêu dùng.
Triển khai các chiến dịch quảng cáo online.
Quản lý nội dung trên mạng xã hội.
Phối hợp với bộ phận bán hàng.
Phân tích hiệu quả chiến dịch marketing.
Nghiên cứu thị trường tiêu dùng.
Đề xuất chiến lược quảng bá sản phẩm.
Báo cáo kết quả marketing định kỳ.',
N'Tốt nghiệp Marketing hoặc ngành liên quan.
Có kinh nghiệm digital marketing.
Biết sử dụng các công cụ quảng cáo.
Có khả năng sáng tạo nội dung.',
N'Lương cạnh tranh.
Thưởng theo hiệu quả chiến dịch.
Đào tạo nâng cao kỹ năng marketing.
Môi trường làm việc năng động.',
N'Thỏa thuận',
N'Trên 3 năm',
2),

(36,27,
N'Nhân Viên Kinh Doanh FMCG',
N'Tìm kiếm khách hàng phân phối sản phẩm.
Phát triển hệ thống đại lý bán lẻ.
Giới thiệu sản phẩm của công ty.
Đàm phán hợp đồng với khách hàng.
Theo dõi doanh số bán hàng.
Chăm sóc khách hàng hiện tại.
Cập nhật thông tin thị trường.
Báo cáo kết quả kinh doanh.',
N'Tốt nghiệp Cao đẳng trở lên.
Có kỹ năng bán hàng.
Kỹ năng giao tiếp tốt.
Chịu được áp lực doanh số.',
N'Lương cơ bản + hoa hồng.
Thưởng doanh số hấp dẫn.
Cơ hội thăng tiến.',
N'10 - 20 triệu',
N'1 năm',
3),

-- FMCG (company 28)
(37,28,
N'Quản Lý Kênh Phân Phối',
N'Quản lý hệ thống phân phối sản phẩm.
Phát triển đại lý bán hàng mới.
Theo dõi doanh số từng khu vực.
Phối hợp với đội ngũ sales.
Phân tích dữ liệu bán hàng.
Đề xuất chiến lược phát triển thị trường.
Quản lý tồn kho tại đại lý.
Báo cáo kết quả kinh doanh.',
N'Tốt nghiệp Kinh tế hoặc Marketing.
Có kinh nghiệm quản lý phân phối.
Kỹ năng phân tích dữ liệu tốt.
Có khả năng lãnh đạo.',
N'Lương cạnh tranh.
Thưởng theo doanh số.
Bảo hiểm đầy đủ.',
N'20 - 30 triệu',
N'2 năm',
2),

(38,28,
N'Nhân Viên Trade Marketing',
N'Triển khai các chương trình khuyến mãi tại điểm bán.
Phối hợp với bộ phận bán hàng.
Quản lý vật phẩm quảng cáo.
Theo dõi hiệu quả chương trình marketing.
Nghiên cứu hành vi người tiêu dùng.
Hỗ trợ phát triển thương hiệu.
Phân tích dữ liệu thị trường.
Báo cáo chiến dịch marketing.',
N'Tốt nghiệp Marketing.
Có kinh nghiệm trade marketing.
Kỹ năng phân tích tốt.
Có khả năng làm việc nhóm.',
N'Lương cạnh tranh.
Thưởng hiệu quả công việc.
Môi trường làm việc năng động.',
N'10 - 20 triệu',
N'1 năm',
2),

-- FMCG (company 29)
(39,29,
N'Nhân Viên Quản Lý Kho',
N'Quản lý hàng hóa trong kho.
Kiểm kê hàng tồn kho định kỳ.
Theo dõi nhập xuất hàng hóa.
Đảm bảo kho vận hành hiệu quả.
Phối hợp với bộ phận logistics.
Sắp xếp hàng hóa khoa học.
Kiểm tra chất lượng hàng hóa.
Báo cáo tình trạng kho.',
N'Tốt nghiệp Trung cấp trở lên.
Có kinh nghiệm quản lý kho.
Cẩn thận và trung thực.',
N'Lương ổn định.
Bảo hiểm đầy đủ.
Môi trường làm việc ổn định.',
N'Dưới 10 triệu',
N'1 năm',
2),

(40,29,
N'Nhân Viên Chăm Sóc Khách Hàng',
N'Tiếp nhận yêu cầu của khách hàng.
Giải đáp thắc mắc về sản phẩm.
Hỗ trợ xử lý khiếu nại.
Theo dõi mức độ hài lòng khách hàng.
Cập nhật thông tin khách hàng.
Phối hợp với bộ phận bán hàng.
Ghi nhận phản hồi khách hàng.
Báo cáo kết quả công việc.',
N'Tốt nghiệp Cao đẳng trở lên.
Có kỹ năng giao tiếp tốt.
Thái độ phục vụ khách hàng tốt.',
N'Lương + thưởng.
Môi trường làm việc thân thiện.',
N'Thỏa thuận',
N'Không yêu cầu',
3),

-- FMCG (company 30)
(41,30,
N'Giám Sát Bán Hàng',
N'Quản lý đội ngũ nhân viên bán hàng.
Theo dõi doanh số bán hàng.
Đào tạo nhân viên sales.
Phân tích thị trường bán lẻ.
Lập kế hoạch kinh doanh.
Phát triển hệ thống khách hàng.
Đảm bảo đạt chỉ tiêu doanh số.
Báo cáo kết quả kinh doanh.',
N'Tốt nghiệp Kinh tế hoặc Marketing.
Có kinh nghiệm quản lý sales.
Kỹ năng lãnh đạo tốt.',
N'Lương hấp dẫn.
Thưởng doanh số cao.',
N'20 - 30 triệu',
N'3 năm',
1),

(42,30,
N'Nhân Viên Bán Hàng Siêu Thị',
N'Tư vấn sản phẩm cho khách hàng.
Sắp xếp hàng hóa trên kệ.
Giới thiệu chương trình khuyến mãi.
Thanh toán cho khách hàng.
Kiểm tra tồn kho.
Giữ gìn vệ sinh khu bán hàng.
Hỗ trợ khách hàng chọn sản phẩm.
Báo cáo doanh số.',
N'Tốt nghiệp THPT.
Có kỹ năng giao tiếp.
Chăm chỉ và trung thực.',
N'Lương + thưởng doanh số.',
N'Dưới 10 triệu',
N'Không yêu cầu',
4),

-- SẢN XUẤT (company 31)
(43,31,
N'Kỹ Sư Sản Xuất',
N'Quản lý quy trình sản xuất tại nhà máy.
Giám sát hoạt động dây chuyền sản xuất.
Đảm bảo chất lượng sản phẩm.
Tối ưu hiệu suất sản xuất.
Kiểm soát nguyên vật liệu.
Đảm bảo an toàn lao động.
Phối hợp với các bộ phận liên quan.
Báo cáo tình hình sản xuất.',
N'Tốt nghiệp ngành Kỹ thuật.
Có kinh nghiệm sản xuất.
Kỹ năng quản lý tốt.',
N'Lương cạnh tranh.',
N'20 - 30 triệu',
N'1 năm',
2),

(44,31,
N'Nhân Viên QC',
N'Kiểm tra chất lượng sản phẩm.
Đánh giá tiêu chuẩn sản xuất.
Phát hiện lỗi sản phẩm.
Đề xuất cải tiến quy trình.
Kiểm tra nguyên vật liệu.
Lập báo cáo chất lượng.
Phối hợp với bộ phận sản xuất.
Theo dõi quy trình kiểm định.',
N'Tốt nghiệp ngành kỹ thuật.
Có kiến thức kiểm soát chất lượng.',
N'Lương ổn định.',
N'10 - 20 triệu',
N'1 năm',
2),

-- SẢN XUẤT (company 32)
(45,32,
N'Kỹ Sư Bảo Trì',
N'Bảo trì hệ thống máy móc trong nhà máy.
Kiểm tra thiết bị định kỳ.
Sửa chữa máy móc khi gặp sự cố.
Đảm bảo dây chuyền hoạt động ổn định.
Cải tiến hệ thống kỹ thuật.
Theo dõi hiệu suất thiết bị.
Phối hợp với bộ phận sản xuất.
Báo cáo tình trạng máy móc.',
N'Tốt nghiệp kỹ thuật cơ khí hoặc điện.
Có kinh nghiệm bảo trì.',
N'Lương cạnh tranh.',
N'10 - 20 triệu',
N'2 năm',
2),

(46,32,
N'Nhân Viên Vận Hành Máy',
N'Vận hành máy móc trong dây chuyền sản xuất.
Theo dõi hoạt động của thiết bị.
Đảm bảo máy hoạt động đúng quy trình.
Kiểm tra chất lượng sản phẩm.
Báo cáo sự cố máy móc.
Phối hợp với kỹ thuật viên.
Giữ gìn vệ sinh khu vực máy.',
N'Tốt nghiệp Trung cấp kỹ thuật.',
N'Lương ổn định.',
N'Thỏa thuận',
N'Không yêu cầu',
3),

-- SẢN XUẤT (company 33)
(47,33,
N'Quản Lý Nhà Máy',
N'Quản lý toàn bộ hoạt động nhà máy.
Điều phối nhân sự sản xuất.
Kiểm soát chi phí sản xuất.
Đảm bảo tiến độ sản xuất.
Quản lý chất lượng sản phẩm.
Đảm bảo an toàn lao động.
Lập kế hoạch sản xuất.
Báo cáo cho ban giám đốc.',
N'Tốt nghiệp kỹ thuật hoặc quản trị.
Có kinh nghiệm quản lý sản xuất.',
N'Lương hấp dẫn.',
N'30 - 50 triệu',
N'Trên 3 năm',
1),

(48,33,
N'Nhân Viên Kho Nguyên Liệu',
N'Quản lý nguyên vật liệu trong kho.
Theo dõi nhập xuất nguyên liệu.
Kiểm kê kho định kỳ.
Sắp xếp hàng hóa khoa học.
Kiểm tra chất lượng nguyên liệu.
Phối hợp với bộ phận sản xuất.
Báo cáo tồn kho.',
N'Tốt nghiệp Trung cấp.',
N'Lương ổn định.',
N'Dưới 10 triệu',
N'Không yêu cầu',
2),

-- SẢN XUẤT (company 34)
(49,34,
N'Kỹ Sư Cơ Khí',
N'Thiết kế và cải tiến thiết bị cơ khí.
Giám sát lắp đặt máy móc.
Bảo trì hệ thống thiết bị.
Phân tích lỗi kỹ thuật.
Đề xuất cải tiến máy móc.
Phối hợp với bộ phận sản xuất.
Đảm bảo máy hoạt động ổn định.',
N'Tốt nghiệp kỹ thuật cơ khí.',
N'Lương cạnh tranh.',
N'20 - 30 triệu',
N'Trên 3 năm',
2),

(50,34,
N'Nhân Viên Lắp Ráp',
N'Thực hiện lắp ráp sản phẩm.
Kiểm tra linh kiện trước khi lắp.
Đảm bảo đúng quy trình kỹ thuật.
Kiểm tra chất lượng sản phẩm.
Báo cáo lỗi sản phẩm.
Phối hợp với bộ phận QC.',
N'Tốt nghiệp Trung cấp.',
N'Lương ổn định.',
N'Dưới 10 triệu',
N'Không yêu cầu',
3),

-- SẢN XUẤT (company 35)
(51,35,
N'Kỹ Sư Điện',
N'Thiết kế hệ thống điện trong nhà máy.
Bảo trì hệ thống điện.
Kiểm tra thiết bị điện.
Đảm bảo an toàn điện.
Sửa chữa sự cố điện.
Phối hợp với bộ phận kỹ thuật.',
N'Tốt nghiệp kỹ thuật điện.',
N'Lương cạnh tranh.',
N'10 - 20 triệu',
N'2 năm',
2),

(52,35,
N'Nhân Viên Kiểm Tra Sản Phẩm',
N'Kiểm tra sản phẩm trước khi xuất kho.
Đánh giá chất lượng sản phẩm.
Phát hiện lỗi sản phẩm.
Báo cáo kết quả kiểm tra.
Đảm bảo tiêu chuẩn chất lượng.',
N'Tốt nghiệp Trung cấp.',
N'Lương ổn định.',
N'Dưới 10 triệu',
N'Không yêu cầu',
2);

insert into jobs
(job_id, company_id, title_job, description_job, requirement_job, benefit_job, salary_job, experience_job, hiring_quantity)
values

(53,27,
N'Chuyên Viên Phát Triển Thị Trường FMCG',
N'Tìm kiếm và mở rộng hệ thống đại lý phân phối sản phẩm.
Khảo sát thị trường và nhu cầu tiêu dùng.
Giới thiệu sản phẩm của công ty tới đối tác.
Xây dựng mối quan hệ với các cửa hàng bán lẻ.
Theo dõi doanh số theo khu vực.
Phối hợp với bộ phận marketing triển khai chương trình khuyến mãi.
Phân tích dữ liệu bán hàng.
Báo cáo kết quả kinh doanh định kỳ.',
N'Tốt nghiệp Cao đẳng trở lên ngành Kinh doanh hoặc Marketing.
Có kỹ năng giao tiếp và đàm phán.
Ưu tiên ứng viên có kinh nghiệm FMCG.',
N'Lương cơ bản + thưởng doanh số.
Được đào tạo kỹ năng bán hàng.
Môi trường làm việc năng động.',
N'Trên 50 triệu',
N'Trên 3 năm',
2),

(54,28,
N'Chuyên Viên Quản Lý Thương Hiệu',
N'Xây dựng và phát triển thương hiệu sản phẩm của công ty.
Lập kế hoạch truyền thông thương hiệu.
Phối hợp với bộ phận marketing triển khai chiến dịch quảng bá.
Phân tích hành vi người tiêu dùng.
Theo dõi mức độ nhận diện thương hiệu.
Đề xuất chiến lược marketing dài hạn.
Quản lý ngân sách marketing.
Báo cáo kết quả chiến dịch.',
N'Tốt nghiệp Marketing hoặc Quản trị kinh doanh.
Có tư duy chiến lược thương hiệu.
Kỹ năng phân tích tốt.',
N'Lương cạnh tranh.
Thưởng theo hiệu quả chiến dịch.',
N'10 - 20 triệu',
N'2 năm',
1),

(55,29,
N'Chuyên Viên Logistics',
N'Quản lý quá trình vận chuyển hàng hóa.
Theo dõi tiến độ giao hàng.
Làm việc với các đối tác vận chuyển.
Kiểm soát chi phí logistics.
Đảm bảo hàng hóa giao đúng thời gian.
Quản lý chứng từ vận chuyển.
Phối hợp với bộ phận kho.
Báo cáo hoạt động logistics.',
N'Tốt nghiệp ngành Logistics hoặc Quản trị kinh doanh.
Có khả năng quản lý chuỗi cung ứng.
Kỹ năng tổ chức tốt.',
N'Lương ổn định.
Chế độ bảo hiểm đầy đủ.',
N'Thỏa thuận',
N'1 năm',
2),

(56,30,
N'Nhân Viên Phát Triển Kênh Bán Lẻ',
N'Tìm kiếm và phát triển các điểm bán lẻ mới.
Hỗ trợ đại lý trưng bày sản phẩm.
Theo dõi doanh số bán hàng.
Thu thập thông tin thị trường.
Đề xuất chương trình khuyến mãi.
Phối hợp với bộ phận sales.
Chăm sóc khách hàng đại lý.
Báo cáo kết quả kinh doanh.',
N'Tốt nghiệp Cao đẳng trở lên.
Có kinh nghiệm bán hàng là lợi thế.
Kỹ năng giao tiếp tốt.',
N'Lương + thưởng doanh số.',
N'Dưới 10 triệu',
N'1 năm',
2),

(57,31,
N'Kỹ Sư Quản Lý Chất Lượng',
N'Giám sát quy trình kiểm soát chất lượng sản phẩm.
Xây dựng tiêu chuẩn kiểm định.
Phân tích lỗi sản phẩm.
Đề xuất cải tiến quy trình sản xuất.
Theo dõi chất lượng nguyên vật liệu.
Phối hợp với bộ phận sản xuất.
Đào tạo nhân viên về tiêu chuẩn chất lượng.
Báo cáo chất lượng sản phẩm.',
N'Tốt nghiệp ngành kỹ thuật hoặc quản lý chất lượng.
Có kinh nghiệm QC/QA.',
N'Lương cạnh tranh.',
N'Dưới 10 triệu',
N'Dưới 1 năm',
1),

(58,32,
N'Chuyên Viên Quản Lý Chuỗi Cung Ứng',
N'Quản lý chuỗi cung ứng nguyên vật liệu.
Theo dõi tiến độ cung cấp hàng hóa.
Làm việc với nhà cung cấp.
Tối ưu chi phí logistics.
Phân tích dữ liệu chuỗi cung ứng.
Đảm bảo nguồn hàng ổn định.
Phối hợp với bộ phận sản xuất.
Báo cáo hoạt động chuỗi cung ứng.',
N'Tốt nghiệp Logistics hoặc Quản trị kinh doanh.
Có kinh nghiệm quản lý chuỗi cung ứng.',
N'Lương hấp dẫn.',
N'20 - 30 triệu',
N'2 năm',
1),

(59,33,
N'Chuyên Viên Hoạch Định Sản Xuất',
N'Lập kế hoạch sản xuất cho nhà máy.
Phân tích nhu cầu sản xuất.
Phân bổ nguồn lực sản xuất.
Theo dõi tiến độ sản xuất.
Tối ưu hiệu suất dây chuyền.
Phối hợp với bộ phận kho.
Quản lý kế hoạch nguyên vật liệu.
Báo cáo kế hoạch sản xuất.',
N'Tốt nghiệp ngành quản lý sản xuất.
Có tư duy phân tích tốt.',
N'Lương cạnh tranh.',
N'20 - 30 triệu',
N'2 năm',
1),

(60,34,
N'Chuyên Viên Nghiên Cứu Phát Triển Sản Phẩm',
N'Nghiên cứu và phát triển sản phẩm mới.
Phân tích nhu cầu thị trường.
Thiết kế và thử nghiệm sản phẩm.
Cải tiến sản phẩm hiện có.
Phối hợp với bộ phận sản xuất.
Theo dõi phản hồi khách hàng.
Đánh giá chất lượng sản phẩm.
Báo cáo kết quả nghiên cứu.',
N'Tốt nghiệp ngành kỹ thuật hoặc công nghệ.
Có tư duy sáng tạo.',
N'Lương hấp dẫn.',
N'20 - 30 triệu',
N'2 năm',
1),

(61,35,
N'Kỹ Sư Tối Ưu Quy Trình Sản Xuất',
N'Phân tích và tối ưu quy trình sản xuất.
Giảm chi phí sản xuất.
Cải thiện hiệu suất dây chuyền.
Áp dụng các phương pháp Lean Manufacturing.
Phối hợp với bộ phận kỹ thuật.
Theo dõi hiệu quả sản xuất.
Đề xuất cải tiến quy trình.
Báo cáo kết quả cải tiến.',
N'Tốt nghiệp kỹ thuật công nghiệp.
Có kinh nghiệm tối ưu quy trình.',
N'Lương cạnh tranh.',
N'Trên 50 triệu',
N'3 năm',
1);