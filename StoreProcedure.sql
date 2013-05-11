use CUAHANG_BANXE
go


alter function ft_SoLuongTon (@MaLoaiXe nvarchar(10))
RETURNS int
AS 
begin
	declare @SLBan int;
	declare @SLNhap int;
	set @SLBan=(select sum(SoLuong) from CTPhieuXuatXe where MaLoaiXe=@MaLoaiXe)
	set @SLNhap=(select sum(SoLuong) from CTPhieuNhapXe where MaLoaiXe=@MaLoaiXe)
	return @SLNhap-@SLBan
end
go

alter procedure sp_ChucVu_Select
as
begin
	 select * from ChucVu
end
go

alter PROCEDURE sp_ChucVu_Insert
@MaCV nvarchar(10),
@TenCV nvarchar(30)
AS
BEGIN
	Insert into ChucVu values(@MaCV, @TenCV)                                                 
END
go

alter procedure sp_ChucVu_Delete
@MaCV nvarchar(10)
AS
BEGIN
	DELETE FROM ChucVu WHERE Ma=@MaCV
END
go

alter procedure sp_ChucVu_Update
@MaCV nvarchar(10),
@TenCV nvarchar(30)
as
begin
	update ChucVu set Ten=@TenCV where Ma=@MaCV
end
go

alter procedure sp_NCC_Insert
@MaNCC nvarchar(10),
@TenNCC nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	insert into NCC values(@MaNCC, @TenNCC, @DiaChi, @SoDT)
END
GO

alter procedure sp_NCC_Delete
@MaNCC nvarchar(10)
AS
BEGIN
	delete from NCC where Ma=@MaNCC
END
GO

alter procedure sp_NCC_Update
@MaNCC nvarchar(10),
@TenNCC nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	update NCC set Ten=@TenNCC, DiaChi=@DiaChi, SoDT=@SoDT where Ma=@MaNCC
END
GO

alter PROCEDURE sp_ChiNhanh_Insert
@MaCN nvarchar(10),
@TenCN nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	insert into ChiNhanh values(@MaCN, @TenCN, @DiaChi, @SoDT, @NVQuanLy)
END
GO

alter PROCEDURE sp_ChiNhanh_update
@MaCN nvarchar(10),
@TenCN nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	update ChiNhanh set Ten=@TenCN, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQuanLy where Ma=@MaCN
END
GO

alter PROCEDURE sp_ChiNhanh_Delete
@MaCN nvarchar(10)
AS
BEGIN
	delete from ChiNhanh where Ma=@MaCN
END
GO

alter PROCEDURE sp_NhanVien_Insert
@MaNV nvarchar(10),
@HoTen nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@GioiTinh tinyint,
@Luong money,
@ChiNhanh nvarchar(10),
@Kho nvarchar(10),
@ChucVu nvarchar(10),
@MatKhau nvarchar(50),
@NgaySinh datetime
AS
BEGIN
	INSERT INTO NhanVien VALUES(@MaNV, @HoTen, @DiaChi, @SoDT, @GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh)
END
GO

alter PROCEDURE sp_NhanVien_Update
@MaNV nvarchar(10),
@HoTen nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@GioiTinh tinyint,
@Luong money,
@ChiNhanh nvarchar(10),
@Kho nvarchar(10),
@ChucVu nvarchar(10),
@MatKhau nvarchar(50),
@NgaySinh datetime
AS
BEGIN
	UPDATE NhanVien SET HoTen=@HoTen, DiaChi=@DiaChi, SoDT=@SoDT, GioiTinh=@GioiTinh, Luong=@Luong, ChiNhanh=@ChiNhanh, Kho=@Kho, ChucVu=@ChucVu, NgaySinh=@NgaySinh
	WHERE Ma=@MaNV
END
GO

alter PROCEDURE sp_NhanVien_Delete
@MaNV nvarchar(10)
AS
BEGIN
	DELETE FROM NhanVien WHERE Ma=@MaNV
END
GO

alter PROCEDURE sp_KhachHang_Insert
@MaKH nvarchar(10),
@TenKH nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	INSERT INTO KhachHang VALUES(@MaKH, @TenKH, @DiaChi, @SoDT)
END
GO

alter PROCEDURE sp_KhachHang_Update
@MaKH nvarchar(10),
@TenKH nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	UPDATE KhachHang SET Ten=@TenKH, SoDT=@SoDT, DiaChi=@DiaChi
	WHERE Ma=@MaKH
END
GO

alter PROCEDURE sp_KhachHang_Delete
@MaKH nvarchar(10)
AS
BEGIN
	DELETE FROM KhachHang WHERE Ma=@MaKH
END
GO

alter PROCEDURE sp_Xe_Insert
@SoKhung nvarchar(50),
@SoMay nvarchar(50), 
@ChiNhanh nvarchar(10),
@LoaiXe nvarchar(10)
AS
BEGIN
	INSERT INTO Xe VALUES(@SoKhung, @SoMay, @ChiNhanh, @LoaiXe)
