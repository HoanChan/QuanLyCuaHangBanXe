using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using Model;
using System;

namespace QuanLyCuaHangBanXe
{
    public partial class XtraFormLogin : DevExpress.XtraEditors.XtraForm
    {
        List<NguoiDung> dsNguoiDung = null;
        public XtraFormLogin(List<NguoiDung> dsNguoiDung)
        {
            this.dsNguoiDung = dsNguoiDung;
            InitializeComponent();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            NguoiDung = dsNguoiDung.FirstOrDefault(m => m.TenDangNhap == txtTenDangNhap.Text && m.MatKhau == txtMatKhau.Text);
            if (NguoiDung != null) 
            {
                DialogResult = DialogResult.OK;
                this.Close();
            }
            else
            {
                MessageBox.Show("Thông tin đăng nhập sai!");
            }
        }

        public NguoiDung NguoiDung { get; set; }
    }
}