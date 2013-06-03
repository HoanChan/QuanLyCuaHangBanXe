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
using System.Collections.Generic;
namespace QuanLyCuaHangBanXe
{
    public partial class Main : RibbonForm
    {
        MasterDetailInfo CurrentMDI = new MasterDetailInfo();
        IList ReportList = null;
        List<CTQuyen> DSQuyen = null;
        //NguoiDung NguoiDung = null;
        public Main()
        {
            XtraFormLogin Login = new XtraFormLogin();
            if (Login.ShowDialog() == DialogResult.Cancel) Environment.Exit(0);
            InitializeComponent();
            var TabList = new List<RibbonPage>() { QuanLyRibbonPage };
            foreach (var page in TabList)
            {
                foreach (var group in page.Groups.Cast<RibbonPageGroup>())
                {
                    var MenuList = group.ItemLinks.Cast<BarButtonItemLink>()
                                    .Select(m => m.Item)
                                    .Where(c => c.GetType().Equals(typeof(BarButtonItem)));
                    foreach (var button in MenuList)
                        button.Visibility = BarItemVisibility.Never;
                }

            }

            DSQuyen = Table.GetListQuyen(Login.UserName);
            foreach (CTQuyen ctq in DSQuyen)
            {
                (ribbonControl.Items[ctq.Menu] as BarButtonItem).Visibility = BarItemVisibility.Always;
            }
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
            gridView.GroupPanelText = gridView1.GroupPanelText = "Kéo cột dữ liệu vào đây để gom nhóm";
            gridView.OptionsPrint.EnableAppearanceEvenRow = true;
            gridView.OptionsPrint.EnableAppearanceOddRow = true;
            gridView.OptionsBehavior.Editable = gridView1.OptionsBehavior.Editable = false;
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


        private void iExit_ItemClick(object sender, ItemClickEventArgs e)
        {
            Environment.Exit(0);
        }
        private void iBaoCao_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            XtraReport r = new XtraReport();
            r.Landscape = true;
            
            ReportBuilderHelper rbh = new ReportBuilderHelper();
            if(ReportList == null) { MessageBox.Show("Chọn danh sách đã!"); return; }
            rbh.Header = "Danh sách " + CurrentMDI.GetName();
            rbh.GenerateReport(r, ReportList, CurrentMDI.GetType());
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

        private void iQuanLyNCC_ItemClick(object sender, ItemClickEventArgs e)
        {
            UpdateGridView(new NCC());
        }

        private void iBaoCaov_Kho_HangTon_ItemClick(object sender, ItemClickEventArgs e)
        {
            rpTonKho rpTK = new rpTonKho();
            rpTK.DataSource = Table.GetList(typeof(v_Kho_HangTon), null, null, false);
            rpTK.ShowPreviewDialog();
        }

        private void iBaoCaov_CuaHang_HangTon_ItemClick(object sender, ItemClickEventArgs e)
        {
            rpTonChiNhanh rp = new rpTonChiNhanh();
            rp.DataSource = Table.GetList(typeof(v_ChiNhanh_HangTon), null, null, false);
            rp.ShowPreviewDialog();
        }

        private void iBaoCaov_HoSoBanXe_ItemClick(object sender, ItemClickEventArgs e)
        {
            rpHoSoBanXe rp = new rpHoSoBanXe();
            rp.DataSource = Table.GetList(typeof(v_HoSoBanXe), null, null, false);
            rp.ShowPreviewDialog();
        }

        private void iBaoCaov_LichSuKhachHang_ItemClick(object sender, ItemClickEventArgs e)
        {
            rpLichSuKhachHang rp = new rpLichSuKhachHang();
            rp.DataSource = Table.GetList(typeof(v_LichSuKhachHang), null, null, false);
            rp.ShowPreviewDialog();
        }

    }
}