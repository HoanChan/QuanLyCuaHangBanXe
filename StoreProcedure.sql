use CUAHANG_BANXE;
go

create procedure Thuong_NV
as
begin
	declare nv cursor for select * from NhanVien
	open nv
	declare @MaCV nvarchar(10), @Luong float
	fetch next from nv into @MaCV, @Luong
	while (@@FETCH_STATUS=0)
	begin
		if(@MaCV='GD')
			set @Luong=@Luong+50000
			else
				if(@MaCV='TP')
					set @Luong=@Luong+20000
					else
					set @Luong=@Luong+10000		
	end
	close nv;
	deallocate nv
end
go


CREATE PROCEDURE Them_ChucVu
@MaCV nvarchar(10),
@Ten nvarchar(50)
AS
BEGIN
	Insert into ChucVu values(@MaCV,@Ten)                                                 
END
go

create procedure Xoa_ChucVu
@MaCV nvarchar(10)
AS
BEGIN
	DELETE FROM ChucVu WHERE MaCV=@MaCV
END

go

create procedure Sua_ChucVu
@MaCV nvarchar(10),
@Ten nvarchar(50)
as
begin
	update ChucVu set Ten=@Ten where MaCV=@MaCV
end
go

create procedure Them_NCC
@MaNCC nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	insert into NCC values(@MaNCC,@Ten,@DiaChi, @SoDT)
END
GO

create procedure Xoa_NCC
@MaNCC nvarchar(10)
AS
BEGIN
	delete from NCC where MaNCC=@MaNCC
END
GO

create procedure Sua_NCC
@MaNCC nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	update NCC set Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT where MaNCC=@MaNCC
END
GO

CREATE PROCEDURE Them_ChiNhanh
@MaCN nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	insert into ChiNhanh values(@MaCN,@Ten,@DiaChi,@SoDT)
END
GO

CREATE PROCEDURE Sua_ChiNhanh
@MaCN nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	update ChiNhanh set Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT where MaCN=@MaCN
END
GO

CREATE PROCEDURE Xoa_ChiNhanh
@MaCN nvarchar(10)
AS
BEGIN
	delete from ChiNhanh where MaCN=@MaCN
END
GO

CREATE PROCEDURE Them_NV
@MaNV nvarchar(10),
@Ten nvarchar(50),
@GioiTinh tinyint,
@NgaySinh datetime,
@DiaChi nvarchar(50),
@Luong float,
@SoDT nchar(10),
@Pass nvarchar(200),
@MaCV nvarchar(10)
AS
BEGIN
	INSERT INTO NhanVien VALUES(@MaNV,@Ten,@GioiTinh,@NgaySinh,@DiaChi,@Luong,@SoDT,@Pass,@MaCV)
END
GO

CREATE PROCEDURE Sua_NV
@MaNV nvarchar(10),
@Ten nvarchar(50),
@GioiTinh tinyint,
@NgaySinh datetime,
@DiaChi nvarchar(50),
@Luong float,
@SoDT nchar(10),
@Pass nvarchar(200),
@MaCV nvarchar(10)
AS
BEGIN
	UPDATE NhanVien SET Ten=@Ten,GioiTinh=@GioiTinh, NgaySinh=@NgaySinh,DiaChi=@DiaChi, Luong=@Luong, Password=@Pass, MaCV=@MaCV
	WHERE MaNV=@MaNV
END
GO

CREATE PROCEDURE Xoa_NV
@MaNV nvarchar(10)
AS
BEGIN
	DELETE FROM NhanVien WHERE MaNV=@MaNV
END
GO

CREATE PROCEDURE Them_KH
@MaKH nvarchar(10),
@Ten nvarchar(50),
@SoDT nvarchar(15),
@DiaChi nvarchar(50)
AS
BEGIN
	INSERT INTO KhachHang VALUES(@MaKH,@Ten,@SoDT,@DiaChi)
END
GO

CREATE PROCEDURE Sua_KH
@MaKH nvarchar(10),
@Ten nvarchar(50),
@SoDT nvarchar(15),
@DiaChi nvarchar(50)
AS
BEGIN
	UPDATE KhachHang SET Ten=@Ten, SoDT=@SoDT, DiaChi=@DiaChi
	WHERE MaKH=@MaKH
END
GO

CREATE PROCEDURE Xoa_KH
@MaKH nvarchar(10)
AS
BEGIN
	DELETE FROM KhachHang WHERE MaKH=@MaKH
