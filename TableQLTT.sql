USE master
GO
DROP DATABASE QuanLyTrongTrot 
GO
CREATE DATABASE QuanLyTrongTrot
GO 
USE QuanLyTrongTrot
GO

-- Bảng HoSo
CREATE TABLE HoSo
(
    Id INT PRIMARY KEY IDENTITY,
    Ten NVARCHAR(50),
    SDT VARCHAR(50),
    Email VARCHAR(50),
    Ext TEXT
)
GO
INSERT INTO HoSo VALUES
    (N'Lê Chí Công', '0912345678', 'cong.dz@hust.edu.vn', NULL),
    (N'Vũ Thị Hải Anh', '0989708960', 'anh.vh@hust.edu.vn', NULL)
GO

-- Bảng Quyen
CREATE TABLE Quyen
(
    Id INT PRIMARY KEY IDENTITY,
    Ten NVARCHAR(50),
    Ext VARCHAR(50)
)
GO
INSERT INTO Quyen VALUES
    (N'Lập trình viên', 'Developer'),
    (N'Quản trị hệ thống', 'Admin'),
    (N'Cán bộ nghiệp vụ', 'Staff')
GO

-- Bảng TaiKhoan
CREATE TABLE TaiKhoan
(
    Ten VARCHAR(50) PRIMARY KEY,
    MatKhau VARCHAR(255),
    QuyenId INT FOREIGN KEY REFERENCES Quyen(Id),
    HoSoId INT FOREIGN KEY REFERENCES HoSo(Id)
)
GO
INSERT INTO TaiKhoan VALUES
    ('dev', '1234', 1, NULL),
    ('admin', '1234', 2, NULL),
    ('0989154248', '1234', 3, 1),
    ('0989708960', '1234', 3, 2)
GO

-- Bảng CapDoHanhChinh
CREATE TABLE CapDoHanhChinh 
(
    ID INT PRIMARY KEY IDENTITY,
    TenCapDo NVARCHAR(50),
    CapDo INT
)
GO
INSERT INTO CapDoHanhChinh VALUES
    (N'Tỉnh', 1),
    (N'Thành phố', 2),
    (N'Huyện', 2),
    (N'Phường', 3),
    (N'Xã', 3),
    (N'Thị trấn', 3),
    (N'Thôn', 4)
GO

-- Bảng DonViHanhChinh
CREATE TABLE DonViHanhChinh
(
    ID INT PRIMARY KEY IDENTITY,
    TenDonVi NVARCHAR(255),
    CapDoHanhChinhID INT FOREIGN KEY REFERENCES CapDoHanhChinh(ID),
    TrucThuocID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID)
)
GO
INSERT INTO DonViHanhChinh (TenDonVi, CapDoHanhChinhID, TrucThuocID) VALUES
    (N'Tỉnh Vĩnh Phúc', 1, NULL),
    (N'Thành phố Vĩnh Yên', 2, 1),
    (N'Thành phố Phúc Yên', 2, 1),
    (N'Huyện Lập Thạch', 3, 1),
    (N'Huyện Tam Dương', 3, 1),
    (N'Huyện Tam Đảo', 3, 1),
    (N'Huyện Bình Xuyên', 3, 1),
    (N'Huyện Yên Lạc', 3, 1),
    (N'Huyện Vĩnh Tường', 3, 1),
    (N'Huyện Sông Lô', 3, 1),
    (N'Phường Tích Sơn', 4, 2),
    (N'Phường Liên Bảo', 4, 2),
    (N'Phường Hội Hợp', 4, 2),
    (N'Phường Đống Đa', 4, 2),
    (N'Phường Ngô Quyền', 4, 2),
    (N'Phường Đồng Tâm', 4, 2),
    (N'Phường Định Trung', 4, 2),
    (N'Phường Khai Quang', 4, 2),
    (N'Xã Thanh Trù', 5, 2),
    (N'Phường Hùng Vương', 4, 3),
    (N'Phường Hai Bà Trưng', 4, 3),
    (N'Phường Phúc Thắng', 4, 3),
    (N'Phường Xuân Hoà', 4, 3),
    (N'Phường Đồng Xuân', 4, 3),
    (N'Xã Ngọc Thanh', 5, 3),
    (N'Xã Cao Minh', 5, 3),
    (N'Phường Nam Viêm', 4, 3),
    (N'Phường Tiền Châu', 4, 3),
    (N'Thị trấn Lập Thạch', 6, 4),
    (N'Xã Quang Sơn', 5, 4),
    (N'Xã Ngọc Mỹ', 5, 4),
    (N'Xã Hợp Lý', 5, 4),
    (N'Xã Bắc Bình', 5, 4),
    (N'Xã Thái Hòa', 5, 4),
    (N'Thị trấn Hoa Sơn', 6, 4),
    (N'Xã Liễn Sơn', 5, 4),
    (N'Xã Xuân Hòa', 5, 4),
    (N'Xã Vân Trục', 5, 4),
    (N'Xã Liên Hòa', 5, 4),
    (N'Xã Tử Du', 5, 4),
    (N'Xã Bàn Giản', 5, 4),
    (N'Xã Xuân Lôi', 5, 4),
    (N'Xã Đồng Ích', 5, 4),
    (N'Xã Tiên Lữ', 5, 4),
    (N'Xã Văn Quán', 5, 4),
    (N'Xã Tây Sơn', 5, 4),
    (N'Xã Sơn Đông', 5, 4),
    (N'Thị trấn Hợp Hòa', 6, 5),
    (N'Xã Hoàng Hoa', 5, 5),
    (N'Xã Đồng Tĩnh', 5, 5),
    (N'Thị trấn Kim Long', 6, 5),
    (N'Xã Hướng Đạo', 5, 5),
    (N'Xã Đạo Tú', 5, 5),
    (N'Xã An Hòa', 5, 5),
    (N'Xã Thanh Vân', 5, 5),
    (N'Xã Duy Phiên', 5, 5),
    (N'Xã Hoàng Đan', 5, 5),
    (N'Xã Hoàng Lâu', 5, 5),
    (N'Xã Hội Thịnh', 5, 5),
    (N'Thị trấn Tam Đảo', 6, 6),
    (N'Thị trấn Hợp Châu', 6, 6),
    (N'Xã Đạo Trù', 5, 6),
    (N'Xã Yên Dương', 5, 6),
    (N'Xã Bồ Lý', 5, 6),
    (N'Thị trấn Đại Đình', 6, 6),
    (N'Xã Tam Quan', 5, 6),
    (N'Xã Hồ Sơn', 5, 6),
    (N'Xã Minh Quang', 5, 6),
    (N'Thị trấn Hương Canh', 6, 7),
    (N'Thị trấn Gia Khánh', 6, 7),
    (N'Xã Trung Mỹ', 5, 7),
    (N'Thị trấn Bá Hiến', 6, 7),
    (N'Xã Thiện Kế', 5, 7),
    (N'Xã Hương Sơn', 5, 7),
    (N'Xã Tam Hợp', 5, 7),
    (N'Xã Quất Lưu', 5, 7),
    (N'Xã Sơn Lôi', 5, 7),
    (N'Thị trấn Đạo Đức', 6, 7),
    (N'Xã Tân Phong', 5, 7),
    (N'Thị trấn Thanh Lãng', 6, 7),
    (N'Xã Phú Xuân', 5, 7),
    (N'Thị trấn Yên Lạc', 6, 8),
    (N'Xã Đồng Cương', 5, 8),
    (N'Xã Đồng Văn', 5, 8),
    (N'Xã Bình Định', 5, 8),
    (N'Xã Trung Nguyên', 5, 8),
    (N'Xã Tề Lỗ', 5, 8),
    (N'Thị trấn Tam Hồng', 6, 8),
    (N'Xã Yên Đồng', 5, 8),
    (N'Xã Văn Tiến', 5, 8),
    (N'Xã Nguyệt Đức', 5, 8),
    (N'Xã Yên Phương', 5, 8),
    (N'Xã Trung Kiên', 5, 8),
    (N'Xã Liên Châu', 5, 8),
    (N'Xã Đại Tự', 5, 8),
    (N'Xã Hồng Châu', 5, 8),
    (N'Xã Trung Hà', 5, 8),
    (N'Thị trấn Vĩnh Tường', 6, 9),
    (N'Xã Kim Xá', 5, 9),
    (N'Xã Yên Bình', 5, 9),
    (N'Xã Chấn Hưng', 5, 9),
    (N'Xã Nghĩa Hưng', 5, 9),
    (N'Xã Yên Lập', 5, 9),
    (N'Xã Sao Đại Việt', 5, 9),
    (N'Xã Đại Đồng', 5, 9),
    (N'Xã Lũng Hoà', 5, 9),
    (N'Thị trấn Thổ Tang', 6, 9),
    (N'Xã Lương Điền', 5, 9),
    (N'Xã Tân Phú', 5, 9),
    (N'Xã Thượng Trưng', 5, 9),
    (N'Xã Vũ Di', 5, 9),
    (N'Xã Tuân Chính', 5, 9),
    (N'Thị trấn Tứ Trưng', 6, 9),
    (N'Xã Ngũ Kiên', 5, 9),
    (N'Xã An Nhân', 5, 9),
    (N'Xã Vĩnh Thịnh', 5, 9),
    (N'Xã Vĩnh Phú', 5, 9),
    (N'Xã Lãng Công', 5, 10),
    (N'Xã Quang Yên', 5, 10),
    (N'Xã Hải Lựu', 5, 10),
    (N'Xã Đồng Quế', 5, 10),
    (N'Xã Nhân Đạo', 5, 10),
    (N'Xã Đôn Nhân', 5, 10),
    (N'Xã Phương Khoan', 5, 10),
    (N'Xã Tân Lập', 5, 10),
    (N'Thị trấn Tam Sơn', 6, 10),
    (N'Xã Yên Thạch', 5, 10),
    (N'Xã Đồng Thịnh', 5, 10),
    (N'Xã Tứ Yên', 5, 10),
    (N'Xã Đức Bác', 5, 10),
    (N'Xã Cao Phong', 5, 10)
