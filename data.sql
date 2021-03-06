USE [CUAHANG_BANXE]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[NVQuanLy] [nvarchar](10) NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTCungCapPhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTCungCapPhuKien](
	[NCC] [nvarchar](10) NOT NULL,
	[LoaiPhuKien] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CTCungCapPhuKien] PRIMARY KEY CLUSTERED 
(
	[NCC] ASC,
	[LoaiPhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTCungCapXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTCungCapXe](
	[NCC] [nvarchar](10) NOT NULL,
	[LoaiXe] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CTCungCapXe] PRIMARY KEY CLUSTERED 
(
	[NCC] ASC,
	[LoaiXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTNhapPhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTNhapPhuKien](
	[PhieuNhapPhuKien] [nvarchar](10) NOT NULL,
	[LoaiPhuKien] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaMua] [money] NOT NULL,
	[ThanhTien] [money] NOT NULL,
 CONSTRAINT [PK_CTNhapPhuKien] PRIMARY KEY CLUSTERED 
(
	[PhieuNhapPhuKien] ASC,
	[LoaiPhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPhieuNhapXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhapXe](
	[PhieuNhapXe] [nvarchar](10) NOT NULL,
	[LoaiXe] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaMua] [money] NOT NULL,
	[ThanhTien] [money] NOT NULL,
 CONSTRAINT [PK_CTPhieuNhapXe] PRIMARY KEY CLUSTERED 
(
	[PhieuNhapXe] ASC,
	[LoaiXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPhieuXuatPhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuXuatPhuKien](
	[PhieuXuatKho] [nvarchar](10) NOT NULL,
	[LoaiPhuKien] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CTPhieuXuatPhuKien] PRIMARY KEY CLUSTERED 
(
	[PhieuXuatKho] ASC,
	[LoaiPhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPhieuXuatXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuXuatXe](
	[PhieuXuatKho] [nvarchar](10) NOT NULL,
	[LoaiXe] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_CTPhieuXuatXe] PRIMARY KEY CLUSTERED 
(
	[PhieuXuatKho] ASC,
	[LoaiXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTQuyen]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTQuyen](
	[ChucVu] [nvarchar](10) NOT NULL,
	[Quyen] [int] NOT NULL,
	[Menu] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CTQuyen_1] PRIMARY KEY CLUSTERED 
(
	[ChucVu] ASC,
	[Quyen] ASC,
	[Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTSuaChua]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTSuaChua](
	[PhieuSuaChua] [nvarchar](10) NOT NULL,
	[PhuKien] [nvarchar](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietSuaChua] PRIMARY KEY CLUSTERED 
(
	[PhieuSuaChua] ASC,
	[PhuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTVanChuyen]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTVanChuyen](
	[NhanVien] [nvarchar](10) NOT NULL,
	[PhieuXuatKho] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_CTVanChuyen] PRIMARY KEY CLUSTERED 
(
	[NhanVien] ASC,
	[PhieuXuatKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoSoBanXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSoBanXe](
	[Ma] [nvarchar](10) NOT NULL,
	[NgayMua] [datetime] NOT NULL,
	[KhachHang] [nvarchar](10) NULL,
	[NhanVienBan] [nvarchar](10) NULL,
	[Xe] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoSoBanXe] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kho]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NULL,
	[NVQuanLy] [nvarchar](10) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiPhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhuKien](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GiaBan] [money] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiPhuKien] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiXe](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[Hang] [nvarchar](10) NOT NULL,
	[TGBH] [datetime] NOT NULL,
	[DongCo] [nvarchar](20) NOT NULL,
	[DTXiLanh] [int] NOT NULL,
	[MauSac] [nvarchar](20) NOT NULL,
	[TrongLuong] [float] NOT NULL,
	[Khung] [nvarchar](30) NOT NULL,
	[Banh] [nvarchar](30) NOT NULL,
	[GiaBan] [money] NOT NULL,
 CONSTRAINT [PK_LoaiXe] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Ma] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NCC]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoDT] [nvarchar](15) NULL,
 CONSTRAINT [PK_NCC] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[Ma] [nvarchar](10) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[SoDT] [nvarchar](15) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[Luong] [money] NOT NULL,
	[ChiNhanh] [nvarchar](10) NULL,
	[Kho] [nvarchar](10) NULL,
	[ChucVu] [nvarchar](10) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhapPhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapPhuKien](
	[Ma] [nvarchar](10) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[NVXacNhan] [nvarchar](10) NULL,
	[Kho] [nvarchar](10) NULL,
	[NCC] [nvarchar](10) NULL,
	[ThanhTien] [money] NOT NULL,
 CONSTRAINT [PK_PhieuNhapPhuKien] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhapXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapXe](
	[Ma] [nvarchar](10) NOT NULL,
	[Kho] [nvarchar](10) NULL,
	[NCC] [nvarchar](10) NULL,
	[NVXacNhan] [nvarchar](10) NULL,
	[ThoiGian] [datetime] NOT NULL,
	[ThanhTien] [money] NOT NULL,
 CONSTRAINT [PK_PhieuNhapXe] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuSuaChua]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuSuaChua](
	[Ma] [nvarchar](10) NOT NULL,
	[NgaySuaChua] [datetime] NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NVSuaChua] [nvarchar](10) NULL,
	[Xe] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhieuSuaChua] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuatKho]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuatKho](
	[Ma] [nvarchar](10) NOT NULL,
	[NgayXuat] [datetime] NOT NULL,
	[ChiNhanh] [nvarchar](10) NULL,
	[NVXacNhan] [nvarchar](10) NULL,
	[Kho] [nvarchar](10) NULL,
 CONSTRAINT [PK_PhieuXuatKHo] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhuKien]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuKien](
	[Ma] [nvarchar](10) NOT NULL,
	[Hang] [nvarchar](20) NULL,
	[LoaiPhuKien] [nvarchar](10) NULL,
 CONSTRAINT [PK_PhuKien] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[Ma] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](30) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen_Menu]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen_Menu](
	[Quyen] [nvarchar](10) NOT NULL,
	[Menu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quyen_Menu] PRIMARY KEY CLUSTERED 
(
	[Quyen] ASC,
	[Menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[SoKhung] [nvarchar](50) NOT NULL,
	[SoMay] [nvarchar](50) NOT NULL,
	[ChiNhanh] [nvarchar](10) NULL,
	[LoaiXe] [nvarchar](10) NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[SoMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_HangTon_ChiNhanh]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_HangTon_ChiNhanh] AS
select distinct Nhap.MaChiNhanh, Nhap.MaLoaiXe, (Nhap.slNhap-Ban.slBan) 'slTon'
from
(SELECT  ChiNhanh.Ma 'MaChiNhanh', CTPhieuXuatXe.LoaiXe 'MaLoaiXe',sum(CTPhieuXuatXe.SoLuong) 'slNhap'
FROM    dbo.ChiNhanh JOIN
        dbo.PhieuXuatKho ON dbo.ChiNhanh.Ma = dbo.PhieuXuatKho.ChiNhanh  JOIN
        dbo.CTPhieuXuatXe ON dbo.PhieuXuatKho.Ma = dbo.CTPhieuXuatXe.PhieuXuatKho
group by ChiNhanh.Ma, CTPhieuXuatXe.LoaiXe) as Nhap
JOIN
(SELECT ChiNhanh.Ma 'MaChiNhanh', LoaiXe.Ma 'MaLoaiXe', count(HoSoBanXe.Ma) 'slBan'  
FROM    dbo.LoaiXe JOIN
		dbo.Xe ON dbo.LoaiXe.Ma = dbo.Xe.LoaiXe left JOIN
		dbo.HoSoBanXe ON dbo.Xe.SoMay = dbo.HoSoBanXe.Xe Join	
		dbo.ChiNhanh ON dbo.Xe.ChiNhanh = dbo.ChiNhanh.Ma 
group by ChiNhanh.Ma, LoaiXe.Ma) as Ban on Nhap.MaChiNhanh = Ban.MaChiNhanh and Nhap.MaLoaiXe = Ban.MaLoaiXe
GO
/****** Object:  View [dbo].[v_HangTon_Kho]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_HangTon_Kho] as
Select distinct Xuat.MaKho, Xuat.MaLoaiXe, (Nhap.slNhap-Xuat.slXuat) 'slTon'
from
(SELECT  Kho.Ma 'MaKho',CTPhieuNhapXe.LoaiXe 'MaLoaiXe',sum(CTPhieuNhapXe.SoLuong) 'slNhap'
FROM  dbo.CTPhieuNhapXe JOIN
      dbo.PhieuNhapXe ON dbo.CTPhieuNhapXe.PhieuNhapXe = dbo.PhieuNhapXe.Ma right JOIN
	  dbo.Kho on Kho.Ma = PhieuNhapXe.Kho
	  Group by Kho.Ma,CTPhieuNhapXe.LoaiXe) as Nhap
join 
(SELECT  Kho.Ma 'MaKho',CTPhieuXuatXe.LoaiXe 'MaLoaiXe',sum(CTPhieuXuatXe.SoLuong) 'slXuat'
FROM  dbo.CTPhieuXuatXe JOIN
      dbo.PhieuXuatKho ON dbo.CTPhieuXuatXe.PhieuXuatKho = dbo.PhieuXuatKho.Ma right JOIN
	  dbo.Kho on Kho.Ma = PhieuXuatKho.Kho
	  Group by Kho.Ma,CTPhieuXuatXe.LoaiXe) as Xuat on Nhap.MaKho=Xuat.MaKho and Nhap.MaLoaiXe=Xuat.MaLoaiXe

GO
/****** Object:  View [dbo].[v_HoSoBanXe]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_HoSoBanXe] AS
SELECT  dbo.HoSoBanXe.Ma 'MaHoSo' ,dbo.ChiNhanh.Ten 'TenChiNhanh',dbo.ChiNhanh.DiaChi 'DiaChiCN',dbo.NhanVien.HoTen 'TenNgDaiDien',ChucVu 'CVNgDaiDien',dbo.KhachHang.Ten 'TenKH', dbo.KhachHang.DiaChi 'DiaChiKH',dbo.KhachHang.SoDT 'SdtKH',
		Hang 'HangSxXe', DTXiLanh, dbo.LoaiXe.Ten 'TenXe', MauSac, SoMay, SoKhung, DongCo
FROM    dbo.HoSoBanXe INNER JOIN
		dbo.KhachHang ON dbo.HoSoBanXe.KhachHang = dbo.KhachHang.Ma JOIN
		dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay JOIN
		dbo.ChiNhanh ON dbo.Xe.ChiNhanh= dbo.ChiNhanh.Ma JOIN
		dbo.NhanVien ON dbo.ChiNhanh.NVQuanLy = dbo.NhanVien.Ma JOIN
		dbo.LoaiXe ON dbo.Xe.LoaiXe = dbo.LoaiXe.Ma
GO
/****** Object:  View [dbo].[v_LichSuKhachHang]    Script Date: 6/2/2013 12:32:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_LichSuKhachHang] as
SELECT Xe.SoMay,HoSoBanXe.KhachHang,HoSoBanXe.NgayMua, count(PhieuSuaChua.Ma) 'SoLan'  
FROM dbo.Xe JOIN
	 dbo.HoSoBanXe ON dbo.Xe.SoMay = dbo.HoSoBanXe.Xe left JOIN
	 dbo.PhieuSuaChua on Xe.SoMay=PhieuSuaChua.Xe
Group by Xe.SoMay,HoSoBanXe.KhachHang, HoSoBanXe.NgayMua

GO
INSERT [dbo].[ChiNhanh] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'1', N'Đức Linh', N'12/1A Đinh Bộ Lĩnh, Bình Thạnh, Tp.HCM', N'0838654785', N'1')
INSERT [dbo].[ChiNhanh] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'2', N'Minh Long', N'124 Hoàng Văn Thụ, Tân Bình, Tp.HCM', N'0832164515', N'2')
INSERT [dbo].[ChiNhanh] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'3', N'Showroom Tân Bình', N'534 Cộng Hòa, Tân Bình, Tp.HCM', N'0838985621', N'3')
INSERT [dbo].[ChucVu] ([Ma], [Ten]) VALUES (N'1', N'GD')
INSERT [dbo].[ChucVu] ([Ma], [Ten]) VALUES (N'2', N'NV')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'1', N'1')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'10')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'11')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'2')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'3')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'4')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'5')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'6')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'7')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'8')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'2', N'9')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'3', N'12')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'3', N'13')
INSERT [dbo].[CTCungCapXe] ([NCC], [LoaiXe]) VALUES (N'3', N'14')
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'1', N'1', 6, 30000.0000, 180000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'1', N'13', 60, 7000.0000, 420000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'1', N'2', 50, 150000.0000, 7500000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'2', N'11', 100, 50000.0000, 5000000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'7', 200, 70000.0000, 14000000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'8', 100, 80000.0000, 8000000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'4', N'4', 50, 140000.0000, 7000000.0000)
INSERT [dbo].[CTNhapPhuKien] ([PhieuNhapPhuKien], [LoaiPhuKien], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'4', N'5', 50, 140000.0000, 7000000.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'1', N'1', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'10', N'11', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'10', N'13', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'10', N'14', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'11', N'2', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'11', N'5', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'11', N'9', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'12', N'5', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'12', N'8', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'13', N'2', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'13', N'4', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'13', N'6', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'13', N'7', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'14', N'12', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'14', N'14', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'14', N'7', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'15', N'1', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'2', N'1', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'11', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'2', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'3', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'4', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'5', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'6', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'7', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'8', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'3', N'9', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'4', N'12', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'4', N'13', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'5', N'14', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'6', N'1', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'7', N'4', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'7', N'6', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'7', N'7', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'8', N'10', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'8', N'9', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'9', N'12', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuNhapXe] ([PhieuNhapXe], [LoaiXe], [SoLuong], [GiaMua], [ThanhTien]) VALUES (N'9', N'13', 2, 1.0000, 2.0000)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'11', 10)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'12', 3)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'13', 10)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'3', 5)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'6', 10)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'7', 10)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'8', 10)
INSERT [dbo].[CTPhieuXuatPhuKien] ([PhieuXuatKho], [LoaiPhuKien], [SoLuong]) VALUES (N'1', N'9', 10)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'1', N'1', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'1', N'2', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'1', N'3', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'1', N'4', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'2', N'12', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'2', N'14', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'2', N'5', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'2', N'6', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'2', N'7', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'3', N'10', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'3', N'11', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'3', N'13', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'3', N'8', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'3', N'9', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'4', N'1', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'4', N'2', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'4', N'3', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'4', N'5', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'5', N'6', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'5', N'7', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'6', N'8', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'6', N'9', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'7', N'10', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'7', N'11', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'7', N'12', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'8', N'13', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'8', N'14', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'8', N'8', 1)
INSERT [dbo].[CTPhieuXuatXe] ([PhieuXuatKho], [LoaiXe], [SoLuong]) VALUES (N'8', N'9', 1)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'1', N'1', 2)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'2', N'14', 1)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'4', N'10', 1)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'5', N'14', 1)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'6', N'13', 1)
INSERT [dbo].[CTSuaChua] ([PhieuSuaChua], [PhuKien], [SoLuong]) VALUES (N'7', N'10', 2)
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'3', N'1')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'3', N'3')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'3', N'8')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'5', N'2')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'6', N'4')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'6', N'7')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'8', N'5')
INSERT [dbo].[CTVanChuyen] ([NhanVien], [PhieuXuatKho]) VALUES (N'9', N'6')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'1', CAST(0x0000A11D00000000 AS DateTime), N'1', N'8', N'1')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'10', CAST(0x0000A21000000000 AS DateTime), N'10', N'10', N'21')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'11', CAST(0x0000A1F100000000 AS DateTime), N'11', N'12', N'22')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'12', CAST(0x0000A1D000000000 AS DateTime), N'1', N'12', N'23')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'2', CAST(0x0000901A00000000 AS DateTime), N'2', N'8', N'2')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'3', CAST(0x00009FEA00000000 AS DateTime), N'3', N'7', N'3')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'4', CAST(0x0000A15900000000 AS DateTime), N'4', N'7', N'4')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'5', CAST(0x0000A13900000000 AS DateTime), N'5', N'7', N'5')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'6', CAST(0x0000A1F100000000 AS DateTime), N'6', N'9', N'15')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'7', CAST(0x0000A1B700000000 AS DateTime), N'7', N'9', N'16')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'8', CAST(0x0000A21100000000 AS DateTime), N'8', N'10', N'17')
INSERT [dbo].[HoSoBanXe] ([Ma], [NgayMua], [KhachHang], [NhanVienBan], [Xe]) VALUES (N'9', CAST(0x0000A1EE00000000 AS DateTime), N'9', N'10', N'18')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'1', N'Đinh Tùng Lâm', N'Q1, Tp.HCM ', N'0838456214')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'10', N'Thinh Văn Hoàng', N'11/2/1 Bạch Đằng, Bình Thạnh', N'0169854265')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'11', N'Nguyễn Văn Thắng', N'1 Lê Quang Định, Gò Vấp, Tp.HCM', N'1236548795')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'2', N'Trần Bùng Binh', N'Thủ đức, Tp.HCM', N'0123546987')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'3', N'Lê Như Tô', N'32 Đường 2, Phường 1, Bình Thạnh, Tp.HCM', N'0928654147')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'4', N'Hoàng Vĩnh Thạnh', N'23/1 Đường 6, Phường Vĩnh Lộc, Tân Phú, Tp.HCM', N'0898214536')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'5', N'Minh Hoàng Đạo', N'12 An Dương Vương, Q5, Tp.HCM', N'0909236547')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'6', N'Hy Văn Lạp', N'12 An Dương Vương, Q5, TpHCM', NULL)
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'7', N'Lu Ninh Kiều', N'77 Đất Võ, Quảng Ngãi', N'0913697455')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'8', N'Đậu Văn Lò', N'12 Thống Nhất, Ninh Trữ', N'0198652664')
INSERT [dbo].[KhachHang] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'9', N'Lê Trần Nghĩa', N'32 Đường Phú Thạnh, Q10, Tp.HCM', N'0132654778')
INSERT [dbo].[Kho] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'1', N'Kho Tân Định', N'123/1A Trần Quang Khải, Q1, tp.HCM', N'0916545124', N'6')
INSERT [dbo].[Kho] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'2', N'Kho Bình Hòa', N'12 Hàm Nghi, Biên Hòa', N'0613545455', N'7')
INSERT [dbo].[Kho] ([Ma], [Ten], [DiaChi], [SoDT], [NVQuanLy]) VALUES (N'3', N'Kho Quang Minh', N'623/1A Đinh Bộ Lĩnh, Phường 11, Bình Thạnh, Tp.HCM', N'0835951212', N'8')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'1', N'Chóa Đèn', 23000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'11', N'Nhớt Máy GHQ', 90000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'12', N'Chụp đèn trước', 45000.0000, N'Dùng cho cách loại xe honda 110cc')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'13', N'Dây điện đầu cúp', 10000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'2', N'Nhông Sau', 200000.0000, N'Hàng Nhật')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'3', N'Xích', 50000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'4', N'Bạc Đạn Bánh Trước', 100000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'5', N'Bạc Đạn Bánh Sau', 100000.0000, NULL)
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'6', N'Lốp Trước ', 100000.0000, N'Loại 110mm')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'7', N'Lốp Trước ', 100000.0000, N'Loại 100mm')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'8', N'Lốp Sau', 140000.0000, N'Loại 100mm')
INSERT [dbo].[LoaiPhuKien] ([Ma], [Ten], [GiaBan], [GhiChu]) VALUES (N'9', N'Lốp Sau', 140000.0000, N'Loại 120mm')
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'1', N'Angel', N'SYM', CAST(0x0000A2A600000000 AS DateTime), N'4 Thì', 98, N'Xanh Đen', 110, N'Khung QFL, Nhật', N'Bánh Trước 110cm,', 2150.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'10', N'Wave RSX FI AT', N'Honda', CAST(0x0000A43700000000 AS DateTime), N'Xăng, 4 kỳ', 109, N'Đen Đỏ', 100, N'Cặp đôi lò xo trụ', N'50mm x 55,6 mm', 1798.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'11', N'Wave S Deluxe', N'Honda', CAST(0x0000A2C500000000 AS DateTime), N'Xăng, 4 kỳ, 1 xy', 110, N'Nâu Đỏ', 107, N'Lò xo trụ, giảm chấn', N'50mm x 55.6mm', 1799.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'12', N'Cuxi 100cc', N'Yamaha', CAST(0x0000A86400000000 AS DateTime), N'4 thì, 2 van SOHC', 102, N'Nâu Xám', 89, N'Halogen 12V', N'90/90-10 50J', 3299.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'13', N'Luvias GTX 2012', N'Yamaha', CAST(0x0000A43500000000 AS DateTime), N'4 thì, xy lanh đơn', 124, N'Đỏ Đen', 101, N'Fuel injection', N'70/90-14M/C 34P', 2797.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'14', N'Exiter 2013 RC', N'Yamaha', CAST(0x0000A41400000000 AS DateTime), N'4 thì, xy, SOHC', 134, N'Đỏ Đen Trắng', 111, N'DC-CDI', N'1,960mm × 695mm', 4000.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'2', N'Air Blade 125', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'PGM-FI, xăng, 4 kỳ', 125, N'Đen Xám', 115, N'IH Chuẩn ISO', N'Trước: 80/90 Sau: 90/90 ', 3790.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'3', N'Lead 125cc', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'PGM-FI, xăng, 4 kỳ', 125, N'Đen Trắng', 115, N'12 44J', N'Trước 100/90-10 56J', 3749.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'4', N'Vision 2013', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'PGM-FI, xăng, 4 kỳ, ', 108, N'Nâu Trắng', 101, N'14 M/C 40P', N'Trước: 80/90 - 14 M/C 40P ', 2870.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'5', N'Future 125 FI', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'Xăng, 4 kỳ', 124, N'Đen', 107, N'17 M/C 38P', N'Trước: 70/90 - 17 M/C', 2999.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'6', N'Wave 110 RSX', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'Xăng, 4 kỳ', 109, N'Đen Đỏ', 101, N'17 M/C 38P', N'Trước: 70/90 - 17 M/C 38P', 2049.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'7', N'Wave α', N'Honda', CAST(0x0000A2A600000000 AS DateTime), N'Xăng, 4 kỳ', 97, N'Xanh', 100, N'Ống lồng', N'	50 mm x 49,5 mm', 1599.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'8', N'Wave α', N'Honda', CAST(0x0000A43C00000000 AS DateTime), N'Xăng, 4 kỳ', 97, N'Đỏ', 100, N'Ống Lồng', N'50 mm x 49,5mm', 1600.0000)
INSERT [dbo].[LoaiXe] ([Ma], [Ten], [Hang], [TGBH], [DongCo], [DTXiLanh], [MauSac], [TrongLuong], [Khung], [Banh], [GiaBan]) VALUES (N'9', N'PCX', N'Honda', CAST(0x0000A6CF00000000 AS DateTime), N'PGM-FI, xăng, 4 kỳ', 124, N'Đen Đỏ', 129, N'100/90 - 14 M/C 57P', N'Trước: 90/90 - 14 M/C', 5199.0000)
INSERT [dbo].[NCC] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'1', N'Yamaha Chi Nhánh Miền Nam', N'12, Huỳnh Văn, Tân Phú, Tp.HCM', N'0838654136')
INSERT [dbo].[NCC] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'2', N'SYM Tp.HCM', N'324 CMT8, Q10, Tp.HCM', N'0839454511')
INSERT [dbo].[NCC] ([Ma], [Ten], [DiaChi], [SoDT]) VALUES (N'3', N'Honda Việt Nam', N'12, Biên Hòa', N'0697885121')
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'1', N'Đinh Văn Bộ', N'12 Quảng Mĩ, Tân Mì, Bình Định', N'0909123654', 1, 325.0000, N'1', NULL, N'1', N'dinhvanbo', CAST(0x00007D6E00000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'10', N'Lê A Văn', N'4 Lý Minh Mạn, Phường Tân An, Biên Hòa', N'0978415151', 1, 654.0000, N'2', NULL, N'2', N'leavan', CAST(0x0000806800000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'11', N'Hoang Minh Thắng', N'1 Minh Vinh, Đồng Phú, Đồng Nai', N'0984523237', 0, 645.0000, N'3', NULL, N'2', N'hoangminhthang', CAST(0x00006F4900000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'12', N'Lục Văn Vũ', N'123A Hồ Quang Trạch, Q8, Tp.HCM ', N'0984121454', 1, 945.0000, N'3', NULL, N'2', N'lucvanvu', CAST(0x00007AB300000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'13', N'Huỳnh Vĩnh Tạo', N'122C Lam Sơn, Bình Định', N'0978854151', 1, 542.0000, NULL, N'1', N'2', N'huynhvinhtao', CAST(0x00006B0100000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'14', N'Trần Như Trang', N'1 Nguyễn Huệ, Q1, Tp.HCM', N'0978512157', 0, 548.0000, NULL, N'2', N'2', N'trannhutrang', CAST(0x00007C2000000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'15', N'Hà Hiếu Lễ', N'23 Đồng Khởi, Q1, Tp.HCM', N'0974512112', 0, 321.0000, NULL, N'3', N'2', N'hahieule', CAST(0x00007AB300000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'16', N'Đinh Hiếu', N'1 Hai Bà Trưng, Tân Bình, Tp.HCM', N'0956121212', 1, 654.0000, N'1', NULL, N'2', N'dinhhieu', CAST(0x00008BD200000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'2', N'Hoàng Văn Lý', N'11A Đường 1, Q7, Tp.HCM', N'0925413654', 1, 535.0000, N'2', NULL, N'2', N'hoangvanly', CAST(0x00007EFB00000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'3', N'Minh Linh Lung', N'544 Tân Mỹ, Q7, Tp.HCM', N'0986215451', 0, 684.0000, N'3', NULL, N'2', N'minhlinhlung', CAST(0xFFFFE20A00000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'4', N'Trần Hoàng', N'233 Nguyễn Huệ, Q1, Tp.HCM', N'0931458484', 1, 541.0000, NULL, N'1', N'2', N'tranhoang', CAST(0x00007AB300000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'5', N'Huỳnh Minh Tạo', N'1/12A CMT8, Q10, Tp.HCM', N'0988151212', 1, 365.0000, NULL, N'2', N'2', N'huynhminhtao', CAST(0x00007C5F00000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'6', N'Đinh Văn Nham', N'12/524 Lý Thường Kiệt, Phường 10, Q10, Tp.HCM', N'0186545117', 1, 541.0000, NULL, N'3', N'2', N'dinhvannham', CAST(0x00006DDC00000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'7', N'Trần Long Định', N'124 Đường 21, Phường 1, Q5', N'0988415121', 1, 326.0000, N'1', NULL, N'2', N'tranlongdinh', CAST(0x00007AB300000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'8', N'Hoàng Vĩnh Thịnh', N'Đường 5, Mình Hóa, Q1, Tp.HCM', N'0978612154', 0, 645.0000, N'1', NULL, N'2', N'hoangvinhthinh', CAST(0x00007C2000000000 AS DateTime))
INSERT [dbo].[NhanVien] ([Ma], [HoTen], [DiaChi], [SoDT], [GioiTinh], [Luong], [ChiNhanh], [Kho], [ChucVu], [MatKhau], [NgaySinh]) VALUES (N'9', N'Thanh Minh Trang', N'34 QL1, Thủ Đức, Tp.HCM', N'0165132356', 0, 364.0000, N'2', NULL, N'2', N'thanhminhtrang', CAST(0x00007EFB00000000 AS DateTime))
INSERT [dbo].[PhieuNhapPhuKien] ([Ma], [ThoiGian], [NVXacNhan], [Kho], [NCC], [ThanhTien]) VALUES (N'1', CAST(0x00009FCB00000000 AS DateTime), N'6', N'1', N'1', 4500000.0000)
INSERT [dbo].[PhieuNhapPhuKien] ([Ma], [ThoiGian], [NVXacNhan], [Kho], [NCC], [ThanhTien]) VALUES (N'2', CAST(0x0000A1D400000000 AS DateTime), N'11', N'2', N'3', 46222222.0000)
INSERT [dbo].[PhieuNhapPhuKien] ([Ma], [ThoiGian], [NVXacNhan], [Kho], [NCC], [ThanhTien]) VALUES (N'3', CAST(0x0000A1E800000000 AS DateTime), N'13', N'1', N'1', 9643310.0000)
INSERT [dbo].[PhieuNhapPhuKien] ([Ma], [ThoiGian], [NVXacNhan], [Kho], [NCC], [ThanhTien]) VALUES (N'4', CAST(0x0000A1D400000000 AS DateTime), N'5', N'3', N'2', 10172000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'1', N'1', N'1', N'6', CAST(0x0000A13900000000 AS DateTime), 65400.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'10', N'2', N'3', N'7', CAST(0x0000A1B100000000 AS DateTime), 31221.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'11', N'3', N'2', N'8', CAST(0x00009FF300000000 AS DateTime), 121000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'12', N'3', N'2', N'8', CAST(0x0000A1A300000000 AS DateTime), 640000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'13', N'3', N'2', N'8', CAST(0x0000A20F00000000 AS DateTime), 6563000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'14', N'3', N'3', N'8', CAST(0x0000A08400000000 AS DateTime), 321212.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'15', N'3', N'1', N'8', CAST(0x0000A1D300000000 AS DateTime), 98000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'2', N'1', N'1', N'6', CAST(0x0000A13900000000 AS DateTime), 46500.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'3', N'1', N'2', N'6', CAST(0x0000A24B00000000 AS DateTime), 65456.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'4', N'1', N'3', N'6', CAST(0x00009FCB00000000 AS DateTime), 362000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'5', N'1', N'3', N'6', CAST(0x0000A1B100000000 AS DateTime), 123124.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'6', N'2', N'1', N'7', CAST(0x0000A13900000000 AS DateTime), 135000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'7', N'2', N'2', N'7', CAST(0x0000A13900000000 AS DateTime), 6540000.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'8', N'2', N'2', N'7', CAST(0x0000A13900000000 AS DateTime), 313212.0000)
INSERT [dbo].[PhieuNhapXe] ([Ma], [Kho], [NCC], [NVXacNhan], [ThoiGian], [ThanhTien]) VALUES (N'9', N'2', N'3', N'7', CAST(0x00009FCF00000000 AS DateTime), 32000.0000)
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'1', CAST(0x0000A13900000000 AS DateTime), N'Hư Van', N'7', N'1')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'2', CAST(0x00009FCB00000000 AS DateTime), N'Thay Dầu', N'7', N'2')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'3', CAST(0x0000A13900000000 AS DateTime), N'Thay Tooc Vít', N'8', N'3')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'4', CAST(0x0000A1D100000000 AS DateTime), N'Xiết ổ nòng côn', N'8', N'4')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'5', CAST(0x0000A1D100000000 AS DateTime), N'Thay Nhớt', N'9', N'15')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'6', CAST(0x0000A1D100000000 AS DateTime), N'Chỉnh chế hòa khí', N'9', N'16')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'7', CAST(0x0000A1D100000000 AS DateTime), N'Tăng Xích', N'10', N'17')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'8', CAST(0x0000A1D100000000 AS DateTime), N'Thay Nhông', N'11', N'22')
INSERT [dbo].[PhieuSuaChua] ([Ma], [NgaySuaChua], [GhiChu], [NVSuaChua], [Xe]) VALUES (N'9', CAST(0x0000A1D100000000 AS DateTime), N'Thay Đèn Trước', N'11', N'23')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'1', CAST(0x0000A12500000000 AS DateTime), N'1', N'1', N'1')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'2', CAST(0x0000A28800000000 AS DateTime), N'1', N'1', N'1')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'3', CAST(0x0000A28800000000 AS DateTime), N'1', N'1', N'2')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'4', CAST(0x0000A13900000000 AS DateTime), N'2', N'2', N'1')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'5', CAST(0x0000A17800000000 AS DateTime), N'2', N'2', N'2')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'6', CAST(0x0000A1B700000000 AS DateTime), N'2', N'2', N'3')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'7', CAST(0x0000A20D00000000 AS DateTime), N'3', N'3', N'2')
INSERT [dbo].[PhieuXuatKho] ([Ma], [NgayXuat], [ChiNhanh], [NVXacNhan], [Kho]) VALUES (N'8', CAST(0x0000A1F100000000 AS DateTime), N'3', N'3', N'3')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'1', N'Yamaha', N'1')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'10', N'Yamaha', N'6')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'11', N'Yamaha', N'7')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'12', N'Yamaha', N'7')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'13', N'Yamaha', N'8')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'14', N'Yamaha', N'8')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'15', N'Yamaha', N'6')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'16', N'Honda', N'1')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'17', N'Honda', N'1')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'18', N'Honda', N'1')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'19', N'Honda', N'1')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'2', N'Yamaha', N'11')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'20', N'Honda', N'13')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'21', N'Honda', N'13')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'22', N'Honda', N'8')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'23', N'Honda', N'9')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'24', N'Honda', N'7')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'25', N'Honda', N'3')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'26', N'Honda', N'5')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'27', N'Honda', N'4')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'3', N'Yamaha', N'12')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'4', N'Yamaha', N'13')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'5', N'Yamaha', N'2')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'6', N'Yamaha', N'3')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'7', N'Yamaha', N'4')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'8', N'Yamaha', N'5')
INSERT [dbo].[PhuKien] ([Ma], [Hang], [LoaiPhuKien]) VALUES (N'9', N'Yamaha', N'6')
INSERT [dbo].[Quyen] ([Ma], [Ten], [GhiChu]) VALUES (N'1', N'1', NULL)
INSERT [dbo].[Quyen] ([Ma], [Ten], [GhiChu]) VALUES (N'2', N'2', NULL)
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'1', N'1', N'1', N'1')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'10', N'10', N'1', N'10')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'11', N'11', N'1', N'11')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'12', N'12', N'1', N'12')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'13', N'13', N'1', N'13')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'14', N'14', N'1', N'14')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'15', N'15', N'2', N'1')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'16', N'16', N'2', N'2')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'17', N'17', N'2', N'3')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'18', N'18', N'2', N'4')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'19', N'19', N'2', N'5')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'2', N'2', N'1', N'2')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'20', N'20', N'2', N'6')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'21', N'21', N'2', N'7')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'22', N'22', N'2', N'8')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'23', N'23', N'2', N'9')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'24', N'24', N'3', N'8')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'25', N'25', N'3', N'9')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'26', N'26', N'3', N'10')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'27', N'27', N'3', N'11')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'28', N'28', N'3', N'12')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'29', N'29', N'3', N'13')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'3', N'3', N'1', N'3')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'4', N'4', N'1', N'4')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'5', N'5', N'1', N'5')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'6', N'6', N'1', N'6')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'7', N'7', N'1', N'7')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'8', N'8', N'1', N'8')
INSERT [dbo].[Xe] ([SoKhung], [SoMay], [ChiNhanh], [LoaiXe]) VALUES (N'9', N'9', N'1', N'9')
ALTER TABLE [dbo].[ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_ChiNhanh_NhanVien] FOREIGN KEY([NVQuanLy])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[ChiNhanh] CHECK CONSTRAINT [FK_ChiNhanh_NhanVien]
GO
ALTER TABLE [dbo].[CTCungCapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTCungCapPhuKien_LoaiPhuKien] FOREIGN KEY([LoaiPhuKien])
REFERENCES [dbo].[LoaiPhuKien] ([Ma])
GO
ALTER TABLE [dbo].[CTCungCapPhuKien] CHECK CONSTRAINT [FK_CTCungCapPhuKien_LoaiPhuKien]
GO
ALTER TABLE [dbo].[CTCungCapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTCungCapPhuKien_NCC] FOREIGN KEY([NCC])
REFERENCES [dbo].[NCC] ([Ma])
GO
ALTER TABLE [dbo].[CTCungCapPhuKien] CHECK CONSTRAINT [FK_CTCungCapPhuKien_NCC]
GO
ALTER TABLE [dbo].[CTCungCapXe]  WITH CHECK ADD  CONSTRAINT [FK_CTCungCapXe_LoaiXe] FOREIGN KEY([LoaiXe])
REFERENCES [dbo].[LoaiXe] ([Ma])
GO
ALTER TABLE [dbo].[CTCungCapXe] CHECK CONSTRAINT [FK_CTCungCapXe_LoaiXe]
GO
ALTER TABLE [dbo].[CTCungCapXe]  WITH CHECK ADD  CONSTRAINT [FK_CTCungCapXe_NCC] FOREIGN KEY([NCC])
REFERENCES [dbo].[NCC] ([Ma])
GO
ALTER TABLE [dbo].[CTCungCapXe] CHECK CONSTRAINT [FK_CTCungCapXe_NCC]
GO
ALTER TABLE [dbo].[CTNhapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapPhuKien_LoaiPhuKien] FOREIGN KEY([LoaiPhuKien])
REFERENCES [dbo].[LoaiPhuKien] ([Ma])
GO
ALTER TABLE [dbo].[CTNhapPhuKien] CHECK CONSTRAINT [FK_CTNhapPhuKien_LoaiPhuKien]
GO
ALTER TABLE [dbo].[CTNhapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapPhuKien_PhieuNhapPhuKien] FOREIGN KEY([PhieuNhapPhuKien])
REFERENCES [dbo].[PhieuNhapPhuKien] ([Ma])
GO
ALTER TABLE [dbo].[CTNhapPhuKien] CHECK CONSTRAINT [FK_CTNhapPhuKien_PhieuNhapPhuKien]
GO
ALTER TABLE [dbo].[CTPhieuNhapXe]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhapXe_LoaiXe] FOREIGN KEY([LoaiXe])
REFERENCES [dbo].[LoaiXe] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuNhapXe] CHECK CONSTRAINT [FK_CTPhieuNhapXe_LoaiXe]
GO
ALTER TABLE [dbo].[CTPhieuNhapXe]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhapXe_PhieuNhapXe] FOREIGN KEY([PhieuNhapXe])
REFERENCES [dbo].[PhieuNhapXe] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuNhapXe] CHECK CONSTRAINT [FK_CTPhieuNhapXe_PhieuNhapXe]
GO
ALTER TABLE [dbo].[CTPhieuXuatPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuatPhuKien_LoaiPhuKien] FOREIGN KEY([LoaiPhuKien])
REFERENCES [dbo].[LoaiPhuKien] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuXuatPhuKien] CHECK CONSTRAINT [FK_CTPhieuXuatPhuKien_LoaiPhuKien]
GO
ALTER TABLE [dbo].[CTPhieuXuatPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuatPhuKien_PhieuXuatKHo] FOREIGN KEY([PhieuXuatKho])
REFERENCES [dbo].[PhieuXuatKho] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuXuatPhuKien] CHECK CONSTRAINT [FK_CTPhieuXuatPhuKien_PhieuXuatKHo]
GO
ALTER TABLE [dbo].[CTPhieuXuatXe]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuatXe_LoaiXe] FOREIGN KEY([LoaiXe])
REFERENCES [dbo].[LoaiXe] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuXuatXe] CHECK CONSTRAINT [FK_CTPhieuXuatXe_LoaiXe]
GO
ALTER TABLE [dbo].[CTPhieuXuatXe]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuatXe_PhieuXuatKHo] FOREIGN KEY([PhieuXuatKho])
REFERENCES [dbo].[PhieuXuatKho] ([Ma])
GO
ALTER TABLE [dbo].[CTPhieuXuatXe] CHECK CONSTRAINT [FK_CTPhieuXuatXe_PhieuXuatKHo]
GO
ALTER TABLE [dbo].[CTQuyen]  WITH CHECK ADD  CONSTRAINT [FK_CTQuyen_ChucVu] FOREIGN KEY([ChucVu])
REFERENCES [dbo].[ChucVu] ([Ma])
GO
ALTER TABLE [dbo].[CTQuyen] CHECK CONSTRAINT [FK_CTQuyen_ChucVu]
GO
ALTER TABLE [dbo].[CTSuaChua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSuaChua_PhieuSuaChua] FOREIGN KEY([PhieuSuaChua])
REFERENCES [dbo].[PhieuSuaChua] ([Ma])
GO
ALTER TABLE [dbo].[CTSuaChua] CHECK CONSTRAINT [FK_ChiTietSuaChua_PhieuSuaChua]
GO
ALTER TABLE [dbo].[CTSuaChua]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSuaChua_PhuKien] FOREIGN KEY([PhuKien])
REFERENCES [dbo].[PhuKien] ([Ma])
GO
ALTER TABLE [dbo].[CTSuaChua] CHECK CONSTRAINT [FK_ChiTietSuaChua_PhuKien]
GO
ALTER TABLE [dbo].[CTVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK_CTVanChuyen_NhanVien] FOREIGN KEY([NhanVien])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[CTVanChuyen] CHECK CONSTRAINT [FK_CTVanChuyen_NhanVien]
GO
ALTER TABLE [dbo].[CTVanChuyen]  WITH CHECK ADD  CONSTRAINT [FK_CTVanChuyen_PhieuXuatKHo] FOREIGN KEY([PhieuXuatKho])
REFERENCES [dbo].[PhieuXuatKho] ([Ma])
GO
ALTER TABLE [dbo].[CTVanChuyen] CHECK CONSTRAINT [FK_CTVanChuyen_PhieuXuatKHo]
GO
ALTER TABLE [dbo].[HoSoBanXe]  WITH CHECK ADD  CONSTRAINT [FK_HoSoBanXe_KhachHang] FOREIGN KEY([KhachHang])
REFERENCES [dbo].[KhachHang] ([Ma])
GO
ALTER TABLE [dbo].[HoSoBanXe] CHECK CONSTRAINT [FK_HoSoBanXe_KhachHang]
GO
ALTER TABLE [dbo].[HoSoBanXe]  WITH CHECK ADD  CONSTRAINT [FK_HoSoBanXe_NhanVien] FOREIGN KEY([NhanVienBan])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[HoSoBanXe] CHECK CONSTRAINT [FK_HoSoBanXe_NhanVien]
GO
ALTER TABLE [dbo].[HoSoBanXe]  WITH CHECK ADD  CONSTRAINT [FK_HoSoBanXe_Xe] FOREIGN KEY([Xe])
REFERENCES [dbo].[Xe] ([SoMay])
GO
ALTER TABLE [dbo].[HoSoBanXe] CHECK CONSTRAINT [FK_HoSoBanXe_Xe]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_NhanVien] FOREIGN KEY([NVQuanLy])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([ChucVu])
REFERENCES [dbo].[ChucVu] ([Ma])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapPhuKien_Kho] FOREIGN KEY([Kho])
REFERENCES [dbo].[Kho] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien] CHECK CONSTRAINT [FK_PhieuNhapPhuKien_Kho]
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapPhuKien_NCC] FOREIGN KEY([NCC])
REFERENCES [dbo].[NCC] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien] CHECK CONSTRAINT [FK_PhieuNhapPhuKien_NCC]
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapPhuKien_NhanVien] FOREIGN KEY([NVXacNhan])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapPhuKien] CHECK CONSTRAINT [FK_PhieuNhapPhuKien_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhapXe]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapXe_Kho] FOREIGN KEY([Kho])
REFERENCES [dbo].[Kho] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapXe] CHECK CONSTRAINT [FK_PhieuNhapXe_Kho]
GO
ALTER TABLE [dbo].[PhieuNhapXe]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapXe_NCC] FOREIGN KEY([NCC])
REFERENCES [dbo].[NCC] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapXe] CHECK CONSTRAINT [FK_PhieuNhapXe_NCC]
GO
ALTER TABLE [dbo].[PhieuNhapXe]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapXe_NhanVien] FOREIGN KEY([NVXacNhan])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[PhieuNhapXe] CHECK CONSTRAINT [FK_PhieuNhapXe_NhanVien]
GO
ALTER TABLE [dbo].[PhieuSuaChua]  WITH CHECK ADD  CONSTRAINT [FK_PhieuSuaChua_NhanVien] FOREIGN KEY([NVSuaChua])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[PhieuSuaChua] CHECK CONSTRAINT [FK_PhieuSuaChua_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKHo_ChiNhanh] FOREIGN KEY([ChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([Ma])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKHo_ChiNhanh]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKho_Kho] FOREIGN KEY([Kho])
REFERENCES [dbo].[Kho] ([Ma])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKho_Kho]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKho_NhanVien] FOREIGN KEY([NVXacNhan])
REFERENCES [dbo].[NhanVien] ([Ma])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKho_NhanVien]
GO
ALTER TABLE [dbo].[PhuKien]  WITH CHECK ADD  CONSTRAINT [FK_PhuKien_LoaiPhuKien] FOREIGN KEY([LoaiPhuKien])
REFERENCES [dbo].[LoaiPhuKien] ([Ma])
GO
ALTER TABLE [dbo].[PhuKien] CHECK CONSTRAINT [FK_PhuKien_LoaiPhuKien]
GO
ALTER TABLE [dbo].[Quyen_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_Menu_Menu] FOREIGN KEY([Menu])
REFERENCES [dbo].[Menu] ([Ma])
GO
ALTER TABLE [dbo].[Quyen_Menu] CHECK CONSTRAINT [FK_Quyen_Menu_Menu]
GO
ALTER TABLE [dbo].[Quyen_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_Menu_Quyen] FOREIGN KEY([Quyen])
REFERENCES [dbo].[Quyen] ([Ma])
GO
ALTER TABLE [dbo].[Quyen_Menu] CHECK CONSTRAINT [FK_Quyen_Menu_Quyen]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_ChiNhanh] FOREIGN KEY([ChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([Ma])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_ChiNhanh]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_LoaiXe] FOREIGN KEY([LoaiXe])
REFERENCES [dbo].[LoaiXe] ([Ma])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_LoaiXe]
GO
