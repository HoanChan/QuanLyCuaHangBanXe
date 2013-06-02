USE [CUAHANG_BANXE]
GO

alter VIEW v_ChiNhanh_Ban
AS
SELECT        dbo.ChiNhanh.Ma AS 'MaChiNhanh', dbo.LoaiXe.Ma AS 'MaLoaiXe', dbo.LoaiXe.Ten AS LoaiXe, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, 
                         dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.ChiNhanh.Ten AS ChiNhanh, 
                         dbo.ChiNhanh.DiaChi, dbo.ChiNhanh.SoDT, COUNT(dbo.HoSoBanXe.Ma) AS 'slBan'
FROM            dbo.NhanVien INNER JOIN
                         dbo.HoSoBanXe ON dbo.NhanVien.Ma = dbo.HoSoBanXe.NhanVienBan INNER JOIN
                         dbo.ChiNhanh ON dbo.NhanVien.ChiNhanh = dbo.ChiNhanh.Ma RIGHT OUTER JOIN
                         dbo.LoaiXe INNER JOIN
                         dbo.Xe ON dbo.LoaiXe.Ma = dbo.Xe.LoaiXe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay
GROUP BY dbo.ChiNhanh.Ma, dbo.LoaiXe.Ma, dbo.LoaiXe.Ten, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, 
                         dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.ChiNhanh.Ten, dbo.ChiNhanh.DiaChi, dbo.ChiNhanh.SoDT

GO

alter VIEW v_ChiNhanh_Nhap
AS
SELECT        dbo.ChiNhanh.Ma AS 'MaChiNhanh', dbo.CTPhieuXuatXe.LoaiXe AS 'MaLoaiXe', dbo.LoaiXe.Ten AS LoaiXe, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, 
                         dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, 
                         dbo.ChiNhanh.Ten AS ChiNhanh, dbo.ChiNhanh.DiaChi, dbo.ChiNhanh.SoDT, SUM(dbo.CTPhieuXuatXe.SoLuong) AS 'slNhap'
FROM            dbo.ChiNhanh INNER JOIN
                         dbo.PhieuXuatKho ON dbo.ChiNhanh.Ma = dbo.PhieuXuatKho.ChiNhanh INNER JOIN
                         dbo.CTPhieuXuatXe ON dbo.PhieuXuatKho.Ma = dbo.CTPhieuXuatXe.PhieuXuatKho INNER JOIN
                         dbo.LoaiXe ON dbo.CTPhieuXuatXe.LoaiXe = dbo.LoaiXe.Ma
GROUP BY dbo.ChiNhanh.Ma, dbo.CTPhieuXuatXe.LoaiXe, dbo.LoaiXe.Ten, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, 
                         dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.ChiNhanh.Ten, dbo.ChiNhanh.DiaChi, dbo.ChiNhanh.SoDT

GO

alter VIEW v_ChiNhanh_HangTon
AS
SELECT DISTINCT 
                         dbo.v_ChiNhanh_Ban.MaChiNhanh, dbo.v_ChiNhanh_Ban.MaLoaiXe, dbo.v_ChiNhanh_Ban.LoaiXe, dbo.v_ChiNhanh_Ban.Hang, 
                         dbo.v_ChiNhanh_Ban.TGBH, dbo.v_ChiNhanh_Ban.DongCo, dbo.v_ChiNhanh_Ban.DTXiLanh, dbo.v_ChiNhanh_Ban.MauSac, 
                         dbo.v_ChiNhanh_Ban.TrongLuong, dbo.v_ChiNhanh_Ban.Khung, dbo.v_ChiNhanh_Ban.Banh, dbo.v_ChiNhanh_Ban.ChiNhanh, dbo.v_ChiNhanh_Ban.DiaChi, 
                         dbo.v_ChiNhanh_Ban.SoDT, dbo.v_ChiNhanh_Nhap.slNhap - dbo.v_ChiNhanh_Ban.slBan AS SoLuongTon
FROM            dbo.v_ChiNhanh_Ban INNER JOIN
                         dbo.v_ChiNhanh_Nhap ON dbo.v_ChiNhanh_Ban.MaChiNhanh = dbo.v_ChiNhanh_Nhap.MaChiNhanh AND 
                         dbo.v_ChiNhanh_Ban.MaLoaiXe = dbo.v_ChiNhanh_Nhap.MaLoaiXe

GO

alter VIEW v_Kho_Nhap
AS
SELECT        dbo.Kho.Ma AS 'MaKho', dbo.CTPhieuNhapXe.LoaiXe AS 'MaLoaiXe', SUM(dbo.CTPhieuNhapXe.SoLuong) AS 'slNhap', dbo.LoaiXe.Ten AS LoaiXe, 
                         dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, 
                         dbo.LoaiXe.Banh, dbo.Kho.Ten AS TenKho, dbo.Kho.DiaChi, dbo.Kho.SoDT
FROM            dbo.CTPhieuNhapXe INNER JOIN
                         dbo.PhieuNhapXe ON dbo.CTPhieuNhapXe.PhieuNhapXe = dbo.PhieuNhapXe.Ma INNER JOIN
                         dbo.LoaiXe ON dbo.CTPhieuNhapXe.LoaiXe = dbo.LoaiXe.Ma RIGHT OUTER JOIN
                         dbo.Kho ON dbo.Kho.Ma = dbo.PhieuNhapXe.Kho
GROUP BY dbo.Kho.Ma, dbo.CTPhieuNhapXe.LoaiXe, dbo.LoaiXe.Ten, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, 
                         dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.Kho.Ten, dbo.Kho.DiaChi, dbo.Kho.SoDT

GO