GO

-- Bảng VungTrongTrot
CREATE TABLE VungTrongTrot
(
    ID INT PRIMARY KEY IDENTITY,
    TenVungTrongTrot NVARCHAR(50),
    MoTa NVARCHAR(250),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID)
)
GO
INSERT INTO VungTrongTrot (TenVungTrongTrot, MoTa, DonViHanhChinhID) VALUES
    (N'Vùng trồng trọt Thanh Trù', N'Nuôi lợn tập trung', (SELECT ID FROM DonViHanhChinh WHERE TenDonVi = N'Xã Thanh Trù')),
    (N'Vùng trồng trọt Ngọc Thanh', N'Nuôi gà thả vườn', (SELECT ID FROM DonViHanhChinh WHERE TenDonVi = N'Xã Ngọc Thanh')),
    (N'Vùng trồng trọt Hợp Lý', N'Nuôi đa dạng các loại gia súc', (SELECT ID FROM DonViHanhChinh WHERE TenDonVi = N'Xã Hợp Lý')),
    (N'Vùng trồng trọt Minh Quang', N'Nuôi theo hướng hữu cơ', (SELECT ID FROM DonViHanhChinh WHERE TenDonVi = N'Xã Minh Quang')),
    (N'Vùng trồng trọt Sơn Lôi', N'Vùng an toàn dịch bệnh', (SELECT ID FROM DonViHanhChinh WHERE TenDonVi = N'Xã Sơn Lôi'))
GO


-- Bảng VaiTro
CREATE TABLE VaiTro
(
    ID INT PRIMARY KEY IDENTITY,
    TenVaiTro NVARCHAR(50)
)
GO
INSERT INTO VaiTro (TenVaiTro) VALUES 
    (N'Admin'), 
    (N'User')
GO

-- Bảng NguoiDung
CREATE TABLE NguoiDung
(
    ID INT PRIMARY KEY IDENTITY,
    UserName NVARCHAR(50),
    Email_or_Phone NVARCHAR(50),
    Password NVARCHAR(50),
    TrangThai NVARCHAR(50),
    VaiTroID INT FOREIGN KEY REFERENCES VaiTro(ID),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID)
)
GO
INSERT INTO NguoiDung (UserName, Email_or_Phone, Password, VaiTroID, TrangThai, DonViHanhChinhID) VALUES  
    (N'Lê Chí Công', 'conglc2004@gmail.com', 'chicong', 1, N'Hoạt động', 1),
    (N'Vũ Thị Hải Anh', 'anhvth2004@gmail.com', 'haianh', 1, N'Hoạt động', 1),
    (N'Đào Nguyễn Minh', 'minhdn2004@gmail.com', 'daominh', 1, N'Hoạt động', 1),
    (N'Đỗ Chí Thanh', 'chithanh@gmail.com', 'chithanh', 2, N'Hoạt động', 1),
    (N'Phạm Quốc Bảo', 'phamquoce@gmail.com', 'phamquoc', 2, N'Hoạt động', 1),
    (N'Hoàng Minh Anh', 'hoangminhf@gmail.com', 'hoangminh', 2, N'Hoạt động', 1),
    (N'Lê Hoài Thương', 'lehoaig@gmail.com', 'lehoai', 2, N'Hoạt động', 1),
    (N'Trần Thị Hà', 'tranthih@gmail.com', 'tranthi', 2, N'Hoạt động', 1),
    (N'Nguyễn Hữu Trí', 'nguyenhuui@gmail.com', 'nguyenhuu', 2, N'Hoạt động', 1),
    (N'Lê Thùy Trang', 'lethuyj@gmail.com', 'lethuy', 2, N'Hoạt động', 1),
    (N'Nguyễn Văn Khang', 'nguyenvank@gmail.com', 'vank', 2, N'Hoạt động', 1),
    (N'Phạm Thị Lan', 'phamthil@gmail.com', 'thil', 2, N'Hoạt động', 1),
    (N'Lê Anh Mão', 'leanhm@gmail.com', 'anhm', 2, N'Hoạt động', 1),
    (N'Hoàng Thị Lan', 'hoangthin@gmail.com', 'hoangn', 2, N'Hoạt động', 1)
GO

-- Bảng LoaiCoSo
CREATE TABLE LoaiCoSo
(
    ID INT PRIMARY KEY IDENTITY,
    TenLoaiCoSo NVARCHAR(50)
)
GO
INSERT INTO LoaiCoSo (TenLoaiCoSo) VALUES
    (N'Trang trại trồng trọt'),
    (N'Cơ sở giết mổ'),
    (N'Nhà máy chế biến thức ăn trồng trọt'),
    (N'Cơ sở xử lý chất thải'),
    (N'Cơ sở buôn bán thuốc BVTV'),
    (N'Cơ sở VietGAP')
GO

