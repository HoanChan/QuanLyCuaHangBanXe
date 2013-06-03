using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using DataContext;
namespace QuanLyCuaHangBanXe
{
    public partial class rpTonKho : DevExpress.XtraReports.UI.XtraReport
    {
        public rpTonKho()
        {
            InitializeComponent();
        }

        private void xrLoaiXe_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var LoaiXe = (string)GetCurrentColumnValue("LoaiXe");
            if (string.IsNullOrEmpty(LoaiXe)) return;
            ((rpLoaiXe)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(LoaiXe), "Ma", LoaiXe, false);
        }

        private void xrKho_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var Kho = (string)GetCurrentColumnValue("Kho");
            if (string.IsNullOrEmpty(Kho)) return;
            ((rpKho)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(Kho), "Ma", Kho, false);
        }

    }
}