END
GO

alter PROCEDURE sp_Xe_Update
@SoKhung nvarchar(50),
@SoMay nvarchar(50), 
@ChiNhanh nvarchar(10),
@LoaiXe nvarchar(10)
AS
BEGIN
	UPDATE Xe SET SoKhung=@SoKhung, MaLoaiXe=@LoaiXe, ChiNhanh=@ChiNhanh
	WHERE SoMay=@SoMay
END
GO

alter PROCEDURE sp_Xe_Delete
@SoMay nvarchar(50)
AS
BEGIN
	DELETE FROM Xe WHERE SoMay=@SoMay
END
GO

alter PROCEDURE sp_LoaiXe_Insert
@MaLoai nvarchar(10),
@TenLoai nvarchar(20),
@Hang nvarchar(10),
@TGBH datetime,
@DongCo nvarchar(20),
@DTXiLanh int,
@MauSac nvarchar(20),
@TrongLuong float,
@Khung nvarchar(30),
@Banh nvarchar(30),
@GiaBan money
AS
BEGIN
	INSERT INTO LoaiXe VALUES(@MaLoai, @TenLoai, @Hang, @TGBH, @DongCo, @DTXiLanh, @MauSac, @TrongLuong, @Khung, @Banh, @GiaBan)
END
GO

alter PROCEDURE sp_LoaiXe_Update
@MaLoai nvarchar(10),
@TenLoai nvarchar(20),
@Hang nvarchar(10),
@TGBH datetime,
@DongCo nvarchar(20),
@DTXiLanh int,
@MauSac nvarchar(20),
@TrongLuong float,
@Khung nvarchar(30),
@Banh nvarchar(30),
@GiaBan money
AS
BEGIN
	UPDATE LoaiXe SET Ten=@TenLoai, MauSac=@MauSac, Hang=@Hang, TGBH=@TGBH, DongCo=@DongCo, TrongLuong=@TrongLuong, DTXiLanh=@DTXiLanh, Khung=@Khung, Banh=@Banh, GiaBan=@GiaBan
	WHERE Ma=@MaLoai
END
GO

alter PROCEDURE sp_LoaiXe_Delete
@MaLoaiXe nvarchar(10)
AS
BEGIN
	DELETE FROM LoaiXe WHERE Ma=@MaLoaiXe
END
GO

alter PROCEDURE sp_Kho_Insert
@MaKho nvarchar(10),
@TenKho nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	INSERT INTO Kho VALUES(@MaKho, @TenKho, @DiaChi, @SoDT, @NVQuanLy)
END
GO

alter PROCEDURE sp_Kho_Update
@MaKho nvarchar(10),
@TenKho nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	UPDATE Kho SET Ten=@TenKho, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQuanLy
	WHERE Ma=@MaKho
END
GO

alter PROCEDURE sp_Kho_Delete
@MaKho nvarchar(10)
AS
BEGIN
	DELETE FROM Kho WHERE Ma=@MaKho
END
GO

alter procedure sp_PhieuXuatKho_Insert
@MaPhieu nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
as
begin
	insert into PhieuXuatKHo values(@MaPhieu, @NgayXuat, @ChiNhanh, @NVXacNhan, @Kho)
end
go

alter procedure sp_CTVanChuyen_Insert
@MaNV nvarchar(10),
@MaPhieuXuatKho nvarchar(10)
as
begin
	insert into CTVanChuyen values(@MaNV, @MaPhieuXuatKho)
end
go

alter procedure sp_HSBanXe_Insert
@MaHS nvarchar(10),
@NgayMua datetime,
@KhachHang nvarchar(10),
@NhanVienBan nvarchar(10),
@MaXe nvarchar(50)
as
begin
	insert into HoSoBanXe values (@MaHS, @NgayMua, @KhachHang, @NhanVienBan, @MaXe)
end
go

