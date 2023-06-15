	-- Tạo bảng KHACHHANG
CREATE TABLE  KhachHang
(
MaKH int identity primary key,
HoTen nvarchar(255),
NgaySinh Datetime,
DienThoai varchar(15),
DiaChi nvarchar(255),
LoaiKH nvarchar(255) ,
)
GO

-- Tạo bảng NHANVIEN
CREATE TABLE   NhanVien
(
MaNV int identity primary key,
HoTen nvarchar(255),
NgayLam datetime,
DienThoai varchar(15),
DiaChi nvarchar(MAX),
PhongBan int,
)

ALTER TABLE NhanVien  ADD CONSTRAINT  FK_NV_PB FOREIGN KEY (PhongBan) REFERENCES  PhongBan (MaPB)

CREATE TABLE   PhongBan
(
MaPB int identity primary key,
TenPB nvarchar(255),
NgayTao datetime,
)

CREATE TABLE  LoaiSach
(
MaLoai int primary key,
TenLoai nvarchar(255),
NgayTao Datetime,
)

CREATE TABLE  MatHang
(
MaMH varchar(15) primary key,
TenMh nvarchar (255) not null,
NgayTao Datetime ,
SoLuong  int ,
GiaMua money,
GiaBan money,
Loai int,
NhaSX nvarchar(150),
Constraint MH_LH  foreign key (Loai) references LoaiSach (Maloai)
)


CREATE TABLE  DonHang
(
SoDH int identity primary key,
NgayDat Datetime,
LoaiThanhToan nvarchar(255),
DCGiaoHang nvarchar(MAX),
KhachHang nvarchar(255) not null,
HinhThucVanChuyen nvarchar(255),
SoLuong int
)
ALTER TABLE DonHang ALTER COLUMN KhachHang int

CREATE TABLE   TTDonHang
(
SoDonHang int not null,
NgayTao Datetime,
TrangThai nvarchar(255),
NVPhutrach int,
)

ALTER TABLE TTDonHang ADD CONSTRAINT  TTDH_HD FOREIGN KEY (SoDonHang) REFERENCES  DonHang (SoDH)
ALTER TABLE TTDonHang ADD CONSTRAINT  TTDH_NV FOREIGN KEY (NVPhuTrach) REFERENCES  NhanVien (MaNV)



CREATE TABLE  ChiTietDonHang
(
MaMH varchar(15),
SoDH int,
primary key (MaMH, SoDH),
)

ALTER TABLE ChiTietDonHang ADD CONSTRAINT  FK_CTDH_MH FOREIGN KEY (MaMH) REFERENCES  MatHang (MaMH)
ALTER TABLE ChiTietDonHang ADD CONSTRAINT  FK_CTDH_DH FOREIGN KEY (SoDH) REFERENCES  DonHang (SoDH)



CREATE TABLE  HoaDon
(
SoHD int identity primary key,
NgayTao Datetime,
PhiVanChuyen money,
SoDH int,
)
ALTER TABLE NhanVien  ADD CONSTRAINT  FK_NV_PB FOREIGN KEY (PhongBan) REFERENCES  PhongBan (MaPB)


CREATE TABLE   NhaSX
(
MaNSX varchar(10) primary key,
Ten nvarchar(255),
NgayTao datetime,
DienThoai varchar(15),
DiaChi nvarchar(MAX),
)


CREATE TABLE   PhieuNhap
(
SoPhieuNhap int identity primary key,
TongSL int,
NgayNhap datetime,
NhaSX  varchar(10) 
)

ALTER TABLE PhieuNhap  ADD CONSTRAINT  FK_PN_NSX FOREIGN KEY (NhaSX) REFERENCES  NhaSX (MaNSX)
ALTER TABLE DonHang  ADD CONSTRAINT  DH_KH FOREIGN KEY (KhachHang) REFERENCES  KhachHang (MaKH)

SELECT * FROM KhachHang
INSERT INTO KhachHang VALUES
(N'Lê Văn Tám','2003-06-29','0967837352',N'Hà Nội',N'thường xuyên '),
(N'Nguyễn Hồng Anh','2003-10-25','0974896326',N'Hà Nội',N'vãng lai'),
(N'Lê Thanh Tâm','2003-02-02','0973894526',N'Hà Nội',N'thường xuyên'),
(N'Nguyễn Anh Ngọc','2004-03-29','0932642853',N'Hà Nội',N'thường xuyên'),
(N'Lương Thùy Linh','2006-08-31','0929482364',N'Hà Nội',N'thường xuyên'),
(N'Nguyễn Xuân Nam','2003-12-13','0932746374',N'TP.Hồ Chí Minh',N'thường xuyên'),
(N'Nguyễn Ngoc Anh','2003-10-14','0969238748',N'TP.Hồ Chí Minh',N'vãng lai'),
(N'Nguyễn Công Hoàn','2003-08-25','0978326476',N'Thanh Hóa',N'vãng lai'),
(N'Pham Hùng Anh','2003-05-04','0932847823',N'Hải Phòng',N'vãng lai'),
(N'Nguyễn Hoàng Anh','2003-12-20','0991278934',N'Hòa Bình',N'vãng lai')

