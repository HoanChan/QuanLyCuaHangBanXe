use CUAHANG_BANXE
go

alter trigger TG_Xoa_Xe on Xe
instead of delete
AS
BEGIN
	declare @SoMay nvarchar(50);
	select @SoMay=SoMay from deleted
	update HoSoBanXe set Xe=null where Xe=@SoMay
	delete from Xe where SoMay=@SoMay
END
GO

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
	update Xe set LoaiXe=null where LoaiXe=@LoaiXe
	update CTPhieuXuatXe set LoaiXe=null where LoaiXe=@LoaiXe
	update CTPhieuNhapXe set LoaiXe=null where LoaiXe=@LoaiXe
	update CTCungCapXe set LoaiXe=null where LoaiXe=@LoaiXe

	delete from LoaiXe where Ma=@LoaiXe
end
go

alter trigger TG_Xoa_ChiNhanh on ChiNhanh
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

alter trigger TG_Xoa_NV on NhanVien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	update PhieuSuaChua set NVSuaChua=null where NVSuaChua=@Ma
	update ChiNhanh set NVQuanLy=null where NVQuanLy=@Ma
	update PhieuXuatKho set NV_XacNhan=null where NV_XacNhan=@Ma
	update CTVanChuyen set NhanVien=null where NhanVien=@Ma
	update Kho set NVQuanLy=null where NVQuanLy=@Ma
	update PhieuNhapXe set NVXacNhan=null where NVXacNhan=@Ma

	delete from NhanVien where Ma=@Ma
end
go

alter trigger TG_Xoa_CV on ChucVu
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

alter trigger TG_Xoa_Quyen on Quyen
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	--update ChiTietQuyen set MaQuyen=null where MaQuyen=@Ma
	delete from CTQuyen where Quyen=@Ma

	delete from Quyen where Ma=@Ma
end
go

alter trigger TG_Xoa_Kho on Kho
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

alter trigger TG_Xoa_LoaiPhuKien on LoaiPhuKien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	update PhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	update CTPhieuXuatPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	update CTNhapPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma
	update CTCungCapPhuKien set LoaiPhuKien=null where LoaiPhuKien=@Ma

	delete from LoaiPhuKien where Ma=@Ma
end
go

alter trigger TG_Xoa_PhuKien on PhuKien
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	update CTSuaChua set PhuKien=null where PhuKien=@Ma

	delete from PhuKien where Ma=@Ma
end
go

alter trigger TG_Xoa_NCC on NCC
instead of delete
as
begin
	declare @Ma nvarchar(10);
	select @Ma=Ma from deleted
	update CTCungCapPhuKien set NCC=null where NCC=@Ma
	update CTCungCapPhuKien set NCC=null where NCC=@Ma
	update PhieuNhapPhuKien set NCC=null where NCC=@Ma
	update PhieuNhapXe set NCC=null where NCC=@Ma

	delete from NCC where Ma=@Ma
end
go