-- Bảng ToChuc_or_CaNhan
CREATE TABLE ToChuc_or_CaNhan
(
    ID INT PRIMARY KEY IDENTITY,
    Ten NVARCHAR(50),
    DiaChi NVARCHAR(50),
    Email_or_Phone NVARCHAR(50)
)
GO
INSERT INTO ToChuc_or_CaNhan (Ten, DiaChi, Email_or_Phone) VALUES
    (N'Công ty TNHH Minh Quang', N'Minh Quang, Tam Đảo', 'minhquang@gmail.com'),
    (N'Hộ kinh doanh Thanh Trù', N'Thanh Trù, Vĩnh Yên', 'thanhtru@gmail.com'),
    (N'Công ty CP Sơn Lôi', N'Sơn Lôi, Bình Xuyên', 'sonloi@gmail.com'),
    (N'Hộ cá nhân Nguyễn Văn A', N'Hợp Lý, Lập Thạch', 'nguyenvana@gmail.com'),
    (N'Công ty TNHH Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', 'ngocthanh@gmail.com')
GO

-- Bảng CoSo
CREATE TABLE CoSo
(
    ID INT PRIMARY KEY IDENTITY,
    TenCoSo NVARCHAR(50),
    DiaChi NVARCHAR(50),
    NgayCapGiayPhep DATE,
    LoaiCoSoID INT FOREIGN KEY REFERENCES LoaiCoSo(ID),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID),
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID)
)
GO
INSERT INTO CoSo (TenCoSo, DiaChi, NgayCapGiayPhep, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID) VALUES
    (N'Trang trại Thanh Trù', N'Xã Thanh Trù, Vĩnh Yên', '2024-06-15', 1, 19, 2),
    (N'Cơ sở giết mổ Hợp Lý', N'Hợp Lý, Lập Thạch', '2024-07-01', 2, 32, 4),
    (N'Nhà máy Minh Quang', N'Minh Quang, Tam Đảo', '2024-08-10', 3, 68, 1),
    (N'Trang trại Sơn Lôi', N'Sơn Lôi, Bình Xuyên', '2024-09-05', 1, 77, 3),
    (N'Cơ sở xử lý chất thải Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', '2024-10-20', 4, 25, 5)
GO

-- Bảng CoSoBuonBan
CREATE TABLE CoSoBuonBan
(
    ID INT PRIMARY KEY IDENTITY,
    TenCoSo NVARCHAR(50),
    DiaChi NVARCHAR(50),
    SoGiayPhepKinhDoanh NVARCHAR(50),
    NgayCapGiayPhep DATE,
    LoaiCoSoID INT FOREIGN KEY REFERENCES LoaiCoSo(ID),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID),
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID)
)
GO
INSERT INTO CoSoBuonBan (TenCoSo, DiaChi, SoGiayPhepKinhDoanh, NgayCapGiayPhep, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID) VALUES
    (N'Cửa hàng thuốc BVTV Thanh Trù', N'Xã Thanh Trù, Vĩnh Yên', N'GDKD-001', '2024-11-01', 5, 19, 2),
    (N'Đại lý thuốc BVTV Sơn Lôi', N'Sơn Lôi, Bình Xuyên', N'GDKD-002', '2024-12-01', 5, 77, 3),
    (N'Cửa hàng Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', N'GDKD-003', '2025-01-15', 5, 25, 5)
GO

-- Bảng CoSoBuonBanPhanBon
CREATE TABLE CoSoBuonBanPhanBon
(
    ID INT PRIMARY KEY IDENTITY,
    TenCoSo NVARCHAR(50),
    DiaChi NVARCHAR(50),
    SoGiayPhepKinhDoanh NVARCHAR(50),
    NgayCapGiayPhep DATE,
    LoaiCoSoID INT FOREIGN KEY REFERENCES LoaiCoSo(ID),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID),
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID)
)
GO
INSERT INTO CoSoBuonBanPhanBon (TenCoSo, DiaChi, SoGiayPhepKinhDoanh, NgayCapGiayPhep, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID) VALUES
    (N'Cửa hàng phân bón Minh Quang', N'Minh Quang, Tam Đảo', N'GDKD-PB-001', '2024-11-10', 5, 68, 1),
    (N'Đại lý phân bón Thanh Trù', N'Xã Thanh Trù, Vĩnh Yên', N'GDKD-PB-002', '2024-12-15', 5, 19, 2),
    (N'Cửa hàng phân bón Sơn Lôi', N'Sơn Lôi, Bình Xuyên', N'GDKD-PB-003', '2025-01-20', 5, 77, 3),
    (N'Đại lý phân bón Hợp Lý', N'Hợp Lý, Lập Thạch', N'GDKD-PB-004', '2025-02-01', 5, 32, 4),
    (N'Cửa hàng phân bón Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', N'GDKD-PB-005', '2025-03-01', 5, 25, 5)
GO

-- Bảng CoSoVietGap
CREATE TABLE CoSoVietGap
(
    ID INT PRIMARY KEY IDENTITY,
    TenCoSo NVARCHAR(50),
    DiaChi NVARCHAR(50),
    SoGiayPhepVietGap NVARCHAR(50),
    NgayCapGiayPhep DATE,
    NgayHetHan DATE,
    LoaiCoSoID INT FOREIGN KEY REFERENCES LoaiCoSo(ID),
    DonViHanhChinhID INT FOREIGN KEY REFERENCES DonViHanhChinh(ID),
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID)
)
GO
INSERT INTO CoSoVietGap (TenCoSo, DiaChi, SoGiayPhepVietGap, NgayCapGiayPhep, NgayHetHan, LoaiCoSoID, DonViHanhChinhID, ToChuc_or_CaNhanID) VALUES
    (N'Trang trại VietGAP Minh Quang', N'Minh Quang, Tam Đảo', N'VG-001', '2024-11-15', '2026-11-15', 6, 68, 1),
    (N'Trang trại VietGAP Thanh Trù', N'Xã Thanh Trù, Vĩnh Yên', N'VG-002', '2024-12-20', '2026-12-20', 6, 19, 2),
    (N'Trang trại VietGAP Sơn Lôi', N'Sơn Lôi, Bình Xuyên', N'VG-003', '2025-01-25', '2027-01-25', 6, 77, 3),
    (N'Trang trại VietGAP Hợp Lý', N'Hợp Lý, Lập Thạch', N'VG-004', '2025-02-10', '2027-02-10', 6, 32, 4),
    (N'Trang trại VietGAP Ngọc Thanh', N'Ngọc Thanh, Phúc Yên', N'VG-005', '2025-03-05', '2027-03-05', 6, 25, 5)
GO

-- Bảng ToChucChungNhan
CREATE TABLE ToChucChungNhan
(
    ID INT PRIMARY KEY IDENTITY,
    Ten NVARCHAR(50),
    DiaChi NVARCHAR(50),
    Email_or_Phone NVARCHAR(50)
)
GO
INSERT INTO ToChucChungNhan (Ten, DiaChi, Email_or_Phone) VALUES
    (N'Tổ chức chứng nhận VietCert', N'Hà Nội', 'vietcert@gmail.com'),
    (N'Tổ chức chứng nhận AgriCert', N'Hồ Chí Minh', 'agricert@gmail.com'),
    (N'Tổ chức chứng nhận BioCert', N'Đà Nẵng', 'biocert@gmail.com')
GO