alter VIEW v_Kho_Xuat
AS
SELECT        dbo.Kho.Ma AS 'MaKho', dbo.CTPhieuXuatXe.LoaiXe AS 'MaLoaiXe', SUM(dbo.CTPhieuXuatXe.SoLuong) AS 'slXuat', dbo.LoaiXe.Ten AS LoaiXe, 
                         dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, 
                         dbo.LoaiXe.Banh, dbo.Kho.Ten AS TenKho, dbo.Kho.DiaChi, dbo.Kho.SoDT
FROM            dbo.CTPhieuXuatXe INNER JOIN
                         dbo.PhieuXuatKho ON dbo.CTPhieuXuatXe.PhieuXuatKho = dbo.PhieuXuatKho.Ma INNER JOIN
                         dbo.LoaiXe ON dbo.CTPhieuXuatXe.LoaiXe = dbo.LoaiXe.Ma RIGHT OUTER JOIN
                         dbo.Kho ON dbo.Kho.Ma = dbo.PhieuXuatKho.Kho
GROUP BY dbo.Kho.Ma, dbo.CTPhieuXuatXe.LoaiXe, dbo.LoaiXe.Ten, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, 
                         dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.Kho.Ten, dbo.Kho.DiaChi, dbo.Kho.SoDT

GO

alter VIEW v_Kho_HangTon
AS
SELECT DISTINCT 
                         dbo.v_Kho_Nhap.MaLoaiXe, dbo.v_Kho_Nhap.MaKho, dbo.v_Kho_Nhap.LoaiXe, dbo.v_Kho_Nhap.Hang, dbo.v_Kho_Nhap.TGBH, dbo.v_Kho_Nhap.DongCo, 
                         dbo.v_Kho_Nhap.DTXiLanh, dbo.v_Kho_Nhap.TrongLuong, dbo.v_Kho_Nhap.MauSac, dbo.v_Kho_Nhap.Khung, dbo.v_Kho_Nhap.Banh, 
                         dbo.v_Kho_Nhap.TenKho, dbo.v_Kho_Nhap.DiaChi, dbo.v_Kho_Nhap.SoDT, dbo.v_Kho_Nhap.slNhap - dbo.v_Kho_Xuat.slXuat AS SoLuongTon
FROM            dbo.v_Kho_Nhap INNER JOIN
                         dbo.v_Kho_Xuat ON dbo.v_Kho_Nhap.MaKho = dbo.v_Kho_Xuat.MaKho AND dbo.v_Kho_Nhap.MaLoaiXe = dbo.v_Kho_Xuat.MaLoaiXe

GO

alter VIEW v_HoSoBanXe AS
SELECT  dbo.HoSoBanXe.Ma 'MaHoSo' ,dbo.ChiNhanh.Ten 'TenChiNhanh',dbo.ChiNhanh.DiaChi 'DiaChiCN',dbo.NhanVien.HoTen 'TenNgDaiDien',ChucVu 'CVNgDaiDien',dbo.KhachHang.Ten 'TenKH', dbo.KhachHang.DiaChi 'DiaChiKH',dbo.KhachHang.SoDT 'SdtKH',
		Hang 'HangSxXe', DTXiLanh, dbo.LoaiXe.Ten 'TenXe', MauSac, SoMay, SoKhung, DongCo
FROM    dbo.HoSoBanXe INNER JOIN
		dbo.KhachHang ON dbo.HoSoBanXe.KhachHang = dbo.KhachHang.Ma JOIN
		dbo.Xe ON dbo.HoSoBanXe.Xe = dbo.Xe.SoMay JOIN
		PhieuXuatKho on xe.PhieuXuatKho=PhieuXuatKho.Ma join
		dbo.ChiNhanh ON PhieuXuatKho.ChiNhanh= dbo.ChiNhanh.Ma JOIN
		dbo.NhanVien ON dbo.ChiNhanh.NVQuanLy = dbo.NhanVien.Ma JOIN
		dbo.LoaiXe ON dbo.Xe.LoaiXe = dbo.LoaiXe.Ma

GO

alter view v_LichSuKhachHang as

SELECT        dbo.HoSoBanXe.NgayMua, dbo.HoSoBanXe.KhachHang, dbo.KhachHang.Ten AS TenKhachHang, dbo.KhachHang.DiaChi, dbo.KhachHang.SoDT, 
                         dbo.Xe.SoMay, dbo.Xe.SoKhung, dbo.LoaiXe.Ten AS LoaiXe, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, 
                         dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, COUNT(dbo.PhieuSuaChua.Ma) AS SoLanBaoHanh
FROM            dbo.Xe INNER JOIN
                         dbo.HoSoBanXe ON dbo.Xe.SoMay = dbo.HoSoBanXe.Xe INNER JOIN
                         dbo.KhachHang ON dbo.HoSoBanXe.KhachHang = dbo.KhachHang.Ma INNER JOIN
                         dbo.LoaiXe ON dbo.Xe.LoaiXe = dbo.LoaiXe.Ma LEFT OUTER JOIN
                         dbo.PhieuSuaChua ON dbo.Xe.SoMay = dbo.PhieuSuaChua.Xe
GROUP BY dbo.Xe.SoMay, dbo.HoSoBanXe.KhachHang, dbo.HoSoBanXe.NgayMua, dbo.KhachHang.Ten, dbo.KhachHang.DiaChi, dbo.KhachHang.SoDT, 
                         dbo.LoaiXe.Ten, dbo.LoaiXe.Hang, dbo.LoaiXe.TGBH, dbo.LoaiXe.DongCo, dbo.LoaiXe.DTXiLanh, dbo.LoaiXe.MauSac, dbo.LoaiXe.TrongLuong, 
                         dbo.LoaiXe.Khung, dbo.LoaiXe.Banh, dbo.Xe.SoKhung

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

GO