using DevExpress.XtraBars;
using DevExpress.XtraBars.Helpers;
using DevExpress.XtraBars.Ribbon;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraReports.UI;
using Model;
using System;
using System.Collections;
using System.Linq;
using System.Windows.Forms;
namespace QuanLyCuaHangBanXe
{
    public partial class Main : RibbonForm
    {
        KhachSanEntities db = new KhachSanEntities();
        MasterDetailInfo CurrentMDI = new MasterDetailInfo();
        NguoiDung NguoiDung = null;
        public Main()
        {
            XtraFormLogin Login = new XtraFormLogin(db.NguoiDung.ToList());
            if (Login.ShowDialog() == DialogResult.Cancel) Environment.Exit(0);
            NguoiDung = Login.NguoiDung;
            InitializeComponent();
            NguoiDungRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "001") > 0; // admin
            PhongRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "002") > 0; // quan ly
            DichVuRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "003") > 0; // tiep tan
            ThuePhongRibbonPageGroup.Visible = PhongRibbonPageGroup.Visible || DichVuRibbonPageGroup.Visible;
            iQuanLyDichVu.Visibility = PhongRibbonPageGroup.Visible ? BarItemVisibility.Always : BarItemVisibility.Never;
            InitSkinGallery();
            InitGrid();
        }

        void InitSkinGallery()
        {
            SkinHelper.InitSkinGallery(rgbiSkins, true);
        }

        void InitGrid()
        {
            //gridView.NewItemRowText = "Bấm vào đây để thêm dữ liệu mới";
            gridView.OptionsPrint.EnableAppearanceEvenRow = true;
            gridView.OptionsPrint.EnableAppearanceOddRow = true;
            gridView.OptionsBehavior.Editable = false;
            //gridView.OptionsView.NewItemRowPosition = NewItemRowPosition.Top;
            gridView.OptionsDetail.EnableMasterViewMode = true;
            gridView.OptionsSelection.MultiSelect = false;
            gridView.OptionsDetail.ShowDetailTabs = true;
            gridView.OptionsDetail.AllowOnlyOneMasterRowExpanded = true;
            gridView.OptionsDetail.AllowZoomDetail = false;
            
            gridView.MasterRowEmpty += new MasterRowEmptyEventHandler(gridView_MasterRowEmpty);
            gridView.MasterRowGetChildList += new MasterRowGetChildListEventHandler(gridView_MasterRowGetChildList);
            gridView.MasterRowGetRelationName += new MasterRowGetRelationNameEventHandler(gridView_MasterRowGetRelationName);
            gridView.MasterRowGetRelationDisplayCaption += new MasterRowGetRelationNameEventHandler(gridView_MasterRowGetRelationDisplayCaption);
            gridView.MasterRowGetRelationCount += new MasterRowGetRelationCountEventHandler(gridView_MasterRowGetRelationCount);
            
        }

        private void gridView_MasterRowEmpty(object sender, MasterRowEmptyEventArgs e)
        {
            var Row = (MasterDetailInfo)gridView.GetRow(e.RowHandle);
            e.IsEmpty = Row.IsEmpty(e.RelationIndex);
        }

        private void gridView_MasterRowGetChildList(object sender, MasterRowGetChildListEventArgs e)
        {
            var Row = (MasterDetailInfo)gridView.GetRow(e.RowHandle);
            e.ChildList = Row.GetChildList(e.RelationIndex);
        }

        private void gridView_MasterRowGetRelationCount(object sender, MasterRowGetRelationCountEventArgs e)
        {
            e.RelationCount = CurrentMDI.GetRelationCount();
        }

        private void gridView_MasterRowGetRelationName(object sender, MasterRowGetRelationNameEventArgs e)
        {
            e.RelationName = "Detail";
        }

        private void gridView_MasterRowGetRelationDisplayCaption(object sender, MasterRowGetRelationNameEventArgs e)
        {
            //var Row = (MasterDetailInfo)gridView.GetRow(e.RowHandle);
            e.RelationName = CurrentMDI.GetRelationName(e.RelationIndex);
        }


        private void iSave_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                if (db.ThuePhong.Local.Count > 0) 
                {
                    foreach (var item in db.ThuePhong.Local)
                    {
                        item.GioDat = DateTime.Today.AddHours(item.GioDat.Hour).AddMinutes(item.GioDat.Minute);
                        item.GioNhan = DateTime.Today.AddHours(item.GioNhan.Hour).AddMinutes(item.GioNhan.Minute);
                        item.GioTra = DateTime.Today.AddHours(item.GioTra.Hour).AddMinutes(item.GioTra.Minute);
                    }
                }
                db.SaveChanges();
                MessageBox.Show("Đã lưu xong!");
            }
            catch (Exception ex)//(DbEntityValidationException dbEx)
            {
                var Err = ex.Message;
                //foreach (var validationErrors in dbEx.EntityValidationErrors)
                //{
                //    foreach (var validationError in validationErrors.ValidationErrors)
                //    {
                //        Err += string.Format("Class: {0}, Property: {1}, Error: {2}",
                //            validationErrors.Entry.Entity.GetType().FullName,
                //            validationError.PropertyName,
                //            validationError.ErrorMessage) + "\r\n";
                //    }
                //}
                MessageBox.Show("Không lưu được! Lỗi: " + Err);
            }
        }

        private void iDelete_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            gridView.DeleteSelectedRows();
        }

        void rDate_CloseUp(object sender, DevExpress.XtraEditors.Controls.CloseUpEventArgs e)
        {
            throw new NotImplementedException();
        }

        
        private void iQuanLyTang_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new Tang();
            UpdateGridView(db.Tang, db.Tang.ToList());
        }

        private void iQuanLyLoaiPhong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new LoaiPhong();
            UpdateGridView(db.LoaiPhong, db.LoaiPhong.ToList());
        }

        private void iQuanLyPhong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new Phong();
            UpdateGridView(db.Phong, db.Phong.ToList());
        }

        private void iQuanLyThuePhong_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new ThuePhong();
            UpdateGridView(db.ThuePhong, db.ThuePhong.ToList());
        }

        private void iQuanLyDichVu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new DichVu();
            UpdateGridView(db.DichVu, db.DichVu.ToList());
        }

        private void iQuanLySuDungDichVu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new SuDungDichVu();
            UpdateGridView(db.SuDungDichVu, db.SuDungDichVu.ToList());
        }

        private void iQuanLyKhachHang_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new KhachHang();
            UpdateGridView(db.KhachHang, db.KhachHang.ToList());
        }

        private void iQuanLyHoaDon_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new HoaDon();
            UpdateGridView(db.HoaDon, db.HoaDon.ToList());
        }

        private void iQuanLyNgoiDung_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new NguoiDung();
            UpdateGridView(db.NguoiDung, db.NguoiDung.ToList());
        }

        private void iQuanLyQuyen_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new Quyen();
            UpdateGridView(db.Quyen, db.Quyen.ToList());
        }

        private void iQuanLyPhanQuyen_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new PhanQuyen();
            UpdateGridView(db.PhanQuyen, db.PhanQuyen.ToList());
        }

        private void iBaoCao_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            XtraReport r = new XtraReport();
            r.Landscape = true;
            
            ReportBuilderHelper rbh = new ReportBuilderHelper();
            IList aList = db.GetList(CurrentMDI.GetType());
            if(aList == null) { MessageBox.Show("Chọn danh sách đã!"); return; }
            rbh.Header = CurrentMDI.GetName();
            rbh.GenerateReport(r, aList, CurrentMDI.GetType());
            r.ShowPreviewDialog();
        }

        private void iBaoCaoHoaDon_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            rpHoaDon rHD = new rpHoaDon();
            rHD.DataSource = db.HoaDon.ToList();
            rHD.ShowPreviewDialog();
        }

    }
}