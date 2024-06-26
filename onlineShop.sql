
USE [onlineShop]
GO
/****** Object:  StoredProcedure [dbo].[Login]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Login]
@Username nvarchar(50),
@Pass nvarchar(50)
as
begin
declare @count int
declare @res bit
select @count = COUNT(*) from KhachHang where TenTKK = @Username and PassK = @Pass
if (@count > 0)
	set @res = 1
else set @res = 0
	select @res
end

GO
/****** Object:  StoredProcedure [dbo].[PhanLoaidt]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PhanLoaidt]
@doituong nchar(10)
as begin
select distinct p.MaPL, p.TenPL from SanPham s join PhanLoai p
on s.MaPL = p.MaPL
where s.DoiTuong = @doituong
end

GO
/****** Object:  UserDefinedFunction [dbo].[NextID] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[NextID] (@lastid varchar(10),@prefix varchar(10),@size int)
  returns varchar(10)
as
    BEGIN
        IF(@lastid = '')
            set @lastid = @prefix + REPLICATE (0,@size - LEN(@prefix))
        declare @num_nextid int, @nextid varchar(10)
        set @lastid = LTRIM(RTRIM(@lastid))
        -- number next id
        set @num_nextid = replace(@lastid,@prefix,'') + 1
        -- bo di so luong ky tu tien to
        set @size = @size - len(@prefix)
        -- replicate số lượng số 0 REPLICATE(0,3) => 000
        set @nextid = @prefix + REPLICATE (0,@size - LEN(@prefix))
        set @nextid = @prefix + RIGHT(REPLICATE(0, @size) + CONVERT (VARCHAR(MAX), @num_nextid), @size)
        return @nextid
    END;
GO
/****** Object:  Table [dbo].[ChiTietHD] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [int] NOT NULL,
	[MaSP] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK__ChiTietH__F557F66115502E78] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaNV] [nchar](10) NULL,
	[NgayMua] [date] NULL,
	[TinhTrangHD] [nchar](10) NULL,
	[TongTien] [decimal](18, 0) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK__HoaDon__2725A6E0620F2F02] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenK] [nvarchar](50) NULL,
	[NgaySinhK] [date] NULL,
	[GioiTinhK] [nchar](10) NULL,
	[DiaChiK] [nvarchar](50) NULL,
	[EmailK] [nvarchar](50) NULL,
	[SDTK] [nvarchar](20) NULL,
	[TenTKK] [nvarchar](50) NULL,
	[PassK] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[TenTK] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[Cap] [int] NULL,
	[TinhTrang] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanLoai] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanLoai](
	[MaPL] [nchar](10) NOT NULL,
	[TenPL] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](10) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[DoiTuong] [nchar](10) NULL,
	[GiaCu] [decimal](12, 0) NULL,
	[GiaMoi] [decimal](12, 0) NULL,
	[GioiThieuSP] [nvarchar](50) NULL,
	[Soluong] [int] NULL,
	[Anh] [nvarchar](50) NULL,
	[MaPL] [nchar](10) NULL,
 CONSTRAINT [PK__SanPham__2725081C03317E3D] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (2, N'SP0014    ', 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (3, N'SP0012    ', 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (4, N'SP0011    ', 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (5, N'SP0011    ', 10, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (6, N'SP0012    ', 1, CAST(300000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (1, 21, N'NV01      ', CAST(0x853B0B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (2, 21, NULL, CAST(0x853B0B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (3, 21, NULL, CAST(0x853B0B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'Giao hàng đến sao hỏa')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (4, 21, NULL, CAST(0x853B0B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'giao hàng tại 234 HQV')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (5, 21, NULL, CAST(0x853B0B00 AS Date), NULL, CAST(3000000 AS Decimal(18, 0)), N'giao hàng tại IPH')
INSERT [dbo].[HoaDon] ([MaHD], [MaKH], [MaNV], [NgayMua], [TinhTrangHD], [TongTien], [GhiChu]) VALUES (6, 21, NULL, CAST(0x863B0B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'sbchđfrhtjh')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (3, N'Nguyễn Văn Quang', CAST(0x021B0B00 AS Date), N'Nam       ', N'Vĩnh Phúc', N'nguyenquang93@gmail.com', N'0981330429', N'Quang 5993', N'nguyenquang93')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (4, N'Nguyễn Kim Thảo', CAST(0x7E1B0B00 AS Date), N'Nữ        ', N'Ninh Bình', N'kimthao94@gmail.com', N'0932334188', N'Thảo 7194', N'kimthao94')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (5, N'Trần Thu Trang', CAST(0x5D1D0B00 AS Date), N'Nữ        ', N'Hà Nội', N'thuytrang95@gmail.com', N'0971003929', N'Trang 1595', N'thuytrang95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (6, N'Phạm Văn Tuấn', CAST(0x1F1A0B00 AS Date), N'Nam       ', N'Hà Nam', N'phamtuan93@gmail.com', N'0981533589', N'Tuấn 21193', N'phamtuan93')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (7, N'Nguyễn Diệu Thu', CAST(0xB1170B00 AS Date), N'Nữ        ', N'Hà Nội', N'dieuthu91@gmail.com', N'0981238338', N'Thu 10591', N'dieuthu91')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (8, N'Bùi Tiến Đạt', CAST(0xCA1D0B00 AS Date), N'Nam       ', N'Hải Dương', N'tiendat95@gmail.com', N'0986234136', N'Đạt 18895', N'tiendat95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (9, N'Ngô Quang Hiếu', CAST(0x241D0B00 AS Date), N'Nam       ', N'Thái Bình', N'quanghieu95@gmail.com', N'09713483969', N'Hiếu 5395', N'quanghieu95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (10, N'Nguyễn Mai Linh', CAST(0x311F0B00 AS Date), N'Nữ        ', N'Hà Nội', N'mailinh96@gmail.com', N'0982356935', N'Linh 11896', N'anhtung95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (11, N'Bùi Anh Tùng', CAST(0x35170B00 AS Date), N'Nam       ', N'Hà Nội', N'anhtung95@gmail.com', N'0986331518', N'Tùng 6191', N'quangtung91')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (12, N'Trần Thu Thảo', CAST(0x87140B00 AS Date), N'Nữ        ', N'Hà Nội', N'thuthao95@gmail.com', N'0974162562', N'Thảo 19291', N'thuthao95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (13, N'Nguyễn Khải Minh', CAST(0xED1A0B00 AS Date), N'Nam       ', N'Vĩnh Phúc', N'khaiminh93@gmail.com', N'0982073329', N'Minh 15893', N'khaiminh93')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (14, N'Nguyễn Kim Hoa', CAST(0x9B1B0B00 AS Date), N'Nữ        ', N'Ninh Bình', N'kimhoa94@gmail.com', N'0935334118', N'Hoa 5294', N'kimhoa94')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (15, N'Trần Thu Anh', CAST(0x621D0B00 AS Date), N'Nữ        ', N'Hà Nội', N'thuanh95@gmail.com', N'0971004329', N'Anh 6595', N'thuanh95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (16, N'Phạm Tuấn Tú', CAST(0x161A0B00 AS Date), N'Nam       ', N'Hà Nam', N'tuantu93@gmail.com', N'0982536589', N'Tú 12193', N'tuantu93')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (17, N'Nguyễn Diệu My', CAST(0x77170B00 AS Date), N'Nữ        ', N'Hà Nội', N'dieumy91@gmail.com', N'0961228138', N'My 13391', N'dieumy91')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (18, N'Bùi Mạnh Khoa', CAST(0xA91D0B00 AS Date), N'Nam       ', N'Hải Dương', N'manhkhoa95@gmail.com', N'0986235126', N'Khoa 16795', N'manhkhoa95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (19, N'Phạm Quang Huy', CAST(0x3B1D0B00 AS Date), N'Nam       ', N'Thái Bình', N'quanghuy95@gmail.com', N'0974183929', N'Huy28395', N'quanghuy95')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (21, N'Phạm Thu Cúc', CAST(0x151D0B00 AS Date), N'Nữ        ', N'Hải Dương', N'phamthucuc95@gmail.com', N'0968572713', N'ThuCuc95', N'18021995')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenK], [NgaySinhK], [GioiTinhK], [DiaChiK], [EmailK], [SDTK], [TenTKK], [PassK]) VALUES (22, N'Hương BTM', CAST(0x1F1E0B00 AS Date), N'Nữ        ', N'hà nội', N'huongbtm@gmail.com', N'0124643546', N'HuongBTM', N'huongbtm')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV01      ', N'Nguyễn Quang Minh', CAST(0xCB1D0B00 AS Date), N'Nam       ', N'Hà Nội', N'quangminh95@gmail.com', N'0986666888', N'NQM95', N'quangminh95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV02      ', N'Phạm Minh Quyên', CAST(0xE21D0B00 AS Date), N'Nữ        ', N'Hà Nội', N'minhquyen95@gmail.com', N'0988668668', N'PMQ95', N'minhquyen95', 1, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV03      ', N'Nguyễn Văn Huy', CAST(0x4E1A0B00 AS Date), N'Nam       ', N'Vĩnh Phúc', N'nguyenhuy93@gmail.com', N'0981330999', N'NVH93', N'nguyenhuy93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV04      ', N'Nguyễn Xuân Mai', CAST(0xFB1B0B00 AS Date), N'Nữ        ', N'Ninh Bình', N'xuanmai94@gmail.com', N'0932338888', N'NXM94', N'xuanmai94', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV05      ', N'Trần Thùy Linh', CAST(0x851D0B00 AS Date), N'Nữ        ', N'Hà Nội', N'thuylinh95@gmail.com', N'0971003999', N'TTL95', N'thuylinh95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV06      ', N'Phạm Văn Hùng', CAST(0x551A0B00 AS Date), N'Nam       ', N'Hà Nam', N'phamhung93@gmail.com', N'0981333599', N'PVH93', N'phamhung93', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV07      ', N'Nguyễn Thị Trang', CAST(0x671E0B00 AS Date), N'Nữ        ', N'Hải Dương', N'nguyentrang96@gmail.com', N'0981331236', N'NTT96', N'nguyentrang96', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV08      ', N'Bùi Quang Thắng', CAST(0x301E0B00 AS Date), N'Nam       ', N'Hà Nội', N'quangthang95@gmail.com', N'0986698238', N'BQT95', N'quangthang95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV09      ', N'Ngô Duy Mạnh', CAST(0x131D0B00 AS Date), N'Nam       ', N'Thái Bình', N'duymanh95@gmail.com', N'0973328399', N'NDM95', N'duymanh95', 2, N'1         ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [Email], [SDT], [TenTK], [Pass], [Cap], [TinhTrang]) VALUES (N'NV10      ', N'Nguyễn Mai Hương', CAST(0xA91F0B00 AS Date), N'Nữ        ', N'Hà Nội', N'maihuong96@gmail.com', N'0989359936', N'NMH96', N'maihuong96', 2, N'1         ')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL01      ', N'Áo khoác')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL02      ', N'Áo phông')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL03      ', N'Chân váy')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL04      ', N'Đầm')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL05      ', N'Jean')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL06      ', N'Quần Short')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL07      ', N'Quần Tây')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL08      ', N'Sơ mi')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL09      ', N'Vest')
INSERT [dbo].[PhanLoai] ([MaPL], [TenPL]) VALUES (N'PL10      ', N'Váy')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0001', N'Áo khoác jean phối nỉ', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), N'Sản phẩm nhập khẩu Hàn Quốc', 50, N'/Images/files/AK_1.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0002', N'Áo khoác dạ lông', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_2.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0003', N'Áo khoác măng tô', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_3.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0004', N'Khoác jean đính đá', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_4.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0005', N'Áo khoác da', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_5.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0006', N'Áo khoác kaki', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_6.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0007', N'Áo khoác tàu', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/AK_1.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0008', N'Chân váy voan', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/CV_1.jpg', N'PL03      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0009', N'Chân váy xòe', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/CV_2.jpg', N'PL03      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0010', N'Chân váy tàu', N'Nữ        ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/CV_3.jpg', N'PL03      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0011', N'Áo khoác jean phối nỉ', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N1.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0012', N'Áo khoác dạ lông', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N2.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0013', N'Áo khoác măng tô', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N3.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0014', N'Áo khoác jean đính đá', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N4.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0015', N'Áo khoác da', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N5.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0016', N'Áo khoác kaki', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N6.jpg', N'PL01      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0017', N'Áo cá sấu', N'Nam       ', CAST(200000 AS Decimal(12, 0)), NULL, NULL, NULL, N'/Images/files/N7.jpg', N'PL02      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0018', N'Áo cổ bẻ', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N8.jpg', N'PL02      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0019', N'Áo phông trơn', N'Nam       ', CAST(500000 AS Decimal(12, 0)), CAST(300000 AS Decimal(12, 0)), NULL, NULL, N'/Images/files/N9.jpg', N'PL02      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0020', N'Áo phông sọc ngang', N'Nam       ', CAST(150000 AS Decimal(12, 0)), NULL, NULL, NULL, N'/Images/files/N10.jpg', N'PL02      ')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DoiTuong], [GiaCu], [GiaMoi], [GioiThieuSP], [Soluong], [Anh], [MaPL]) VALUES (N'SP0021', N'Sơ mi đẹp', N'Nữ        ', NULL, CAST(250000 AS Decimal(12, 0)), NULL, 10, N'/Images/files/SM_1.jpg', N'PL08      ')
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHD__MaHD__173876EA] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK__ChiTietHD__MaHD__173876EA]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHD__MaSP__182C9B23] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK__ChiTietHD__MaSP__182C9B23]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__1DE57479] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__1DE57479]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__1ED998B2] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__1ED998B2]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaPL__0519C6AF] FOREIGN KEY([MaPL])
REFERENCES [dbo].[PhanLoai] ([MaPL])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaPL__0519C6AF]
GO