END
GO

CREATE PROCEDURE Them_Xe
@SoMay nvarchar(50), 
@SoKhung nvarchar(50),
@MaLoaiXe nvarchar(10),
@MaCN nvarchar(10)
AS
BEGIN
	INSERT INTO Xe VALUES(@SoKhung,@SoMay,@MaLoaiXe,@MaCN)
END
GO

CREATE PROCEDURE Sua_Xe
@SoMay nvarchar(50), 
@SoKhung nvarchar(50),
@MaLoaiXe nvarchar(10),
@MaCN nvarchar(10)
AS
BEGIN
	UPDATE Xe SET SoMay=@SoMay, LoaiXe=@MaLoaiXe, ChiNhanh=@MaCN
	WHERE SoKhung=@SoKhung
END
GO

CREATE PROCEDURE Xoa_Xe
@SoKhung nvarchar(50)
AS
BEGIN
	DELETE FROM Xe WHERE SoKhung=@SoKhung
END
GO

CREATE PROCEDURE Them_LoaiXe
@MaLoaiXe nvarchar(10),
@Ten nvarchar(50),
@Mau nvarchar(50),
@Hang nvarchar(10),
@TGBH datetime,
@DongCo nvarchar(20),
@TrongLuong int,
@DungTichXiLanh nvarchar(50),
@Khung nvarchar(30),
@Banh nvarchar(30),
@Gia float
AS
BEGIN
	INSERT INTO LoaiXe VALUES(@MaLoaiXe,@Ten,@Hang,@TGBH,@DongCo,@DungTichXiLanh,@Mau,@TrongLuong,@Khung,@Banh,@Gia)
END
GO

CREATE PROCEDURE Sua_LoaiXe
@MaLoaiXe nvarchar(10),
@Ten nvarchar(50),
@Mau nvarchar(50),
@Hang nvarchar(10),
@TGBH datetime,
@DongCo nvarchar(20),
@TrongLuong int,
@DungTichXiLanh nvarchar(50),
@Khung nvarchar(30),
@Banh nvarchar(30),
@Gia float
AS
BEGIN
	UPDATE LoaiXe SET TenLoai=@Ten,MauSac=@Mau, Hang=@Hang, TGBH=@TGBH, DongCo=@DongCo, TrongLuong=@TrongLuong,DTXiLanh=@DungTichXiLanh,Khung=@Khung,Banh=@Banh,GiaBan=@Gia
	WHERE MaLoai=@MaLoaiXe
END
GO

CREATE PROCEDURE Xoa_LoaiXe
@MaLoaiXe nvarchar(10)
AS
BEGIN
	DELETE FROM LoaiXe WHERE MaLoai=@MaLoaiXe
END
GO

CREATE PROCEDURE Them_Kho
@MaKho nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQL nvarchar(10)
AS
BEGIN
	INSERT INTO Kho VALUES(@MaKho,@Ten,@DiaChi,@SoDT,@NVQL)
END
GO

CREATE PROCEDURE Sua_Kho
@MaKho nvarchar(10),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQL nvarchar(10)
AS
BEGIN
	UPDATE Kho SET TenKho=@Ten, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQL
	WHERE MaKho=@MaKho
END
GO

CREATE PROCEDURE Xoa_Kho
@MaKho nvarchar(10)
AS
BEGIN
	DELETE FROM Kho WHERE MaKho=@MaKho
END
GO

create procedure Them_PhieuXuatKho
@MaPhieu nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
as
begin
	insert into PhieuXuatKHo values(@MaPhieu,@NgayXuat,@ChiNhanh,@NVXacNhan,@Kho)
end
go

create procedure Them_VTVanChuyen
@MaNV nvarchar(10),
@MaPhieuXuat nvarchar(10)
as
begin
	insert into CTVanChuyen values(@MaNV,@MaPhieuXuat)
end
go

create procedure Them_HSBanXe
@MaHS nvarchar(10),
@NgayMua datetime,
@KH nvarchar(10),
@NVBan nvarchar(10),
@MaXe nvarchar(50)
as
begin
	insert into HoSoBanXe values (@MaHS,@NgayMua,@KH,@NVBan,@MaXe)
end
go

create procedure Them_CTPhieuNhapXe
@MaPhieu nvarchar(10),
@MaLoai nvarchar(10),
@Sl int,
@Gia int
as
begin
	insert into CTPhieuNhapXe values(@MaPhieu,@MaLoai,@Sl,@Gia)