-- Bảng ToChucCaNhanSanXuat
CREATE TABLE ToChucCaNhanSanXuat
(
    ID INT PRIMARY KEY IDENTITY,
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID),
    CoSoID INT FOREIGN KEY REFERENCES CoSo(ID),
    TenCoSo NVARCHAR(50),
    GiayPhepSanXuat NVARCHAR(50),
    NgayCapGiayPhep DATE,
    NgayHetHan DATE,
    MoTa NVARCHAR(250),
    TrangThai NVARCHAR(50)
)
GO
INSERT INTO ToChucCaNhanSanXuat (ToChuc_or_CaNhanID, CoSoID, TenCoSo, GiayPhepSanXuat, NgayCapGiayPhep, NgayHetHan, MoTa, TrangThai) VALUES
    (1, 3, N'Nhà máy Minh Quang', N'GP-SX-001', '2024-01-10', '2026-01-10', N'Cơ sở sản xuất đạt chuẩn GMP', N'Đủ điều kiện'),
    (2, NULL, N'Hộ kinh doanh Thanh Trù', N'GP-SX-002', '2024-02-15', '2026-02-15', N'Hộ cá nhân sản xuất thuốc trừ sâu sinh học', N'Đủ điều kiện'),
    (3, 4, N'Trang trại Sơn Lôi', N'GP-SX-003', '2024-03-01', '2026-03-01', N'Nhà máy sản xuất quy mô lớn', N'Đủ điều kiện'),
    (4, 2, N'Cơ sở giết mổ Hợp Lý', N'GP-SX-004', '2024-04-20', '2025-04-20', N'Cơ sở sản xuất thuốc diệt cỏ', N'Không đủ điều kiện'),
    (5, 5, N'Cơ sở xử lý chất thải Ngọc Thanh', N'GP-SX-005', '2024-05-10', '2026-05-10', N'Sản xuất thuốc trừ nấm đạt tiêu chuẩn', N'Đủ điều kiện')
GO

-- Bảng ToChucCaNhanSanXuatPhanBon
CREATE TABLE ToChucCaNhanSanXuatPhanBon
(
    ID INT PRIMARY KEY IDENTITY,
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID),
    CoSoID INT FOREIGN KEY REFERENCES CoSo(ID),
    TenCoSo NVARCHAR(50),
    GiayPhepSanXuat NVARCHAR(50),
    NgayCapGiayPhep DATE,
    NgayHetHan DATE,
    MoTa NVARCHAR(250),
    TrangThai NVARCHAR(50) CHECK (TrangThai IN (N'Đủ điều kiện', N'Không đủ điều kiện'))
)
GO
INSERT INTO ToChucCaNhanSanXuatPhanBon (ToChuc_or_CaNhanID, CoSoID, TenCoSo, GiayPhepSanXuat, NgayCapGiayPhep, NgayHetHan, MoTa, TrangThai) VALUES
    (1, 3, N'Nhà máy Minh Quang', N'GP-PB-001', '2024-01-15', '2026-01-15', N'Cơ sở sản xuất phân bón hữu cơ đạt chuẩn', N'Đủ điều kiện'),
    (2, 1, N'Trang trại Thanh Trù', N'GP-PB-002', '2024-02-20', '2026-02-20', N'Hộ cá nhân sản xuất phân bón vi sinh', N'Đủ điều kiện'),
    (3, 4, N'Trang trại Sơn Lôi', N'GP-PB-003', '2024-03-10', '2026-03-10', N'Nhà máy sản xuất phân bón NPK quy mô lớn', N'Đủ điều kiện'),
    (4, NULL, N'Hộ cá nhân Nguyễn Văn A', N'GP-PB-004', '2024-04-25', '2025-04-25', N'Cơ sở sản xuất phân bón lá', N'Không đủ điều kiện'),
    (5, 5, N'Cơ sở xử lý chất thải Ngọc Thanh', N'GP-PB-005', '2024-05-15', '2026-05-15', N'Sản xuất phân bón hữu cơ chất lượng cao', N'Đủ điều kiện')
GO


-- Bảng LichSuTruyCap
CREATE TABLE LichSuTruyCap 
(
    ID INT PRIMARY KEY IDENTITY,
    ThoiGianTruyCap DATETIME2,
    MoTaHanhDong NVARCHAR(50),
    NguoiDungID INT FOREIGN KEY REFERENCES NguoiDung(ID)
)
GO
INSERT INTO LichSuTruyCap (ThoiGianTruyCap, MoTaHanhDong, NguoiDungID) VALUES
    ('2025-04-20 08:30', N'Đăng nhập hệ thống', 1),
    ('2025-04-20 09:00', N'Cập nhật dữ liệu cơ sở', 2),
    ('2025-04-21 10:15', N'Xem báo cáo vùng trồng trọt', 3),
    ('2025-04-22 14:20', N'Thêm thông tin hộ trồng trọt', 4),
    ('2025-04-23 07:45', N'Đăng xuất hệ thống', 1)
GO

-- Bảng SanPhamXuLyChatThai
CREATE TABLE SanPhamXuLyChatThai
(
    ID INT PRIMARY KEY IDENTITY,
    TenSanPham NVARCHAR(50),
    LoaiSanPham NVARCHAR(50),
    NgaySanXuat DATE,
    NgayHetHan DATE,
    CoSoID INT FOREIGN KEY REFERENCES CoSo(ID)
)
GO
INSERT INTO SanPhamXuLyChatThai (TenSanPham, LoaiSanPham, NgaySanXuat, NgayHetHan, CoSoID) VALUES
    (N'Phân bón hữu cơ Thanh Trù', N'Phân bón', '2025-01-10', '2026-01-10', 1),
    (N'Chất xử lý nước Hợp Lý', N'Hóa chất xử lý', '2025-02-15', '2026-02-15', 2),
    (N'Phân vi sinh Minh Quang', N'Phân bón', '2025-03-01', '2026-03-01', 3),
    (N'Chất khử mùi Sơn Lôi', N'Hóa chất xử lý', '2025-03-20', '2026-03-20', 4),
    (N'Phân bón Ngọc Thanh', N'Phân bón', '2025-04-01', '2026-04-01', 5)
GO

-- Bảng GiayChungNhan
CREATE TABLE GiayChungNhan 
(
    ID INT PRIMARY KEY,
    ToChucChungNhanID INT FOREIGN KEY REFERENCES ToChucChungNhan(ID),
    Ten NVARCHAR(50),
    ToChuc_or_CaNhanID INT FOREIGN KEY REFERENCES ToChuc_or_CaNhan(ID),
    NgayCap DATE,
    NgayHetHan DATE
)
GO
INSERT INTO GiayChungNhan (ID, ToChucChungNhanID, Ten, ToChuc_or_CaNhanID, NgayCap, NgayHetHan) VALUES
    (1, 1, N'Chứng nhận an toàn trồng trọt', 2, '2024-06-20', '2025-06-20'),
    (2, 2, N'Chứng nhận cơ sở giết mổ', 4, '2024-07-10', '2025-07-10'),
    (3, 3, N'Chứng nhận sản xuất thức ăn', 1, '2024-08-15', '2025-08-15'),
    (4, 2, N'Chứng nhận trồng trọt sạch', 3, '2024-09-10', '2025-09-10'),
    (5, 1, N'Chứng nhận xử lý chất thải', 5, '2024-10-25', '2025-10-25')
GO

