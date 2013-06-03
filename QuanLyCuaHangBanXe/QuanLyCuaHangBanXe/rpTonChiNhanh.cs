using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using DataContext;

namespace QuanLyCuaHangBanXe
{
    public partial class rpTonChiNhanh : DevExpress.XtraReports.UI.XtraReport
    {
        public rpTonChiNhanh()
        {
            InitializeComponent();
        }

        private void xrChiNhanh_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var ChiNhanh = (string)GetCurrentColumnValue("ChiNhanh");
            if (string.IsNullOrEmpty(ChiNhanh)) return;
            ((rpKho)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(ChiNhanh), "Ma", ChiNhanh, false);
        }

        private void xrLoaiXe_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var LoaiXe = (string)GetCurrentColumnValue("LoaiXe");
            if (string.IsNullOrEmpty(LoaiXe)) return;
            ((rpLoaiXe)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(LoaiXe), "Ma", LoaiXe, false);
        }

    }
}
