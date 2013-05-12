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
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from ChucVu where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_NCC_Select
as
begin
	select * from NCC
end
go

alter procedure sp_NCC_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from NCC where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_ChiNhanh_Select
as
begin
	select * from ChiNhanh
end
go

alter PROCEDURE sp_ChiNhanh_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from ChiNhanh where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_NhanVien_Select
as
begin
	select * from NhanVien
end
go

alter PROCEDURE sp_NhanVien_Insert
@Ma nvarchar(10),
@HoTen nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@GioiTinh bit,
@Luong money,
@ChiNhanh nvarchar(10),
@Kho nvarchar(10),
@ChucVu nvarchar(10),
@MatKhau nvarchar(50),
@NgaySinh datetime
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from NhanVien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end

	if(@ChiNhanh='')
		set @ChiNhanh=null
	if(@Kho='')
		set @Kho=null

	set @message= N'[ChiNhanh] và [Kho] không được đồng thời khác null';
	if(@ChiNhanh!= null and @Kho!=null)
	begin
		raiserror (@message, 16, 1)
		return 
	end

	INSERT INTO NhanVien VALUES(@Ma, @HoTen, @DiaChi, @SoDT, @GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh)
END
GO

alter PROCEDURE sp_NhanVien_Update
@Ma nvarchar(10),
@HoTen nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@GioiTinh bit,
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

alter procedure sp_KhachHang_Select
as
begin
	select * from KhachHang
end
go

alter PROCEDURE sp_KhachHang_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from KhachHang where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_Xe_Select
as
begin
	select * from Xe
end
go

alter PROCEDURE sp_Xe_Insert
@SoKhung nvarchar(50),
@SoMay nvarchar(50), 
@ChiNhanh nvarchar(10),
@LoaiXe nvarchar(10)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[SoMay] bị trùng';
	select * from Xe where SoMay=@SoMay
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_LoaiXe_Select
as
begin
	select * from LoaiXe
end
go

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
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from LoaiXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_Kho_Select
as
begin
	select * from Kho
end
go

alter PROCEDURE sp_Kho_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from Kho where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_PhieuXuatKho_Select
as
begin
	select * from PhieuXuatKho
end
go

alter procedure sp_PhieuXuatKho_Insert
@Ma nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from PhieuXuatKho where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into PhieuXuatKHo values(@Ma, @NgayXuat, @ChiNhanh, @NVXacNhan, @Kho)
end
go

alter procedure sp_CTVanChuyen_Select
as
begin
	select * from CTVanChuyen
end
go

alter procedure sp_CTVanChuyen_Insert
@NhanVien nvarchar(10),
@PhieuXuatKho nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[NhanVien] và [PhieuXuatKho] bị trùng';
	select * from CTVanChuyen where NhanVien=@NhanVien and PhieuXuatKho=@PhieuXuatKho
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTVanChuyen values(@NhanVien, @PhieuXuatKho)
end
go

alter procedure sp_HoSoBanXe_Select
as
begin
	select * from HoSoBanXe
end
go

alter procedure sp_HoSoBanXe_Insert
@Ma nvarchar(10),
@NgayMua datetime,
@KhachHang nvarchar(10),
@NhanVienBan nvarchar(10),
@Xe nvarchar(50)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from HoSoBanXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into HoSoBanXe values (@Ma, @NgayMua, @KhachHang, @NhanVienBan, @Xe)
end
go