alter procedure sp_CTPhieuNhapXe_Insert
@MaPhieu nvarchar(10),
@MaLoai nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	insert into CTPhieuNhapXe values(@MaPhieu, @MaLoai, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuXuatXe_Insert
@MaPhieuXuatKho nvarchar(10),
@MaLoaiXe nvarchar(10),
@SoLuong int
as
begin
	insert into CTPhieuXuatXe values(@MaPhieuXuatKho, @MaLoaiXe, @SoLuong)
end
go

alter procedure sp_CTCungCapXe_Insert
@MaNCC nvarchar(10),
@MaLoaiXe nvarchar(10)
as
begin
	insert into CTCungCapXe values (@MaNCC, @MaLoaiXe)
end
go

alter procedure sp_PhieuNhapXe_Insert
@MaPhieuNhap nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@NVXacNhan nvarchar(10),
@ThoiGian datetime,
@ThanhTien money
as
begin
	insert into PhieuNhapXe values(@MaPhieuNhap, @Kho, @NCC, @NVXacNhan, @ThoiGian, @ThanhTien)
end
go

alter procedure sp_PhieuNhapPhuKien_Insert
@MaPhieu varchar(10),
@ThoiGian datetime,
@NVXacNhan nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@ThanhTien money
as
begin
	insert into PhieuNhapPhuKien values(@MaPhieu, @ThoiGian, @NVXacNhan, @Kho, @NCC, @ThanhTien)
end
go

alter procedure sp_CTCungCapPhuKien_Insert
@NCC nvarchar(10),
@MaLoaiPK nvarchar(10)
as
begin
	insert into CTCungCapPhuKien values(@NCC, @MaLoaiPK)
end
go

alter procedure sp_CTNhapPK_Insert
@MaPhieu nvarchar(10),
@MaLoai nvarchar(10),
@SL int,
@GiaMua money,
@ThanhTien money
as
begin
	insert into CTNhapPhuKien values(@MaPhieu, @MaLoai, @SL, @GiaMua, @ThanhTien)
end
go


alter procedure sp_CTPhieuXuatPK_Insert
@MaPhieu nvarchar(10),
@MaLoaiPK nvarchar(10),
@SL int
as
begin
	insert into CTPhieuXuatPhuKien values(@MaPhieu,@MaLoaiPK,@SL)
end
go

alter procedure sp_PhuKien_Insert
@MaPK nvarchar(10),
@Hang nvarchar(10),
@LoaiPk nvarchar(10)
as
begin
	insert into PhuKien values(@MaPK, @Hang, @LoaiPk)
end
go

alter procedure sp_PhuKien_Update
@MaPK nvarchar(10),
@Hang nvarchar(10),
@LoaiPk nvarchar(10)
as
begin
	update PhuKien set Hang=@Hang, MaLoaiPhuKien=@LoaiPk
	where Ma=@MaPK
end
go

alter procedure sp_PhuKien_Delete
@MaPK nvarchar(10)
as
begin
	delete from PhuKien where Ma=@MaPK
end
go

alter procedure sp_LoaiPhuKien_Insert
@MaLoai nvarchar(10),
@TenLoai nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	insert into LoaiPhuKien values(@MaLoai, @TenLoai, @GiaBan, @GhiChu)
end
go

alter procedure sp_LoaiPhuKien_Update
@MaLoai nvarchar(10),
@TenLoai nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	update LoaiPhuKien set Ten=@TenLoai, GiaBan=@GiaBan, GhiChu=@GhiChu
	where Ma=@MaLoai
end
go

alter procedure sp_LoaiPhuKien_Delete
@MaLoai nvarchar(10)
as
begin
	delete from LoaiPhuKien where Ma=@MaLoai
end
go

alter procedure sp_ChiTietQuyen_Insert
@MaCV nvarchar(10),
@MaQuyen nvarchar(10)
as
begin
	insert into ChiTietQuyen values(@MaCV, @MaQuyen)
end
go

alter procedure sp_ChiTietQuyen_Update
@MaCV nvarchar(10),
@MaQuyen nvarchar(10)
as
begin
	update ChiTietQuyen set MaQuyen=@MaQuyen where MaCV=@MaCV
end
go


alter procedure sp_ChiTietQuyen_Delete
@MaCV nvarchar(10),
@MaQuyen nvarchar(10)
as
begin
	delete from ChiTietQuyen where MaCV=@MaCV and MaQuyen=@MaQuyen
end
go

alter procedure sp_Quyen_Insert
@MaQuyen nvarchar(10),
@TenQuyen nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	insert into Quyen values(@MaQuyen, @TenQuyen, @GhiChu)
end
go

alter procedure sp_Quyen_Update
@MaQuyen nvarchar(10),
@TenQuyen nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	update Quyen set Ten=@TenQuyen, GhiChu=@GhiChu
	where Ma=@MaQuyen
end
go

alter procedure sp_Quyen_Delete
@MaQuyen nvarchar(10)
as
begin
	delete from Quyen where Ma=@MaQuyen
end
go

--Thêm phiếu sửa chữa
alter procedure sp_PhieuSuaChua_Insert
@MaPhieu nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	insert into PhieuSuaChua values (@MaPhieu,@NgaySua,@GhiChu,@NVSua)
END
go

--Them vào Chi tiet sua chua
alter procedure sp_ChiTietSuaChua_Insert
@MaPhieu nvarchar(10),
@MaPhuKien nvarchar(10),
@sl int
AS
BEGIN
	insert into ChiTietSuaChua values (@MaPhieu,@MaPhuKien,@sl)
END
go


--Xóa phiếu sửa chữa khi biết mã phiếu
alter procedure Xoa_PhieuSuaChua
@MaPhieu nvarchar(10)
AS
BEGIN
	delete from PhieuSuaChua where Ma=@MaPhieu
END
go

--Sửa ghi chú của phiếu sửa chữa khi biết mã phiếu
alter procedure CapNhat_PhieuSuaChua
@MaPhieu nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	update PhieuSuaChua set NgaySuaChua=@NgaySua,GhiChu=@GhiChu, NVSuaChua=@NVSua  where Ma=@MaPhieu
END
go

