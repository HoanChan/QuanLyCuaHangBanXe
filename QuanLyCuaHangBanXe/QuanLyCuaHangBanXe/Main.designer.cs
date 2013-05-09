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
            this.iSave = new DevExpress.XtraBars.BarButtonItem();
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
            this.iDelete = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyLoaiPhong = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhong = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyTang = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyThuePhong = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyDichVu = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLySuDungDichVu = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyHoaDon = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyNgoiDung = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyQuyen = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyPhanQuyen = new DevExpress.XtraBars.BarButtonItem();
            this.iQuanLyKhachHang = new DevExpress.XtraBars.BarButtonItem();
            this.iBaoCao = new DevExpress.XtraBars.BarButtonItem();
            this.iBaoCaoHoaDon = new DevExpress.XtraBars.BarButtonItem();
            this.barStaticItem1 = new DevExpress.XtraBars.BarStaticItem();
            this.ribbonImageCollectionLarge = new DevExpress.Utils.ImageCollection(this.components);
            this.homeRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.fileRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.skinsRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.QuanLyRibbonPage = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.PhongRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.DichVuRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ThuePhongRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.NguoiDungRibbonPageGroup = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
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
            this.DataGridView.Size = new System.Drawing.Size(755, 525);
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
            this.iSave,
            this.iExit,
            this.siStatus,
            this.iBoldFontStyle,
            this.iItalicFontStyle,
            this.iUnderlinedFontStyle,
            this.iLeftTextAlign,
            this.iCenterTextAlign,
            this.iRightTextAlign,
            this.rgbiSkins,
            this.iDelete,
            this.iQuanLyLoaiPhong,
            this.iQuanLyPhong,
            this.iQuanLyTang,
            this.iQuanLyThuePhong,
            this.iQuanLyDichVu,
            this.iQuanLySuDungDichVu,
            this.iQuanLyHoaDon,
            this.iQuanLyNgoiDung,
            this.iQuanLyQuyen,
            this.iQuanLyPhanQuyen,
            this.iQuanLyKhachHang,
            this.iBaoCao,
            this.iBaoCaoHoaDon,
            this.barStaticItem1});
            this.ribbonControl.LargeImages = this.ribbonImageCollectionLarge;
            this.ribbonControl.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl.MaxItemId = 85;
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
            this.ribbonControl.Toolbar.ItemLinks.Add(this.iSave);
            this.ribbonControl.Toolbar.ItemLinks.Add(this.iDelete);
            // 
            // appMenu
            // 
            this.appMenu.ItemLinks.Add(this.iSave);
            this.appMenu.ItemLinks.Add(this.iExit);
            this.appMenu.Name = "appMenu";
            this.appMenu.Ribbon = this.ribbonControl;
            this.appMenu.ShowRightPane = true;
            // 
            // iSave
            // 
            this.iSave.Caption = "Lưu";
            this.iSave.Description = "Saves the active document.";
            this.iSave.Hint = "Saves the active document";
            this.iSave.Id = 16;
            this.iSave.ImageIndex = 4;
            this.iSave.ItemShortcut = new DevExpress.XtraBars.BarShortcut((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.S));
            this.iSave.LargeImageIndex = 4;
            this.iSave.Name = "iSave";
            this.iSave.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iSave_ItemClick);
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
            // iDelete
            // 
            this.iDelete.Caption = "Xoá";
            this.iDelete.Id = 63;
            this.iDelete.ImageIndex = 6;
            this.iDelete.ImageIndexDisabled = 6;
            this.iDelete.LargeImageIndex = 6;
            this.iDelete.LargeImageIndexDisabled = 6;
            this.iDelete.Name = "iDelete";
            this.iDelete.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iDelete_ItemClick);
            // 
            // iQuanLyLoaiPhong
            // 
            this.iQuanLyLoaiPhong.Caption = "Loại Phòng";
            this.iQuanLyLoaiPhong.Id = 64;
            this.iQuanLyLoaiPhong.LargeImageIndex = 10;
            this.iQuanLyLoaiPhong.Name = "iQuanLyLoaiPhong";
            this.iQuanLyLoaiPhong.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyLoaiPhong.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyLoaiPhong_ItemClick);
            // 
            // iQuanLyPhong
            // 
            this.iQuanLyPhong.Caption = "Phòng";
            this.iQuanLyPhong.Id = 65;
            this.iQuanLyPhong.LargeImageIndex = 11;
            this.iQuanLyPhong.Name = "iQuanLyPhong";
            this.iQuanLyPhong.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhong_ItemClick);
            // 
            // iQuanLyTang
            // 
            this.iQuanLyTang.Caption = "Tầng";
            this.iQuanLyTang.Id = 66;
            this.iQuanLyTang.LargeImageIndex = 9;
            this.iQuanLyTang.Name = "iQuanLyTang";
            this.iQuanLyTang.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyTang.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyTang_ItemClick);
            // 
            // iQuanLyThuePhong
            // 
            this.iQuanLyThuePhong.Caption = "Thuê Phòng";
            this.iQuanLyThuePhong.Id = 67;
            this.iQuanLyThuePhong.LargeImageIndex = 17;
            this.iQuanLyThuePhong.Name = "iQuanLyThuePhong";
            this.iQuanLyThuePhong.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyThuePhong.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyThuePhong_ItemClick);
            // 
            // iQuanLyDichVu
            // 
            this.iQuanLyDichVu.Caption = "Dịch Vụ";
            this.iQuanLyDichVu.Id = 68;
            this.iQuanLyDichVu.LargeImageIndex = 14;
            this.iQuanLyDichVu.Name = "iQuanLyDichVu";
            this.iQuanLyDichVu.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyDichVu.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyDichVu_ItemClick);
            // 
            // iQuanLySuDungDichVu
            // 
            this.iQuanLySuDungDichVu.Caption = "Sử Dụng Dịch Vụ";
            this.iQuanLySuDungDichVu.Id = 69;
            this.iQuanLySuDungDichVu.LargeImageIndex = 13;
            this.iQuanLySuDungDichVu.Name = "iQuanLySuDungDichVu";
            this.iQuanLySuDungDichVu.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLySuDungDichVu.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLySuDungDichVu_ItemClick);
            // 
            // iQuanLyHoaDon
            // 
            this.iQuanLyHoaDon.Caption = "Hoá Đơn";
            this.iQuanLyHoaDon.Id = 70;
            this.iQuanLyHoaDon.LargeImageIndex = 7;
            this.iQuanLyHoaDon.Name = "iQuanLyHoaDon";
            this.iQuanLyHoaDon.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyHoaDon.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyHoaDon_ItemClick);
            // 
            // iQuanLyNgoiDung
            // 
            this.iQuanLyNgoiDung.Caption = "Người Dùng";
            this.iQuanLyNgoiDung.Id = 71;
            this.iQuanLyNgoiDung.LargeImageIndex = 15;
            this.iQuanLyNgoiDung.Name = "iQuanLyNgoiDung";
            this.iQuanLyNgoiDung.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyNgoiDung_ItemClick);
            // 
            // iQuanLyQuyen
            // 
            this.iQuanLyQuyen.Caption = "Quyền";
            this.iQuanLyQuyen.Id = 72;
            this.iQuanLyQuyen.LargeImageIndex = 16;
            this.iQuanLyQuyen.Name = "iQuanLyQuyen";
            this.iQuanLyQuyen.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyQuyen.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyQuyen_ItemClick);
            // 
            // iQuanLyPhanQuyen
            // 
            this.iQuanLyPhanQuyen.Caption = "Phân Quyền";
            this.iQuanLyPhanQuyen.Id = 73;
            this.iQuanLyPhanQuyen.LargeImageIndex = 17;
            this.iQuanLyPhanQuyen.Name = "iQuanLyPhanQuyen";
            this.iQuanLyPhanQuyen.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyPhanQuyen.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyPhanQuyen_ItemClick);
            // 
            // iQuanLyKhachHang
            // 
            this.iQuanLyKhachHang.Caption = "Khách Hàng";
            this.iQuanLyKhachHang.Id = 74;
            this.iQuanLyKhachHang.LargeImageIndex = 15;
            this.iQuanLyKhachHang.Name = "iQuanLyKhachHang";
            this.iQuanLyKhachHang.RibbonStyle = DevExpress.XtraBars.Ribbon.RibbonItemStyles.Large;
            this.iQuanLyKhachHang.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iQuanLyKhachHang_ItemClick);
            // 
            // iBaoCao
            // 
            this.iBaoCao.Caption = "Báo Cáo";
            this.iBaoCao.Id = 78;
            this.iBaoCao.LargeImageIndex = 18;
            this.iBaoCao.Name = "iBaoCao";
            this.iBaoCao.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iBaoCao_ItemClick);
            // 
            // iBaoCaoHoaDon
            // 
            this.iBaoCaoHoaDon.Caption = "Hoá Đơn";
            this.iBaoCaoHoaDon.Id = 79;
            this.iBaoCaoHoaDon.LargeImageIndex = 18;
            this.iBaoCaoHoaDon.Name = "iBaoCaoHoaDon";
            this.iBaoCaoHoaDon.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.iBaoCaoHoaDon_ItemClick);
            // 
            // barStaticItem1
            // 
            this.barStaticItem1.Caption = "Tên đăng nhập:";
            this.barStaticItem1.Id = 82;
            this.barStaticItem1.Name = "barStaticItem1";
            this.barStaticItem1.TextAlignment = System.Drawing.StringAlignment.Near;
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
            this.fileRibbonPageGroup.ItemLinks.Add(this.iSave);
            this.fileRibbonPageGroup.ItemLinks.Add(this.iDelete);
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
            this.PhongRibbonPageGroup,
            this.DichVuRibbonPageGroup,
            this.ThuePhongRibbonPageGroup,
            this.NguoiDungRibbonPageGroup});
            this.QuanLyRibbonPage.Name = "QuanLyRibbonPage";
            this.QuanLyRibbonPage.Text = "Quản Lý";
            // 
            // PhongRibbonPageGroup
            // 
            this.PhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyTang);
            this.PhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyLoaiPhong);
            this.PhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyPhong);
            this.PhongRibbonPageGroup.Name = "PhongRibbonPageGroup";
            this.PhongRibbonPageGroup.Text = "Phòng";
            // 
            // DichVuRibbonPageGroup
            // 
            this.DichVuRibbonPageGroup.ItemLinks.Add(this.iQuanLyDichVu);
            this.DichVuRibbonPageGroup.ItemLinks.Add(this.iQuanLySuDungDichVu);
            this.DichVuRibbonPageGroup.Name = "DichVuRibbonPageGroup";
            this.DichVuRibbonPageGroup.Text = "Dịch Vụ";
            // 
            // ThuePhongRibbonPageGroup
            // 
            this.ThuePhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyKhachHang);
            this.ThuePhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyThuePhong);
            this.ThuePhongRibbonPageGroup.ItemLinks.Add(this.iQuanLyHoaDon);
            this.ThuePhongRibbonPageGroup.Name = "ThuePhongRibbonPageGroup";
            this.ThuePhongRibbonPageGroup.Text = "Thuê Phòng";
            // 
            // NguoiDungRibbonPageGroup
            // 
            this.NguoiDungRibbonPageGroup.ItemLinks.Add(this.iQuanLyNgoiDung);
            this.NguoiDungRibbonPageGroup.ItemLinks.Add(this.iQuanLyQuyen);
            this.NguoiDungRibbonPageGroup.ItemLinks.Add(this.iQuanLyPhanQuyen);
            this.NguoiDungRibbonPageGroup.Name = "NguoiDungRibbonPageGroup";
            this.NguoiDungRibbonPageGroup.Text = "Người Dùng";
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
            this.ribbonPageGroup1.ItemLinks.Add(this.iBaoCaoHoaDon);
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
            this.ribbonStatusBar.Location = new System.Drawing.Point(0, 669);
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
            this.splitContainerControl.Size = new System.Drawing.Size(1100, 525);
            this.splitContainerControl.SplitterPosition = 755;
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
            this.ClientSize = new System.Drawing.Size(1100, 700);
            this.Controls.Add(this.splitContainerControl);
            this.Controls.Add(this.ribbonControl);
            this.Controls.Add(this.ribbonStatusBar);
            this.IsMdiContainer = true;
            this.Name = "Main";
            this.Ribbon = this.ribbonControl;
            this.StatusBar = this.ribbonStatusBar;
            this.Text = "Quản Lý Khách Sạn";
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
        private DevExpress.XtraBars.BarButtonItem iSave;
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
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup PhongRibbonPageGroup;
        private DevExpress.XtraBars.Ribbon.ApplicationMenu appMenu;
        private DevExpress.XtraBars.Ribbon.RibbonStatusBar ribbonStatusBar;
        private DevExpress.Utils.ImageCollection ribbonImageCollection;
        private DevExpress.Utils.ImageCollection ribbonImageCollectionLarge;
        private DevExpress.XtraBars.BarButtonItem iDelete;
        private DevExpress.XtraBars.BarButtonItem iQuanLyLoaiPhong;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhong;
        private DevExpress.XtraBars.BarButtonItem iQuanLyTang;
        private DevExpress.XtraBars.BarButtonItem iQuanLyThuePhong;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup DichVuRibbonPageGroup;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ThuePhongRibbonPageGroup;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup NguoiDungRibbonPageGroup;
        private DevExpress.XtraBars.BarButtonItem iQuanLyDichVu;
        private DevExpress.XtraBars.BarButtonItem iQuanLySuDungDichVu;
        private DevExpress.XtraBars.BarButtonItem iQuanLyHoaDon;
        private DevExpress.XtraBars.BarButtonItem iQuanLyNgoiDung;
        private DevExpress.XtraBars.BarButtonItem iQuanLyQuyen;
        private DevExpress.XtraBars.BarButtonItem iQuanLyPhanQuyen;
        private DevExpress.XtraBars.BarButtonItem iQuanLyKhachHang;
        private DevExpress.XtraBars.Ribbon.RibbonPage BaoCaoRibbonPage;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraBars.BarButtonItem iBaoCao;
        private DevExpress.XtraBars.BarButtonItem iBaoCaoHoaDon;
        private DevExpress.XtraBars.BarStaticItem barStaticItem1;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit rpName;
        private DevExpress.XtraEditors.Repository.RepositoryItemTextEdit rpPass;
        private DevExpress.XtraEditors.SplitContainerControl splitContainerControl;
        private DevExpress.XtraGrid.GridControl DataGridView;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView;
        private DevExpress.XtraGrid.Views.Card.CardView cardView1;
        private DevExpress.XtraEditors.DXErrorProvider.DXErrorProvider dxErrorProvider;

    }
}
