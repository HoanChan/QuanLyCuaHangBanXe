using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
namespace DataContext
{
    public class MasterDetailInfo
    {
        public virtual bool IsEmpty(int RelationIndex) { return GetChildList(RelationIndex).Count == 0; }
        public virtual IList GetChildList(int RelationIndex) { return new List<object>(); }
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
        public virtual bool EnabledEdit()
        {
            foreach (var pro in this.GetType().GetProperties())
            {
                if (!this.IsPrimaryKey(pro.Name))
                {
                    return true;
                }
            }
            return false;
        }
    }

    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
    public class TypeDisplay : Attribute
    {
        public string Name { get; set; }
    }

    [TypeDisplay(Name = "Chi nhánh")]
    public partial class ChiNhanh : MasterDetailInfo
    {
        public override int GetRelationCount() { return 3; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(NhanVien).GetName();
                case 1: return typeof(PhieuXuatKho).GetName();
                default: return typeof(Xe).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(NhanVien), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(PhieuXuatKho), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(Xe), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Chức vụ")]
    public partial class ChucVu : MasterDetailInfo
    {
        public override int GetRelationCount() { return 2; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTQuyen).GetName();
                default: return typeof(NhanVien).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTQuyen), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(NhanVien), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Chi tiết cung cấp phụ kiện")]
    public partial class CTCungCapPhuKien : MasterDetailInfo
    {

    }

    [TypeDisplay(Name = "Chi tiết cung cấp xe")]
    public partial class CTCungCapXe : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết nhập phụ kiện")]
    public partial class CTNhapPhuKien : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết phiếu nhập xe")]
    public partial class CTPhieuNhapXe : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết phiếu xuất phụ kiện")]
    public partial class CTPhieuXuatPhuKien : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết phiếu xuất xe")]
    public partial class CTPhieuXuatXe : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết quyền")]
    public partial class CTQuyen : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết sửa chữa")]
    public partial class CTSuaChua : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Chi tiết vận chuyển")]
    public partial class CTVanChuyen : MasterDetailInfo
    {
    }

    [TypeDisplay(Name = "Hồ sơ bán xe")]
    public partial class HoSoBanXe : MasterDetailInfo
    {
        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "Khách hàng")]
    public partial class KhachHang : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(HoSoBanXe).GetName();
        }
        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(HoSoBanXe), this.GetType().Name, Ma);
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Kho")]
    public partial class Kho : MasterDetailInfo
    {
        public override int GetRelationCount() { return 3; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(PhieuNhapXe).GetName();
                case 1: return typeof(PhieuNhapPhuKien).GetName();
                default: return typeof(PhieuXuatKho).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(PhieuNhapXe), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(PhieuNhapPhuKien), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(PhieuXuatKho), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Loại phụ kiện")]
    public partial class LoaiPhuKien : MasterDetailInfo
    {
        public override int GetRelationCount() { return 4; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTNhapPhuKien).GetName();
                case 1: return typeof(CTPhieuXuatPhuKien).GetName();
                case 2: return typeof(CTCungCapPhuKien).GetName();
                default: return typeof(PhuKien).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTNhapPhuKien), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(CTPhieuXuatPhuKien), this.GetType().Name, Ma);
                case 2: return Table.GetList(typeof(CTCungCapPhuKien), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(PhuKien), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Loại xe")]
    public partial class LoaiXe : MasterDetailInfo
    {
        public override int GetRelationCount() { return 4; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTCungCapXe).GetName();
                case 1: return typeof(CTPhieuNhapXe).GetName();
                case 2: return typeof(CTPhieuXuatXe).GetName();
                default: return typeof(Xe).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTCungCapXe), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(CTPhieuNhapXe), this.GetType().Name, Ma);
                case 2: return Table.GetList(typeof(CTPhieuXuatXe), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(Xe), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Menu")]
    public partial class Menu : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(Quyen_Menu).GetName();
        }
        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(Quyen_Menu), this.GetType().Name, Ma);
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Nhà cung cấp")]
    public partial class NCC : MasterDetailInfo
    {
        public override int GetRelationCount() { return 4; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTCungCapPhuKien).GetName();
                case 1: return typeof(CTCungCapXe).GetName();
                case 2: return typeof(PhieuNhapPhuKien).GetName();
                default: return typeof(PhieuNhapXe).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTCungCapPhuKien), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(CTCungCapXe), this.GetType().Name, Ma);
                case 2: return Table.GetList(typeof(PhieuNhapPhuKien), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(PhieuNhapXe), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Nhân viên")]
    public partial class NhanVien : MasterDetailInfo
    {
        public override int GetRelationCount() { return 8; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTVanChuyen).GetName();
                case 1: return typeof(HoSoBanXe).GetName();
                case 2: return typeof(Kho).GetName();
                case 3: return typeof(PhieuNhapPhuKien).GetName();
                case 4: return typeof(PhieuNhapXe).GetName();
                case 5: return typeof(PhieuSuaChua).GetName();
                case 6: return typeof(ChiNhanh).GetName();
                default: return typeof(PhieuXuatKho).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTVanChuyen), "NhanVien", Ma);
                case 1: return Table.GetList(typeof(HoSoBanXe), "NhanVienBan", Ma);
                case 2: return Table.GetList(typeof(Kho), "NVQuanLy", Ma);
                case 3: return Table.GetList(typeof(PhieuNhapPhuKien), "NVXacNhan", Ma);
                case 4: return Table.GetList(typeof(PhieuNhapXe), "NVXacNhan", Ma);
                case 5: return Table.GetList(typeof(PhieuSuaChua), "NVSuaChua", Ma);
                case 6: return Table.GetList(typeof(ChiNhanh), "NVQuanLy", Ma);
                default: return Table.GetList(typeof(PhieuXuatKho), "NVXacNhan", Ma);
            }
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + HoTen;
        }
    }


    [TypeDisplay(Name = "Phiếu nhập phụ kiện")]
    public partial class PhieuNhapPhuKien : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(CTNhapPhuKien).GetName();
        }
        public override IList GetChildList(int RelationIndex)
        {

            return Table.GetList(typeof(CTNhapPhuKien), this.GetType().Name, Ma);

        }
        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "Phiếu nhập xe")]
    public partial class PhieuNhapXe : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(CTPhieuNhapXe).GetName();
        }

        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(CTPhieuNhapXe), this.GetType().Name, Ma);
        }
        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "Phiếu sửa chữa")]
    public partial class PhieuSuaChua : MasterDetailInfo
    {

        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(CTSuaChua).GetName();
        }

        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(CTSuaChua), this.GetType().Name, Ma);
        }

        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "phiếu xuất kho")]
    public partial class PhieuXuatKho : MasterDetailInfo
    {
        public override int GetRelationCount() { return 3; }
        public override string GetRelationName(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return typeof(CTVanChuyen).GetName();
                case 1: return typeof(CTPhieuXuatPhuKien).GetName();
                default: return typeof(CTPhieuXuatXe).GetName();
            }
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTVanChuyen), this.GetType().Name, Ma);
                case 1: return Table.GetList(typeof(CTPhieuXuatPhuKien), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(CTPhieuXuatXe), this.GetType().Name, Ma);
            }
        }
        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "Phụ kiện")]
    public partial class PhuKien : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(CTSuaChua).GetName();
        }
        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(CTSuaChua), this.GetType().Name, Ma);
        }
        public override string ToString()
        {
            return Ma;
        }
    }

    [TypeDisplay(Name = "Phân quyền cho menu")]
    public partial class Quyen_Menu : MasterDetailInfo
    {

    }

    [TypeDisplay(Name = "Quyền")]
    public partial class Quyen : MasterDetailInfo
    {
        public override int GetRelationCount() { return 2; }
        public override string GetRelationName(int RelationIndex)
        {
            switch(RelationIndex)
            {
                case 0: return typeof(CTQuyen).GetName();
                default: return typeof(Quyen_Menu).GetName();
            }           
        }
        public override IList GetChildList(int RelationIndex)
        {
            switch (RelationIndex)
            {
                case 0: return Table.GetList(typeof(CTQuyen), this.GetType().Name, Ma);
                default: return Table.GetList(typeof(Quyen_Menu), this.GetType().Name, Ma);
            } 
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }

    [TypeDisplay(Name = "Xe")]
    public partial class Xe : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex)
        {
            return typeof(HoSoBanXe).GetName();
        }
        public override IList GetChildList(int RelationIndex)
        {
            return Table.GetList(typeof(HoSoBanXe), this.GetType().Name, SoMay);
        }
        public override string ToString()
        {
            return SoMay;
        }
    }
}
