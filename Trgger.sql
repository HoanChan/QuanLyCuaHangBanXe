use CUAHANG_BANXE
go

alter trigger tg_ChucVu_Insert_Update on ChucVu
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);

	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_ChucVu_Delete on ChucVu
instead of delete
as
begin
	declare @Ma nvarchar(10);

	select @Ma=Ma from deleted

	update NhanVien set ChucVu=null where ChucVu=@Ma
	--update ChiTietQuyen set MaCV=null where MaCV=@Ma
	delete from CTQuyen  where ChucVu=@Ma

	delete from ChucVu where Ma=@Ma
end
go



alter trigger tg_NhanVien_Delete on NhanVien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted

	update PhieuSuaChua set NVSuaChua=null where NVSuaChua=@Ma
	update ChiNhanh set NVQuanLy=null where NVQuanLy=@Ma
	update PhieuXuatKho set NVXacNhan=null where NVXacNhan=@Ma
	--update CTVanChuyen set NhanVien=null where NhanVien=@Ma
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
end
go

alter trigger tg_Quyen_Insert_Update on Quyen
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_Quyen_Delete on Quyen
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	--update ChiTietQuyen set MaQuyen=null where MaQuyen=@Ma
	delete from CTQuyen where Quyen=@Ma
	delete from Quyen_Menu where Quyen=@Ma

	delete from Quyen where Ma=@Ma
end
go

alter trigger tg_Menu_Insert_Update on Menu
for insert, update
as
begin
	declare @Ma nvarchar(50);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_Menu_Delete on Menu
instead of delete
as
begin
	declare @Ma nvarchar(50);
	select @Ma=Ma from deleted

	delete from Quyen_Menu where Menu=@Ma

	delete from Menu where Ma=@Ma
end
go

alter trigger tg_Xe_Delete on Xe
instead of delete
AS
BEGIN
	declare @SoMay nvarchar(50);
	select @SoMay=SoMay from deleted
	update HoSoBanXe set Xe=null where Xe=@SoMay
	delete from Xe where SoMay=@SoMay
END
GO

alter trigger tg_NCC_Insert_Update on NCC
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
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
	--update CTCungCapPhuKien set NCC=null where NCC=@Ma
	delete from CTCungCapPhuKien where NCC=@Ma
	delete from CTCungCapXe where NCC=@Ma
	update PhieuNhapPhuKien set NCC=null where NCC=@Ma
	update PhieuNhapXe set NCC=null where NCC=@Ma

	delete from NCC where Ma=@Ma
end
go


alter trigger tg_Kho_Insert_Update on Kho
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
		rollback transaction
	end
end
go

alter trigger tg_Kho_Delele on Kho
instead of delete
as
begin
	declare @MaKho nvarchar(10);
	select @MaKho=Ma from deleted
	update PhieuNhapPhuKien set Kho=null where Kho=@MaKho
	update PhieuXuatKho set Kho=null where Kho=@MaKho
	update PhieuNhapXe set Kho=null where Kho=@MaKho

	delete from Kho where Ma=@MaKho
end
go

alter trigger tg_ChiNhanh_Insert_Update on ChiNhanh
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
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
	update Xe set ChiNhanh=null where ChiNhanh=@Ma
	update PhieuXuatKHo set ChiNhanh=null where ChiNhanh=@Ma
	delete from ChiNhanh where Ma=@Ma
end
go

alter trigger tg_LoaiPhuKien_Insert_Update on LoaiPhuKien
for insert, update
as
begin
	declare @Ma nvarchar(10);
	declare @Ten nvarchar(30);
	select @Ma=Ma, @Ten=Ten from inserted
	
	declare @message nvarchar(MAX);	
	set @message= N'[Ten] đã tồn tại';
	select * from ChucVu where Ten=@Ten
	if(@@ROWCOUNT>1)
	begin
		raiserror (@message, 16, 1)
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
	update PhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	--update CTPhieuXuatPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	delete from CTPhieuXuatPhuKien where LoaiPhuKien=@Ma
	--update CTNhapPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	delete from CTNhapPhuKien where LoaiPhuKien=@Ma
	--update CTCungCapPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	delete from CTCungCapPhuKien where LoaiPhuKien=@Ma

	delete from LoaiPhuKien where Ma=@Ma
end
go

alter trigger TG_Them_HSBanXe On HoSoBanXe
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
		raiserror ('Het hang',16,1)
		rollback transaction
	end
end
go

alter trigger TG_Xoa_LoaiXe on LoaiXe
instead of delete
as
begin
	declare @LoaiXe nvarchar(10);
	select @LoaiXe=Ma from deleted
	--update Xe set LoaiXe=null where LoaiXe=@LoaiXe
	delete from CTPhieuXuatXe where LoaiXe=@LoaiXe
	--update CTPhieuXuatXe set LoaiXe=null where LoaiXe=@LoaiXe
	delete from CTPhieuXuatXe where LoaiXe=@LoaiXe
	--update CTPhieuNhapXe set LoaiXe=null where LoaiXe=@LoaiXe
	delete from CTPhieuNhapXe where LoaiXe=@LoaiXe
	update CTCungCapXe set LoaiXe=null where LoaiXe=@LoaiXe

	delete from LoaiXe where Ma=@LoaiXe
end
go

alter trigger TG_XoaKH on KhachHang
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	update HoSoBanXe set KhachHang=null where KhachHang=@Ma
	delete from KhachHang where Ma=@Ma
end
go

alter trigger TG_Xoa_PhuKien on PhuKien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	--update CTSuaChua set PhuKien=null where PhuKien=@Ma
	delete from CTSuaChua where PhuKien=@Ma

	delete from PhuKien where Ma=@Ma
end
go


