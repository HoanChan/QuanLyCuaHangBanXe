use CUAHANG_BANXE
go

create trigger TG_Xoa_Xe on Xe
instead of delete
AS
BEGIN
	declare @SoKhung nvarchar(50);
	select @SoKhung=SoKhung from deleted
	update HoSoBanXe set MaXe=null where MaXe=@SoKhung
	delete from Xe where SoKhung=@SoKhung
END
GO

create trigger TG_Them_HSBanXe On HoSoBanXe
for insert
as
begin
	declare @MaLoaiXe nvarchar(10);
	select @MaloaiXe = LoaiXe from inserted as x join Xe on x.MaXe=Xe.SoKhung

	declare @SLBan int;
	declare @SLNhap int;

	set @SLBan=(select sum(SoLuong) from CTPhieuXuatXe where MaLoaiXe=@MaLoaiXe)
	set @SLNhap=(select sum(SoLuong) from CTPhieuNhapXe where MaLoaiXe=@MaLoaiXe)

	if(@SLBan>=@SLNhap)
	begin
		raiserror ('Het hang',16,1)
		rollback transaction
	end
end
go

create trigger TG_Xoa_LoaiXe on LoaiXe
instead of delete
as
begin
	declare @MaLoai nvarchar(10);
	select @MaLoai=MaLoai from deleted
	update Xe set LoaiXe=null where LoaiXe=@MaLoai
	update CTPhieuXuatXe set MaLoaiXe=null where MaLoaiXe=@MaLoai
	update CTPhieuNhapXe set MaLoaiXe=null where MaLoaiXe=@MaLoai
	update CTCungCapXe set MaLoaiXe=null where MaLoaiXe=@MaLoai

	delete from LoaiXe where MaLoai=@MaLoai
end
go

create trigger TG_Xoa_ChiNhanh on ChiNhanh
instead of delete
as
begin
	declare @MaCN nvarchar(10);
	select @MaCN=MaCN from deleted
	update Xe set ChiNhanh=null where ChiNhanh=@MaCN
	update PhieuXuatKHo set ChiNhanh=null where ChiNhanh=@MaCN
	delete from ChiNhanh where MaCN=@MaCN
end
go

create trigger TG_XoaKH on KhachHang
instead of delete
as
begin
	declare @MaKH nvarchar(10);
	select @MaKH=MaKH from deleted
	update HoSoBanXe set KhachHang=null where KhachHang=@MaKH
	delete from KhachHang where MaKH=@MaKH
end
go

create trigger TG_Xoa_NV on NhanVien
instead of delete
as
begin
	declare @MaNV nvarchar(10);
	select @MaNV=MaNV from deleted
	update PhieuSuaChua set NVSuaChua=null where NVSuaChua=@MaNV
	update ChiNhanh set NVQuanLy=null where NVQuanLy=@MaNV
	update PhieuXuatKho set NV_XacNhan=null where NV_XacNhan=@MaNV
	update CTVanChuyen set MaNV=null where MaNV=@MaNV
	update Kho set NVQuanLy=null where NVQuanLy=@MaNV
	update PhieuNhapXe set NVXacNhan=null where NVXacNhan=@MaNV

	delete from NhanVien where MaNV=@MaNV
end
go

create trigger TG_Xoa_CV on ChucVu
instead of delete
as
begin
	declare @MaCV nvarchar(10);
	select @MaCV=MaCV from deleted
	update NhanVien set ChucVu=null where ChucVu=@MaCV
	update ChiTietQuyen set MaCV=null where MaCV=@MaCV

	delete from ChucVu where MaCV=@MaCV
end
go

create trigger TG_Xoa_Quyen on Quyen
instead of delete
as
begin
	declare @MaQuyen nvarchar(10);
	select @MaQuyen=MaQuyen from deleted
	update ChiTietQuyen set MaQuyen=null where MaQuyen=@MaQuyen

	delete from Quyen where MaQuyen=@MaQuyen
end
go

create trigger TG_Xoa_Kho on Kho
instead of delete
as
begin
	declare @MaKho nvarchar(10);
	select @MaKho=MaKho from deleted
	update PhieuNhapPhuKien set Kho=null where Kho=@MaKho
	update PhieuXuatKho set Kho=null where Kho=@MaKho
	update PhieuNhapXe set Kho=null where Kho=@MaKho

	delete from Kho where MaKho=@MaKho
end
go

create trigger TG_Xoa_LoaiPhuKien on LoaiPhuKien
instead of delete
as
begin
	declare @MaLoai nvarchar(10);
	select @MaLoai=MaLoai from deleted
	update PhuKien set LoaiPhuKien=null where LoaiPhuKien=@MaLoai
	update CTPhieuXuatPhuKien set MaLoaiPhuKien=null where MaLoaiPhuKien=@MaLoai
	update CTNhapPhuKien set MaLoaiPhuKien=null where MaLoaiPhuKien=@MaLoai
	update CTCungCapPhuKien set MaLoaiPhuKien=null where MaLoaiPhuKien=@MaLoai

	delete from LoaiPhuKien where MaLoai=@MaLoai
end
go

create trigger TG_Xoa_PhuKien on PhuKien
instead of delete
as
begin
	declare @MaPhuKien nvarchar(10);
	select @MaPhuKien=MaPhuKien from deleted
	update ChiTietSuaChua set MaPhuKien=null where MaPhuKien=@MaPhuKien

	delete from PhuKien where MaPhuKien=@MaPhuKien
end
go

create trigger TG_Xoa_NCC on NCC
instead of delete
as
begin
	declare @MaNCC nvarchar(10);
	select @MaNCC=MaNCC from deleted
	update CTCungCapPhuKien set MaNCC=null where MaNCC=@MaNCC
	update CTCungCapPhuKien set MaNCC=null where MaNCC=@MaNCC
	update PhieuNhapPhuKien set NCC=null where NCC=@MaNCC
	update PhieuNhapXe set NCC=null where NCC=@MaNCC

	delete from NCC where MaNCC=@MaNCC
end
go

