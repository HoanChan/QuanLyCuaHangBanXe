﻿use CUAHANG_BANXE
go

--exec sp_password '123123123','123123','NV001'

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

alter procedure sp_ChucVu_KiemTra(
@Ma nvarchar(10),
@Ten nvarchar(30),
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 và lớn hơn 30',16,1)
		set @ok=0
	end	
end
GO

alter PROCEDURE sp_ChucVu_Insert
@Ma nvarchar(10),
@Ten nvarchar(30)
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải nhập vào',16,1);
		set @ok=0;
	end

	declare @message nvarchar(MAX);	
	set @message= N'[Ma]Bị trùng';
	select * from ChucVu where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		set @ok = 0
	end
	
	EXECUTE dbo.sp_ChucVu_KiemTra @Ma, @Ten, @ok output

	if(@ok = 0)
		return

	exec @ok = sp_addrole @Ma 

	if(@ok<>0)
		raiserror(N'[_Msg]Thêm thất bại',16,1)
	else
	begin
	Insert into ChucVu values(@Ma, @Ten)
		if(@@ERROR<>0)
				raiserror(N'[_Msg]Thêm thất bại',16,1)
			else
				raiserror(N'[_Msg]Đã thêm thành công',16,1)
	end
END
go

alter procedure sp_ChucVu_Delete
@Ma nvarchar(10)
AS
BEGIN
	declare nv cursor for select Ma from NhanVien where ChucVu=@Ma
	open nv
	declare @MaNV nvarchar(10);
	fetch next from nv into @MaNV
	while (@@FETCH_STATUS=0)
	begin
		exec sp_droprolemember @Ma, @MaNV

		fetch next from nv into @MaNV
	end
	close nv;
	deallocate nv

	exec sp_droprole @Ma
	DELETE FROM ChucVu WHERE Ma=@Ma
END
go

alter procedure sp_ChucVu_Update
@Ma nvarchar(10),
@Ten nvarchar(30)
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải nhập vào',16,1);
		set @ok=0;
	end
	select * from ChucVu where Ma=@Ma
	if(@@ROWCOUNT=0)
	begin
		raiserror (N'[Ma]Không tồn tại', 16, 1)
		set @ok=0
	end
	if(@ok = 0)
		return

	update ChucVu set Ten=@Ten where Ma=@Ma
	if(@@ERROR<>0)
			raiserror(N'[_Msg]Cập nhật thất bại',16,1)
		else
			raiserror(N'[_Msg]Đã cập nhật thành công',16,1)
end
go

alter procedure sp_NCC_Select
as
begin
	select * from NCC
end
go

alter procedure sp_NCC_KiemTra(
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@Ok bit output)
as
begin
	if(len(@Ten)not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 30',16,1)
		set @ok=0
	end
	if(len(@DiaChi)not between 1 and 50)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
	if(len(@SoDT)not between 10 and 15)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 10 hoặc lớn hơn 15',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_NCC_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15)
AS
BEGIN
	declare @ok bit
	set @ok=1
	if(@Ma is null)
	begin
		raiserror(N'[Ma]Phải được nhập vào',16,1)
		set @ok=0
	end
	
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from NCC where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		return 
	end
	execute dbo.sp_NCC_KiemTra @Ten, @DiaChi, @SoDT, @ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	execute dbo.sp_NCC_KiemTra @Ten, @DiaChi, @SoDT, @ok output
	if(@ok<>0)
		update NCC set Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT where Ma=@Ma
END
GO

alter procedure sp_ChiNhanh_Select
as
begin
	select * from ChiNhanh
end
go

alter procedure sp_ChiNhanh_KiemTra(
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10),
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 và lớn hơn 30',16,1)
		set @ok=0
	end

	if(len(@DiaChi) not between 1 and 50)
	begin
		raiserror( N'[DiaChi]Số lượng ký tự không được ít hơn 1 và lớn hơn 50',16,1)
		set @ok=0
	end
	
	if(len(@SoDT)not between 10 and 15 )
	begin
		raiserror( N'[SoDT]Số lượng ký tự không được ít hơn 10 và lớn hơn 15',16,1)
		set @ok=0
	end
end
GO

alter PROCEDURE sp_ChiNhanh_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	declare @ok bit;
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror ('N[Ma]Phải được nhập vào',16,1)
		set @ok=0
	end
	
	select * from ChiNhanh where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] Bị trùng', 16, 1)
		set @ok=0
	end

	EXECUTE  dbo.sp_ChiNhanh_KiemTra @Ma, @Ten, @DiaChi, @SoDT,@NVQuanLy, @ok output

	if(@ok <> 0)
		insert into ChiNhanh values(@Ma, @Ten, @DiaChi, @SoDT, @NVQuanLy)
END
GO

alter PROCEDURE sp_ChiNhanh_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	if(@Ma is null)
	begin
		raiserror ('N[Ma]Phải được nhập vào',16,1)
		set @ok=0
	end
	
	select * from ChiNhanh where Ma=@Ma
	if(@@ROWCOUNT=0)
	begin
		raiserror (N'[Ma] Không tồn tại', 16, 1)
		set @ok=0
	end

	EXECUTE  dbo.sp_ChiNhanh_KiemTra @Ma, @Ten, @DiaChi, @SoDT, @NVQuanLy, @ok output
	if(@ok = 0)
		return
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

alter procedure sp_NhanVien_KiemTra(
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
@NgaySinh datetime,
@Ok bit output)
as
begin
	if(@ChiNhanh is not null and @Kho is not null)
	begin
		raiserror( N'[ChiNhanh]Chi nhánh và kho chỉ được chọn 1',16,1)
		raiserror( N'[Kho]Chi nhánh và kho chỉ được chọn 1',16,1)
		set @ok=0
	end

	if(@ChiNhanh is null and @Kho is null)
	begin
		raiserror( N'[ChiNhanh]Cần chọn giá trị',16,1)
		raiserror( N'[Kho]Cần chọn giá trị',16,1)
		set @ok=0
	end

	if(@HoTen is null)
	begin
		raiserror( N'[HoTen]Không được để trống',16,1)
		set @ok=0
	end

	if(len(@HoTen) not between 1 and 30)
	begin
		raiserror( N'[HoTen][1,30]',16,1)
		set @ok=0
	end

	if(@DiaChi is null)
	begin
		raiserror( N'[DiaChi]Không được để trống',16,1)
		set @ok=0
	end

	if(len(@DiaChi) > 50)
	begin
		raiserror( N'[DiaChi]Không nhập nhiều quá 50 kí tự',16,1)
		set @ok=0
	end

	if(@SoDT is null)
	begin
		raiserror( N'[SoDT]Không được để trống',16,1)
		set @ok=0
	end
	
	if(len(@SoDT)not between 10 and 15 )
	begin
		raiserror( N'[SoDT]Không ít hơn 10 kí tự và không nhiều quá 15 kí tự',16,1)
		set @ok=0
	end

	if(@Luong <= 0)
	begin
		raiserror( N'[Luong]Phải > 0',16,1)
		set @ok=0
	end

	if(@ChucVu is null)
	begin
		raiserror( N'[ChucVu]Cần chọn giá trị',16,1)
		set @ok=0
	end

	if(@MatKhau is null)
	begin
		raiserror( N'[MatKhau]Không được để trống',16,1)
		set @ok=0
	end

	if(len(@MatKhau) not between 3 and 50)
	begin
		raiserror( N'[MatKhau]Không ít hơn 3 kí tự và không nhiều quá 50 kí tự',16,1)
		set @ok=0
	end

	if(@NgaySinh is null)
	begin
		raiserror( N'[NgaySinh]Phải chọn giá trị',16,1)
		set @ok=0
	end

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
	declare @ok bit;
	set @ok=1

	if(@Ma is null)
	begin
		raiserror( N'[Ma]Không được để trống',16,1)
		set @ok=0
	end

	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end

	declare @message nvarchar(MAX);	
	set @message= N'[Ma] bị trùng';
	select * from NhanVien where Ma=@Ma

	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		set @ok=0
	end

	EXECUTE  dbo.sp_NhanVien_KiemTra @Ma, @HoTen, @DiaChi, @SoDT,@GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh, @ok output

	if(@ok=0) return
	
	--exec sp_addlogin @Ma, @MatKhau
	--exec sp_adduser @Ma, @Ma
	--exec sp_addrolemember @ChucVu, @Ma

	exec @ok = sp_addlogin @Ma, @MatKhau
	if(@ok=0)
	begin
		exec @ok = sp_adduser @Ma, @Ma
		if(@ok=0)
		begin
			exec @ok = sp_addrolemember @ChucVu, @Ma
			if(@ok<>0)
			begin
				exec sp_dropuser @Ma
				exec sp_droplogin @Ma
			end
		end
		else
			exec sp_droplogin @Ma
	end
	
	if(@ok<>0)
		raiserror(N'[_Msg]Đã thêm thất bại',16,1)
	else
	begin 
		INSERT INTO NhanVien VALUES(@Ma, @HoTen, @DiaChi, @SoDT, @GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh)
		if(@@ERROR<>0)
			raiserror(N'[_Msg]Đã thêm thất bại',16,1)
		else
			raiserror(N'[_Msg]Đã thêm thành công',16,1)
	end
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
	declare @ok bit;
	set @ok=1;

	EXECUTE  dbo.sp_NhanVien_KiemTra @Ma, @HoTen, @DiaChi, @SoDT,@GioiTinh, @Luong, @ChiNhanh, @Kho, @ChucVu, @MatKhau, @NgaySinh, @ok output

	if(@ok=0)
		return

	declare @ChucVuCu nvarchar(10), @MatKhauCu nvarchar(50);
	select @MatKhauCu=MatKhau, @ChucVuCu=ChucVu from NhanVien where Ma=@Ma
	set @ok=0
	if(@MatKhauCu <> @MatKhau)
	begin
		--exec ('alter login ' + @Ma + ' with password = ''' + @MatKhau + '''OLD_PASSWORD = '''+ @MatKhauCu+'''')
		exec @ok =  sp_password @MatKhauCu, @MatKhau, @Ma
	end

	if(@ChucVuCu <> @ChucVu)
	begin
		if(@ChucVuCu is null)
		begin
			exec @ok = sp_addrolemember @ChucVu, @Ma
		end
		else
			begin
				exec @ok = sp_droprolemember @ChucVuCu, @Ma
				exec @ok = sp_addrolemember @ChucVu, @Ma
			end
	end

	--if(@ChucVuCu <> @ChucVu or @MatKhauCu <> @MatKhau)
	--begin
	--	if(@ChucVuCu is not null)
	--		exec @ok = sp_droprolemember @ChucVuCu, @Ma
	--	exec @ok = sp_dropuser @Ma
	--	exec @ok = sp_droplogin @Ma
	--	exec @ok = sp_addlogin @Ma, @MatKhau
	--	exec @ok = sp_adduser @Ma, @Ma
	--	exec @ok = sp_addrolemember @ChucVu, @Ma
	--end
	if(@ok <> 0)
	begin
		raiserror(N'[_Msg]Cập nhật thất bại',16,6)
		return
	end

	UPDATE NhanVien SET HoTen=@HoTen, DiaChi=@DiaChi, SoDT=@SoDT, GioiTinh=@GioiTinh, Luong=@Luong, ChiNhanh=@ChiNhanh, Kho=@Kho, ChucVu=@ChucVu, NgaySinh=@NgaySinh
		WHERE Ma=@Ma
	if(@@ERROR<>0)
		raiserror(N'[_Msg]Cập nhật thất bại',16,1)
	else
		raiserror(N'[_Msg]Đã cập nhật thành công',16,1)
END
GO

alter PROCEDURE sp_NhanVien_Delete
@Ma nvarchar(10)
AS
BEGIN
	declare @ChucVu nvarchar(10);
	select @ChucVu=ChucVu from NhanVien where Ma=@Ma
	declare @ok bit;
	set @ok=0
	exec @ok = sp_droprolemember @ChucVu, @Ma
	if(@ok=0)
	begin
		exec @ok = sp_dropuser @Ma
		if(@ok=0)
		begin
			exec @ok = sp_droplogin @Ma
			if(@ok<>0)
				exec sp_adduser @Ma, @Ma
		end
		else
			exec sp_addrolemember @ChucVu, @Ma
	end

	if(@ok=0)
	begin
		DELETE FROM NhanVien WHERE Ma=@Ma
		if(@@ERROR <> 0)
			raiserror(N'[_Msg]Xóa thất bại',16,1)
		else
			raiserror(N'[_Msg]Xóa thành công',16,1)
	end
	else
		raiserror(N'[_Msg]Xóa thất bại',16,1)
END
GO

alter procedure sp_KhachHang_Select
as
begin
	select * from KhachHang
end
go

alter procedure sp_KhachHang_KiemTra(
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 30',16,1)
		set @ok=0
	end
	
	if(len(@DiaChi) not between 1 and 50)
	begin
		raiserror( N'[DiaChi]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
	
	if(len(@SoDT) not between 10 and 15)
	begin
		raiserror( N'[SoDT]Số lượng ký tự không được ít hơn 10 hoặc nhỏ hơn 15',16,1)
		set @ok=0
	end
	
end
GO

alter PROCEDURE sp_KhachHang_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15)
AS
BEGIN
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from KhachHang where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	
	Execute dbo.sp_KhachHang_KiemTra @Ten, @DiaChi, @SoDT, @ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	
	Execute dbo.sp_KhachHang_KiemTra @Ten, @DiaChi, @SoDT, @ok output
	if(@ok<>0)
		Update KhachHang set Ten=@Ten, DiaChi=@DiaChi,SoDT=@SoDT where Ma=@Ma
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

alter procedure sp_Xe_KiemTra(
@SoKhung nvarchar(50),
@Ok bit output)
as
begin
	if(len(@SoKhung) not between 1 and 50)
	begin
		raiserror( N'[SoKhung]Số lượng kí tự không ít hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
end
GO

alter PROCEDURE sp_Xe_Insert
@SoKhung nvarchar(50),
@SoMay nvarchar(50), 
@ChiNhanh nvarchar(10),
@LoaiXe nvarchar(10)
AS
BEGIN
	declare @ok bit
	set @ok=1
	
	if(@SoMay is null)
	begin
		raiserror (N'[SoMay]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@SoMay)not between 1 and 50)
	begin
		raiserror (N'[SoMay]Không được ít hơn 1 hoặc lớn hơn 50 kí tự',16,1)
		set @ok=0
	end
	
	select * from Xe where SoMay=@SoMay
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[SoMay]Bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_Xe_KiemTra @SoMay, @ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	execute dbo.sp_Xe_KiemTra @SoKhung, @ok output
	if(@ok<>0)
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

alter procedure sp_LoaiXe_KiemTra(
@Ten nvarchar(20),
@Hang nvarchar(10),
@TGBH datetime,
@DongCo nvarchar(20),
@DTXiLanh int,
@MauSac nvarchar(20),
@TrongLuong float,
@Khung nvarchar(30),
@Banh nvarchar(30),
@GiaBan money,
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 20)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 20',16,1)
		set @ok=0
	end
	
	if(len(@Hang) not between 1 and 10)
	begin
		raiserror( N'[Hang]Số lượng kí tự không được ít hơn 1 hoặc lớn hơn 10',16,1)
		set @ok=0
	end
	if(@TGBH is null)
	begin
		raiserror( N'[TGBH]Phải được nhập vào',16,1)
		set @ok=0
	end
	if(len(@DongCo) not between 1 and 20)
	begin
		raiserror( N'[DongCo]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 20',16,1)
		set @ok=0
	end
	
	if(@DTXiLanh<=0)
	begin
		raiserror( N'[DTXiLanh]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	if(len(@MauSac) not between 1 and 20)
	begin
		raiserror( N'[MauSac]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 20',16,1)
		set @ok=0
	end
	if(@TrongLuong<=0)
	begin
		raiserror( N'[TrongLuong]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
	if(len(@Khung) not between 1 and 30)
	begin
		raiserror( N'[Khung]Số lượng kí tự không được ít hơn 1 hoặc lớn hơn 30',16,1)
		set @ok=0
	end
	if(len(@Banh) not between 1 and 30)
	begin
		raiserror( N'[Banh]Số lượng kí tự không được ít hơn 1 hoặc lớn hơn 30',16,1)
		set @ok=0
	end
	
	if(@GiaBan<=0)
	begin
		raiserror( N'[GiaBan]Phải lớn hơn 0 ',16,1)
		set @ok=0
	end
	
end
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
	declare @ok bit
	set @ok=1
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from LoaiXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		set @ok=0 
	end
	
	execute dbo.sp_LoaiXe_KiemTra @Ten, @Hang, @TGBH, @DongCo, @DTXiLanh, @MauSac, @TrongLuong, @Khung, @Banh, @GiaBan, @ok output
	if(@ok<>0)
		INSERT INTO LoaiXe 
		VALUES(@Ma, @Ten, @Hang, @TGBH, @DongCo, @DTXiLanh, @MauSac, @TrongLuong, @Khung, @Banh, @GiaBan)
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
	declare @ok bit;
	set @ok=1
	execute dbo.sp_LoaiXe_KiemTra @Ten, @Hang, @TGBH, @DongCo, @DTXiLanh, @MauSac, @TrongLuong, @Khung, @Banh, @GiaBan, @ok output
	if(@ok<>0)
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

alter procedure sp_Kho_KiemTra(
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
	
	if(len(@DiaChi)not between 1 and 50)
	begin
		raiserror( N'[DiaChi]Số lượng kí tự không được nhỏ hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
	
	if(len(@SoDT)not between 10 and 15)
	begin
		raiserror( N'[SoDT]Số lượng kí tự không được nhỏ hơn 10 hoặc lớn hơn 15',16,1)
		set @ok=0
	end
end
GO

alter PROCEDURE sp_Kho_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@DiaChi nvarchar(50),
@SoDT nvarchar(15),
@NVQuanLy nvarchar(10)
AS
BEGIN
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from Kho where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	
	Execute dbo.sp_Kho_KiemTra @Ten,@DiaChi,@SoDt,@ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	
	Execute dbo.sp_Kho_KiemTra @Ten,@DiaChi,@SoDt,@ok output
	if(@ok<>0)
		Update  Kho set  Ten=@Ten, DiaChi=@DiaChi, SoDT=@SoDT, NVQuanLy=@NVQuanLy where Ma=@Ma
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

alter procedure sp_PhieuXuatKho_KiemTra(
@NgayXuat datetime,
@Ok bit output)
as
begin
	if(@NgayXuat is null)
	begin
		raiserror( N'[NgayXuat]Phải được nhập vào',16,1)
		set @ok=0
	end
	if(YEAR(@NgayXuat)<1950)
	begin
		raiserror( N'[NgayXuat]Phải lớn hơn 1950',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_PhieuXuatKho_Insert
@Ma nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
as
begin
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from PhieuXuatKho where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_PhieuXuatKho_KiemTra @NgayXuat, @ok output
	if(@ok<>0)
		insert into PhieuXuatKho values(@Ma, @NgayXuat, @ChiNhanh, @NVXacNhan, @Kho)
end
go

alter PROCEDURE sp_PhieuXuatKho_Update
@Ma nvarchar(10),
@NgayXuat datetime,
@ChiNhanh nvarchar(10),
@NVXacNhan nvarchar(10),
@Kho nvarchar(10)
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	execute dbo.sp_PhieuXuatKho_KiemTra @NgayXuat, @ok output
	if(@ok <> 0)	
		UPDATE PhieuXuatKho SET NgayXuat=@NgayXuat,ChiNhanh=@ChiNhanh,NVXacNhan=@NVXacNhan,Kho=@Kho
		WHERE Ma=@Ma
END
GO

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
	declare @ok bit;
	set @ok=1;
	
	if(@NhanVien is null)
	begin
		raiserror (N'[NhanVien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTVanChuyen where NhanVien=@NhanVien and PhieuXuatKho=@PhieuXuatKho
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[NhanVien]Bị trùng', 16, 1)
		raiserror (N'[PhieuXuatKho]Bị trùng', 16, 1)
		set @ok=0; 
	end
	if(@ok<>0)
		insert into CTVanChuyen values(@NhanVien, @PhieuXuatKho)
end
go

alter procedure sp_CTVanChuyen_Update
@NhanVien nvarchar(10),
@PhieuXuatKho nvarchar(10)
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@NhanVien is null)
	begin
		raiserror (N'[NhanVien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTVanChuyen where NhanVien=@NhanVien and PhieuXuatKho=@PhieuXuatKho
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[NhanVien] và [PhuKien]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	if(@ok<>0)
		update CTVanChuyen set NhanVien=@NhanVien,PhieuXuatKho=@PhieuXuatKho
				where PhieuXuatKho=@PhieuXuatKho
end
GO

alter procedure sp_HoSoBanXe_Select
as
begin
	select * from HoSoBanXe
end
go

alter procedure sp_HoSoBanXe_KiemTra(
@NgayMua datetime,
@Ok bit output)
as
begin
	if(@NgayMua is null)
	begin
		raiserror (N'[NgayMua]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
end
GO

alter procedure sp_HoSoBanXe_Insert
@Ma nvarchar(10),
@NgayMua datetime,
@KhachHang nvarchar(10),
@NhanVienBan nvarchar(10),
@Xe nvarchar(50)
as
begin
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from HoSoBanXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		set @ok=0
	end
	
	Execute dbo.sp_HoSoBanXe_KiemTra @NgayMua, @ok output
	
	if(@ok<>0)
		insert into HoSoBanXe values (@Ma, @NgayMua, @KhachHang, @NhanVienBan, @Xe)
end
go

alter procedure sp_HoSoBanXe_Update
@Ma nvarchar(10),
@NgayMua datetime,
@KhachHang nvarchar(10),
@NhanVienBan nvarchar(10),
@Xe nvarchar(50)
as
begin
	declare @ok bit
	set @ok=1
	
	
	if(@KhachHang is null)
	begin
		raiserror (N'[KhachHang]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(@NhanVienBan is null)
	begin
		raiserror (N'[NhanVienBan]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(@Xe is null)
	begin
		raiserror (N'[Xe]Phải được nhập vào', 16, 1)
		set @ok=0
	end

	Execute dbo.sp_HoSoBanXe_KiemTra @NgayMua, @ok output
	if(@ok<>0)
		update HoSoBanXe set NgayMua=@NgayMua,KhachHang=@KhachHang, NhanVienBan=@NhanVienBan, Xe=@Xe
			where Ma=@Ma
end
GO

alter procedure sp_CTPhieuNhapXe_Select
as
begin
	select * from CTPhieuNhapXe
end
go

alter procedure sp_CTPhieuNhapXe_KiemTra(
@SoLuong int,
@GiaMua money,
@ThanhTien money,
@Ok bit output)
as
begin
	if(@SoLuong <=0)
	begin
		raiserror( N'[SoLuong]Phải lớn hơn 0',16,1)
		set @ok=0
	end

	if(@GiaMua <=0)
	begin
		raiserror( N'[GiaMua]Phải lớn hơn 0',16,1)
		set @ok=0
	end

	
	if(@ThanhTien<=0)
	begin
		raiserror( N'[ThanhTien]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
end
GO

alter procedure sp_CTPhieuNhapXe_Insert
@PhieuNhapXe nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	declare @ok bit
	set @ok=1;
	
	if(@PhieuNhapXe is null)
	begin
		raiserror (N'[PhieuNhapXe]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTPhieuNhapXe where PhieuNhapXe=@PhieuNhapXe and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhieuNhapXe] bị trùng', 16, 1)
		raiserror (N'[LoaiXe] bị trùng', 16, 1)
		set @ok=0; 
	end
	
	Execute dbo.sp_CTPhieuNhapXe_KiemTra @SoLuong, @GiaMua, @ThanhTien, @ok output 
	
	if(@ok<>0)
		insert into CTNhapPhuKien values(@PhieuNhapXe, @LoaiXe, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTPhieuNhapXe_Update
@PhieuNhapXe nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuNhapXe is null)
	begin
		raiserror (N'[PhieuNhapXe]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	select * from CTPhieuNhapXe where PhieuNhapXe=@PhieuNhapXe and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhieuNhapXe]Bị trùng', 16, 1)
		raiserror (N'[LoaiXe]Bị trùng', 16, 1)
		set @ok=0
	end
	
	Execute dbo.sp_CTPhieuNhapXe_KiemTra @SoLuong, @GiaMua, @ThanhTien, @ok output 
	
	if(@ok<>0)
		update CTPhieuNhapXe set PhieuNhapXe=@PhieuNhapXe,LoaiXe=@LoaiXe,
	 GiaMua=@GiaMua, SoLuong=@SoLuong, ThanhTien=@ThanhTien where PhieuNhapXe=@PhieuNhapXe
end
GO

alter procedure sp_CTPhieuXuatXe_Select
as
begin
	select * from CTPhieuXuatXe
end
go

alter procedure sp_CTPhieuXuatXe_KiemTra(
@SoLuong int,
@Ok bit output)
as
begin
	if(@SoLuong<=0)
	begin
		raiserror( N'[SoLuong]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
end
GO

alter procedure sp_CTPhieuXuatXe_Insert
@PhieuXuatKho nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	select * from CTPhieuXuatXe where PhieuXuatKho=@PhieuXuatKho and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[LoaiPhuKien] bị trùng', 16, 1)
		raiserror (N'[PhieuXuatKho] bị trùng', 16, 1)
		set @ok=0
	end
	
	Execute dbo.sp_CTPhieuXuatXe_KiemTra @SoLuong, @ok output 

	if(@ok<>0)
		insert into CTPhieuXuatXe values(@PhieuXuatKho, @LoaiXe, @SoLuong)
end
go

alter procedure sp_CTPhieuXuatXe_Update
@PhieuXuatKho nvarchar(10),
@LoaiXe nvarchar(10),
@SoLuong int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok=0;
	end

	select * from CTPhieuXuatXe where PhieuXuatKho=@PhieuXuatKho and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhieuXuatKho]Bị trùng', 16, 1)
		raiserror (N'[LoaiXe]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	execute dbo.sp_CTPhieuXuatXe_KiemTra @SoLuong, @ok output
	if(@ok <>0 )
		update CTPhieuXuatXe set PhieuXuatKho=@PhieuXuatKho,LoaiXe=@LoaiXe,
	 SoLuong=@SoLuong where PhieuXuatKho=@PhieuXuatKho
end
GO

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
	declare @ok bit
	set @ok =1
	
	if(@NCC is null)
	begin
		raiserror (N'[NCC]Phải được nhập vào', 16, 1)
		set @ok =0
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok =0
	end

	select * from CTCungCapXe where NCC=@NCC and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror ( N'[NCC]Bị trùng', 16, 1)
		raiserror ( N'[LoaiXe]Bị trùng', 16, 1)
		set @ok =0
	end
	
	if(@ok<>0)
		insert into CTCungCapXe values(@NCC, @LoaiXe)
end
go

alter procedure sp_CTCungCapXe_Update
@NCC nvarchar(10),
@LoaiXe nvarchar(10)
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@NCC is null)
	begin
		raiserror (N'[NCC]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiXe is null)
	begin
		raiserror (N'[LoaiXe]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTCungCapXe where NCC=@NCC and LoaiXe=@LoaiXe
	if(@@ROWCOUNT>0)
	begin
		raiserror ('[LoaiXe]Bị trùng', 16, 1)
		raiserror ('[NCC]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	if(@ok<>0)
		update CTCungCapXe set NCC=@NCC,LoaiXe=@LoaiXe where NCC=@NCC
end
GO

alter procedure sp_PhieuNhapXe_Select
as
begin
	select * from PhieuNhapXe
end
go

alter procedure sp_PhieuNhapXe_KiemTra(
@ThoiGian datetime,
@ThanhTien money,
@Ok bit output)
as
begin
	if(@ThoiGian is null)
	begin
		raiserror( N'[ThoiGian]Phải được nhập vào',16,1)
		set @ok=0
	end

	if(@ThanhTien <= 0)
	begin
		raiserror( N'[ChiNhanh]Phải lớn hơn 0',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_PhieuNhapXe_Insert
@Ma nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@NVXacNhan nvarchar(10),
@ThoiGian datetime,
@ThanhTien money
as
begin
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from PhieuNhapXe where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		return 
	end
	
	execute dbo.sp_PhieuNhapXe_KiemTra @ThoiGian, @ThanhTien, @ok output
	if(@ok <> 0)
		insert into PhieuNhapXe values(@Ma, @Kho, @NCC, @NVXacNhan, @ThoiGian, @ThanhTien)
end
go

alter PROCEDURE sp_PhieuNhapXe_Update
@Ma nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@NVXacNhan nvarchar(10),
@ThoiGian datetime,
@ThanhTien money
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	execute dbo.sp_PhieuNhapXe_KiemTra @ThoiGian, @ThanhTien, @ok output
	if(@ok <> 0)	
		UPDATE PhieuNhapXe SET Kho=@Kho, NCC=@NCC, NVXacNhan=@NVXacNhan, ThoiGian=@ThoiGian, ThanhTien=@ThanhTien
		WHERE Ma=@Ma
END
GO

alter procedure sp_PhieuNhapPhuKien_Select
as
begin
	select * from PhieuNhapPhuKien
end
go

alter procedure sp_PhieuNhapPhuKien_KiemTra(
@ThoiGian datetime,
@ThanhTien money,
@Ok bit output)
as
begin
	if(@ThoiGian is null)
	begin
		raiserror( N'[ThoiGian]Phải được nhập vào',16,1)
		set @ok=0
	end

	if(@ThanhTien <= 0)
	begin
		raiserror( N'[ChiNhanh]Phải lớn hơn 0',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_PhuKien_KiemTra(
@Hang nvarchar(10),
@Ok bit output)
as
begin
	if(len(@Hang) not between 1 and 10)
	begin
		raiserror( N'[Hang]Số lượng kí tự không ít hơn 1 hoặc lớn hơn 10',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_PhieuNhapPhuKien_KiemTra(
@ThoiGian datetime,
@ThanhTien money,
@Ok bit output)
as
begin
	if(@ThoiGian is null)
	begin
		raiserror( N'[ThoiGian]Phải được nhập vào',16,1)
		set @ok=0
	end

	if(@ThanhTien <= 0)
	begin
		raiserror( N'[ChiNhanh]Phải lớn hơn 0',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_PhieuNhapPhuKien_Insert
@Ma varchar(10),
@ThoiGian datetime,
@NVXacNhan nvarchar(10),
@Kho nvarchar(10),
@NCC nvarchar(10),
@ThanhTien money
as
begin
	declare @ok bit
	set @ok =1
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào',16,1)
		set @ok=0
	end
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	select * from PhieuNhapPhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_PhieuNhapPhuKien_KiemTra @ThoiGian,@ThanhTien
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	if(@NCC is null)
	begin
		raiserror (N'[NCC]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	declare @message nvarchar(MAX);	
	set @message= N'[NCC]Không tồn tại';
	
	select * from NCC where Ma=@NCC
	if(@@ROWCOUNT=0)
	begin
		raiserror (@message, 16, 1)
		set @ok=0
	end
	
	set @message= N'[LoaiPhuKien]Không tồn tại';
	select * from LoaiPhuKien where Ma=@LoaiPhuKien
	if(@@ROWCOUNT=0)
	begin
		raiserror (@message, 16, 1)
		set @ok=0
	end
	
	set @message= N'[NCC] và [LoaiPhuKien]Bị trùng';
	select * from CTCungCapPhuKien where NCC=@NCC and @LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (@message, 16, 1)
		set @ok=0
	end
	
	if(@ok<>0)
		insert into CTCungCapPhuKien values(@NCC, @LoaiPhuKien)
end
go

alter procedure sp_CTCungCapPhuKien_Update
@NCC nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	declare @ok bit
	set @ok =1
	
	if(@NCC is null)
	begin
		raiserror (N'[NCC]Phải được nhập vào', 16, 1)
		set @ok =0
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok =0
	end
	
	if(@ok <>0)
		update CTCungCapPhuKien set NCC=@NCC,LoaiPhuKien=@LoaiPhuKien where NCC=@NCC
end
GO

alter procedure sp_CTNhapPhuKien_Select
as
begin
	select * from CTNhapPhuKien
end
go

alter procedure sp_CTNhapPhuKien_KiemTra(
@SoLuong int,
@GiaMua money,
@ThanhTien money,
@Ok bit output)
as
begin
	if(@SoLuong<=0)
	begin
		raiserror( N'[@SoLuong]Phải lớn hơn 0',16,1)
		set @ok=0
	end

	if(@GiaMua<=0)
	begin
		raiserror( N'[@GiaMua]Phải lớn hơn 0',16,1)
		set @ok=0
	end

	
	if(@ThanhTien<=0 )
	begin
		raiserror( N'[ThanhTien]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
end
GO

alter procedure sp_CTNhapPhuKien_Insert
@PhieuNhapPhuKien nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	declare @ok bit
	set @ok=1;
	
	if(@PhieuNhapPhuKien is null)
	begin
		raiserror (N'[PhieuNhapPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTNhapPhuKien where PhieuNhapPhuKien=@PhieuNhapPhuKien and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[LoaiPhuKien] bị trùng', 16, 1)
		raiserror (N'[PhieuNhapPhuKien] bị trùng', 16, 1)
		set @ok=0;
	end
	
	Execute dbo.sp_CTNhapPhuKien_KiemTra @SoLuong, @GiaMua, @ThanhTien, @ok output 
	
	if(@ok<>0)
		insert into CTNhapPhuKien values(@PhieuNhapPhuKien, @LoaiPhuKien, @SoLuong, @GiaMua, @ThanhTien)
end
go

alter procedure sp_CTNhapPhuKien_Update
@PhieuNhapPhuKien nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int,
@GiaMua money,
@ThanhTien money
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuNhapPhuKien is null)
	begin
		raiserror (N'[PhieuNhapPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTNhapPhuKien where PhieuNhapPhuKien=@PhieuNhapPhuKien and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[LoaiPhuKien]Bị trùng', 16, 1)
		raiserror (N'[PhieuNhapPhuKien]Bị trùng', 16, 1)
		set @ok=0; 
	end
	
	execute dbo.sp_CTNhapPhuKien_KiemTra @SoLuong,@GiaMua,@ThanhTien, @ok output
	if(@ok<>0 )
		update CTNhapPhuKien set PhieuNhapPhuKien=@PhieuNhapPhuKien,LoaiPhuKien=@LoaiPhuKien,
	 GiaMua=@GiaMua, SoLuong=@SoLuong, ThanhTien=@ThanhTien where PhieuNhapPhuKien=@PhieuNhapPhuKien
end
GO

alter procedure sp_CTPhieuXuatPhuKien_Select
as
begin
	select * from CTPhieuXuatPhuKien
end
go

alter procedure sp_CTPhieuXuatPhuKien_KiemTra(
@SoLuong int,
@Ok bit output)
as
begin
	if(@SoLuong <=0)
	begin
		raiserror( N'[SoLuong]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
end
GO

alter procedure sp_CTPhieuXuatPhuKien_Insert
@PhieuXuatKho nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTPhieuXuatPhuKien where PhieuXuatKho=@PhieuXuatKho and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[LoaiPhuKien] bị trùng', 16, 1)
		raiserror (N'[PhieuXuatKho] bị trùng', 16, 1)
		set @ok=0;
	end
	
	Execute dbo.sp_CTPhieuXuatPhuKien_KiemTra  @SoLuong, @ok output 
	
	if(@ok<>0)
		insert into CTPhieuXuatPhuKien values(@PhieuXuatKho, @LoaiPhuKien, @SoLuong)
end
go

alter procedure sp_CTPhieuXuatPhuKien_Update
@PhieuXuatKho nvarchar(10),
@LoaiPhuKien nvarchar(10),
@SoLuong int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuXuatKho is null)
	begin
		raiserror (N'[PhieuXuatKho]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@LoaiPhuKien is null)
	begin
		raiserror (N'[LoaiPhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end

	select * from CTPhieuXuatPhuKien where PhieuXuatKho=@PhieuXuatKho and LoaiPhuKien=@LoaiPhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhieuXuatKho]Bị trùng', 16, 1)
		raiserror (N'[LoaiPhuKien]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	execute dbo.sp_CTphieuXuatPhuKien_KiemTra @SoLuong, @ok output
	if(@ok =0 )
	begin
		set @ok=0;
	end
	if(@ok<>0)
		update CTphieuXuatPhuKien set PhieuXuatKho=@PhieuXuatKho,LoaiPhuKien=@LoaiPhuKien,
				SoLuong=@SoLuong where PhieuXuatKho=@PhieuXuatKho
end
GO

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
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from PhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_PhuKien_KiemTra @Hang, @ok output
	if(@ok<>0)
		insert into PhuKien values(@Ma, @Hang, @LoaiPhuKien)
end
go

alter procedure sp_PhuKien_Update
@Ma nvarchar(10),
@Hang nvarchar(10),
@LoaiPhuKien nvarchar(10)
as
begin
	declare @ok bit
	set @ok=1
	execute dbo.sp_PhuKien_KiemTra @Hang, @ok output
	if(@ok<>0)
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

alter procedure sp_LoaiPhuKien_KiemTra(
@Ten nvarchar(50),
@GiaBan money,
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 50)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 50',16,1)
		set @ok=0
	end
	
	if(@GiaBan<=0)
	begin
		raiserror( N'[GiaBan]Phải lớn hơn 0',16,1)
		set @ok=0
	end
	
end
GO

alter procedure sp_LoaiPhuKien_Insert
@Ma nvarchar(10),
@Ten nvarchar(50),
@GiaBan money,
@GhiChu nvarchar(MAX)
as
begin
	declare @ok bit
	set @ok =1
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok =0
	end
		
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
		
	select * from LoaiPhuKien where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		set @ok =0
	end
	
	execute dbo.sp_LoaiPhuKien_KiemTra @Ten, @GiaBan, @ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok =1

	execute dbo.sp_LoaiPhuKien_KiemTra @Ten, @GiaBan, @ok output
	if(@ok<>0)
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

alter procedure sp_Quyen_KiemTra(
@Ten nvarchar(30),
@Ok bit output)
as
begin
	if(len(@Ten) not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng kí tự không ít hơn 1 hoặc lớn hơn 10',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_CTQuyen_Insert
@ChucVu nvarchar(10),
@Quyen int,
@Menu nvarchar(100)
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@ChucVu is null)
	begin
		raiserror (N'[ChucVu]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@Quyen is null)
	begin
		raiserror (N'[Quyen]Phải được nhập vào', 16, 1)
		set @ok=0;
	end

	if (@Menu is null)
	begin
		raiserror (N'[Menu]Phải được nhập vào', 16, 1)
		set @ok=0;
	end

	select * from CTQuyen where ChucVu=@ChucVu and Quyen=@Quyen and Menu=@Menu
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[ChucVu]bị trùng', 16, 1)
		raiserror (N'[Quyen]bị trùng', 16, 1)
		set @ok=0;
	end
	
	if(@ok<>0)
	begin
		insert into CTQuyen values(@ChucVu, @Quyen,@Menu)
		if(@Quyen = 1)
		begin
			exec ('grant EXECUTE on schema ::dbo to '+ @ChucVu)
			exec ('grant select on  ' + @Menu + ' to ' + @ChucVu)
		end
		else
		begin
			exec ('grant EXECUTE on schema ::dbo to '+ @ChucVu)
			exec ('grant select on  ' + @Menu + ' to ' + @ChucVu)
			exec ('grant insert on  ' + @Menu + ' to ' + @ChucVu)
			exec ('grant update on  ' + @Menu + ' to ' + @ChucVu)
			exec ('grant delete on  ' + @Menu + ' to ' + @ChucVu)
		end
	end
end
go

alter procedure sp_CTQuyen_Update
@ChucVu nvarchar(10),
@Quyen int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@ChucVu is null)
	begin
		raiserror (N'[ChucVu]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@Quyen is null)
	begin
		raiserror (N'[Quyen]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTQuyen where ChucVu=@ChucVu and Quyen=@Quyen
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[ChucVu]Bị trùng', 16, 1)
		raiserror (N'[Quyen]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	if(@ok<>0)
		update CTQuyen set ChucVu=@ChucVu,Quyen=@Quyen where ChucVu=@ChucVu
end
go

alter procedure sp_CTQuyen_Delete
@ChucVu nvarchar(10),
@Quyen int,
@Menu nvarchar(100)
as
begin
	exec ('Revoke EXECUTE on schema ::dbo to ' + @ChucVu + ' cascade')
	if(@Quyen=1)
		exec ('Revoke select on ' + @Menu + ' to ' + @ChucVu + ' cascade')
	else
	begin
		exec ('Revoke select on ' + @Menu + ' to ' + @ChucVu + ' cascade')
		exec ('Revoke insert on ' + @Menu + ' to ' + @ChucVu + ' cascade')
		exec ('Revoke update on ' + @Menu + ' to ' + @ChucVu + ' cascade')
		exec ('Revoke delete on ' + @Menu + ' to ' + @ChucVu + ' cascade')
	end
	delete from CTQuyen where ChucVu=@ChucVu and Quyen=@Quyen and Menu=@Menu
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
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from Quyen where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_Quyen_KiemTra @Ten, @ok output
	if(@ok<>0)
		insert into Quyen values(@Ma, @Ten, @GhiChu)
end
go

alter procedure sp_Quyen_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	declare @ok bit
	set @ok=1
	
	execute dbo.sp_Quyen_KiemTra @Ten, @ok output
	if(@ok<>0)
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

alter procedure sp_PhieuSuaChua_KiemTra(
@NgaySua datetime,
@Ok bit output)
as
begin
	if(@NgaySua is null)
	begin
		raiserror( N'[NgaySua]Phải được nhập vào',16,1)
		set @ok=0
	end

end
GO

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
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(len(@Ma)not between 1 and 10)
	begin
		raiserror (N'[Ma]Không được ít hơn 1 hoặc lớn hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from PhieuSuaChua where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma] bị trùng', 16, 1)
		set @ok=0
	end
	execute dbo.sp_PhieuSuaChua_KiemTra @NgaySua, @ok output
	if(@ok<>0)
		insert into PhieuSuaChua values (@Ma, @NgaySua, @GhiChu, @NVSua)
END
go

alter PROCEDURE sp_PhieuSuaChua_Update
@Ma nvarchar(10),
@NgaySua datetime,
@GhiChu nvarchar(max),
@NVSua nvarchar(10)
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	execute dbo.sp_PhieuSuaChua_KiemTra @NgaySua, @ok output
	if(@ok <> 0)	
		UPDATE PhieuSuaChua SET NgaySuaChua=@NgaySua,NVSuaChua=@NVSua,GhiChu=@GhiChu
		WHERE Ma=@Ma
END
GO

alter procedure sp_CTSuaChua_Select
as
begin
	select * from CTSuaChua
end
go

alter procedure sp_CTSuaChua_KiemTra(
@SoLuong int,
@Ok bit output)
as
begin
	if(@SoLuong<=0)
	begin
		raiserror (N'[SoLuong]Phải lớn hơn 0', 16, 1)
		set @ok=0
	end
	
end
GO

alter procedure sp_CTSuaChua_Insert
@PhieuSuaChua nvarchar(10),
@PhuKien nvarchar(10),
@SoLuong int
AS
BEGIN
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuSuaChua is null)
	begin
		raiserror (N'[PhieuSuaChua]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@PhuKien is null)
	begin
		raiserror (N'[PhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTSuaChua where PhieuSuaChua=@PhieuSuaChua and PhuKien=@PhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhuKien] bị trùng', 16, 1)
		raiserror (N'[PhieuSuaChua]bị trùng', 16, 1)
		set @ok=0;
	end
	
	execute dbo.sp_CTSuaChua_KiemTra @SoLuong, @ok output
	if(@ok <> 0 )
		insert into CTSuaChua values(@PhieuSuaChua, @PhuKien, @SoLuong)
END
go

alter procedure [dbo].[sp_CTSuaChua_Update]
@PhieuSuaChua nvarchar(10),
@PhuKien nvarchar(10),
@SoLuong int
as
begin
	declare @ok bit;
	set @ok=1;
	
	if(@PhieuSuaChua is null)
	begin
		raiserror (N'[PhieuSuaChua]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	if (@PhuKien is null)
	begin
		raiserror (N'[PhuKien]Phải được nhập vào', 16, 1)
		set @ok=0;
	end
	
	select * from CTSuaChua where PhieuSuaChua=@PhieuSuaChua and PhuKien=@PhuKien
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[PhuKien]Bị trùng', 16, 1)
		raiserror (N'[PhieuSuaChua]Bị trùng', 16, 1)
		set @ok=0;
	end
	
	execute dbo.sp_CTSuaChua_KiemTra @SoLuong, @ok output
	if(@ok <>0 )
		update CTSuaChua set PhieuSuaChua=@PhieuSuaChua,PhuKien=@PhuKien,
	 SoLuong=@SoLuong where PhieuSuaChua=@PhieuSuaChua
end
GO

alter procedure sp_Menu_Select
as
begin
	select * from Menu
end
go

alter procedure sp_Menu_KiemTra(
@Ten nvarchar(30),
@GhiChu nvarchar(MAX),
@Ok bit output)
as
begin
	if(len(@Ten)not between 1 and 30)
	begin
		raiserror( N'[Ten]Số lượng ký tự không được ít hơn 1 hoặc lớn hơn 30',16,1)
		set @ok=0
	end
end
GO

alter procedure sp_Menu_Insert
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	declare @ok bit
	set @ok=1
	
	if(@Ma is null)
	begin
		raiserror (N'[Ma]Phải được nhập vào',16,1)
		set @ok=0
	end	
	
	if( len(@Ma) not between 1 and 10 )
	begin
		raiserror( N'[Ma] không ít hơn 1 và nhiều hơn 10 kí tự',16,1)
		set @ok=0
	end
	
	select * from Menu where Ma=@Ma
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Ma]Bị trùng', 16, 1)
		set @ok=0
	end
	
	execute dbo.sp_Menu_KiemTra @Ten,@ok output
	if(@ok<>0)
		insert into Menu values(@Ma, @Ten, @GhiChu)
end
go

alter procedure sp_Menu_Update
@Ma nvarchar(10),
@Ten nvarchar(30),
@GhiChu nvarchar(MAX)
as
begin
	declare @ok bit
	set @ok=1
	
	execute dbo.sp_Menu_KiemTra @Ten,@ok output
	if(@ok<>0)
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
	declare @ok bit
	set @ok=1
	if(@Quyen is null)
	begin
		raiserror (N'[Quyen]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(@Menu is null)
	begin
		raiserror (N'[Menu]Phải được nhập vào', 16, 1)
		set @ok=0
	end

	select * from Quyen_Menu where Quyen=@Quyen and Menu=@Menu
	if(@@ROWCOUNT>0)
	begin
		raiserror (N'[Menu] bị trùng', 16, 1)
		raiserror (N'[Quyen] bị trùng', 16, 1)
		set @ok=0 
	end
	
	if(@ok<>0)
		insert into Quyen_Menu values(@Quyen, @Menu)
end
go

alter procedure sp_Quyen_Menu_Update
@QuyenMoi nvarchar(10),
@Menu nvarchar(10),
@QuyenCu nvarchar(10)
as
begin
	declare @ok bit
	set @ok=1
	if(@QuyenCu is null)
	begin
		raiserror (N'[Quyen]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	
	if(@Menu is null)
	begin
		raiserror (N'[Menu]Phải được nhập vào', 16, 1)
		set @ok=0
	end
	if(@ok<>0)
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

alter procedure sp_Select
@TenBang nvarchar(MAX),
@DieuKien nvarchar(MAX)
as
begin
	if(@DieuKien is null)
		exec ('select * from  ' + @TenBang)
	else
		exec ('select * from  ' + @TenBang + ' where ' + @DieuKien)
end
go

--grant [ten_procedure] on [table] to [user | group]