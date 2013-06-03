use CUAHANG_BANXE
go

alter trigger tg_ChucVu_Delete on ChucVu
instead of delete
as
begin
	declare @Ma nvarchar(10);

	select @Ma=Ma from deleted

	begin tran t1

		update NhanVien set ChucVu=null where ChucVu=@Ma
		delete from CTQuyen  where ChucVu=@Ma
		delete from ChucVu where Ma=@Ma
		if(@@ERROR<>0)
			raiserror(N'[_Msg]Xóa thất bại',16,1)
		else
			raiserror(N'[_Msg]Đã xóa thành công',16,1)
	commit tran t1
end
go

/*create trigger tg_NhanVien_Insert on NhanVien
for insert
as
begin
	declare @Ma nvarchar(10),@ChucVu nvarchar(10), @MatKhau nvarchar(50);
	select @Ma=Ma, @MatKhau=MatKhau, @ChucVu=ChucVu 
	from inserted
	--begin tran t1
		exec sp_addlogin @Ma, @MatKhau
		--exec ('create login ' + @Ma + ' with password = ''' + @MatKhau + '''')
		exec sp_adduser @Ma, @Ma
		--exec ('create user ' + @Ma + ' for '+ @Ma)
		if(@ChucVu is not null)
			exec sp_addrolemember @ChucVu, @Ma
		if(@@ERROR<>0)
		begin
			rollback tran
			raiserror(N'[_Msg]Đã thêm thất bại',16,1)
			return
		end
		else
			raiserror(N'[_Msg]Đã thêm thành công',16,1)
	--commit tran t1
end*/
go

/*create trigger tg_NhanVien_update on NhanVien
instead of update
as
begin
	declare @Ma nvarchar(10),
		@MatKhau nvarchar(50),
		@ChucVu nvarchar(10),
		@HoTen nvarchar(30),
		@DiaChi nvarchar(50),
		@SoDT nchar(15),
		@GioiTinh bit,
		@Luong money,
		@ChiNhanh nvarchar(10),
		@Kho nvarchar(10),
		@NgaySinh datetime,
		@ChucVuCu nvarchar(10),
		@MatKhauCu nvarchar(50);

		select @Ma=Ma, @MatKhau=MatKhau, @ChucVu=ChucVu, @HoTen=HoTen, @DiaChi=DiaChi, @SoDT=SoDT,
				@GioiTinh=GioiTinh, @Luong=Luong, @ChiNhanh=ChiNhanh, @Kho=Kho, @NgaySinh=NgaySinh
		from inserted
		select @MatKhauCu=@MatKhau, @ChucVuCu=ChucVu from NhanVien where Ma=@Ma

		if(@MatKhauCu <> @MatKhau)
		begin
			begin tran t1
				exec sp_droprolemember @ChucVuCu, @Ma
				exec sp_droplogin @Ma
				exec sp_addlogin @Ma, @MatKhau
				exec sp_addrolemember @ChucVu, @Ma
				UPDATE NhanVien SET HoTen=@HoTen, DiaChi=@DiaChi, SoDT=@SoDT, GioiTinh=@GioiTinh, Luong=@Luong, ChiNhanh=@ChiNhanh, Kho=@Kho, ChucVu=@ChucVu, NgaySinh=@NgaySinh
				WHERE Ma=@Ma
				raiserror(N'[_Msg]Đã cập nhật thành công',16,1)
			commit tran t1
			return
		end
		else if(@ChucVuCu <> @ChucVu)
		begin
			begin tran t2
				exec sp_droprolemember @ChucVuCu, @Ma
				exec sp_addrolemember @ChucVu, @Ma
				UPDATE NhanVien SET HoTen=@HoTen, DiaChi=@DiaChi, SoDT=@SoDT, GioiTinh=@GioiTinh, Luong=@Luong, ChiNhanh=@ChiNhanh, Kho=@Kho, ChucVu=@ChucVu, NgaySinh=@NgaySinh
				WHERE Ma=@Ma
				raiserror(N'[_Msg]Đã cập nhật thành công',16,1)
			commit tran t2			
			return
		end
		raiserror(N'[_Msg]Cập nhật thất bại',16,1)
end
go*/

alter trigger tg_NhanVien_Delete on NhanVien
instead of delete
as
begin

	declare @Ma nvarchar(10), @ChucVu nvarchar(10);
	select @Ma=Ma, @ChucVu=ChucVu from deleted

	begin tran t1

		update PhieuSuaChua set NVSuaChua=null where NVSuaChua=@Ma
		update ChiNhanh set NVQuanLy=null where NVQuanLy=@Ma
		update PhieuXuatKho set NVXacNhan=null where NVXacNhan=@Ma
		delete from CTVanChuyen where NhanVien=@Ma
		update Kho set NVQuanLy=null where NVQuanLy=@Ma
		update PhieuNhapXe set NVXacNhan=null where NVXacNhan=@Ma
		Update HoSoBanXe set NhanVienBan=null where NhanVienBan=@Ma
		update PhieuNhapPhuKien set NVXacNhan=null where NVXacNhan=@Ma

		declare @message nvarchar(MAX);	
		set @message= N'[Ma] bị xóa bạn phải cập nhật các thông tin sau:'+ CHAR(13) +
					  N'- [NVSuaChua] trong Phiếu Sửa Chữa'+ CHAR(13) + 
					  N'- [NVQuanLy] trong Chi Nhánh'+ CHAR(13) +
					  N'- [NVXacNhan] trong Phiếu Xuất Kho'+ CHAR(13) +
					  N'- [NVQuanLy] trong Kho'+ CHAR(13) +
					  N'- [NVXacNhan] trong Phiếu Nhập Xe'+ CHAR(13) +
					  N'- [NhanVienBan] trong HoSoBanXe'+ CHAR(13) +
					  N'- [NVXacNhan] trong PhieuNhapPhuKien'+ CHAR(13) 
						;
		raiserror (@message, 16, 1)
		delete from NhanVien where Ma=@Ma
		if(@@ERROR<>0)
			raiserror(N'[_Msg]Xóa thất bại',16,1)
		else
			raiserror(N'[_Msg]Đã xóa thành công',16,1)
	commit tran t1
	
