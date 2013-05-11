using System;
using System.Collections;
using System.Data;
using System.Linq;
namespace DataContext
{
    public class MasterDetailInfo
    {
        public virtual bool IsEmpty(int RelationIndex) { return true; }
        public virtual IList GetChildList(int RelationIndex) { return null; }
        public virtual int GetRelationCount() { return 0; }
        public virtual string GetRelationName(int RelationIndex) { return "Detail"; }
        public virtual string GetName()
        {
            try
            {
                return "Danh Sách " + ((TypeDisplay)this.GetType().GetCustomAttributes(typeof(TypeDisplay), false).First()).Name;
            }
            catch (Exception)
            {
                return "Danh Sách " + this.GetType().Name;	
            }
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
    public class TypeDisplay : Attribute
    {
        public string Name { get; set; }
    }

    //[TypeDisplay(Name="Dịch Vụ")]
    //public partial class DichVu : MasterDetailInfo
    //{
    //    public override int GetRelationCount() { return 1; }
    //    public override string GetRelationName(int RelationIndex) { return "Sử Dụng Dịch Vụ"; }
    //    public override bool IsEmpty(int RelationIndex) { return dsSuDungDichVu == null ? true : dsSuDungDichVu.Count == 0; }
    //    public override IList GetChildList(int RelationIndex)
    //    {
    //        return dsSuDungDichVu.Select(m => new
    //        {
    //            Mã = m.DichVu.Ma,
    //            DịchVụ = m.DichVu.Ten,
    //            Giá = m.DichVu.Gia,
    //            ĐơnVịTính = m.DichVu.DonViTinh,
    //            SốLượng = m.SoLuong,
    //            ThôngTin = m.DichVu.ThongTin
    //        }).ToList();
    //    }
    //    public override string ToString()
    //    {
    //        return "(" + Ma + ") " + Ten;
    //    }
    //}

    [TypeDisplay(Name = "Chi nhánh")]
    public partial class ChiNhanh : MasterDetailInfo
    {
        //public override int GetRelationCount() { return 3; } // NhanVien, PhieuXuatKho, Xe
        //public override string GetRelationName(int RelationIndex)
        //{
        //    switch (RelationIndex)
        //    {
        //        case 0: return "Nhân viên";
        //        case 1: return "Phiếu Xuất Kho";
        //        default: return "Xe";
        //    }
        //}
        //public override bool IsEmpty(int RelationIndex) { return dsSuDungDichVu == null ? true : dsSuDungDichVu.Count == 0; }
        //public override IList GetChildList(int RelationIndex)
        //{
        //    return dsSuDungDichVu.Select(m => new
        //    {
        //        Mã = m.DichVu.Ma,
        //        DịchVụ = m.DichVu.Ten,
        //        Giá = m.DichVu.Gia,
        //        ĐơnVịTính = m.DichVu.DonViTinh,
        //        SốLượng = m.SoLuong,
        //        ThôngTin = m.DichVu.ThongTin
        //    }).ToList();
        //}
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class ChucVu : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class CTCungCapPhuKien : MasterDetailInfo
    {
    }

    public partial class CTCungCapXe : MasterDetailInfo
    {
    }

    public partial class CTNhapPhuKien : MasterDetailInfo
    {
    }

    public partial class CTPhieuNhapXe : MasterDetailInfo
    {
    }

    public partial class CTPhieuXuatPhuKien : MasterDetailInfo
    {
    }

    public partial class CTPhieuXuatXe : MasterDetailInfo
    {
    }

    public partial class CTQuyen : MasterDetailInfo
    {
    }

    public partial class CTSuaChua : MasterDetailInfo
    {
    }

    public partial class CTVanChuyen : MasterDetailInfo
    {
    }

    public partial class HoSoBanXe : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }

    public partial class KhachHang : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
    public partial class Kho : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class LoaiPhuKien : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class LoaiXe : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class NCC : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class NhanVien : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + HoTen;
        }
    }

    public partial class PhieuNhapPhuKien : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }

    public partial class PhieuNhapXe : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }
    public partial class PhieuSuaChua : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }
    public partial class PhieuXuatKho : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }
    public partial class PhuKien : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }

    public partial class Quyen : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    public partial class Xe : MasterDetailInfo
    {
        public override string ToString()
        {
            return SoMay;
        }
    }
}