end
go

create procedure Them_CTPHieuXuatXe
@MaPhieu nvarchar(10),
@MaLoai nvarchar(10),
@SL int
as
begin
	insert into CTPhieuXuatXe values(@MaPhieu,@MaLoai,@SL)
end
go

create procedure Them_CTCungCapXe
@MaNCC nvarchar(10),
@MaLoai nvarchar(10)
as
begin
	insert into CTCungCapXe values (@MaNCC,@MaLoai)
end
go

create procedure Them_PhieuNhapXe
@MaPhieu nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@NV nvarchar(10),
@ThoiGian datetime
as
begin
	insert into PhieuNhapXe values(@MaPhieu,@Kho,@NCC,@NV,@ThoiGian)
end
go

create procedure Them_PhieuNhapPhuKien
@MaPhieu varchar(10),
@ThoiGian datetime,
@NV nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10)
as
begin
	insert into PhieuNhapPhuKien values(@MaPhieu,@ThoiGian,@NV,@Kho,@NCC)
end
go

create procedure Them_CTCungCapPhuKien
@NCC nvarchar(10),
@MaLoaiPK nvarchar(10)
as
begin
	insert into CTCungCapPhuKien values(@NCC,@MaLoaiPK)
end
go

create procedure Them_CTNhapPK
@MaPhieu nvarchar(10),
@MaLoai nvarchar(10),
@SL int,
@Gia int
as
begin
	insert into CTNhapPhuKien values(@MaPhieu,@MaLoai,@SL,@Gia)
end
go


create procedure Them_CTPhieuXuatPK
@MaPhieu nvarchar(10),
@MaLoaiPK nvarchar(10),
@SL int
as
begin
	insert into CTPhieuXuatPhuKien values(@MaPhieu,@MaLoaiPK,@SL)
end
go

create procedure Them_PhuKien
@MaPK nvarchar(10),
@Hang nvarchar(10),
@LoaiPk nvarchar(10)
as
begin
	insert into PhuKien values(@MaPK,@Hang,@LoaiPk)
end
go

create procedure Sua_PhuKien
@MaPK nvarchar(10),
@Hang nvarchar(10),
@LoaiPk nvarchar(10)
as
begin
	update PhuKien set Hang=@Hang,LoaiPhuKien=@LoaiPk
	where MaPhuKien=@MaPK
end
go

create procedure Xoa_PhuKien
@MaPK nvarchar(10)
as
begin
	delete from PhuKien where MaPhuKien=@MaPK
end
go

create procedure Them_LoaiPhuKien
@MaLoai nvarchar(10),
@TenLoai nvarchar(50),
@GhiChu nvarchar(MAX)
as
begin
	insert into LoaiPhuKien values(@MaLoai,@TenLoai,@GhiChu)
end
go

create procedure Sua_LoaiPK
@MaLoai nvarchar(10),
@TenLoai nvarchar(50),
@GhiChu nvarchar(MAX)
as
begin
	update LoaiPhuKien set TenLoai=@TenLoai,GhiChu=@GhiChu
	where MaLoai=@MaLoai
end
go

create procedure Xoa_LoaiPK
@MaLoai nvarchar(10)
as
begin
	delete from LoaiPhuKien where MaLoai=@MaLoai
end
go

Thêm phiếu sửa chữa
create procedure Them_PhieuSuaChua
@MaPhieu nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	insert into PhieuSuaChua values (@MaPhieu,@NgaySua,@GhiChu,@NVSua)
END
go


--Xóa phiếu sửa chữa khi biết mã phiếu
create procedure Xoa_PhieuSuaChua
@MaPhieu nvarchar(10)
AS
BEGIN
	delete from PhieuSuaChua where MaPhieu=@MaPhieu
END
go



--Sửa ghi chú của phiếu sửa chữa khi biết mã phiếu
create procedure CapNhat_PhieuSuaChua
@MaPhieu nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	update PhieuSuaChua set MaPhieu=@MaPhieu, NgaySuaChua=@NgaySua,GhiChu=@GhiChu, NVSuaChua=@NVSua  where MaPhieu=@MaPhieu
END
go


--Them vào Chi tiet sua chua
create procedure Them_ChiTietSua
@MaPhieu nvarchar(10),
@MaPhuKien nvarchar(10),
@sl int
AS
BEGIN
	insert into ChiTietSuaChua values (@MaPhieu,@MaPhuKien,@sl)
END
go