end
go

alter trigger tg_Xe_Delete on Xe
instead of delete
AS
BEGIN
	declare @SoMay nvarchar(50);
	select @SoMay=SoMay from deleted
	begin tran t1
		update HoSoBanXe set Xe=null where Xe=@SoMay
		update PhieuSuaChua set Xe=null where Xe=@SoMay
		delete from Xe where SoMay=@SoMay
	commit tran t1
END
GO

alter trigger tg_NCC_Insert_Update on NCC
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (N'[Ten]Đã tồn tại', 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_NCC_Delete on NCC
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		delete from CTCungCapPhuKien where NCC=@Ma
		delete from CTCungCapXe where NCC=@Ma
		update PhieuNhapPhuKien set NCC=null where NCC=@Ma
		update PhieuNhapXe set NCC=null where NCC=@Ma

		delete from NCC where Ma=@Ma
	commit tran t1
end
go


alter trigger tg_Kho_Insert_Update on Kho
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (N'[Ten]Đã tồn tại', 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_Kho_Delele on Kho
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		update PhieuNhapPhuKien set Kho=null where Kho=@Ma
		update PhieuXuatKho set Kho=null where Kho=@Ma
		update PhieuNhapXe set Kho=null where Kho=@Ma
		update NhanVien set Kho=null where Kho=@Ma

		delete from Kho where Ma=@Ma
	commit tran t1
end
go

alter trigger tg_ChiNhanh_Insert_Update on ChiNhanh
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (N'[Ten]Đã tồn tại', 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_ChiNhanh_Delete on ChiNhanh
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		update Xe set ChiNhanh=null where ChiNhanh=@Ma
		update PhieuXuatKho set ChiNhanh=null where ChiNhanh=@Ma
		update NhanVien set ChiNhanh=null where ChiNhanh=@Ma
		delete from ChiNhanh where Ma=@Ma
	commit tran t1

end
go

alter trigger tg_LoaiPhuKien_Insert_Update on LoaiPhuKien
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (N'[Ten]Đã tồn tại', 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_LoaiPhuKien_Delete on LoaiPhuKien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		update PhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
		delete from CTPhieuXuatPhuKien where LoaiPhuKien=@Ma
		delete from CTNhapPhuKien where LoaiPhuKien=@Ma
		delete from CTCungCapPhuKien where LoaiPhuKien=@Ma

		delete from LoaiPhuKien where Ma=@Ma
	commit tran t1
end
go

alter trigger tg_HSBanXe_Insert On HoSoBanXe
for insert
as
begin
	declare @LoaiXe nvarchar(10);
	select @loaiXe = LoaiXe from inserted as x join Xe on x.Xe=Xe.SoMay

	declare @SLBan int;
	declare @SLNhap int;

	set @SLBan=(select sum(SoLuong) from CTPhieuXuatXe where LoaiXe=@LoaiXe)
	set @SLNhap=(select sum(SoLuong) from CTPhieuNhapXe where LoaiXe=@LoaiXe)

	if(@SLBan>=@SLNhap)
	begin
		raiserror ('Hết hàng',16,1)
		rollback transaction
	end
end
go

alter trigger tg_LoaiXe_Delete on LoaiXe
instead of delete
as
begin
	declare @LoaiXe nvarchar(10);
	select @LoaiXe=Ma from deleted
	begin tran t1
		delete from CTPhieuXuatXe where LoaiXe=@LoaiXe
		delete from CTPhieuXuatXe where LoaiXe=@LoaiXe
		delete from CTPhieuNhapXe where LoaiXe=@LoaiXe
		update CTCungCapXe set LoaiXe=null where LoaiXe=@LoaiXe
		update Xe set LoaiXe=null where LoaiXe=@LoaiXe

		delete from LoaiXe where Ma=@LoaiXe
	commit tran t1
end
go

alter trigger tg_KhachHang_delete on KhachHang
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		update HoSoBanXe set KhachHang=null where KhachHang=@Ma
		delete from KhachHang where Ma=@Ma
	commit tran t1
end
go

alter trigger tg_PhuKien_Delete on PhuKien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		delete from CTSuaChua where PhuKien=@Ma

		delete from PhuKien where Ma=@Ma
	commit tran t1
end
go

alter trigger tg_PhieuXuatKho_Delete on PhieuXuatKho
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		delete from CTPhieuXuatPhuKien where PhieuXuatKho=@Ma
		delete from CTVanChuyen where PhieuXuatKho=@Ma
		delete from CTPhieuXuatXe where PhieuXuatKho=@Ma

		update Xe set PhieuXuatKho=null where PhieuXuatKho=@Ma

		delete from PhieuXuatKho where Ma=@Ma
	commit tran t1
end
go

alter trigger tg_PhieuNhapXe_Delete on PhieuNhapXe
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	begin tran t1
		delete from CTPhieuNhapXe where PhieuNhapXe=@Ma
		delete from Xe where PhieuNhapXe=@Ma

		delete from PhieuNhapXe where Ma=@Ma
	commit tran t1
end
go