SELECT * FROM PhongBan
INSERT INTO PhongBan VALUES
(N'Nhập liệu','2022-01-01'),
(N'Chăm sóc khách hàng','2022-01-01'),
(N'Marketing','2022-01-01'),
(N'Đóng gói','2022-01-01'),
(N'Vận Chuyển','2022-01-01')

SELECT * FROM NhanVien
INSERT INTO NhanVien VALUES
(N'Nguyễn đình huy','2022-06-15','0937473232',N'Nam Từ Liêm','1'),
(N'Nguyễn Ngọc thao mai','2022-04-28','0932746378',N'Nam Từ Liêm','1'),
(N'Hồ anh thảo','2022-06-15', '0939384387',N'Trung Văn','3'),
(N'Trần Tiến Đạt','2022-06-15','0937483725',N'Trung Văn 1','4'),
(N'Nguyễn câm ly','2022-06-15','0938242383',N'Trung Văn 2','4'),
(N'Nguyễn viết xuân','2022-06-15','0923847236',N'Trung Văn 3','4'),
(N'Hà Văn nam','2022-05-20','0998374898',N'Bắc Từ Liêm','5'),
(N'Nguyễn Văn bính','2022-04-28','0938726487',N'Nam Từ Liêm','2'),
(N'Ngô Văn Thuyết','2022-06-15','0939843237',N'Bắc Từ Liêm 1','5'),
(N'Đinh thành an','2022-03-03', '0932938834',N'Nhổn','2'),
(N'Bùi Việt trung','2022-03-03', '0939883927',N'Nhổn','3'),
(N'Đinh quang phong','2022-03-03', '0932984393',N'Nhổn','5')

SELECT * FROM NhaSX
INSERT INTO NhaSX VALUES
('122',N'bui trung anh','2022-02-22','0945627725',N'Hai Bà Trưng - Hà Nội'),
('235',N'viet nam','2022-01-15','0945627725',N'Cầu Giấy - Hà Nội'),
('146',N'viet nam 2','2022-01-15','0945627725',N'Thanh Xuân - Hà Nội'),
('127',N'viet nam 3','2022-02-22','0945627725',N'Hà Đông - Hà Nội'),
('189',N'đông thành','2022-01-20','0945627725',N'Hoàn Kiếm - Hà Nội'),
('352',N'đông thành 1','2022-02-22','0945627725',N'Hoàn Kiếm - Hà Nội'),
('184',N'đông thành 2','2022-01-20','0945627725',N'Hai Bà Trưng - Hà Nội'),
('177',N'kim đồng 1','2022-01-17','0945627725',N'Thanh Xuân - Hà Nội'),
('179',N'kim đồng 2','2022-01-17','0945627725',N'Hà Đông  - Hà Nội'),
('290',N'kim đồng 3','2022-01-20','0945627725',N'Hoàn Kiếm - Hà Nội')

SELECT * FROM PhieuNhap
INSERT INTO PhieuNhap VALUES
('100','2022-02-22','122'),
('150','2022-01-15','235'),
('50','2022-01-15','146'),
('250','2022-02-22','127'),
('150','2022-01-20','189'),
('200','2022-02-22','352'),
('180','2022-01-20','184'),
('400','2022-01-17','177'),
('160','2022-01-17','179'),
('400','2022-01-20','290')

SELECT * FROM Loaisach
INSERT INTO Loaisach VALUES
('01',N'sách thiếu nhi','2022-02-12'),
('02',N'sách dạy học lập trình','2022-01-10'),
('03',N'sách dạy học lập trình 1','2022-01-05'),
('04',N'sách dạy học lập trình 2','2022-02-12'),
('05',N'sách thiếu nhi 1','2022-01-10'),
('06',N'sách thiếu nhi 2','2022-02-12'),
('07',N'sách dạy tiếng anh','2022-01-10'),
('08',N'sách dạy tiếng trung','2022-01-07'),
('09',N'sách dạy tiếng hàn','2022-01-07'),
('10',N'sách tiểu thuyết','2022-01-10')

