using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;

namespace DataContext
{
    public partial class CTCungCapPhuKien
    {
        public string MaNCC { get; set; }
        public string MaLoaiPhuKien { get; set; }
    }

    public partial class CTCungCapXe
    {
        public string MaNCC { get; set; }
        public string MaLoaiXe { get; set; }
    }

    public partial class CTNhapPhuKien
    {
        [Key, ForeignKey("PhieuNhapPhuKien_MaPhieuNhap"), Display(Name = "Phiếu nhập")]
        public string MaPhieuNhap { get; set; }
        [Key, ForeignKey("LoaiPhuKien_MaLoai"), Display(Name = "Loại phụ kiện")]
        public string MaLoaiPhuKien { get; set; }
        [Display(Name = "Số lượng")]
        public int SoLuong { get; set; }
        [Display(Name = "Giá mua")]
        public decimal GiaMua { get; set; }
        [Display(Name = "Thành tiền")]
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuNhapXe
    {
        public string MaPhieuNhapXe { get; set; }
        public string MaLoaiXe { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaMua { get; set; }
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuXuatPhuKien
    {
        public string MaPhieuXuatKho { get; set; }
        public string MaLoaiPhuKien { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class CTPhieuXuatXe
    {
        public string MaPhieuXuatKho { get; set; }
        public string MaLoaiXe { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class CTVanChuyen
    {
        public string MaNV { get; set; }
        public string MaPhieuXuatKho { get; set; }
    }

    public partial class ChiNhanh
    {
        public string MaCN { get; set; }
        public string TenChiNhanh { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public string NVQuanLy { get; set; }
    }

    public partial class ChiTietSuaChua
    {
        public string MaPhieuSuaChua { get; set; }
        public string MaPhuKien { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class ChiTietQuyen
    {
        public string MaCV { get; set; }
        public string MaQuyen { get; set; }
    }
    
    public partial class ChucVu
    {
        [Key, Display(Name="Mã")]
        public string MaCV { get; set; }
        [Display(Name = "Tên")]
        public string TenCV { get; set; }
    }

    public partial class HoSoBanXe
    {
        public string MaHS { get; set; }
        public DateTime NgayMua { get; set; }
        public string KhachHang { get; set; }
        public string NhanVienBan { get; set; }
        public string MaXe { get; set; }
    }

    public partial class KhachHang
    {
        public string MaKH { get; set; }
        public string TenKH { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
    }
    public partial class Kho
    {
        public string MaKho { get; set; }
        public string TenKho { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public string NVQuanLy { get; set; }
    }

    public partial class LoaiPhuKien
    {
        public string MaLoai { get; set; }
        public string TenLoai { get; set; }
        public decimal GiaBan { get; set; }
        public string GhiChu { get; set; }
    }

    public partial class LoaiXe
    {
        public string MaLoai { get; set; }
        public string TenLoai { get; set; }
        public string Hang { get; set; }
        public DateTime TGBH { get; set; }
        public string DongCo { get; set; }
        public int DTXiLanh { get; set; }
        public string MauSac { get; set; }
        public int TrongLuong { get; set; }
        public string Khung { get; set; }
        public string Banh { get; set; }
        public decimal GiaBan { get; set; }
    }

    public partial class NCC
    {
        public string MaNCC { get; set; }
        public string TenNCC { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
    }

    public partial class NhanVien
    {
        public string MaNV { get; set; }
        public string HoTen { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public string GioiTinh { get; set; }
        public decimal Luong { get; set; }
        public string ChiNhanh { get; set; }
        public string Kho { get; set; }
        public string ChucVu { get; set; }
        public string MatKhau { get; set; }
        public DateTime NgaySinh { get; set; }
    }

    public partial class PhieuNhapPhuKien
    {
        public string MaPhieuNhap { get; set; }
        public DateTime ThoiGian { get; set; }
        public string NVXacNhan { get; set; }
        public string Kho { get; set; }
        public string NCC { get; set; }
        public decimal ThanhTien { get; set; }
    }

    public partial class PhieuNhapXe
    {
        public string MaPhieuNhap { get; set; }
        public string Kho { get; set; }
        public string NCC { get; set; }
        public string NVXacNhan { get; set; }
        public DateTime ThoiGian { get; set; }
        public decimal ThanhTien { get; set; }
    }
    public partial class PhieuSuaChua
    {
        public string MaPhieu { get; set; }
        public DateTime NgaySuaChua { get; set; }
        public string GhiChu { get; set; }
        public string NVSuaChua { get; set; }
    }
    public partial class PhieuXuatKho
    {

        public string MaPhieuXuat { get; set; }
        public DateTime NgayXuat { get; set; }
        public string ChiNhanh { get; set; }
        public string NV_XacNhan { get; set; }
        public string Kho { get; set; }
    }
    public partial class PhuKien
    {
        public string MaPhuKien { get; set; }
        public string Hang { get; set; }
        public string LoaiPhuKien { get; set; }
    }

    public partial class Quyen
    {
        public string MaQuyen { get; set; }
        public string TenQuyen { get; set; }
        public string GhiChu { get; set; }
    }

    public partial class Xe
    {
        public string SoKhung { get; set; }
        public string SoMay { get; set; }
        public string ChiNhanh { get; set; }
        public string LoaiXe { get; set; }
    }
}
