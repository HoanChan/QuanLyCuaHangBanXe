use CUAHANG_BANXE
go


alter function ft_SoLuongTon (@LoaiXe nvarchar(10))
RETURNS int
AS 
begin
	declare @SLBan int;
	declare @SLNhap int;
	set @SLBan=(select sum(SoLuong) from CTPhieuXuatXe where LoaiXe=@LoaiXe)
	set @SLNhap=(select sum(SoLuong) from CTPhieuNhapXe where LoaiXe=@LoaiXe)
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
@Ma nvarchar(10),
@Ten nvarchar(30)
AS
BEGIN
	Insert into ChucVu values(@Ma, @Ten)                                                 
END
go

alter procedure sp_ChucVu_Delete
@Ma nvarchar(10)
AS
BEGIN
	DELETE FROM ChucVu WHERE Ma=@Ma
END
go

alter procedure sp_ChucVu_Update
@Ma nvarchar(10),
@Ten nvarchar(30)
as
begin
	update ChucVu set Ten=@Ten where Ma=@Ma
end
go

alter procedure sp_NCC_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	insert into NCC values(@Ma, @Ten, @DiaChi, @SoDT)
END
GO

alter procedure sp_NCC_Delete
@Ma nvarchar(10)
AS
BEGIN
	delete from NCC where Ma=@Ma
END
GO

alter procedure sp_NCC_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	update NCC set Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT where Ma=@Ma
END
GO

alter PROCEDURE sp_ChiNhanh_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	insert into ChiNhanh values(@Ma, @Ten, @DiaChi, @SoDT, @NVQuanLy)
END
GO

alter PROCEDURE sp_ChiNhanh_update
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	update ChiNhanh set Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQuanLy where Ma=@Ma
END
GO

alter PROCEDURE sp_ChiNhanh_Delete
@Ma nvarchar(10)
AS
BEGIN
	delete from ChiNhanh where Ma=@Ma
END
GO

alter PROCEDURE sp_NhanVien_Insert
@Ma nvarchar(10),
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
	INSERT INTO NhanVien VALUES(@Ma, @HoTen, @DiaChi, @SoDT, @GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh)
END
GO

alter PROCEDURE sp_NhanVien_Update
@Ma nvarchar(10),
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
	WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_NhanVien_Delete
@Ma nvarchar(10)
AS
BEGIN
	DELETE FROM NhanVien WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_KhachHang_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	INSERT INTO KhachHang VALUES(@Ma, @Ten, @DiaChi, @SoDT)
END
GO

alter PROCEDURE sp_KhachHang_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	UPDATE KhachHang SET Ten=@Ten, SoDT=@SoDT, DiaChi=@DiaChi
	WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_KhachHang_Delete
@Ma nvarchar(10)
AS
BEGIN
	DELETE FROM KhachHang WHERE Ma=@Ma
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
	UPDATE Xe SET SoKhung=@SoKhung, LoaiXe=@LoaiXe, ChiNhanh=@ChiNhanh
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
@Ma nvarchar(10),
@Ten nvarchar(20),
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
	INSERT INTO LoaiXe VALUES(@Ma, @Ten, @Hang, @TGBH, @DongCo, @DTXiLanh, @MauSac, @TrongLuong, @Khung, @Banh, @GiaBan)
END
GO

alter PROCEDURE sp_LoaiXe_Update
@Ma nvarchar(10),
@Ten nvarchar(20),
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
	UPDATE LoaiXe SET Ten=@Ten, MauSac=@MauSac, Hang=@Hang, TGBH=@TGBH, DongCo=@DongCo, TrongLuong=@TrongLuong, DTXiLanh=@DTXiLanh, Khung=@Khung, Banh=@Banh, GiaBan=@GiaBan
	WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_LoaiXe_Delete
@Ma nvarchar(10)
AS
BEGIN
	DELETE FROM LoaiXe WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_Kho_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	INSERT INTO Kho VALUES(@Ma, @Ten, @DiaChi, @SoDT, @NVQuanLy)
END
GO

alter PROCEDURE sp_Kho_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	UPDATE Kho SET Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQuanLy
	WHERE Ma=@Ma
END
GO

alter PROCEDURE sp_Kho_Delete
@Ma nvarchar(10)
AS
BEGIN
	DELETE FROM Kho WHERE Ma=@Ma
END
GO

alter procedure sp_PhieuXuatKho_Insert
@Ma nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
as
begin
	insert into PhieuXuatKHo values(@Ma, @NgayXuat, @ChiNhanh, @NVXacNhan, @Kho)
end
go

alter procedure sp_CTVanChuyen_Insert
@NhanVien nvarchar(10),
@PhieuXuatKho nvarchar(10)
as
begin
	insert into CTVanChuyen values(@NhanVien, @PhieuXuatKho)
end
go