SELECT * FROM MatHang
INSERT INTO MatHang VALUES
('12',N'Chuyện Con Mèo Dạy Hải Âu Bay','2022-02-12','25','17,000','37,000','01',N'bui trung anh'),
('13',N'Hoàng Tử Bé','2022-02-12','25','10,000','29,000','01',N'bui trung anh'),
('14',N'Truyện tranh lịch sử Việt Nam - Nguyên Phi Ỷ La','2022-02-12','25','20,000','47,000','05',N'viet nam'),
('15',N'Truyện tranh lịch sử Việt Nam - Dấy nghiệp trung hưng','2022-01-10','100','10,000','18,000','05',N'viet nam'),
('16',N'Truyện Cổ Andersen','2022-01-10','20','17,000','27,000','06',N'viet nam 2'),
('17',N'Chú Bé Mang Pyjama Sọc','2022-01-10','30','10,000','18,000','06',N'viet nam 2'),
('18',N'Tớ Học Lập Trình','2022-01-10','50','11,000','23,000','02',N'viet nam 3'),
('19',N'Lập Trình Và Cuộc Sống','2022-01-10','50','125,000','255,000,','02',N'viet nam 3'),
('20',N'Code Dạo Kí Sự','2022-01-05','10','120,000','230,000','03',N'đông thành'),
('21',N'Giáo Trình Kỹ Thuật Lập Trình C Căn Bản Và Nâng Cao','2022-01-05','10','90,000','190,000','03',N'đông thành'),
('22',N'Giáo Trình C++ Và Lập Trình Hướng Đối Tượng','2022-01-05','20','90,000','160,000','04',N'đông thành 1'),
('23',N'Ngôn Ngữ Lập Trình C Và C++','2022-01-05','10','100,000','220,000','04',N'đông thành 1'),
('24',N'Vừa lười vừa bận vẫn giỏi tiếng Anh','2022-02-12','100','100,000','180,000','07',N'kim đồng 1'),
('25',N'“English Grammar for Dummies”','2022-02-12','50','40,000','120,000','07',N'kim đồng 1'),
('26',N'5000 từ vựng tiếng Anh thông dụng nhất','2022-02-12','100','100,000','220,000','07',N'kim đồng 1'),
('27',N'Tự học 2000 từ vựng tiếng Anh','2022-01-10','50','100,000','240,000','07',N'kim đồng 1'),
('28',N'Tự học tiếng Trung cho người mới bắt đầu','2022-01-10','50','120,000','250,000','08',N'kim đồng 2'),
('29',N'Giáo trình Hán Ngữ Boya sơ cấp','2022-01-10','50','100,000','230,000','08',N'sách dạy tiếng trung'),
('30',N'Tập viết chữ Hán theo giáo trình Hán Ngữ phiên bản mới','2022-02-12','100','100,000','220,000','08',N'kim đồng 2'),
('31',N'Tiếng Hàn Cơ Bản Cùng Cheri Hyeri – Kim Hye Ri','2022-02-12','100','70,000','160,000','09',N'kim đồng 2'),
('32',N'Ngữ Pháp Tiếng Hàn Thông Dụng – Sơ Cấp','2022-01-10','90','200,000','620,000','09',N'kim đồng 2'),
('33',N'Bộ Sách Mukbang 1200 Từ Vựng Tiếng Hàn Tổng Hợp','2022-01-10','90','200,000,','430,000','09',N'kim đồng 2'),
('34',N'NỬA CHỪNG XUÂN','2022-01-07','90','90,000','190,000','10',N'kim đồng 3'),
('35',N'Không Gia Đình - Hector Malot','2022-01-07','110','90,000','190,000','10',N'kim đồng 3'),
('36',N'Ông Già Và Biển Cả - Ernest Hemingway','2022-01-07','100','90,000','230,000','10',N'kim đồng 3'),
('37',N'Âm Thanh Và Cuồng Nộ - William Faulkner','2022-01-07','100','90,000','220,000','10',N'kim đồng 3')



