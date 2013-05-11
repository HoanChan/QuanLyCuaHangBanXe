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
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public string NVQuanLy { get; set; }
    }

    public partial class ChucVu
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
    }

    public partial class CTCungCapPhuKien
    {
        public string NCC { get; set; }
        public string LoaiPhuKien { get; set; }
    }

    public partial class CTCungCapXe
    {
        public string NCC { get; set; }
        public string LoaiXe { get; set; }
    }

    public partial class CTNhapPhuKien
    {
        public string PhieuNhapPhuKien { get; set; }
        public string LoaiPhuKien { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaMua { get; set; }
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuNhapXe
    {
        public string PhieuNhapXe { get; set; }
        public string LoaiXe { get; set; }
        public int SoLuong { get; set; }
        public decimal GiaMua { get; set; }
        public decimal ThanhTien { get; set; }
    }

    public partial class CTPhieuXuatPhuKien
    {
        public string PhieuXuatKho { get; set; }
        public string LoaiPhuKien { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class CTPhieuXuatXe
    {
        public string PhieuXuatKho { get; set; }
        public string LoaiXe { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class CTQuyen
    {
        public string ChucVu { get; set; }
        public string Quyen { get; set; }
    }

    public partial class CTSuaChua
    {
        public string PhieuSuaChua { get; set; }
        public string PhuKien { get; set; }
        public int SoLuong { get; set; }
    }

    public partial class CTVanChuyen
    {
        public string NhanVien { get; set; }
        public string PhieuXuatKho { get; set; }
    }

    public partial class HoSoBanXe
    {
        public string Ma { get; set; }
        public DateTime NgayMua { get; set; }
        public string KhachHang { get; set; }
        public string NhanVienBan { get; set; }
        public string Xe { get; set; }
    }

    public partial class KhachHang
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
    }
    public partial class Kho
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public string NVQuanLy { get; set; }
    }

    public partial class LoaiPhuKien
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public decimal GiaBan { get; set; }
        public string GhiChu { get; set; }
    }

    public partial class LoaiXe
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string Hang { get; set; }
        public DateTime TGBH { get; set; }
        public string DongCo { get; set; }
        public int DTXiLanh { get; set; }
        public string MauSac { get; set; }
        public double TrongLuong { get; set; }
        public string Khung { get; set; }
        public string Banh { get; set; }
        public decimal GiaBan { get; set; }
    }

    public partial class NCC
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
    }

    public partial class NhanVien
    {
        public string Ma { get; set; }
        public string HoTen { get; set; }
        public string DiaChi { get; set; }
        public string SoDT { get; set; }
        public byte GioiTinh { get; set; }
        public decimal Luong { get; set; }
        public string ChiNhanh { get; set; }
        public string Kho { get; set; }
        public string ChucVu { get; set; }
        public string MatKhau { get; set; }
        public DateTime NgaySinh { get; set; }
    }

    public partial class PhieuNhapPhuKien
    {
        public string Ma { get; set; }
        public DateTime ThoiGian { get; set; }
        public string NVXacNhan { get; set; }
        public string Kho { get; set; }
        public string NCC { get; set; }
        public decimal ThanhTien { get; set; }
    }

    public partial class PhieuNhapXe
    {
        public string Ma { get; set; }
        public string Kho { get; set; }
        public string NCC { get; set; }
        public string NVXacNhan { get; set; }
        public DateTime ThoiGian { get; set; }
        public decimal ThanhTien { get; set; }
    }
    public partial class PhieuSuaChua
    {
        public string Ma { get; set; }
        public DateTime NgaySuaChua { get; set; }
        public string GhiChu { get; set; }
        public string NVSuaChua { get; set; }
    }
    public partial class PhieuXuatKho
    {

        public string Ma { get; set; }
        public DateTime NgayXuat { get; set; }
        public string ChiNhanh { get; set; }
        public string NVXacNhan { get; set; }
        public string Kho { get; set; }
    }
    public partial class PhuKien
    {
        public string Ma { get; set; }
        public string Hang { get; set; }
        public string LoaiPhuKien { get; set; }
    }

    public partial class Quyen
    {
        public string Ma { get; set; }
        public string Ten { get; set; }
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