alter procedure sp_HSBanXe_Insert
@Ma nvarchar(10),
@NgayMua datetime,
@KhachHang nvarchar(10),
@NhanVienBan nvarchar(10),
@Xe nvarchar(50)
as
begin
	insert into HoSoBanXe values (@Ma, @NgayMua, @KhachHang, @NhanVienBan, @Xe)
end
go

alter procedure sp_CTPhieuNhapXe_Insert
@PhieuNhapXe nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	insert into CTPhieuNhapXe values(@PhieuNhapXe, @LoaiXe, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuXuatXe_Insert
@PhieuXuatKho nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int
as
begin
	insert into CTPhieuXuatXe values(@PhieuXuatKho, @LoaiXe, @SoLuong)
end
go

alter procedure sp_CTCungCapXe_Insert
@NCC nvarchar(10),
@LoaiXe nvarchar(10)
as
begin
	insert into CTCungCapXe values (@NCC, @LoaiXe)
end
go

alter procedure sp_PhieuNhapXe_Insert
@Ma nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@NVXacNhan nvarchar(10),
@ThoiGian datetime,
@ThanhTien money
as
begin
	insert into PhieuNhapXe values(@Ma, @Kho, @NCC, @NVXacNhan, @ThoiGian, @ThanhTien)
end
go

alter procedure sp_PhieuNhapPhuKien_Insert
@Ma varchar(10),
@ThoiGian datetime,
@NVXacNhan nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@ThanhTien money
as
begin
	insert into PhieuNhapPhuKien values(@Ma, @ThoiGian, @NVXacNhan, @Kho, @NCC, @ThanhTien)
end
go

alter procedure sp_CTCungCapPhuKien_Insert
@NCC nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	insert into CTCungCapPhuKien values(@NCC, @LoaiPhuKien)
end
go

alter procedure sp_CTNhapPhuKien_Insert
@PhieuNhapPhuKien nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	insert into CTNhapPhuKien values(@PhieuNhapPhuKien, @LoaiPhuKien, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuXuatPhuKien_Insert
@PhieuXuatKho nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int
as
begin
	insert into CTPhieuXuatPhuKien values(@PhieuXuatKho,@LoaiPhuKien,@SoLuong)
end
go

alter procedure sp_PhuKien_Insert
@Ma nvarchar(10),
@Hang nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	insert into PhuKien values(@Ma, @Hang, @LoaiPhuKien)
end
go

alter procedure sp_PhuKien_Update
@Ma nvarchar(10),
@Hang nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	update PhuKien set Hang=@Hang, LoaiPhuKien=@LoaiPhuKien
	where Ma=@Ma
end
go

alter procedure sp_PhuKien_Delete
@Ma nvarchar(10)
as
begin
	delete from PhuKien where Ma=@Ma
end
go

alter procedure sp_LoaiPhuKien_Insert
@Ma nvarchar(10),
@Ten nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	insert into LoaiPhuKien values(@Ma, @Ten, @GiaBan, @GhiChu)
end
go

alter procedure sp_LoaiPhuKien_Update
@Ma nvarchar(10),
@Ten nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	update LoaiPhuKien set Ten=@Ten, GiaBan=@GiaBan, GhiChu=@GhiChu
	where Ma=@Ma
end
go

alter procedure sp_LoaiPhuKien_Delete
@Ma nvarchar(10)
as
begin
	delete from LoaiPhuKien where Ma=@Ma
end
go

alter procedure sp_CTQuyen_Insert
@ChucVu nvarchar(10),
@Quyen nvarchar(10)
as
begin
	insert into CTQuyen values(@ChucVu, @Quyen)
end
go

alter procedure sp_CTQuyen_Update
@ChucVu nvarchar(10),
@MaQuyen nvarchar(10)
as
begin
	update CTQuyen set Quyen=@MaQuyen where ChucVu=@ChucVu
end
go

alter procedure sp_CTQuyen_Delete
@ChucVu nvarchar(10),
@MaQuyen nvarchar(10)
as
begin
	delete from CTQuyen where ChucVu=@ChucVu and Quyen=@MaQuyen
end
go

alter procedure sp_Quyen_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	insert into Quyen values(@Ma, @Ten, @GhiChu)
end
go

alter procedure sp_Quyen_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	update Quyen set Ten=@Ten, GhiChu=@GhiChu
	where Ma=@Ma
end
go

alter procedure sp_Quyen_Delete
@Ma nvarchar(10)
as
begin
	delete from Quyen where Ma=@Ma
end
go

alter procedure sp_PhieuSuaChua_Insert
@Ma nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	insert into PhieuSuaChua values (@Ma, @NgaySua, @GhiChu, @NVSua)
END
go

alter procedure sp_CTSuaChua_Insert
@PhieuSuaChua nvarchar(10),
@PhuKien nvarchar(10),
@sl int
AS
BEGIN
	insert into CTSuaChua values (@PhieuSuaChua,@PhuKien,@sl)
END
go

