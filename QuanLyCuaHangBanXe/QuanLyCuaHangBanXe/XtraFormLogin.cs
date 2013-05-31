using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System;
using DataContext;
using DataProvider;
using System.Configuration;

namespace QuanLyCuaHangBanXe
{
    public partial class XtraFormLogin : DevExpress.XtraEditors.XtraForm
    {

        public XtraFormLogin()
        {
            
            InitializeComponent();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            try
            {
                Table.db = new Data(ConfigurationManager.AppSettings["DatabaseServer"], ConfigurationManager.AppSettings["DatabaseName"], txtTenDangNhap.Text, txtMatKhau.Text);
                DialogResult = DialogResult.OK;
                this.Close();
            }
            catch
            {
                MessageBox.Show("Thông tin đăng nhập sai!");
            }
        }
    }
}