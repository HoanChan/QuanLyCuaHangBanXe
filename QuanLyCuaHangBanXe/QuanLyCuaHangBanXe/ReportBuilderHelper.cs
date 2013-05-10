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
        public Font TableHeaderFont = new Font(FontFamily.GenericSansSerif, 10, FontStyle.Bold);
        public Font HeaderFont = new Font(FontFamily.GenericSansSerif, 13, FontStyle.Bold);
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
            int totalf=0;
            for(int i = 0; i < dsd.Count; i++) 
                totalf += dsd[i].Factor;
            int fWidth = (rep.PageWidth - (rep.Margins.Left + rep.Margins.Right)) / totalf;
            int incShift = 0;
            for(int i = 0; i < colCount; i++) {
                XRLabel labelh = CreateLabel(fWidth * dsd[i].Factor, incShift, 50);
                labelh.Text = dsd[i].CaptionName;
                labelh.Font = TableHeaderFont;
                XRLabel labeld = CreateLabel(fWidth * dsd[i].Factor, incShift);
                labeld.DataBindings.Add("Text", null, dsd[i].Fieldname);

                if(i > 0) {
                    labelh.Borders = BorderSide.Right | BorderSide.Top | BorderSide.Bottom;
                    labeld.Borders = BorderSide.Right | BorderSide.Bottom;
   
                }
                else {
                    labelh.Borders = BorderSide.All;
                    labeld.Borders = BorderSide.Left | BorderSide.Right | BorderSide.Bottom;
                }
                incShift += fWidth * dsd[i].Factor;

                rep.Bands[BandKind.PageHeader].Controls.Add(labelh);
                rep.Bands[BandKind.Detail].Controls.Add(labeld);
            }
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
                    try
                    {
                        dsd.Factor = r[0].Order == 0 ? 1 : r[0].Order;
                    }
                    catch (Exception)
                    {
                        dsd.Factor = 1;
                    }
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
        string fieldname;

        public string Fieldname {
            get { return fieldname; }
            set { fieldname = value; }
        }
        string captionName;

        public string CaptionName {
            get { return captionName; }
            set { captionName = value; }
        }
        int factor;

        public int Factor {
            get { return factor; }
            set { factor = value; }
        }
    
    }
}
