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
                Table.db = new Data(@"(localdb)\v11.0", "CUAHANG_BANXE", txtTenDangNhap.Text, txtMatKhau.Text);
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