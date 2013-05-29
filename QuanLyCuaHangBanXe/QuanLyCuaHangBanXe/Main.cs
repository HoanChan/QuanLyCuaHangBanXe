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
            //XtraFormLogin Login = new XtraFormLogin();
            //if (Login.ShowDialog() == DialogResult.Cancel) Environment.Exit(0);
            InitializeComponent();
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

        private void iQuanLyChucVu_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new ChucVu());
        }

        private void iQuanLyChiNhanh_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new ChiNhanh());
        }

        private void iQuanLyNhanVien_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new NhanVien());
        }

        private void iQuanLyKho_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new Kho());
        }

        private void iQuanLyKhachHang_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new KhachHang());
        }

        private void iQuanLyHoSoBanXe_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new HoSoBanXe());
        }

        private void iQuanLyPhuKien_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new PhuKien());
        }

        private void iQuanLyLoaiPhuKien_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new LoaiPhuKien());
        }

        private void iQuanLyXe_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new Xe());
        }

        private void iQuanLyLoaiXe_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new LoaiXe());
        }

        private void iQuanLyPhieuNhapPhuKien_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new PhieuNhapPhuKien());
        }

        private void iQuanLyPhieuNhapXe_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new PhieuNhapXe());
        }

        private void iQuanLyPhieuSuaChua_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new PhieuSuaChua());
        }

        private void iQuanLyPhieuXuatKho_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new PhieuXuatKho());
        }

    }
}