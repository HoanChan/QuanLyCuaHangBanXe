using QuanLyCuaHangBanXe;
using System;
using System.Collections;
using System.Data;
using System.Linq;
namespace Model
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

    public partial class KhachSanEntities
    {
        public IList GetList(Type Info)
        {
            if (Info == typeof(DichVu)) { return this.DichVu.ToList(); }
            else if (Info == typeof(HoaDon)) { return this.HoaDon.ToList(); }
            else if (Info == typeof(KhachHang)) { return this.KhachHang.ToList(); }
            else if (Info == typeof(LoaiPhong)) { return this.LoaiPhong.ToList(); }
            else if (Info == typeof(NguoiDung)) { return this.NguoiDung.ToList(); }
            else if (Info == typeof(Phong)) { return this.Phong.ToList(); }
            else if (Info == typeof(Quyen)) { return this.Quyen.ToList(); }
            else if (Info == typeof(Tang)) { return this.Tang.ToList(); }
            else if (Info == typeof(ThuePhong)) { return this.ThuePhong.ToList(); }
            else if (Info == typeof(SuDungDichVu)) { return this.SuDungDichVu.ToList(); }
            else if (Info == typeof(PhanQuyen)) { return this.PhanQuyen.ToList(); }
            else { return null; }
        }

        public void Update(object OldObj, object NewObj)
        {
            var Info = OldObj.GetType();
            Object Entity = null;
            if (Info == typeof(DichVu)) { var Key = (OldObj as DichVu).Ma; Entity = this.DichVu.First(m => m.Ma == Key); }
            else if (Info == typeof(HoaDon)) { var Key = (NewObj as HoaDon).FK_ThuePhong = (OldObj as HoaDon).ThuePhong.Ma; Entity = this.HoaDon.First(m => m.FK_ThuePhong == Key); }
            else if (Info == typeof(KhachHang)) { var Key = (OldObj as KhachHang).CMND; Entity = this.KhachHang.First(m => m.CMND == Key); }
            else if (Info == typeof(LoaiPhong)) { var Key = (OldObj as LoaiPhong).Ma; Entity = this.LoaiPhong.First(m => m.Ma == Key); }
            else if (Info == typeof(NguoiDung)) { var Key = (OldObj as NguoiDung).TenDangNhap; Entity = this.NguoiDung.First(m => m.TenDangNhap == Key); }
            else if (Info == typeof(Phong)) { var Key = (OldObj as Phong).Ma; Entity = this.Phong.First(m => m.Ma == Key); }
            else if (Info == typeof(Quyen)) { var Key = (OldObj as Quyen).Ma; Entity = this.Quyen.First(m => m.Ma == Key); }
            else if (Info == typeof(Tang)) { var Key = (OldObj as Tang).Ma; Entity = this.Tang.First(m => m.Ma == Key); }
            else if (Info == typeof(ThuePhong)) { var Key = (OldObj as ThuePhong).Ma; Entity = this.ThuePhong.First(m => m.Ma == Key); }
            else if (Info == typeof(SuDungDichVu)) { var Key1 = (NewObj as SuDungDichVu).FK_DichVu = (OldObj as SuDungDichVu).DichVu.Ma; var Key2 = (NewObj as SuDungDichVu).FK_ThuePhong = (OldObj as SuDungDichVu).ThuePhong.Ma; Entity = this.SuDungDichVu.First(m => m.FK_DichVu == Key1 && m.FK_ThuePhong == Key2); }
            else if (Info == typeof(PhanQuyen)) { var Key1 = (NewObj as PhanQuyen).FK_Quyen = (OldObj as PhanQuyen).Quyen.Ma; var Key2 = (NewObj as PhanQuyen).FK_NguoiDung = (OldObj as PhanQuyen).NguoiDung.TenDangNhap; Entity = this.PhanQuyen.First(m => m.FK_Quyen == Key1 && m.FK_NguoiDung == Key2); }
            else { return; }
            if (Entity != null)
            {
                if (NewObj is ThuePhong)
                {
                    var item = NewObj as ThuePhong;
                    item.GioDat = DateTime.Today.AddHours(item.GioDat.Hour).AddMinutes(item.GioDat.Minute);
                    item.GioNhan = DateTime.Today.AddHours(item.GioNhan.Hour).AddMinutes(item.GioNhan.Minute);
                    item.GioTra = DateTime.Today.AddHours(item.GioTra.Hour).AddMinutes(item.GioTra.Minute);
                }
                Entity.SetPropertiesValue(NewObj);
            }
            this.SaveChanges();
        }

        public void AddNew(object NewObj)
        {
            if (NewObj is ThuePhong)
            {
                var item = NewObj as ThuePhong;
                item.GioDat = DateTime.Today.AddHours(item.GioDat.Hour).AddMinutes(item.GioDat.Minute);
                item.GioNhan = DateTime.Today.AddHours(item.GioNhan.Hour).AddMinutes(item.GioNhan.Minute);
                item.GioTra = DateTime.Today.AddHours(item.GioTra.Hour).AddMinutes(item.GioTra.Minute);
            }
            var Info = NewObj.GetType();
            if (Info == typeof(DichVu)) { var Key = (NewObj as DichVu).Ma; if (this.DichVu.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.DichVu.Add(NewObj as DichVu); }
            else if (Info == typeof(HoaDon)) { var Key = (NewObj as HoaDon).ThuePhong.Ma; if (this.HoaDon.Count(m => m.ThuePhong.Ma == Key) > 0) throw new Exception("Đã có hoá đơn được lập cho Thuê Phòng này rồi!"); this.HoaDon.Add(NewObj as HoaDon); }
            else if (Info == typeof(KhachHang)) { var Key = (NewObj as KhachHang).CMND; if (this.KhachHang.Count(m => m.CMND == Key) > 0) throw new Exception("CMND đã được sử dụng!"); this.KhachHang.Add(NewObj as KhachHang); }
            else if (Info == typeof(LoaiPhong)) { var Key = (NewObj as LoaiPhong).Ma; if (this.LoaiPhong.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.LoaiPhong.Add(NewObj as LoaiPhong); }
            else if (Info == typeof(NguoiDung)) { var Key = (NewObj as NguoiDung).TenDangNhap; if (this.NguoiDung.Count(m => m.TenDangNhap == Key) > 0) throw new Exception("Tên đăng nhập đã được sử dụng!"); this.NguoiDung.Add(NewObj as NguoiDung); }
            else if (Info == typeof(Phong)) { var Key = (NewObj as Phong).Ma; if (this.Phong.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.Phong.Add(NewObj as Phong); }
            else if (Info == typeof(Quyen)) { var Key = (NewObj as Quyen).Ma; if (this.Quyen.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.Quyen.Add(NewObj as Quyen); }
            else if (Info == typeof(Tang)) { var Key = (NewObj as Tang).Ma; if (this.Tang.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.Tang.Add(NewObj as Tang); }
            else if (Info == typeof(ThuePhong)) { var Key = (NewObj as ThuePhong).Ma; if (this.ThuePhong.Count(m => m.Ma == Key) > 0) throw new Exception("Mã đã được sử dụng!"); this.ThuePhong.Add(NewObj as ThuePhong); }
            else if (Info == typeof(SuDungDichVu)) { var Key1 = (NewObj as SuDungDichVu).DichVu.Ma; var Key2 = (NewObj as SuDungDichVu).ThuePhong.Ma; if (this.SuDungDichVu.Count(m => m.DichVu.Ma == Key1 && m.ThuePhong.Ma == Key2) > 0) throw new Exception("Nội dung đã được sử dụng!"); this.SuDungDichVu.Add(NewObj as SuDungDichVu); }
            else if (Info == typeof(PhanQuyen)) { var Key1 = (NewObj as PhanQuyen).Quyen.Ma; var Key2 = (NewObj as PhanQuyen).NguoiDung.TenDangNhap; if (this.PhanQuyen.Count(m => m.Quyen.Ma == Key1 && m.NguoiDung.TenDangNhap == Key2) > 0) throw new Exception("Nội dung đã được sử dụng!"); this.PhanQuyen.Add(NewObj as PhanQuyen); }
            else { return; }
            this.SaveChanges();
        }

        public void Delete(object OldObj)
        {
            var Info = OldObj.GetType();
            if (Info == typeof(DichVu)) { var Key = (OldObj as DichVu).Ma; this.DichVu.Remove(this.DichVu.First(m => m.Ma == Key)); }
            else if (Info == typeof(HoaDon)) { var Key = (OldObj as HoaDon).FK_ThuePhong; this.HoaDon.Remove(this.HoaDon.First(m => m.FK_ThuePhong == Key)); }
            else if (Info == typeof(KhachHang)) { var Key = (OldObj as KhachHang).CMND; this.KhachHang.Remove(this.KhachHang.First(m => m.CMND == Key)); }
            else if (Info == typeof(LoaiPhong)) { var Key = (OldObj as LoaiPhong).Ma; this.LoaiPhong.Remove(this.LoaiPhong.First(m => m.Ma == Key)); }
            else if (Info == typeof(NguoiDung)) { var Key = (OldObj as NguoiDung).TenDangNhap; this.NguoiDung.Remove(this.NguoiDung.First(m => m.TenDangNhap == Key)); }
            else if (Info == typeof(Phong)) { var Key = (OldObj as Phong).Ma; this.Phong.Remove(this.Phong.First(m => m.Ma == Key)); }
            else if (Info == typeof(Quyen)) { var Key = (OldObj as Quyen).Ma; this.Quyen.Remove(this.Quyen.First(m => m.Ma == Key)); }
            else if (Info == typeof(Tang)) { var Key = (OldObj as Tang).Ma; this.Tang.Remove(this.Tang.First(m => m.Ma == Key)); }
            else if (Info == typeof(ThuePhong)) { var Key = (OldObj as ThuePhong).Ma; this.ThuePhong.Remove(this.ThuePhong.First(m => m.Ma == Key)); }
            else if (Info == typeof(SuDungDichVu)) { var Key1 = (OldObj as SuDungDichVu).FK_DichVu; var Key2 = (OldObj as SuDungDichVu).FK_ThuePhong; this.SuDungDichVu.Remove(this.SuDungDichVu.First(m => m.FK_DichVu == Key1 && m.FK_ThuePhong == Key2)); }
            else if (Info == typeof(PhanQuyen)) { var Key1 = (OldObj as PhanQuyen).FK_Quyen; var Key2 = (OldObj as PhanQuyen).FK_NguoiDung; this.PhanQuyen.Remove(this.PhanQuyen.First(m => m.FK_Quyen == Key1 && m.FK_NguoiDung == Key2)); }
            else { return; }
            this.SaveChanges();
        }

        //public void Unchanges()
        //{
        //    foreach (var entry in this.ChangeTracker.Entries())
        //    {
        //        if (entry.State == EntityState.Modified)
        //        {
        //            entry.State = EntityState.Unchanged;
        //        }
        //        else if (entry.State == EntityState.Added)
        //        {
        //            entry.State = EntityState.Detached;
        //        }
        //    }
        //}
    }

    [TypeDisplay(Name="Dịch Vụ")]
    public partial class DichVu : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Sử Dụng Dịch Vụ"; }
        public override bool IsEmpty(int RelationIndex) { return dsSuDungDichVu == null ? true : dsSuDungDichVu.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsSuDungDichVu.Select(m => new
            {
                Mã = m.DichVu.Ma,
                DịchVụ = m.DichVu.Ten,
                Giá = m.DichVu.Gia,
                ĐơnVịTính = m.DichVu.DonViTinh,
                SốLượng = m.SoLuong,
                ThôngTin = m.DichVu.ThongTin
            }).ToList();
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
    [TypeDisplay(Name = "Sử Dụng Dịch Vụ")]
    public partial class SuDungDichVu : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + ThuePhong.Ma + ") " + DichVu.Ten;
        }
    }
    [TypeDisplay(Name = "Hoá Đơn")]
    public partial class HoaDon : MasterDetailInfo
    {
        public override string ToString()
        {
            return ThuePhong.Ma + "(" + NgayLap.ToShortDateString() + ")";
        }
    }
    [TypeDisplay(Name = "Khách Hàng")]
    public partial class KhachHang : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Thuê Phòng"; }
        public override bool IsEmpty(int RelationIndex) { return dsThuePhong == null ? true : dsThuePhong.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsThuePhong.Select(m => new
            {
                Mã = m.Ma,
                KháchHàng = m.KhachHang,
                Phòng = m.Phong,
                NgàyĐặt = m.NgayDat,
                GiờĐặt = m.GioDat,
                NgàyNhận = m.NgayNhan,
                GiờNhận = m.GioNhan,
                NgàyTrả = m.NgayTra,
                GiờTrả = m.GioTra,
                SốNgàyDựKiến = m.SoNgayDuKien,
                ĐặtCọc = m.DatCoc,
                GhiChú = m.GhiChu
            }).ToList();
        }

        public override string ToString()
        {
            return "(" + CMND + ") " + HoTen;
        }
    }
    [TypeDisplay(Name = "Loại Phòng")]
    public partial class LoaiPhong : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Phòng"; }
        public override bool IsEmpty(int RelationIndex) { return dsPhong == null ? true : dsPhong.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsPhong.Select(m => new
            {
                Mã = m.Ma,
                Tên = m.Ten,
                Tầng = m.Tang,
                LoạiPhòng = m.LoaiPhong,
                GhiChú = m.GhiChu
            }).ToList();
        }

        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
    [TypeDisplay(Name = "Phòng")]
    public partial class Phong : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Thuê Phòng"; }
        public override bool IsEmpty(int RelationIndex) { return dsThuePhong == null ? true : dsThuePhong.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsThuePhong.Select(m => new
            {
                Mã = m.Ma,
                KháchHàng = m.KhachHang,
                Phòng = m.Phong,
                NgàyĐặt = m.NgayDat,
                GiờĐặt = m.GioDat,
                NgàyNhận = m.NgayNhan,
                GiờNhận = m.GioNhan,
                NgàyTrả = m.NgayTra,
                GiờTrả = m.GioTra,
                SốNgàyDựKiến = m.SoNgayDuKien,
                ĐặtCọc = m.DatCoc,
                GhiChú = m.GhiChu
            }).ToList();
        }

        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
    [TypeDisplay(Name = "Thuê Phòng")]
    public partial class ThuePhong : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Dịch Vụ"; }
        public override bool IsEmpty(int RelationIndex) { return dsSuDungDichVu == null ? true : dsSuDungDichVu.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsSuDungDichVu.Select(m => new
            {
                Mã = m.DichVu.Ma,
                DịchVụ = m.DichVu.Ten,
                Giá = m.DichVu.Gia,
                ĐơnVịTính = m.DichVu.DonViTinh,
                SốLượng = m.SoLuong,
                ThôngTin = m.DichVu.ThongTin
            }).ToList();
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Phong.Ten + " - " + KhachHang.HoTen;
        }
    }
    [TypeDisplay(Name = "Tầng")]
    public partial class Tang : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Phòng"; }
        public override bool IsEmpty(int RelationIndex) { return dsPhong == null ? true : dsPhong.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsPhong.Select(m => new
            {
                Mã = m.Ma,
                Tên = m.Ten,
                Tầng = m.Tang,
                LoạiPhòng = m.LoaiPhong,
                GhiChú = m.GhiChu
            }).ToList();
        }


        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
    [TypeDisplay(Name = "Người Dùng")]
    public partial class NguoiDung : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Phân Quyền"; }
        public override bool IsEmpty(int RelationIndex) { return dsPhanQuyen == null ? true : dsPhanQuyen.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsPhanQuyen.Select(m => new
            {
                Mã = m.Quyen.Ma,
                Tên = m.Quyen.Ten,
                ChiTiết = m.Quyen.ChiTiet
            }).ToList();
        }
        public override string ToString()
        {
            return "(" + TenDangNhap + ") " + HoTen;
        }
    }
    [TypeDisplay(Name = "Phân Quyền")]
    public partial class PhanQuyen : MasterDetailInfo
    {
        public override string ToString()
        {
            return "(" + NguoiDung.TenDangNhap + ") " + Quyen.Ten;
        }
    }
    [TypeDisplay(Name = "Quyền")]
    public partial class Quyen : MasterDetailInfo
    {
        public override int GetRelationCount() { return 1; }
        public override string GetRelationName(int RelationIndex) { return "Phân Quyền"; }
        public override bool IsEmpty(int RelationIndex) { return dsPhanQuyen == null ? true : dsPhanQuyen.Count == 0; }
        public override IList GetChildList(int RelationIndex)
        {
            return dsPhanQuyen.Select(m => new
            {
                TênĐăngNhập = m.NguoiDung.TenDangNhap,
                MậtKhẩu = m.NguoiDung.MatKhau,
                HọTên = m.NguoiDung.HoTen,
                Email = m.NguoiDung.Email
            }).ToList();
        }
        public override string ToString()
        {
            return "(" + Ma + ") " + Ten;
        }
    }
}
