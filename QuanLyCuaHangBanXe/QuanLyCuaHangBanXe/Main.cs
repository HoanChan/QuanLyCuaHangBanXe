using DevExpress.XtraBars;
using DevExpress.XtraBars.Helpers;
using DevExpress.XtraBars.Ribbon;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.Linq;
using System.Windows.Forms;
using DataContext;
namespace QuanLyCuaHangBanXe
{
    public partial class Main : RibbonForm
    {
        MasterDetailInfo CurrentMDI = new MasterDetailInfo();
        //NguoiDung NguoiDung = null;
        public Main()
        {
            //XtraFormLogin Login = new XtraFormLogin(db.NguoiDung.ToList());
            //if (Login.ShowDialog() == DialogResult.Cancel) Environment.Exit(0);
            //NguoiDung = Login.NguoiDung;
            InitializeComponent();
            //NguoiDungRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "001") > 0; // admin
            //PhongRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "002") > 0; // quan ly
            //DichVuRibbonPageGroup.Visible = NguoiDung.dsPhanQuyen.Count(m => m.Quyen.Ma == "003") > 0; // tiep tan
            //ThuePhongRibbonPageGroup.Visible = PhongRibbonPageGroup.Visible || DichVuRibbonPageGroup.Visible;
            //iQuanLyDichVu.Visibility = PhongRibbonPageGroup.Visible ? BarItemVisibility.Always : BarItemVisibility.Never;
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

        private void iQuanLyNgoiDung_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new NhanVien();
            UpdateGridView();
        }

        private void iQuanLyQuyen_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            CurrentMDI = new Quyen();
            UpdateGridView();
        }

        private void iQuanLyPhanQuyen_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            //CurrentMDI = new CV_q();
            UpdateGridView();
        }

        private void iBaoCao_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            XtraReport r = new XtraReport();
            r.Landscape = true;
            
            ReportBuilderHelper rbh = new ReportBuilderHelper();
            IList aList = Table.GetList(CurrentMDI.GetType());
            if(aList == null) { MessageBox.Show("Chọn danh sách đã!"); return; }
            rbh.Header = CurrentMDI.GetName();
            rbh.GenerateReport(r, aList, CurrentMDI.GetType());
            r.ShowPreviewDialog();
        }

    }
}