alter procedure sp_CTPhieuNhapXe_Select
as
begin
	select * from CTPhieuNhapXe
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
	declare @message nvarchar(MAX);	
	set @message= N'[PhieuNhapXe] và [LoaiXe] bị trùng';
	select * from CTPhieuNhapXe where PhieuNhapXe=@PhieuNhapXe and LoaiXe=@loaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTPhieuNhapXe values(@PhieuNhapXe, @LoaiXe, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuXuatXe_Select
as
begin
	select * from CTPhieuXuatXe
end
go

alter procedure sp_CTPhieuXuatXe_Insert
@PhieuXuatKho nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[PhieuXuatKho] và [LoaiXe] bị trùng';
	select * from CTPhieuXuatXe where PhieuXuatKho=@PhieuXuatKho and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTPhieuXuatXe values(@PhieuXuatKho, @LoaiXe, @SoLuong)
end
go

alter procedure sp_CTCungCapXe_Select
as
begin
	select * from CTCungCapXe
end
go

alter procedure sp_CTCungCapXe_Insert
@NCC nvarchar(10),
@LoaiXe nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[NCC] và [LoaiXe] bị trùng';
	select * from CTCungCapXe where NCC=@NCC and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTCungCapXe values (@NCC, @LoaiXe)
end
go

alter procedure sp_PhieuNhapXe_Select
as
begin
	select * from PhieuNhapXe
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
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from PhieuNhapXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into PhieuNhapXe values(@Ma, @Kho, @NCC, @NVXacNhan, @ThoiGian, @ThanhTien)
end
go

alter procedure sp_PhieuNhapPhuKien_Select
as
begin
	select * from PhieuNhapPhuKien
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
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from PhieuNhapPhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into PhieuNhapPhuKien values(@Ma, @ThoiGian, @NVXacNhan, @Kho, @NCC, @ThanhTien)
end
go

alter procedure sp_CTCungCapPhuKien_Select
as
begin
	select * from CTCungCapPhuKien
end
go

alter procedure sp_CTCungCapPhuKien_Insert
@NCC nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[NCC] và [LoaiPhuKien] bị trùng';
	select * from CTCungCapPhuKien where NCC=@NCC and @LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTCungCapPhuKien values(@NCC, @LoaiPhuKien)
end
go

alter procedure sp_CTNhapPhuKien_Select
as
begin
	select * from CTNhapPhuKien
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
	declare @message nvarchar(MAX);	
	set @message= N'[PhieuNhapPhuKien] và [LoaiPhuKien] bị trùng';
	select * from CTNhapPhuKien where PhieuNhapPhuKien=@PhieuNhapPhuKien and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTNhapPhuKien values(@PhieuNhapPhuKien, @LoaiPhuKien, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuXuatPhuKien_Select
as
begin
	select * from CTPhieuXuatPhuKien
end
go

alter procedure sp_CTPhieuXuatPhuKien_Insert
@PhieuXuatKho nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[PhieuXuatKho] và [LoaiPhuKien] bị trùng';
	select * from CTPhieuXuatPhuKien where PhieuXuatKho=@PhieuXuatKho and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTPhieuXuatPhuKien values(@PhieuXuatKho,@LoaiPhuKien,@SoLuong)
end
go

alter procedure sp_PhuKien_Select
as
begin
	select * from PhuKien
end
go

alter procedure sp_PhuKien_Insert
@Ma nvarchar(10),
@Hang nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from PhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_LoaiPhuKien_Select
as
begin
	select * from LoaiPhuKien
end
go

alter procedure sp_LoaiPhuKien_Insert
@Ma nvarchar(10),
@Ten nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from LoaiPhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_CTQuyen_Select
as
begin
	select * from CTQuyen
end
go

alter procedure sp_CTQuyen_Insert
@ChucVu nvarchar(10),
@Quyen nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[ChucVu] và [Quyen] bị trùng';
	select * from CTQuyen where ChucVu=@ChucVu and Quyen=@Quyen
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTQuyen values(@ChucVu, @Quyen)
end
go

alter procedure sp_CTQuyen_Update
@ChucVu nvarchar(10),
@QuyenMoi nvarchar(10),
@QuyenCu nvarchar(10)
as
begin
	update CTQuyen set Quyen=@QuyenMoi where ChucVu=@ChucVu and Quyen=@QuyenCu
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

alter procedure sp_Quyen_Select
as
begin
	select * from Quyen
end
go

alter procedure sp_Quyen_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from Quyen where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
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

alter procedure sp_PhieuSuaChua_Select
as
begin
	select * from PhieuSuaChua
end
go

alter procedure sp_PhieuSuaChua_Insert
@Ma nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from PhieuSuaChua where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into PhieuSuaChua values (@Ma, @NgaySua, @GhiChu, @NVSua)
END
go

alter procedure sp_CTSuaChua_Select
as
begin
	select * from CTSuaChua
end
go

alter procedure sp_CTSuaChua_Insert
@PhieuSuaChua nvarchar(10),
@PhuKien nvarchar(10),
@SoLuong int
AS
BEGIN
	declare @message nvarchar(MAX);	
	set @message= N'[PhieuSuaChua] và [PhuKien] bị trùng';
	select * from CTSuaChua where PhieuSuaChua=@PhieuSuaChua and PhuKien=@PhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into CTSuaChua values (@PhieuSuaChua, @PhuKien, @SoLuong)
END
go

alter procedure sp_Menu_Select
as
begin
	select * from Menu
end
go

alter procedure sp_Menu_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from Menu where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into Menu values(@Ma, @Ten, @GhiChu)
end
go

alter procedure sp_Menu_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	update Menu set Ten=@Ten, GhiChu=@GhiChu
	where Ma=@Ma
end
go

alter procedure sp_Menu_Delete
@Ma nvarchar(10)
as
begin
	delete from Menu where Ma=@Ma
end
go

alter procedure sp_Quyen_Menu_Select
as
begin
	select * from Quyen_Menu
end
go

alter procedure sp_Quyen_Menu_Insert
@Quyen nvarchar(10),
@Menu nvarchar(10)
as
begin
	declare @message nvarchar(MAX);	
	set @message= N'[Quyen] và [Menu] bị trùng';
	select * from Quyen_Menu where Quyen=@Quyen and Menu=@Menu
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		return 
	end
	insert into Quyen_Menu values(@Quyen, @Menu)
end
go

alter procedure sp_Quyen_Menu_Update
@QuyenMoi nvarchar(10),
@Menu nvarchar(10),
@QuyenCu nvarchar(10)
as
begin
	update Quyen_Menu set Quyen=@QuyenMoi
	where Menu=@Menu and Quyen=@QuyenCu
end
go

alter procedure sp_Quyen_Menu_Delete
@Quyen nvarchar(10),
@Menu nvarchar(10)
as
begin
	delete from Quyen_Menu where Quyen=@Quyen and Menu=@Menu
end
go