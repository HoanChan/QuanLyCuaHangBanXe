using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Drawing;
using System.Reflection;

namespace QuanLyCuaHangBanXe {
    public class ReportBuilderHelper {
        public Font lblFont = new Font(FontFamily.GenericSansSerif, 13, FontStyle.Bold);
        public Font txtFont = new Font(FontFamily.GenericSansSerif, 13);
        public Font HeaderFont = new Font(FontFamily.GenericSansSerif, 16, FontStyle.Bold);
        public string Header = "";
        List<DataSourceDefinition> dsd;

        public XtraReport GenerateReport(IList list, Type aType)
        {
            XtraReport r = new XtraReport();
            r.DataSource = list;
            InitBands(r);
            if (list.Count == 0) return r;
            dsd = GenerateDataSourceDefinition(aType);
            InitDetailsBasedOnXRLabel(r, dsd);
            return r;
        }

        public void GenerateReport(XtraReport r, IList list, Type aType) {
            r.DataSource = list;
            InitBands(r);
            if (list.Count == 0) return;
            dsd = GenerateDataSourceDefinition(aType);
            InitDetailsBasedOnXRLabel(r, dsd);
        }

        private void InitDetailsBasedOnXRLabel(XtraReport rep, List<DataSourceDefinition> dsd)
        {
            XRLabel labelc = CreateLabel(rep.PageWidth - (rep.Margins.Left + rep.Margins.Right), 0);
            labelc.Text = Header;
            labelc.Font = HeaderFont;
            labelc.TextAlignment = TextAlignment.MiddleCenter;
            rep.Bands[BandKind.PageHeader].Controls.Add(labelc);
            int colCount = dsd.Count;
            int fWidth = (rep.PageWidth - (rep.Margins.Left + rep.Margins.Right));
            for(int i = 0; i < colCount; i++) {
                XRLabel labelh = CreateLabel(180, 0, i * 20);
                labelh.Text = dsd[i].CaptionName;
                labelh.Font = lblFont;
                labelh.TextAlignment = TextAlignment.MiddleRight;
                XRLabel labeld = CreateLabel(fWidth - 200, 200, i * 20);
                labeld.DataBindings.Add("Text", null, dsd[i].Fieldname);
                labeld.Font = txtFont;
                labeld.TextAlignment = TextAlignment.MiddleLeft;
                if (dsd[i].FieldType.Equals(typeof(DateTime)))
                    labeld.DataBindings["Text"].FormatString = "{0:dd/MM/yyyy}";
                rep.Bands[BandKind.Detail].Controls.Add(labelh);
                rep.Bands[BandKind.Detail].Controls.Add(labeld);
                rep.Bands[BandKind.Detail].HeightF += 20;
            }
            rep.Bands[BandKind.Detail].Controls.Add(new XRLine() { WidthF = fWidth, BorderWidth = 1, TopF = colCount * 20 });
        }

        private static XRLabel CreateLabel(int fWidth, int incShift, int Y = 0) {
            XRLabel labeld = new XRLabel();
            labeld.Location = new Point(incShift, Y);
            labeld.Size = new Size(fWidth, 20);
            return labeld;
        }

        private List<DataSourceDefinition> GenerateDataSourceDefinition(Type aType) {
            List<DataSourceDefinition> dsdl = new List<DataSourceDefinition>();
            PropertyInfo[] pi = aType.GetProperties();
            for(int i = 0; i < pi.Length; i++) {
                DisplayAttribute[] r = pi[i].GetCustomAttributes(typeof(DisplayAttribute), false) as DisplayAttribute[];
                if(r.Length > 0) {
                    DataSourceDefinition dsd = new DataSourceDefinition();
                    dsd.CaptionName  = r[0].Name == null ? pi[i].Name :  r[0].Name;
                    dsd.Fieldname = pi[i].Name;
                    dsd.FieldType = pi[i].PropertyType;
                    dsdl.Add(dsd);
                }
            }
            return dsdl;      
        }
        public void InitBands(XtraReport rep) {
            
            DetailBand detail = new DetailBand();
            PageHeaderBand pageHeader = new PageHeaderBand();
            ReportFooterBand reportFooter = new ReportFooterBand();
            detail.Height = 20;
            reportFooter.Height = 380;
            pageHeader.Height = 20;

            rep.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] { detail, pageHeader, reportFooter });
        }
    }
    public class DataSourceDefinition {
        public string Fieldname { get; set; }
        public string CaptionName { get; set; }
        public Type FieldType { get; set; }
    }
}
