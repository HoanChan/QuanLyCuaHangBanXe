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
    //} 
    [TypeDisplay(Name = "Chức vụ")]
    public partial class ChucVu : MasterDetailInfo
    {
        //public override int GetRelationCount() { return 1; }
        //public override string GetRelationName(int RelationIndex) { return "Sử Dụng Dịch Vụ"; }
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
            return "(" + MaCV + ") " + TenCV;
        }
    }
}
