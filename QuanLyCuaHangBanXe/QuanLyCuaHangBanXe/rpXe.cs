using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using DataContext;

namespace QuanLyCuaHangBanXe
{
    public partial class rpXe : DevExpress.XtraReports.UI.XtraReport
    {
        public rpXe()
        {
            InitializeComponent();
        }

        private void xrLoaiXe_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            var LoaiXe = (string)GetCurrentColumnValue("LoaiXe");
            if (string.IsNullOrEmpty(LoaiXe)) return;
            ((rpLoaiXe)((XRSubreport)sender).ReportSource).DataSource = Table.GetList(typeof(LoaiXe), "Ma", LoaiXe, false);
        }

    }
}
