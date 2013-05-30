using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;

namespace DataContext
{
    public partial class ChiNhanh
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên quản lý")]
        public string NVQuanLy { get; set; }
    }

    public partial class ChucVu
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
    }

    public partial class CTCungCapPhuKien
    {
        [Key, ForeignKey("NCC_Ma"), Display(Name = "Nhà cung cấp")]
        public string NCC { get; set; }
        [Key, ForeignKey("LoaiPhuKien_Ma"), Display(Name = "Loại phụ kiện")]
        public string LoaiPhuKien { get; set; }
    }

    public partial class CTCungCapXe
    {
        [Key, ForeignKey("NCC_Ma"), Display(Name = "Nhà cung cấp")]
        public string NCC { get; set; }
        [Key, ForeignKey("LoaiXe_Ma"), Display(Name = "Loại xe")]
        public string LoaiXe { get; set; }
    }

    public partial class CTNhapPhuKien
    {
        [Key, ForeignKey("PhieuNhapPhuKien_Ma"), Display(Name = "Phiếu nhập phụ kiện")]
        public string PhieuNhapPhuKien { get; set; }
        [Key, ForeignKey("LoaiPhuKien_Ma"), Display(Name = "Loại phụ kiện")]
        public string LoaiPhuKien { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
        [Display(Name = "Giá mua")]
        public decimal GiaMua { get; set; }
        [Display(Name = "Thành tiền")]
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuNhapXe
    {
        [Key, ForeignKey("PhieuNhapXe_Ma"), Display(Name = "Phiếu nhập xe")]
        public string PhieuNhapXe { get; set; }
        [Key, ForeignKey("LoaiXe_Ma"), Display(Name = "Loại xe")]
        public string LoaiXe { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
        [Display(Name = "Giá Mua")]
        public decimal GiaMua { get; set; }
        [Display(Name = "Thành Tiền")]
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuXuatPhuKien
    {
        [Key, ForeignKey("PhieuXuatKho_Ma"), Display(Name = "Phiếu xuất kho")]
        public string PhieuXuatKho { get; set; }
        [Key, ForeignKey("LoaiPhuKien_Ma"), Display(Name = "Loại phụ kiện")]
        public string LoaiPhuKien { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
    }

    public partial class CTPhieuXuatXe
    {
        [Key, ForeignKey("PhieuXuatXe_Ma"), Display(Name = "Phiếu xuất xe")]
        public string PhieuXuatKho { get; set; }
        [Key, ForeignKey("LoaiXe_Ma"), Display(Name = "Loại xe")]
        public string LoaiXe { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
    }

    public partial class CTQuyen
    {
        [Key, ForeignKey("ChucVu_Ma"), Display(Name = "Chức vụ")]
        public string ChucVu { get; set; }
        [Key, ForeignKey("Quyen_Ma"), Display(Name = "Quyền")]
        public int Quyen { get; set; }
        [Key, ForeignKey("Menu_Ma"), Display(Name = "Menu")]
        public string Menu { get; set; }
    }

    public partial class CTSuaChua
    {
        [Key, ForeignKey("PhieuSuaChua_Ma"), Display(Name = "Phiếu sửa chữa")]
        public string PhieuSuaChua { get; set; }
        [Key, ForeignKey("PhuKien_Ma"), Display(Name = "Phụ kiện")]
        public string PhuKien { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
    }

    public partial class CTVanChuyen
    {
        [Key, ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên")]
        public string NhanVien { get; set; }
        [Key, ForeignKey("PhieuXuatKho_Ma"), Display(Name = "Phiếu xuất kho")]
        public string PhieuXuatKho { get; set; }
    }

    public partial class HoSoBanXe
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Ngày mua")]
        public DateTime NgayMua { get; set; }
        [ForeignKey("KhachHang_Ma"), Display(Name = "Khách hàng")]
        public string KhachHang { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên bán")]
        public string NhanVienBan { get; set; }
        [ForeignKey("Xe_SoMay"), Display(Name = "Xe")]
        public string Xe { get; set; }
    }

    public partial class KhachHang
    {
        [Key, Display(Name = "Mã (CMND)")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }
    }
    public partial class Kho
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Người quản lý")]
        public string NVQuanLy { get; set; }
    }

    public partial class LoaiPhuKien
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Giá bán")]
        public decimal GiaBan { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
    }

    public partial class LoaiXe
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Hãng sản xuất")]
        public string Hang { get; set; }
        [Display(Name = "Thời gian bảo hành")]
        public DateTime TGBH { get; set; }
        [Display(Name = "Động cơ")]
        public string DongCo { get; set; }
        [Display(Name = "Dung tích xi lanh")]
        public int DTXiLanh { get; set; }
        [Display(Name = "Màu sắc")]
        public string MauSac { get; set; }
        [Display(Name = "Trọng lượng")]
        public double TrongLuong { get; set; }
        [Display(Name = "Khung xe")]
        public string Khung { get; set; }
        [Display(Name = "Bánh xe")]
        public string Banh { get; set; }
        [Display(Name = "Giá bán")]
        public decimal GiaBan { get; set; }
    }

    public partial class Menu
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
    }

    public partial class NCC
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }
    }

    public partial class NhanVien
    {
        [Key, Display(Name = "Mã (CMND)")]
        public string Ma { get; set; }
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }
        [Display(Name = "Giới tính (Là Nam)")]
        public bool GioiTinh { get; set; }
        [Display(Name = "Lương")]
        public decimal Luong { get; set; }
        [ForeignKey("ChiNhanh_Ma"), Display(Name = "Chi nhánh")]
        public string ChiNhanh { get; set; }
        [ForeignKey("Kho_Ma"), Display(Name = "Kho")]
        public string Kho { get; set; }
        [ForeignKey("ChucVu_Ma"), Display(Name = "Chức vụ")]
        public string ChucVu { get; set; }
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }
        [Display(Name = "Ngày sinh")]
        public DateTime NgaySinh { get; set; }
    }

    public partial class PhieuNhapPhuKien
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Thời gian")]
        public DateTime ThoiGian { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên xác nhận")]
        public string NVXacNhan { get; set; }
        [ForeignKey("Kho_Ma"), Display(Name = "Kho")]
        public string Kho { get; set; }
        [ForeignKey("NCC_Ma"), Display(Name = "Nhà cung cấp")]
        public string NCC { get; set; }
        [Display(Name = "Thành tiền")]
        public decimal ThanhTien { get; set; }
    }

    public partial class PhieuNhapXe
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [ForeignKey("Kho_Ma"), Display(Name = "Kho")]
        public string Kho { get; set; }
        [ForeignKey("NCC_Ma"), Display(Name = "Nhà cung cấp")]
        public string NCC { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên xác nhận")]
        public string NVXacNhan { get; set; }
        [Display(Name = "Thời gian")]
        public DateTime ThoiGian { get; set; }
        [Display(Name = "Thành tiền")]
        public decimal ThanhTien { get; set; }
    }
    public partial class PhieuSuaChua
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Ngày sửa chữa")]
        public DateTime NgaySuaChua { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên sửa chữa")]
        public string NVSuaChua { get; set; }
    }
    public partial class PhieuXuatKho
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Ngày xuất")]
        public DateTime NgayXuat { get; set; }
        [ForeignKey("ChiNhanh_Ma"), Display(Name = "Chi nhánh")]
        public string ChiNhanh { get; set; }
        [ForeignKey("NhanVien_Ma"), Display(Name = "Nhân viên xác nhận")]
        public string NVXacNhan { get; set; }
        [ForeignKey("Kho_Ma"), Display(Name = "Kho")]
        public string Kho { get; set; }
    }
    public partial class PhuKien
    {
        [Key, Display(Name = "Mã")]
        public string Ma { get; set; }
        [Display(Name = "Hãng sản xuất")]
        public string Hang { get; set; }
        [ForeignKey("LoaiPhuKien_Ma"), Display(Name = "Loại phụ kiện")]
        public string LoaiPhuKien { get; set; }
    }

    public partial class Quyen
    {
        [Key, Display(Name = "Mã")]
        public int Ma { get; set; }
        [Display(Name = "Tên")]
        public string Ten { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
    }

    public partial class Xe
    {
        [Key, Display(Name = "Số máy")]
        public string SoMay { get; set; }
        [Display(Name = "Số khung")]
        public string SoKhung { get; set; }
        [ForeignKey("ChiNhanh_Ma"), Display(Name = "Chi nhánh")]
        public string ChiNhanh { get; set; }
        [ForeignKey("LoaiXe_Ma"), Display(Name = "Loại xe")]
        public string LoaiXe { get; set; }
    }
}
