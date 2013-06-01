USE [CUAHANG_BANXE]
GO


alter view v_HangTon_ChiNhanh AS
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

alter view v_HangTon_Kho as
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

alter VIEW v_HoSoBanXe AS
SELECT  dbo.HoSoBanXe.Ma 'MaHoSo' ,dbo.ChiNhanh.Ten 'TenChiNhanh',dbo.ChiNhanh.DiaChi 'DiaChiCN',dbo.NhanVien.HoTen 'TenNgDaiDien',ChucVu 'CVNgDaiDien',dbo.KhachHang.Ten 'TenKH', dbo.KhachHang.DiaChi 'DiaChiKH',dbo.KhachHang.SoDT 'SdtKH',
		Hang 'HangSxXe', DTXiLanh, dbo.LoaiXe.Ten 'TenXe', MauSac, SoMay, SoKhung, DongCo
FROM    dbo.HoSoBanXe INNER JOIN
		dbo.KhachHang ON dbo.HoSoBanXe.KhachHang = dbo.KhachHang.Ma JOIN
		dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay JOIN
		dbo.ChiNhanh ON dbo.Xe.ChiNhanh= dbo.ChiNhanh.Ma JOIN
		dbo.NhanVien ON dbo.ChiNhanh.NVQuanLy = dbo.NhanVien.Ma JOIN
		dbo.LoaiXe ON dbo.Xe.LoaiXe = dbo.LoaiXe.Ma
GO

alter view [dbo].[v_LichSuKhachHang] as

SELECT Xe.SoMay,HoSoBanXe.KhachHang,HoSoBanXe.NgayMua, count(PhieuSuaChua.Ma) 'SoLan'  
FROM dbo.Xe JOIN
	 dbo.HoSoBanXe ON dbo.Xe.SoMay = dbo.HoSoBanXe.Xe left JOIN
	 dbo.PhieuSuaChua on Xe.SoMay = PhieuSuaChua.Xe
Group by Xe.SoMay,HoSoBanXe.KhachHang, HoSoBanXe.NgayMua
GO