-- Bảng GiongCayLuuHanh
CREATE TABLE GiongCayLuuHanh
(
    ID INT PRIMARY KEY IDENTITY,
    TenGiongCay NVARCHAR(100),
    LoaiCay NVARCHAR(50),
    MoTa NVARCHAR(255)
)
GO
INSERT INTO GiongCayLuuHanh (TenGiongCay, LoaiCay, MoTa) VALUES
    (N'Xoài Cát Hòa Lộc', N'Cây ăn quả', N'Giống xoài chất lượng cao, ngọt, thơm'),
    (N'Cam Sành', N'Cây ăn quả', N'Giống cam phổ biến, mọng nước'),
    (N'Cà phê Catimor', N'Cây công nghiệp', N'Giống cà phê năng suất cao'),
    (N'Nhãn Xuồng Cơm Vàng', N'Cây ăn quả', N'Giống nhãn ngọt, cơm dày, năng suất cao')
GO

-- Bảng CayDauDong
CREATE TABLE CayDauDong
(
    ID INT PRIMARY KEY IDENTITY,
    TenGiongCay NVARCHAR(100),
    LoaiCay NVARCHAR(50),
    MoTa NVARCHAR(255)
)
GO
INSERT INTO CayDauDong (TenGiongCay, LoaiCay, MoTa) VALUES
    (N'Keo Lai', N'Cây lâm nghiệp', N'Giống cây gỗ nhanh lớn'),
    (N'Sầu riêng Ri6', N'Cây ăn quả', N'Giống sầu riêng thơm ngon, cơm dày'),
    (N'Bưởi Diễn', N'Cây ăn quả', N'Giống bưởi ngọt, múi mọng'),
    (N'Mít Thái Siêu Sớm', N'Cây ăn quả', N'Giống mít cho trái sớm, múi dày và ngọt'),
    (N'Cao su RRIV 4', N'Cây công nghiệp', N'Giống cao su năng suất cao')
GO

-- Bảng ThuocBaoVeThucVat
CREATE TABLE ThuocBaoVeThucVat
(
    ID INT NOT NULL PRIMARY KEY IDENTITY,
    TenThuoc NVARCHAR(255) NOT NULL,
    LoaiThuoc NVARCHAR(255) NOT NULL,
    NgaySanXuat DATE NOT NULL,
    NgayHetHan DATE NOT NULL
)
GO
INSERT INTO ThuocBaoVeThucVat (TenThuoc, LoaiThuoc, NgaySanXuat, NgayHetHan) VALUES
    (N'Actara 25WG', N'Thuốc trừ sâu', '2025-01-10', '2027-01-10'),
    (N'Ridomil Gold', N'Thuốc trừ nấm', '2025-02-15', '2027-02-15'),
    (N'Roundup', N'Thuốc diệt cỏ', '2025-03-01', '2027-03-01'),
    (N'Antracol 70WP', N'Thuốc trừ nấm', '2025-03-20', '2027-03-20'),
    (N'Confidor 100SL', N'Thuốc trừ sâu', '2025-04-01', '2027-04-01')
GO

-- Bảng PhanBon
CREATE TABLE PhanBon
(
    ID INT PRIMARY KEY IDENTITY,
    TenPhanBon NVARCHAR(255) NOT NULL,
    LoaiPhanBon NVARCHAR(50) NOT NULL,
    NgaySanXuat DATE NOT NULL,
    NgayHetHan DATE NOT NULL,
    CoSoID INT FOREIGN KEY REFERENCES CoSo(ID),
    MoTa NVARCHAR(255)
)
GO
INSERT INTO PhanBon (TenPhanBon, LoaiPhanBon, NgaySanXuat, NgayHetHan, CoSoID, MoTa) VALUES
    (N'Phân hữu cơ vi sinh', N'Phân hữu cơ', '2025-01-01', '2027-01-01', 1, N'Phân bón hữu cơ vi sinh chất lượng cao'),
    (N'Phân NPK 20-20-15', N'Phân vô cơ', '2025-02-01', '2027-02-01', 3, N'Phân NPK cân đối cho cây trồng'),
    (N'Phân bón lá GrowMax', N'Phân bón lá', '2025-03-01', '2027-03-01', 5, N'Phân bón lá kích thích tăng trưởng'),
    (N'Phân vi sinh Azoto', N'Phân vi sinh', '2025-04-01', '2027-04-01', 4, N'Phân vi sinh cải tạo đất'),
    (N'Phân hữu cơ compost', N'Phân hữu cơ', '2025-05-01', '2027-05-01', 1, N'Phân hữu cơ từ nguyên liệu tự nhiên')
GO
-- Bảng TuoiSau_CapDoPhoBien
CREATE TABLE TuoiSau_CapDoPhoBien
(
    ID INT PRIMARY KEY IDENTITY,
    TenSinhVat NVARCHAR(100),
    TenTuoiSau NVARCHAR(50),
    TenCapDoPhoBien NVARCHAR(50)
)
GO
INSERT INTO TuoiSau_CapDoPhoBien (TenSinhVat, TenTuoiSau, TenCapDoPhoBien) VALUES
    (N'Sâu đục thân', N'Sâu non', N'Phổ biến'),
    (N'Rầy nâu', N'Trưởng thành', N'Rất phổ biến'),
    (N'Sâu keo mùa thu', N'Sâu non', N'Phổ biến')
GO
-- Bảng SinhVatGayHai
CREATE TABLE SinhVatGayHai
(
    ID INT PRIMARY KEY IDENTITY,
    TenSinhVat NVARCHAR(100),
    LoaiSinhVat NVARCHAR(50),
    NgayPhatHien DATE,
    MoTa NVARCHAR(255),
    VungTrongTrotID INT FOREIGN KEY REFERENCES VungTrongTrot(ID),
    TuoiSau_CapDoPhoBienID INT FOREIGN KEY REFERENCES TuoiSau_CapDoPhoBien(ID)
)
GO
INSERT INTO SinhVatGayHai (TenSinhVat, LoaiSinhVat, NgayPhatHien, MoTa, VungTrongTrotID, TuoiSau_CapDoPhoBienID) VALUES
    (N'Sâu đục thân', N'Sâu hại', '2025-01-15', N'Gây hại cây lúa', 1, 1),
    (N'Rầy nâu', N'Côn trùng', '2025-02-10', N'Hút nhựa cây lúa', 2, 2),
    (N'Bệnh đạo ôn', N'Nấm bệnh', '2025-03-05', N'Gây hại lá lúa', 3, NULL),
    (N'Chuột đồng', N'Động vật có hại', '2025-04-01', N'Phá hoại mùa màng', 4, NULL),
    (N'Sâu keo mùa thu', N'Sâu hại', '2025-05-10', N'Gây hại ngô và rau màu', 5, 3)
GO

-- Tạo bảng BanDoPhanBo mới với cột TenCoSo
CREATE TABLE BanDoPhanBo
(
    ID INT PRIMARY KEY IDENTITY,
    KinhDo FLOAT,
    ViDo FLOAT,
    CoSoID INT FOREIGN KEY REFERENCES CoSo(ID),
    VungTrongTrotID INT FOREIGN KEY REFERENCES VungTrongTrot(ID),
    CoSoBuonBanID INT FOREIGN KEY REFERENCES CoSoBuonBan(ID),
    CoSoBuonBanPhanBonID INT FOREIGN KEY REFERENCES CoSoBuonBanPhanBon(ID),
    SinhVatGayHaiID INT FOREIGN KEY REFERENCES SinhVatGayHai(ID),
    TenCoSo NVARCHAR(50)
)
GO

