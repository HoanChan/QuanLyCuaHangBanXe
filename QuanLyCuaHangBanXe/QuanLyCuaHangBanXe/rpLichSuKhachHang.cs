using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using DataContext;

namespace QuanLyCuaHangBanXe
{
    public partial class rpLichSuKhachHang : DevExpress.XtraReports.UI.XtraReport
    {
        public rpLichSuKhachHang()
        {
            InitializeComponent();
        }

        private void xrKhachHang_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var KhachHang = (string)GetCurrentColumnValue("KhachHang");
            if (string.IsNullOrEmpty(KhachHang)) return;
            ((rpKhachHang)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(KhachHang), "Ma", KhachHang, false);
        }

        private void xrXe_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var Xe = (string)GetCurrentColumnValue("Xe");
            if (string.IsNullOrEmpty(Xe)) return;
            ((rpXe)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(Xe), "SoMay", Xe, false);
        }

    }
}
