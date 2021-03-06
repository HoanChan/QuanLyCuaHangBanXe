USE [CUAHANG_BANXE]
GO

alter VIEW v_ChiNhanh_Ban
AS
SELECT        dbo.NhanVien.ChiNhanh, dbo.Xe.LoaiXe, COUNT(dbo.HoSoBanXe.Ma) AS slBan
FROM            dbo.NhanVien INNER JOIN
                         dbo.HoSoBanXe ON dbo.NhanVien.Ma = dbo.HoSoBanXe.NhanVienBan INNER JOIN
                         dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay
GROUP BY dbo.NhanVien.ChiNhanh, dbo.Xe.LoaiXe
GO

alter VIEW v_ChiNhanh_Nhap
AS
SELECT        dbo.PhieuXuatKho.ChiNhanh, dbo.CTPhieuXuatXe.LoaiXe, SUM(dbo.CTPhieuXuatXe.SoLuong) AS slNhap
FROM            dbo.PhieuXuatKho INNER JOIN
                         dbo.CTPhieuXuatXe ON dbo.PhieuXuatKho.Ma = dbo.CTPhieuXuatXe.PhieuXuatKho
GROUP BY dbo.CTPhieuXuatXe.LoaiXe, dbo.PhieuXuatKho.ChiNhanh

GO

create VIEW v_ChiNhanh_HangTon
AS
SELECT        dbo.v_ChiNhanh_Ban.ChiNhanh, dbo.v_ChiNhanh_Ban.LoaiXe, dbo.v_ChiNhanh_Nhap.slNhap - dbo.v_ChiNhanh_Ban.slBan AS SoLuongTon
FROM            dbo.v_ChiNhanh_Ban INNER JOIN
                         dbo.v_ChiNhanh_Nhap ON dbo.v_ChiNhanh_Ban.ChiNhanh = dbo.v_ChiNhanh_Nhap.ChiNhanh AND 
                         dbo.v_ChiNhanh_Ban.LoaiXe = dbo.v_ChiNhanh_Nhap.LoaiXe

GO

alter VIEW v_Kho_Nhap
AS
SELECT        dbo.PhieuNhapXe.Kho, dbo.CTPhieuNhapXe.LoaiXe, SUM(dbo.CTPhieuNhapXe.SoLuong) AS slNhap
FROM            dbo.CTPhieuNhapXe INNER JOIN
                         dbo.PhieuNhapXe ON dbo.CTPhieuNhapXe.PhieuNhapXe = dbo.PhieuNhapXe.Ma
GROUP BY dbo.CTPhieuNhapXe.LoaiXe, dbo.PhieuNhapXe.Kho

GO

alter VIEW v_Kho_Xuat
AS
SELECT        dbo.PhieuXuatKho.Kho, dbo.CTPhieuXuatXe.LoaiXe, SUM(dbo.CTPhieuXuatXe.SoLuong) AS slXuat
FROM            dbo.CTPhieuXuatXe INNER JOIN
                         dbo.PhieuXuatKho ON dbo.CTPhieuXuatXe.PhieuXuatKho = dbo.PhieuXuatKho.Ma
GROUP BY dbo.CTPhieuXuatXe.LoaiXe, dbo.PhieuXuatKho.Kho

GO

alter VIEW v_Kho_HangTon
AS
SELECT DISTINCT dbo.v_Kho_Nhap.Kho, dbo.v_Kho_Nhap.LoaiXe, dbo.v_Kho_Nhap.slNhap - dbo.v_Kho_Xuat.slXuat AS SoLuongTon
FROM            dbo.v_Kho_Nhap INNER JOIN
                         dbo.v_Kho_Xuat ON dbo.v_Kho_Nhap.Kho = dbo.v_Kho_Xuat.Kho AND dbo.v_Kho_Nhap.LoaiXe = dbo.v_Kho_Xuat.LoaiXe

GO

alter VIEW v_HoSoBanXe AS
SELECT        dbo.HoSoBanXe.Ma, dbo.HoSoBanXe.NgayMua, dbo.HoSoBanXe.KhachHang, dbo.HoSoBanXe.NhanVienBan, dbo.HoSoBanXe.Xe, dbo.Xe.LoaiXe, 
                         dbo.NhanVien.ChiNhanh
FROM            dbo.HoSoBanXe INNER JOIN
                         dbo.NhanVien ON dbo.HoSoBanXe.NhanVienBan = dbo.NhanVien.Ma INNER JOIN
                         dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay

GO

alter view v_LichSuKhachHang as

SELECT        dbo.HoSoBanXe.KhachHang, dbo.HoSoBanXe.NgayMua, dbo.HoSoBanXe.Xe, dbo.Xe.LoaiXe, COUNT(dbo.PhieuSuaChua.Ma) AS SoLanBaoHanh
FROM            dbo.Xe INNER JOIN
                         dbo.HoSoBanXe ON dbo.Xe.SoMay = dbo.HoSoBanXe.Xe LEFT OUTER JOIN
                         dbo.PhieuSuaChua ON dbo.Xe.SoMay = dbo.PhieuSuaChua.Xe
GROUP BY dbo.HoSoBanXe.KhachHang, dbo.HoSoBanXe.NgayMua, dbo.Xe.LoaiXe, dbo.HoSoBanXe.Xe

GO

alter VIEW v_ThongKeDoanhThu
AS
SELECT        MONTH(dbo.HoSoBanXe.NgayMua) AS Thang, YEAR(dbo.HoSoBanXe.NgayMua) AS Nam, dbo.PhieuXuatKho.ChiNhanh, dbo.HoSoBanXe.NhanVienBan, 
                         dbo.Xe.SoMay, dbo.Xe.GiaBan, dbo.CTPhieuNhapXe.GiaMua, dbo.Xe.GiaBan - dbo.CTPhieuNhapXe.GiaMua AS LoiNhuan
FROM            dbo.HoSoBanXe INNER JOIN
                         dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay INNER JOIN
                         dbo.PhieuXuatKho ON dbo.Xe.PhieuXuatKho = dbo.PhieuXuatKho.Ma INNER JOIN
                         dbo.PhieuNhapXe ON dbo.Xe.PhieuNhapXe = dbo.PhieuNhapXe.Ma INNER JOIN
                         dbo.CTPhieuNhapXe ON dbo.PhieuNhapXe.Ma = dbo.CTPhieuNhapXe.PhieuNhapXe
go