-- Thêm dữ liệu vào bảng BanDoPhanBo
INSERT INTO BanDoPhanBo (KinhDo, ViDo, CoSoID, VungTrongTrotID, CoSoBuonBanID, CoSoBuonBanPhanBonID, SinhVatGayHaiID, TenCoSo)
VALUES
    -- Dữ liệu hiện có liên quan đến vùng trồng trọt
    (105.592, 21.308, 1, 1, NULL, NULL, NULL, N'Trang trại Thanh Trù'),
    (105.620, 21.295, NULL, 2, NULL, NULL, NULL, N'Vùng trồng trọt Ngọc Thanh'),
    (105.580, 21.350, 2, 3, NULL, NULL, NULL, N'Cơ sở giết mổ Hợp Lý'),
    (105.630, 21.280, 3, 4, NULL, NULL, NULL, N'Nhà máy Minh Quang'),
    (105.600, 21.320, 4, 5, NULL, NULL, NULL, N'Trang trại Sơn Lôi'),
    -- Cơ sở buôn bán thuốc BVTV từ CoSoBuonBan
    (105.590, 21.310, NULL, NULL, 1, NULL, NULL, N'Cửa hàng thuốc BVTV Thanh Trù'),
    (105.610, 21.325, NULL, NULL, 2, NULL, NULL, N'Đại lý thuốc BVTV Sơn Lôi'),
    (105.605, 21.315, NULL, NULL, 3, NULL, NULL, N'Cửa hàng Ngọc Thanh'),
    -- Cơ sở sản xuất thuốc BVTV từ ToChucCaNhanSanXuat
    (105.585, 21.345, 2, NULL, NULL, NULL, NULL, N'Cơ sở giết mổ Hợp Lý'),
    (105.625, 21.285, 5, NULL, NULL, NULL, NULL, N'Cơ sở xử lý chất thải Ngọc Thanh'),
    (105.595, 21.305, NULL, NULL, NULL, NULL, NULL, N'Hộ kinh doanh Thanh Trù'),
    -- Cơ sở buôn bán phân bón từ CoSoBuonBanPhanBon
    (105.635, 21.275, NULL, NULL, NULL, 1, NULL, N'Cửa hàng phân bón Minh Quang'),
    (105.595, 21.315, NULL, NULL, NULL, 2, NULL, N'Đại lý phân bón Thanh Trù'),
    (105.615, 21.320, NULL, NULL, NULL, 3, NULL, N'Cửa hàng phân bón Sơn Lôi'),
    (105.575, 21.355, NULL, NULL, NULL, 4, NULL, N'Đại lý phân bón Hợp Lý'),
    (105.610, 21.310, NULL, NULL, NULL, 5, NULL, N'Cửa hàng phân bón Ngọc Thanh'),
    -- Cơ sở sản xuất phân bón từ ToChucCaNhanSanXuatPhanBon
    (105.625, 21.280, 3, NULL, NULL, NULL, NULL, N'Nhà máy Minh Quang'),
    (105.590, 21.305, 1, NULL, NULL, NULL, NULL, N'Trang trại Thanh Trù'),
    (105.605, 21.325, 4, NULL, NULL, NULL, NULL, N'Trang trại Sơn Lôi'),
    (105.580, 21.340, NULL, NULL, NULL, NULL, NULL, N'Hộ cá nhân Nguyễn Văn A'),
    (105.620, 21.290, 5, NULL, NULL, NULL, NULL, N'Cơ sở xử lý chất thải Ngọc Thanh'),
    -- Khu vực có sinh vật gây hại từ SinhVatGayHai
    (105.592, 21.308, NULL, 1, NULL, NULL, 1, N'Vùng trồng trọt Thanh Trù - Sâu đục thân'),
    (105.620, 21.295, NULL, 2, NULL, NULL, 2, N'Vùng trồng trọt Ngọc Thanh - Rầy nâu'),
    (105.580, 21.350, NULL, 3, NULL, NULL, 3, N'Vùng trồng trọt Hợp Lý - Bệnh đạo ôn'),
    (105.630, 21.280, NULL, 4, NULL, NULL, 4, N'Vùng trồng trọt Minh Quang - Chuột đồng'),
    (105.600, 21.320, NULL, 5, NULL, NULL, 5, N'Vùng trồng trọt Sơn Lôi - Sâu keo mùa thu')
GO

-- View DonVi_Huyen
CREATE VIEW DonVi_Huyen AS
SELECT *
FROM DonViHanhChinh
WHERE CapDoHanhChinhID = (SELECT ID FROM CapDoHanhChinh WHERE TenCapDo = N'Huyện')
GO

-- View DonVi_Phuong
CREATE VIEW DonVi_Phuong AS
SELECT *
FROM DonViHanhChinh
WHERE CapDoHanhChinhID = (SELECT ID FROM CapDoHanhChinh WHERE TenCapDo = N'Phường')
GO

-- View DonVi_Xa
CREATE VIEW DonVi_Xa AS
SELECT *
FROM DonViHanhChinh
WHERE CapDoHanhChinhID = (SELECT ID FROM CapDoHanhChinh WHERE TenCapDo = N'Xã')
GO


-- View GiongCay
CREATE VIEW GiongCay AS
SELECT TenGiongCay, LoaiCay, MoTa FROM GiongCayLuuHanh
UNION
SELECT TenGiongCay, LoaiCay, MoTa FROM CayDauDong
GO

-- View View_GiongCayLuuHanh
CREATE VIEW View_GiongCayLuuHanh AS
SELECT ID, TenGiongCay, LoaiCay, MoTa
FROM GiongCayLuuHanh
GO

-- View View_CayDauDong
CREATE VIEW View_CayDauDong AS
SELECT ID, TenGiongCay, LoaiCay, MoTa
FROM CayDauDong
GO

-- Truy vấn danh sách sinh vật gây hại
SELECT 
    s.ID,
    s.TenSinhVat,
    s.LoaiSinhVat,
    s.NgayPhatHien,
    s.MoTa,
    v.TenVungTrongTrot AS VungTrongTrot
FROM SinhVatGayHai s
JOIN VungTrongTrot v ON s.VungTrongTrotID = v.ID
WHERE s.NgayPhatHien <= GETDATE()
ORDER BY s.NgayPhatHien DESC
GO

-- View ChiTietCoSoBuonBan

CREATE VIEW ChiTietCoSoBuonBan AS
SELECT 
    c.ID, 
    c.TenCoSo, 
    c.DiaChi, 
    c.SoGiayPhepKinhDoanh, 
    c.NgayCapGiayPhep,
    l.TenLoaiCoSo, 
    d.TenDonVi AS 'Địa bàn',
    t.Ten AS 'Chủ sở hữu', 
    t.Email_or_Phone AS 'Liên hệ',
    DATEDIFF(DAY, c.NgayCapGiayPhep, GETDATE()) AS 'Số ngày cấp'
FROM CoSoBuonBan c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
GO

-- View ChiTietCoSoBuonBanPhanBon
CREATE VIEW ChiTietCoSoBuonBanPhanBon AS
SELECT 
    c.ID, 
    c.TenCoSo, 
    c.DiaChi, 
    c.SoGiayPhepKinhDoanh, 
    c.NgayCapGiayPhep,
    l.TenLoaiCoSo, 
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu, 
    t.Email_or_Phone AS LienHe,
    DATEDIFF(DAY, c.NgayCapGiayPhep, GETDATE()) AS SoNgayCap
FROM CoSoBuonBanPhanBon c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
GO