SELECT * FROM DonHang
INSERT INTO DonHang VALUES
('2022-02-10',N'Thanh toán khi nhận hàng',N'Hà Nội','1',N'Vận chuyển đường bộ','3'),
('2022-02-10',N'Chuyển Khoản',N'Hà Nội','2',N'Vận chuyển đường bộ','6'),
('2022-03-15',N'Chuyển Khoản',N'Hà Nội','3',N'Vận chuyển đường bộ','5'),
('2022-02-28',N'Thanh toán khi nhận hàng',N'Hà Nội','4',N'Vận chuyển đường bộ','3'),
('2022-03-20',N'Chuyển Khoản',N'TP.Hồ Chí Minh','5',N'Vận chuyển đường hàng không','2'),
('2022-03-20',N'Chuyển Khoản',N'Hà Nội','6',N'Vận chuyển đường bộ','1'),
('2022-04-05',N'Thanh toán khi nhận hàng',N'TP.Hồ Chí Minh','7',N'Vận chuyển đường sắt','3'),
('2022-05-30',N'Chuyển Khoản',N'Thanh Hóa','8',N'Vận chuyển đường sắt','1'),
('2022-07-15',N'Chuyển Khoản',N'Hải Phòng','9',N'Vận chuyển đường sắt','3'),
('2022-07-15',N'Chuyển Khoản',N'Hòa Bình','10',N'Vận chuyển đường sắt','2')

SELECT * FROM TTDonHang
INSERT INTO TTDonHang VALUES
('1','2012-02-10',N'Đã giao hàng thành công','7'),
('2','2012-02-10',N'Đã giao hàng thành công','7'),
('3','2019-03-15',N'Đang vận chyển','7'),
('4','2019-02-28',N'Đang vận chyển','9'),
('5','2019-03-20',N'Đang vận chyển','9'),
('6','2019-03-20',N'Đang vận chyển','9'),
('7','2022-04-05',N'Đang vận chyển','12'),
('8','2022-05-30',N'Đang vận chyển','12'),
('9','2022-07-15',N'Đang vận chyển','12'),
('10','2022-07-15',N'Đã giao hàng thành công','12')

SELECT * FROM ChiTietDonHang
INSERT INTO ChiTietDonHang VALUES
('12','1'),
('19','5'),
('24','7'),
('14','2'),
('31','3'),
('37','9'),
('25','10'),
('21','4'),
('22','6'),
('17','8')

SELECT * FROM HoaDon
INSERT INTO HoaDon VALUES
('2019-02-10','22,000','6'),
('2019-02-10','30,000','4'),
('2019-03-15','35,000','3'),
('2020-02-28','22,000','9'),
('2020-03-20','22,000','1'),
('2020-03-20','22,000','2'),
('2022-04-05','30,000','8'),
('2022-05-30','35,000','7'),
('2022-07-15','22,000','5'),
('2022-07-15','22,000','10')

--10 câu truy vấn dữ liệu--
--1. Liệt kê thông tin của khách hàng như là MaKH, HoTen, NgaySinh, DienThoai, DiaChi, LoaiKH--
Select  *
from KhachHang
--2. Liệt kê thông tin hóa đơn có giá vận chuyển trên 30,000--
Select *
from HoaDon
where PhiVanChuyen > 25000
--3. Liệt kê TenMh, GiaMua, GiaBan trong bảng MatHang có GiaBan >50.000 được sắp xếp tăng dần, SoLuong cũng được sắp xếp tăng dần--
Select TenMh,SoLuong, GiaMua, GiaBan
from MatHang
where GiaBan > 50000
Order by SoLuong , GiaBan  
--4. Liệt kê thông tin nhân viên bắt đầu làm việc từ khoảng tháng 3 đến tháng 8--
select *
from NhanVien
where month(NgayLam) between 3 and 8
--5. Tìm khách hàng LoạiKH = vãng lai đã mua sach--
select *
from KhachHang
where LoaiKH = 'vãng lai' AND MaKH in(Select KhachHang from DonHang)
--6. Liệt kê TenMh, SoLuong, GiaMua,GiaBan ,NhaSX với điều kiện NhaSX là bui trung anh và kim đồng, cùng với đó phải có giá mua lớn hơn 100.000--
select TenMh, SoLuong, GiaMua,GiaBan ,NhaSX
from MatHang
group by TenMh, SoLuong, GiaBan, GiaMua,NhaSX
having NhaSX ='bui trung anh' or NhaSX ='kim đồng' and GiaMua > 100000
--7. Đếm tổng số lượng  của từng loại hàng--
select Loai, sum(SoLuong) as SoLuong
from MatHang
group by Loai
--8. Liệt kê mặt hàng có tổng lượng hàng lớn hơn 200--
select Loai, SUM(SoLuong) as SoLuong
from MatHang
group by Loai
having SUM(SoLuong)>200
--9. Liệt kê thông tin đơn hàng có ngày đặt từ nagỳ 10 đến ngày 30--
select *
from DonHang
where day(NgayDat) between 10 and 30
--10. Tính tổng lượng hàng  trong bảng phiếu nhập--
select sum(TongSL)as TongLuongHang
from PhieuNhap


