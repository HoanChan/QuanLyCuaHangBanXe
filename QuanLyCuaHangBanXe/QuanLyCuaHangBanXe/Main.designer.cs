namespace QuanLyCuaHangBanXe
{
    partial class Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            DevExpress.XtraGrid.GridLevelNode gridLevelNode1 = new DevExpress.XtraGrid.GridLevelNode();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            this.cardView1 = new DevExpress.XtraGrid.Views.Card.CardView();
            this.DataGridView = new DevExpress.XtraGrid.GridControl();
            this.gridView = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.ribbonControl = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.appMenu = new DevExpress.XtraBars.Ribbon.ApplicationMenu(this.components);
            this.iExit = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonImageCollection = new DevExpress.Utils.ImageCollection(this.components);
            this.siStatus = new DevExpress.XtraBars.BarStaticItem();
            this.iBoldFontStyle = new DevExpress.XtraBars.BarButtonItem();
            this.iItalicFontStyle = new DevExpress.XtraBars.BarButtonItem();
            this.iUnderlinedFontStyle = new DevExpress.XtraBars.BarButtonItem();
            this.iLeftTextAlign = new DevExpress.XtraBars.BarButtonItem();
            this.iCenterTextAlign = new DevExpress.XtraBars.BarButtonItem();
            this.iRightTextAlign = new DevExpress.XtraBars.BarButtonItem();
            this.rgbiSkins = new DevExpress.XtraBars.RibbonGalleryBarItem();
            this.iQuanLyKhachHang = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyHoSoBanXe = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhuKien = new DevExpress.XtraBars.BarButtonItem();
            this.iBaoCao = new DevExpress.XtraBars.BarButtonItem();
            this.barStaticItem1 = new DevExpress.XtraBars.BarStaticItem();
            this.iQuanLyChucVu = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyChiNhanh = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyNhanVien = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyLoaiPhuKien = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyXe = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyKho = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyLoaiXe = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyNCC = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhieuNhapPhuKien = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhieuNhapXe = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhieuSuaChua = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhieuXuatKho = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonImageCollectionLarge = new DevExpress.Utils.ImageCollection(this.components);
            this.homeRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.fileRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.skinsRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.QuanLyRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.RPGNguoiDung = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.BaoCaoRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.rpName = new DevExpress.XtraEditors.Repository.RepositoryItemTextEdit();
            this.rpPass = new DevExpress.XtraEditors.Repository.RepositoryItemTextEdit();
            this.ribbonStatusBar = new DevExpress.XtraBars.Ribbon.RibbonStatusBar();
            this.splitContainerControl = new DevExpress.XtraEditors.SplitContainerControl();
            this.dxErrorProvider = new DevExpress.XtraEditors.DXErrorProvider.DXErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.cardView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.DataGridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.appMenu)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonImageCollection)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonImageCollectionLarge)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rpName)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rpPass)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl)).BeginInit();
            this.splitContainerControl.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dxErrorProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // cardView1
            // 
            this.cardView1.FocusedCardTopFieldIndex = 0;
            this.cardView1.GridControl = this.DataGridView;
            this.cardView1.Name = "cardView1";
            this.cardView1.VertScrollVisibility = DevExpress.XtraGrid.Views.Base.ScrollVisibility.Auto;
            // 
            // DataGridView
            // 
            this.DataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            gridLevelNode1.LevelTemplate = this.cardView1;
            gridLevelNode1.RelationName = "Detail";
            this.DataGridView.LevelTree.Nodes.AddRange(new DevExpress.XtraGrid.GridLevelNode[] {
            gridLevelNode1});
            this.DataGridView.Location = new System.Drawing.Point(0, 0);
            this.DataGridView.MainView = this.gridView;
            this.DataGridView.Name = "DataGridView";
            this.DataGridView.Size = new System.Drawing.Size(754, 541);
            this.DataGridView.TabIndex = 9;
            this.DataGridView.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView,
            this.cardView1});
            // 
            // gridView
            // 
            this.gridView.GridControl = this.DataGridView;
            this.gridView.Name = "gridView";
            // 
            // ribbonControl
            // 
            this.ribbonControl.ApplicationButtonDropDownControl = this.appMenu;
            this.ribbonControl.ApplicationButtonText = null;
            this.ribbonControl.ExpandCollapseItem.Id = 0;
            this.ribbonControl.ExpandCollapseItem.Name = "";
            this.ribbonControl.Images = this.ribbonImageCollection;
            this.ribbonControl.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbonControl.ExpandCollapseItem,
            this.iExit,
            this.siStatus,
            this.iBoldFontStyle,
            this.iItalicFontStyle,
            this.iUnderlinedFontStyle,
            this.iLeftTextAlign,
            this.iCenterTextAlign,
            this.iRightTextAlign,
            this.rgbiSkins,
            this.iQuanLyKhachHang,
            this.iQuanLyHoSoBanXe,
            this.iQuanLyPhuKien,
            this.iBaoCao,
            this.barStaticItem1,
            this.iQuanLyChucVu,
            this.iQuanLyChiNhanh,
            this.iQuanLyNhanVien,
            this.iQuanLyLoaiPhuKien,
            this.iQuanLyXe,
            this.iQuanLyKho,
            this.iQuanLyLoaiXe,
            this.iQuanLyNCC,
            this.iQuanLyPhieuNhapPhuKien,
            this.iQuanLyPhieuNhapXe,
            this.iQuanLyPhieuSuaChua,
            this.iQuanLyPhieuXuatKho});
            this.ribbonControl.LargeImages = this.ribbonImageCollectionLarge;
            this.ribbonControl.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl.MaxItemId = 97;
            this.ribbonControl.Name = "ribbonControl";
            this.ribbonControl.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.homeRibbonPage,
            this.QuanLyRibbonPage,
            this.BaoCaoRibbonPage});
            this.ribbonControl.RepositoryItems.AddRange(new DevExpress.XtraEditors.Repository.RepositoryItem[] {
            this.rpName,
            this.rpPass});
            this.ribbonControl.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonControlStyle.Office2010;
            this.ribbonControl.Size = new System.Drawing.Size(1100, 144);
            this.ribbonControl.StatusBar = this.ribbonStatusBar;
            // 
            // appMenu
            // 
            this.appMenu.ItemLinks.Add(this.iExit);
            this.appMenu.Name = "appMenu";
            this.appMenu.Ribbon = this.ribbonControl;
            this.appMenu.ShowRightPane = true;
            // 
            // iExit
            // 
            this.iExit.Caption = "Exit";
            this.iExit.Description = "Closes this program after prompting you to save unsaved data.";
            this.iExit.Hint = "Closes this program after prompting you to save unsaved data";
            this.iExit.Id = 20;
            this.iExit.ImageIndex = 6;
            this.iExit.LargeImageIndex = 6;
            this.iExit.Name = "iExit";
            // 
            // ribbonImageCollection
            // 
            this.ribbonImageCollection.ImageStream = ((DevExpress.Utils.ImageCollectionStreamer)(resources.GetObject("ribbonImageCollection.ImageStream")));
            this.ribbonImageCollection.Images.SetKeyName(0, "Ribbon_New_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(1, "Ribbon_Open_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(2, "Ribbon_Close_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(3, "Ribbon_Find_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(4, "Ribbon_Save_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(5, "Ribbon_SaveAs_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(6, "Ribbon_Exit_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(7, "Ribbon_Content_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(8, "Ribbon_Info_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(9, "Ribbon_Bold_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(10, "Ribbon_Italic_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(11, "Ribbon_Underline_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(12, "Ribbon_AlignLeft_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(13, "Ribbon_AlignCenter_16x16.png");
            this.ribbonImageCollection.Images.SetKeyName(14, "Ribbon_AlignRight_16x16.png");
            // 
            // siStatus
            // 
            this.siStatus.Caption = "...";
            this.siStatus.Id = 31;
            this.siStatus.Name = "siStatus";
            this.siStatus.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // iBoldFontStyle
            // 
            this.iBoldFontStyle.Caption = "Bold";
            this.iBoldFontStyle.Id = 53;
            this.iBoldFontStyle.ImageIndex = 9;
            this.iBoldFontStyle.Name = "iBoldFontStyle";
            // 
            // iItalicFontStyle
            // 
            this.iItalicFontStyle.Caption = "Italic";
            this.iItalicFontStyle.Id = 54;
            this.iItalicFontStyle.ImageIndex = 10;
            this.iItalicFontStyle.Name = "iItalicFontStyle";
            // 
            // iUnderlinedFontStyle
            // 
            this.iUnderlinedFontStyle.Caption = "Underlined";
            this.iUnderlinedFontStyle.Id = 55;
            this.iUnderlinedFontStyle.ImageIndex = 11;
            this.iUnderlinedFontStyle.Name = "iUnderlinedFontStyle";
            // 
            // iLeftTextAlign
            // 
            this.iLeftTextAlign.Caption = "Left";
            this.iLeftTextAlign.Id = 57;
            this.iLeftTextAlign.ImageIndex = 12;
            this.iLeftTextAlign.Name = "iLeftTextAlign";
            // 
            // iCenterTextAlign
            // 
            this.iCenterTextAlign.Caption = "Center";
            this.iCenterTextAlign.Id = 58;
            this.iCenterTextAlign.ImageIndex = 13;
            this.iCenterTextAlign.Name = "iCenterTextAlign";
            // 
            // iRightTextAlign
            // 
            this.iRightTextAlign.Caption = "Right";
            this.iRightTextAlign.Id = 59;
            this.iRightTextAlign.ImageIndex = 14;
            this.iRightTextAlign.Name = "iRightTextAlign";
            // 
            // rgbiSkins
            // 
            this.rgbiSkins.Caption = "Skins";
            // 
            // rgbiSkins
            // 
            this.rgbiSkins.Gallery.AllowHoverImages = true;
            this.rgbiSkins.Gallery.Appearance.ItemCaptionAppearance.Normal.Options.UseFont = true;
            this.rgbiSkins.Gallery.Appearance.ItemCaptionAppearance.Normal.Options.UseTextOptions = true;
            this.rgbiSkins.Gallery.Appearance.ItemCaptionAppearance.Normal.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            this.rgbiSkins.Gallery.ColumnCount = 4;
            this.rgbiSkins.Gallery.FixedHoverImageSize = false;
            this.rgbiSkins.Gallery.ImageSize = new System.Drawing.Size(32, 17);
            this.rgbiSkins.Gallery.ItemImageLocation = DevExpress.Utils.Locations.Top;
            this.rgbiSkins.Gallery.RowCount = 4;
            this.rgbiSkins.Id = 60;
            this.rgbiSkins.Name = "rgbiSkins";
            // 
            // iQuanLyKhachHang
            // 
            this.iQuanLyKhachHang.Caption = "Khách Hàng";
            this.iQuanLyKhachHang.Id = 71;
            this.iQuanLyKhachHang.LargeImageIndex = 15;
            this.iQuanLyKhachHang.Name = "iQuanLyKhachHang";
            this.iQuanLyKhachHang.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyKhachHang_ItemClick);
            // 
            // iQuanLyHoSoBanXe
            // 
            this.iQuanLyHoSoBanXe.Caption = "Hồ Sơ Bán Xe";
            this.iQuanLyHoSoBanXe.Id = 72;
            this.iQuanLyHoSoBanXe.LargeImageIndex = 16;
            this.iQuanLyHoSoBanXe.Name = "iQuanLyHoSoBanXe";
            this.iQuanLyHoSoBanXe.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyHoSoBanXe.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyHoSoBanXe_ItemClick);
            // 
            // iQuanLyPhuKien
            // 
            this.iQuanLyPhuKien.Caption = "Phụ Kiện";
            this.iQuanLyPhuKien.Id = 73;
            this.iQuanLyPhuKien.LargeImageIndex = 17;
            this.iQuanLyPhuKien.Name = "iQuanLyPhuKien";
            this.iQuanLyPhuKien.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyPhuKien.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhuKien_ItemClick);
            // 
            // iBaoCao
            // 
            this.iBaoCao.Caption = "Báo Cáo";
            this.iBaoCao.Id = 78;
            this.iBaoCao.LargeImageIndex = 18;
            this.iBaoCao.Name = "iBaoCao";
            this.iBaoCao.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iBaoCao_ItemClick);
            // 
            // barStaticItem1
            // 
            this.barStaticItem1.Caption = "Tên đăng nhập:";
            this.barStaticItem1.Id = 82;
            this.barStaticItem1.Name = "barStaticItem1";
            this.barStaticItem1.TextAlignment = System.Drawing.StringAlignment.Near;
            // 
            // iQuanLyChucVu
            // 
            this.iQuanLyChucVu.Caption = "Chức Vụ";
            this.iQuanLyChucVu.Id = 85;
            this.iQuanLyChucVu.LargeImageIndex = 17;
            this.iQuanLyChucVu.Name = "iQuanLyChucVu";
            this.iQuanLyChucVu.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyChucVu_ItemClick);
            // 
            // iQuanLyChiNhanh
            // 
            this.iQuanLyChiNhanh.Caption = "Chi Nhánh";
            this.iQuanLyChiNhanh.Id = 86;
            this.iQuanLyChiNhanh.LargeImageIndex = 10;
            this.iQuanLyChiNhanh.Name = "iQuanLyChiNhanh";
            this.iQuanLyChiNhanh.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyChiNhanh_ItemClick);
            // 
            // iQuanLyNhanVien
            // 
            this.iQuanLyNhanVien.Caption = "Nhân Viên";
            this.iQuanLyNhanVien.Id = 87;
            this.iQuanLyNhanVien.LargeImageIndex = 15;
            this.iQuanLyNhanVien.Name = "iQuanLyNhanVien";
            this.iQuanLyNhanVien.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyNhanVien_ItemClick);
            // 
            // iQuanLyLoaiPhuKien
            // 
            this.iQuanLyLoaiPhuKien.Caption = "Loại Phụ Kiện";
            this.iQuanLyLoaiPhuKien.Id = 88;
            this.iQuanLyLoaiPhuKien.LargeImageIndex = 0;
            this.iQuanLyLoaiPhuKien.Name = "iQuanLyLoaiPhuKien";
            this.iQuanLyLoaiPhuKien.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyLoaiPhuKien_ItemClick);
            // 
            // iQuanLyXe
            // 
            this.iQuanLyXe.Caption = "Xe";
            this.iQuanLyXe.Id = 89;
            this.iQuanLyXe.LargeImageIndex = 3;
            this.iQuanLyXe.Name = "iQuanLyXe";
            this.iQuanLyXe.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyXe_ItemClick);
            // 
            // iQuanLyKho
            // 
            this.iQuanLyKho.Caption = "Kho";
            this.iQuanLyKho.Id = 90;
            this.iQuanLyKho.LargeImageIndex = 11;
            this.iQuanLyKho.Name = "iQuanLyKho";
            this.iQuanLyKho.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyKho_ItemClick);
            // 
            // iQuanLyLoaiXe
            // 
            this.iQuanLyLoaiXe.Caption = "Loại Xe";
            this.iQuanLyLoaiXe.Id = 91;
            this.iQuanLyLoaiXe.LargeImageIndex = 14;
            this.iQuanLyLoaiXe.Name = "iQuanLyLoaiXe";
            this.iQuanLyLoaiXe.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyLoaiXe_ItemClick);
            // 
            // iQuanLyNCC
            // 
            this.iQuanLyNCC.Caption = "Nhà Cung Cấp";
            this.iQuanLyNCC.Id = 92;
            this.iQuanLyNCC.LargeImageIndex = 4;
            this.iQuanLyNCC.Name = "iQuanLyNCC";
            // 
            // iQuanLyPhieuNhapPhuKien
            // 
            this.iQuanLyPhieuNhapPhuKien.Caption = "Phiếu Nhập Phụ Kiện";
            this.iQuanLyPhieuNhapPhuKien.Id = 93;
            this.iQuanLyPhieuNhapPhuKien.LargeImageIndex = 1;
            this.iQuanLyPhieuNhapPhuKien.Name = "iQuanLyPhieuNhapPhuKien";
            this.iQuanLyPhieuNhapPhuKien.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhieuNhapPhuKien_ItemClick);
            // 
            // iQuanLyPhieuNhapXe
            // 
            this.iQuanLyPhieuNhapXe.Caption = "Phiếu Nhập Xe";
            this.iQuanLyPhieuNhapXe.Id = 94;
            this.iQuanLyPhieuNhapXe.LargeImageIndex = 6;
            this.iQuanLyPhieuNhapXe.Name = "iQuanLyPhieuNhapXe";
            this.iQuanLyPhieuNhapXe.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhieuNhapXe_ItemClick);
            // 
            // iQuanLyPhieuSuaChua
            // 
            this.iQuanLyPhieuSuaChua.Caption = "Phiếu Sửa Chữa";
            this.iQuanLyPhieuSuaChua.Id = 95;
            this.iQuanLyPhieuSuaChua.LargeImageIndex = 12;
            this.iQuanLyPhieuSuaChua.Name = "iQuanLyPhieuSuaChua";
            this.iQuanLyPhieuSuaChua.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhieuSuaChua_ItemClick);
            // 
            // iQuanLyPhieuXuatKho
            // 
            this.iQuanLyPhieuXuatKho.Caption = "Phiếu Xuất Kho";
            this.iQuanLyPhieuXuatKho.Id = 96;
            this.iQuanLyPhieuXuatKho.LargeImageIndex = 13;
            this.iQuanLyPhieuXuatKho.Name = "iQuanLyPhieuXuatKho";
            this.iQuanLyPhieuXuatKho.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhieuXuatKho_ItemClick);
            // 
            // ribbonImageCollectionLarge
            // 
            this.ribbonImageCollectionLarge.ImageSize = new System.Drawing.Size(32, 32);
            this.ribbonImageCollectionLarge.ImageStream = ((DevExpress.Utils.ImageCollectionStreamer)(resources.GetObject("ribbonImageCollectionLarge.ImageStream")));
            this.ribbonImageCollectionLarge.Images.SetKeyName(0, "Ribbon_New_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(1, "Ribbon_Open_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(2, "Ribbon_Close_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(3, "Ribbon_Find_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(4, "Ribbon_Save_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(5, "Ribbon_SaveAs_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(6, "Ribbon_Exit_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(7, "Ribbon_Content_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(8, "Ribbon_Info_32x32.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(9, "building.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(10, "apartment-icon.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(11, "bedroom-icon.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(12, "Keys-64.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(13, "Swimming-Pool-64.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(14, "Coke Zero_Black_Woops.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(15, "Manager-icon.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(16, "Superman-icon.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(17, "Supervisor-icon.png");
            this.ribbonImageCollectionLarge.Images.SetKeyName(18, "client_report_dock_icon_by_ornorm-d5e0d34.png");
            // 
            // homeRibbonPage
            // 
            this.homeRibbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.fileRibbonPageGroup,
            this.skinsRibbonPageGroup});
            this.homeRibbonPage.Name = "homeRibbonPage";
            this.homeRibbonPage.Text = "Home";
            // 
            // fileRibbonPageGroup
            // 
            this.fileRibbonPageGroup.ItemLinks.Add(this.iBaoCao);
            this.fileRibbonPageGroup.Name = "fileRibbonPageGroup";
            this.fileRibbonPageGroup.Text = "File";
            // 
            // skinsRibbonPageGroup
            // 
            this.skinsRibbonPageGroup.ItemLinks.Add(this.rgbiSkins);
            this.skinsRibbonPageGroup.Name = "skinsRibbonPageGroup";
            this.skinsRibbonPageGroup.ShowCaptionButton = false;
            this.skinsRibbonPageGroup.Text = "Skins";
            // 
            // QuanLyRibbonPage
            // 
            this.QuanLyRibbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.RPGNguoiDung});
            this.QuanLyRibbonPage.Name = "QuanLyRibbonPage";
            this.QuanLyRibbonPage.Text = "Quản Lý";
            // 
            // RPGNguoiDung
            // 
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyChiNhanh);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyChucVu);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyHoSoBanXe);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyKhachHang);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyKho);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyLoaiPhuKien);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyLoaiXe);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyNCC);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyNhanVien);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyXe);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyPhieuNhapPhuKien);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyPhieuNhapXe);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyPhieuSuaChua);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyPhieuXuatKho);
            this.RPGNguoiDung.ItemLinks.Add(this.iQuanLyPhuKien);
            this.RPGNguoiDung.Name = "RPGNguoiDung";
            this.RPGNguoiDung.Text = "Người Dùng";
            // 
            // BaoCaoRibbonPage
            // 
            this.BaoCaoRibbonPage.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1});
            this.BaoCaoRibbonPage.Name = "BaoCaoRibbonPage";
            this.BaoCaoRibbonPage.Text = "Báo Cáo";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            // 
            // rpName
            // 
            this.rpName.AutoHeight = false;
            this.rpName.Name = "rpName";
            // 
            // rpPass
            // 
            this.rpPass.AutoHeight = false;
            this.rpPass.Name = "rpPass";
            // 
            // ribbonStatusBar
            // 
            this.ribbonStatusBar.ItemLinks.Add(this.siStatus);
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 685);
            this.ribbonStatusBar.Name = "ribbonStatusBar";
            this.ribbonStatusBar.Ribbon = this.ribbonControl;
            this.ribbonStatusBar.Size = new System.Drawing.Size(1100, 31);
            // 
            // splitContainerControl
            // 
            this.splitContainerControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainerControl.Location = new System.Drawing.Point(0, 144);
            this.splitContainerControl.Name = "splitContainerControl";
            this.splitContainerControl.Panel1.Controls.Add(this.DataGridView);
            this.splitContainerControl.Panel1.Text = "Panel1";
            this.splitContainerControl.Panel2.Text = "Panel2";
            this.splitContainerControl.Size = new System.Drawing.Size(1100, 541);
            this.splitContainerControl.SplitterPosition = 754;
            this.splitContainerControl.TabIndex = 12;
            this.splitContainerControl.Text = "splitContainerControl1";
            // 
            // dxErrorProvider
            // 
            this.dxErrorProvider.ContainerControl = this;
            // 
            // Main
            // 
            this.AllowFormGlass = DevExpress.Utils.DefaultBoolean.False;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1100, 716);
            this.Controls.Add(this.splitContainerControl);
            this.Controls.Add(this.ribbonControl);
            this.Controls.Add(this.ribbonStatusBar);
            this.IsMdiContainer = true;
            this.Name = "Main";
            this.Ribbon = this.ribbonControl;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "Quản Lý Cửa Hàng Bán Xe";
            ((System.ComponentModel.ISupportInitialize)(this.cardView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.DataGridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.appMenu)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonImageCollection)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonImageCollectionLarge)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rpName)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rpPass)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainerControl)).EndInit();
            this.splitContainerControl.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dxErrorProvider)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl;
        private DevExpress.XtraBars.BarButtonItem iExit;
        private DevExpress.XtraBars.BarStaticItem siStatus;
        private DevExpress.XtraBars.BarButtonItem iBoldFontStyle;
        private DevExpress.XtraBars.BarButtonItem iItalicFontStyle;
        private DevExpress.XtraBars.BarButtonItem iUnderlinedFontStyle;
        private DevExpress.XtraBars.BarButtonItem iLeftTextAlign;
        private DevExpress.XtraBars.BarButtonItem iCenterTextAlign;
        private DevExpress.XtraBars.BarButtonItem iRightTextAlign;
        private DevExpress.XtraBars.RibbonGalleryBarItem rgbiSkins;
        private DevExpress.XtraBars.Ribbon.RibbonPage homeRibbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup fileRibbonPageGroup;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup skinsRibbonPageGroup;
        private DevExpress.XtraBars.Ribbon.RibbonPage QuanLyRibbonPage;
        private DevExpress.XtraBars.Ribbon.ApplicationMenu appMenu;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private DevExpress.Utils.ImageCollection ribbonImageCollection;
        private DevExpress.Utils.ImageCollection ribbonImageCollectionLarge;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup RPGNguoiDung;

        private DevExpress.XtraBars.BarButtonItem iQuanLyKhachHang;
        private DevExpress.XtraBars.BarButtonItem iQuanLyHoSoBanXe;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhuKien;

        private DevExpress.XtraBars.Ribbon.RibbonPage BaoCaoRibbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraBars.BarButtonItem iBaoCao;
        private DevExpress.XtraBars.BarStaticItem barStaticItem1;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit rpName;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit rpPass;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl;
        private DevExpress.XtraGrid.GridControl DataGridView;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
        private DevExpress.XtraGrid.Views.Card.CardView cardView1;
        private DevExpress.XtraEditors.DXErrorProvider.DXErrorProvider dxErrorProvider;
        private DevExpress.XtraBars.BarButtonItem iQuanLyChucVu;
        private DevExpress.XtraBars.BarButtonItem iQuanLyChiNhanh;
        private DevExpress.XtraBars.BarButtonItem iQuanLyNhanVien;
        private DevExpress.XtraBars.BarButtonItem iQuanLyLoaiPhuKien;
        private DevExpress.XtraBars.BarButtonItem iQuanLyXe;
        private DevExpress.XtraBars.BarButtonItem iQuanLyKho;
        private DevExpress.XtraBars.BarButtonItem iQuanLyLoaiXe;
        private DevExpress.XtraBars.BarButtonItem iQuanLyNCC;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhieuNhapPhuKien;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhieuNhapXe;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhieuSuaChua;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhieuXuatKho;

    }
}