-- View ChiTietCoSoVietGap
CREATE VIEW ChiTietCoSoVietGap AS
SELECT 
    c.ID, 
    c.TenCoSo, 
    c.DiaChi, 
    c.SoGiayPhepVietGap, 
    c.NgayCapGiayPhep,
    c.NgayHetHan,
    l.TenLoaiCoSo, 
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu, 
    t.Email_or_Phone AS LienHe,
    DATEDIFF(DAY, c.NgayCapGiayPhep, GETDATE()) AS SoNgayCap
FROM CoSoVietGap c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
WHERE c.NgayHetHan > GETDATE() OR c.NgayHetHan IS NULL
GO

-- View ChiTietPhanBon
CREATE VIEW ChiTietPhanBon AS
SELECT 
    p.ID,
    p.TenPhanBon,
    p.LoaiPhanBon,
    p.NgaySanXuat,
    p.NgayHetHan,
    c.TenCoSo AS TenCoSo,
    c.DiaChi AS DiaChiCoSo,
    l.TenLoaiCoSo AS LoaiCoSo,
    DATEDIFF(DAY, p.NgaySanXuat, GETDATE()) AS SoNgaySanXuat
FROM PhanBon p
LEFT JOIN CoSo c ON p.CoSoID = c.ID
LEFT JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
WHERE p.NgayHetHan > GETDATE()
GO

-- View ChiTietToChucCaNhanSanXuat
CREATE VIEW ChiTietToChucCaNhanSanXuat AS
SELECT 
    t.ID,
    tc.Ten AS TenToChucCaNhan,
    t.TenCoSo,
    t.GiayPhepSanXuat,
    t.NgayCapGiayPhep,
    t.NgayHetHan,
    t.MoTa,
    t.TrangThai,
    DATEDIFF(DAY, t.NgayCapGiayPhep, GETDATE()) AS SoNgayCap
FROM ToChucCaNhanSanXuat t
LEFT JOIN ToChuc_or_CaNhan tc ON t.ToChuc_or_CaNhanID = tc.ID
GO

-- View ChiTietToChucCaNhanSanXuatPhanBon
CREATE VIEW ChiTietToChucCaNhanSanXuatPhanBon AS
SELECT 
    t.ID,
    tc.Ten AS TenToChucCaNhan,
    t.TenCoSo,
    t.GiayPhepSanXuat,
    t.NgayCapGiayPhep,
    t.NgayHetHan,
    t.MoTa,
    t.TrangThai,
    DATEDIFF(DAY, t.NgayCapGiayPhep, GETDATE()) AS SoNgayCap
FROM ToChucCaNhanSanXuatPhanBon t
LEFT JOIN ToChuc_or_CaNhan tc ON t.ToChuc_or_CaNhanID = tc.ID
GO

-- Truy vấn danh sách tổ chức/cá nhân đủ điều kiện sản xuất thuốc BVTV
SELECT 
    t.ID,
    tc.Ten AS TenToChucCaNhan,
    t.TenCoSo,
    t.GiayPhepSanXuat,
    t.NgayCapGiayPhep,
    t.NgayHetHan,
    t.MoTa,
    t.TrangThai
FROM ToChucCaNhanSanXuat t
LEFT JOIN ToChuc_or_CaNhan tc ON t.ToChuc_or_CaNhanID = tc.ID
WHERE t.NgayHetHan > GETDATE() OR t.NgayHetHan IS NULL
ORDER BY t.NgayCapGiayPhep DESC
GO

-- Truy vấn danh sách tổ chức/cá nhân sản xuất phân bón còn hiệu lực
SELECT 
    t.ID,
    tc.Ten AS TenToChucCaNhan,
    t.TenCoSo,
    t.GiayPhepSanXuat,
    t.NgayCapGiayPhep,
    t.NgayHetHan,
    t.MoTa,
    t.TrangThai
FROM ToChucCaNhanSanXuatPhanBon t
LEFT JOIN ToChuc_or_CaNhan tc ON t.ToChuc_or_CaNhanID = tc.ID
WHERE t.NgayHetHan > GETDATE() OR t.NgayHetHan IS NULL
ORDER BY t.NgayCapGiayPhep DESC
GO

-- Truy vấn danh sách cơ sở VietGAP còn hiệu lực
SELECT 
    c.ID, 
    c.TenCoSo, 
    c.DiaChi, 
    c.SoGiayPhepVietGap, 
    c.NgayCapGiayPhep,
    c.NgayHetHan,
    l.TenLoaiCoSo, 
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu, 
    t.Email_or_Phone AS LienHe
FROM CoSoVietGap c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
WHERE c.NgayHetHan > GETDATE() OR c.NgayHetHan IS NULL
ORDER BY c.NgayCapGiayPhep DESC
GO

-- Truy vấn danh sách thuốc bảo vệ thực vật
SELECT ID, TenThuoc, LoaiThuoc, NgaySanXuat, NgayHetHan
FROM ThuocBaoVeThucVat
WHERE NgayHetHan > GETDATE()
ORDER BY NgaySanXuat DESC
GO

-- Truy vấn danh sách phân bón
SELECT 
    ID,
    TenPhanBon,
    LoaiPhanBon,
    NgaySanXuat,
    NgayHetHan,
    CoSoID,
    MoTa
FROM PhanBon
WHERE NgayHetHan > GETDATE()
ORDER BY NgaySanXuat DESC
GO

-- Truy vấn danh sách cơ sở buôn bán phân bón còn hiệu lực
SELECT 
    c.ID, 
    c.TenCoSo, 
    c.DiaChi, 
    c.SoGiayPhepKinhDoanh, 
    c.NgayCapGiayPhep,
    l.TenLoaiCoSo, 
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu, 
    t.Email_or_Phone AS LienHe
FROM CoSoBuonBanPhanBon c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
WHERE c.NgayCapGiayPhep <= GETDATE()
ORDER BY c.NgayCapGiayPhep DESC
GO

-- Thống kê phân bón theo loại
SELECT 
    LoaiPhanBon,
    COUNT(*) AS SoLuong,
    MIN(NgaySanXuat) AS NgaySanXuatSomNhat,
    MAX(NgayHetHan) AS NgayHetHanMoiNhat
FROM PhanBon
WHERE NgayHetHan > GETDATE()
GROUP BY LoaiPhanBon
ORDER BY SoLuong DESC
GO

-- Truy vấn dữ liệu tổng hợp giống cây
SELECT * FROM GiongCay ORDER BY LoaiCay, TenGiongCay
GO

-- Truy vấn dữ liệu từng bảng con
SELECT * FROM View_GiongCayLuuHanh ORDER BY LoaiCay, TenGiongCay
GO
SELECT * FROM View_CayDauDong ORDER BY LoaiCay, TenGiongCay
GO

-- Chi tiết cơ sở sản xuất
SELECT c.ID, c.TenCoSo, c.DiaChi, c.NgayCapGiayPhep,
       l.TenLoaiCoSo, d.TenDonVi AS 'Địa bàn',
       t.Ten AS 'Chủ sở hữu', t.Email_or_Phone AS 'Liên hệ',
       DATEDIFF(DAY, c.NgayCapGiayPhep, GETDATE()) AS 'Số ngày cấp'
FROM CoSo c
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
JOIN DonViHanhChinh d ON c.DonViHanhChinhID = d.ID
JOIN ToChuc_or_CaNhan t ON c.ToChuc_or_CaNhanID = t.ID
GO

-- Danh sách tổ chức/cá nhân
SELECT ID, Ten, DiaChi, Email_or_Phone,
       CASE 
           WHEN ID IN (SELECT ToChuc_or_CaNhanID FROM CoSo) 
                OR ID IN (SELECT ToChuc_or_CaNhanID FROM CoSoBuonBan) 
           THEN N'Có cơ sở'
           ELSE N'Chưa có cơ sở'
       END AS TinhTrang
FROM ToChuc_or_CaNhan
GO

-- Các sản phẩm xử lý chất thải
SELECT s.ID, s.TenSanPham, s.LoaiSanPham, 
       s.NgaySanXuat, s.NgayHetHan,
       c.TenCoSo, l.TenLoaiCoSo
FROM SanPhamXuLyChatThai s
JOIN CoSo c ON s.CoSoID = c.ID
JOIN LoaiCoSo l ON c.LoaiCoSoID = l.ID
WHERE s.NgayHetHan > GETDATE()
GO

-- Danh sách tổ chức chứng nhận
SELECT t.ID, t.Ten, t.DiaChi, t.Email_or_Phone,
       COUNT(g.ID) AS 'Số chứng nhận đã cấp'
FROM ToChucChungNhan t
LEFT JOIN GiayChungNhan g ON t.ID = g.ToChucChungNhanID
GROUP BY t.ID, t.Ten, t.DiaChi, t.Email_or_Phone
GO

-- Lịch sử hoạt động của người dùng
SELECT l.ID, n.UserName, FORMAT(ThoiGianTruyCap, 'yyyy-MM-dd HH:mm:ss') AS ThoiGianTruyCap, l.MoTaHanhDong
FROM LichSuTruyCap l
JOIN NguoiDung n ON l.NguoiDungID = n.ID
ORDER BY l.ID DESC
GO

-- View TuoiSau_CapDoPhoBien
CREATE VIEW View_TuoiSau_CapDoPhoBien AS
SELECT 
    s.ID,
    s.TenSinhVat,
    s.LoaiSinhVat,
    s.NgayPhatHien,
    s.MoTa,
    v.TenVungTrongTrot AS VungTrongTrot,
    t.TenTuoiSau,
    t.TenCapDoPhoBien
FROM SinhVatGayHai s
JOIN VungTrongTrot v ON s.VungTrongTrotID = v.ID
JOIN TuoiSau_CapDoPhoBien t ON s.TuoiSau_CapDoPhoBienID = t.ID
WHERE s.LoaiSinhVat IN (N'Sâu hại', N'Côn trùng')
GO

-- Truy vấn kiểm tra view
SELECT * FROM View_TuoiSau_CapDoPhoBien
ORDER BY NgayPhatHien DESC
GO

-- View BanDoPhanBo_ThuocBVTV: Bản đồ phân bổ cơ sở sản xuất và buôn bán thuốc BVTV
CREATE VIEW BanDoPhanBo_ThuocBVTV AS
SELECT 
    b.ID,
    b.KinhDo,
    b.ViDo,
    b.TenCoSo,
    COALESCE(c.DiaChi, cb.DiaChi) AS DiaChi,
    COALESCE(lc.TenLoaiCoSo, lcb.TenLoaiCoSo) AS LoaiCoSo,
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu,
    t.Email_or_Phone AS LienHe
FROM BanDoPhanBo b
LEFT JOIN CoSo c ON b.CoSoID = c.ID
LEFT JOIN CoSoBuonBan cb ON b.CoSoBuonBanID = cb.ID
LEFT JOIN LoaiCoSo lc ON c.LoaiCoSoID = lc.ID
LEFT JOIN LoaiCoSo lcb ON cb.LoaiCoSoID = lcb.ID
LEFT JOIN DonViHanhChinh d ON (c.DonViHanhChinhID = d.ID OR cb.DonViHanhChinhID = d.ID)
LEFT JOIN ToChuc_or_CaNhan t ON (c.ToChuc_or_CaNhanID = t.ID OR cb.ToChuc_or_CaNhanID = t.ID)
WHERE b.CoSoBuonBanID IS NOT NULL 
   OR b.CoSoID IN (SELECT CoSoID FROM ToChucCaNhanSanXuat WHERE MoTa LIKE N'%thuốc%')
   OR (b.CoSoID IS NULL AND b.TenCoSo = N'Hộ kinh doanh Thanh Trù') -- Cơ sở sản xuất thuốc BVTV không có CoSoID
GO

-- View BanDoPhanBo_PhanBon: Bản đồ phân bổ cơ sở sản xuất và buôn bán phân bón
CREATE VIEW BanDoPhanBo_PhanBon AS
SELECT 
    b.ID,
    b.KinhDo,
    b.ViDo,
    b.TenCoSo,
    COALESCE(c.DiaChi, cbp.DiaChi) AS DiaChi,
    COALESCE(lc.TenLoaiCoSo, lcbp.TenLoaiCoSo) AS LoaiCoSo,
    d.TenDonVi AS DiaBan,
    t.Ten AS ChuSoHuu,
    t.Email_or_Phone AS LienHe
FROM BanDoPhanBo b
LEFT JOIN CoSo c ON b.CoSoID = c.ID
LEFT JOIN CoSoBuonBanPhanBon cbp ON b.CoSoBuonBanPhanBonID = cbp.ID
LEFT JOIN LoaiCoSo lc ON c.LoaiCoSoID = lc.ID
LEFT JOIN LoaiCoSo lcbp ON cbp.LoaiCoSoID = lcbp.ID
LEFT JOIN DonViHanhChinh d ON (c.DonViHanhChinhID = d.ID OR cbp.DonViHanhChinhID = d.ID)
LEFT JOIN ToChuc_or_CaNhan t ON (c.ToChuc_or_CaNhanID = t.ID OR cbp.ToChuc_or_CaNhanID = t.ID)
WHERE b.CoSoBuonBanPhanBonID IS NOT NULL 
   OR b.CoSoID IN (SELECT CoSoID FROM ToChucCaNhanSanXuatPhanBon)
   OR (b.CoSoID IS NULL AND b.TenCoSo = N'Hộ cá nhân Nguyễn Văn A') -- Cơ sở sản xuất phân bón không có CoSoID
GO

-- View BanDoPhanBo_SinhVatGayHai: Bản đồ phân bổ khu vực có sinh vật gây hại
CREATE VIEW BanDoPhanBo_SinhVatGayHai AS
SELECT 
    b.ID,
    b.KinhDo,
    b.ViDo,
    b.TenCoSo,
    v.MoTa AS DiaChi,
    N'Khu vực sinh vật gây hại' AS LoaiCoSo,
    d.TenDonVi AS DiaBan,
    N'Không xác định' AS ChuSoHuu,
    N'Không xác định' AS LienHe,
    sv.TenSinhVat AS SinhVatGayHai,
    sv.LoaiSinhVat,
    sv.NgayPhatHien
FROM BanDoPhanBo b
JOIN SinhVatGayHai sv ON b.SinhVatGayHaiID = sv.ID
JOIN VungTrongTrot v ON sv.VungTrongTrotID = v.ID
JOIN DonViHanhChinh d ON v.DonViHanhChinhID = d.ID
WHERE b.SinhVatGayHaiID IS NOT NULL
GO

-- Truy vấn kiểm tra các view
SELECT * FROM BanDoPhanBo_ThuocBVTV ORDER BY TenCoSo
GO
SELECT * FROM BanDoPhanBo_PhanBon ORDER BY TenCoSo
GO
SELECT * FROM BanDoPhanBo_SinhVatGayHai ORDER BY TenCoSo
GO