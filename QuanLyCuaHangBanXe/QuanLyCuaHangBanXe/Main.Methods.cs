using DevExpress.Utils;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Controls;
using DevExpress.XtraEditors.DXErrorProvider;
using Model;
using System;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
namespace QuanLyCuaHangBanXe
{
    public partial class Main
    {

        private void UpdateGridView(DbSet EntityQuery, Object Data)
        {
            DataGridView.BeginUpdate();
            DataGridView.DataSource = null;
            gridView.Columns.Clear();
            DataGridView.DataSource = new BindingSource(Data, "");
            //DataGridView.DataSource = new BindingSource(EntityQuery.Local, "");
            var EntityProperties = EntityQuery.ElementType.GetProperties();
            int index = 0;
            foreach (var Pro in EntityProperties)
            {
                gridView.Columns[index].Caption = Pro.GetName();

                if (Pro.PropertyType.IsGenericType || Pro.Name.Substring(0, 2) == "FK")
                {
                    gridView.Columns[index].Visible = false;
                }
                else
                {
                    if (Pro.PropertyType == typeof(DateTime))
                    {
                        if (Pro.Name.Substring(0, 3) == "Gio")
                        {
                            gridView.Columns[index].DisplayFormat.FormatType = FormatType.DateTime;
                            gridView.Columns[index].DisplayFormat.FormatString = "T";
                        }
                        else
                        {
                            gridView.Columns[index].DisplayFormat.FormatType = FormatType.DateTime;
                            gridView.Columns[index].DisplayFormat.FormatString = "d";
                        }
                    }
                }
                index++;
                if (index >= gridView.Columns.Count)
                {
                    break;
                }
            }
            DataGridView.EndUpdate();
            DataGridView.RefreshDataSource();
            CreateDetail(EntityQuery.ElementType);
            ribbonControl.SelectedPage = homeRibbonPage;
        }
        private void ShowError(Exception e)
        {
            if (e.InnerException != null)
            {
                if (MessageBox.Show("(Bấm Yes để biết thêm thông tin)Lỗi: " + e.Message, "", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    ShowError(e.InnerException);
                }
            }
            else
            {
                MessageBox.Show("Lỗi: " + e.Message);
            }
        }
        private void CreateDetail(Type EntityType)
        {
            #region Label + textbox
            splitContainerControl.Panel2.Controls.Clear();
            var EntityProperties = EntityType.GetProperties();
            int index = 0;
            for (int i = 0; i < EntityProperties.Count(); i++)
            {
                var Pro = EntityProperties[i];
                var DisplayName = Pro.GetName();
                if (Pro.PropertyType.IsGenericType || Pro.Name.Substring(0, 2) == "FK") { }
                else
                {
                    var DataBindingsType = "Text";
                    var label = new LabelControl();
                    label.Location = new Point(20, 50 + 30 * index);
                    label.Text = DisplayName;
                    label.Font = new Font(label.Font, CurrentMDI.IsKey(Pro.Name) ? FontStyle.Underline | FontStyle.Bold : FontStyle.Regular);
                    BaseEdit textbox = new TextEdit();
                    //set Repository
                    if (Pro.PropertyType == typeof(DateTime))
                    {
                        var rDate = new DateEdit();
                        var rTime = new TimeEdit();

                        if (Pro.Name.Substring(0, 3) == "Gio")
                            textbox = rTime;
                        else
                            textbox = rDate;

                        DataBindingsType = "EditValue";

                    }
                    else if (Pro.PropertyType == typeof(bool))
                    {
                        textbox = new CheckEdit();
                        DataBindingsType = "EditValue";
                    }
                    else if (Pro.PropertyType == typeof(int) || Pro.PropertyType == typeof(decimal))
                    {
                        textbox = new CalcEdit();
                        DataBindingsType = "EditValue";
                    }
                    else
                    {
                        var aList = db.GetList(Pro.PropertyType);
                        if (aList != null)
                        {
                            var Ri = new LookUpEdit();
                            Ri.Properties.NullText = "Chưa có giá trị";
                            Ri.Properties.DataSource = aList;
                            Ri.Properties.BestFitMode = BestFitMode.BestFitResizePopup;
                            Ri.BindingContextChanged += new EventHandler(delegate(object sender, EventArgs e)
                            {
                                var Lookup = (sender as LookUpEdit);
                                Lookup.Properties.PopulateColumns();
                                Lookup.Properties.BestFit();
                                if (Lookup.Properties.Columns.Count == 0) return;
                                var ci = 0;
                                foreach (var Column in Pro.PropertyType.GetProperties())
                                {
                                    if (Column.PropertyType.IsGenericType)
                                    {
                                        Lookup.Properties.Columns[ci].Visible = false;
                                    }
                                    else
                                    {
                                        Lookup.Properties.Columns[ci].Caption = Column.GetName();
                                        if (Column.PropertyType == typeof(DateTime))
                                        {
                                            if (Column.Name.Substring(0, 3) == "Gio")
                                                Lookup.Properties.Columns[ci].FormatString = "HH:mm tt";
                                            else
                                                Lookup.Properties.Columns[ci].FormatString = "dd/MM/yyy";
                                        }
                                    }
                                    ci++;
                                }
                            });
                            textbox = Ri;
                            DataBindingsType = "EditValue";
                        }
                    }
                    textbox.Location = new Point(120, 50 + 30 * index);
                    textbox.Width = 200;
                    textbox.TabIndex = index;
                    textbox.DataBindings.Add(DataBindingsType, gridView.DataSource, Pro.Name);
                    textbox.Properties.ReadOnly = true;
                    textbox.Name = Pro.Name;
                    splitContainerControl.Panel2.Controls.AddRange(new Control[] { label, textbox });
                    #region Nút tính cho tổng tiền
                    if (textbox.Name == "TongTien" && EntityType == typeof(HoaDon))
                    {
                        textbox.Width -= 60;
                        var btnCalc = new SimpleButton()
                        {
                            Text = "Tính",
                            Top = textbox.Top,
                            Left = textbox.Left + textbox.Width + 10,
                            Width = 50,
                            Enabled = false
                        };
                        btnCalc.Click += new EventHandler(delegate(object sender, EventArgs e)
                        {
                            try
                            {
                                var aThuePhong = (splitContainerControl.Panel2.Controls["ThuePhong"] as BaseEdit).EditValue as ThuePhong;
                                var KhoanKhac = Convert.ToInt32((splitContainerControl.Panel2.Controls["KhoanKhac"] as BaseEdit).EditValue);
                                var TienDichVu = 0;
                                foreach (var item in aThuePhong.dsSuDungDichVu)
                                {
                                    TienDichVu += (int)item.DichVu.Gia * item.SoLuong;
                                }
                                var ThoiGian = (aThuePhong.NgayTra.Date + aThuePhong.GioTra.TimeOfDay) - (aThuePhong.NgayNhan.Date + aThuePhong.GioDat.TimeOfDay);
                                var TienPhong = (ThoiGian.Days + ThoiGian.Hours / 24f + ThoiGian.Minutes / 24f / 60f) * (int)aThuePhong.Phong.LoaiPhong.Gia;
                                var TongTien = (float)TienDichVu + TienPhong + KhoanKhac;
                                textbox.EditValue = (decimal)(TongTien - TongTien % 1000);
                            }
                            catch
                            {
                                textbox.EditValue = (decimal)0;
                            }
                        });
                        textbox.Tag = btnCalc;
                        splitContainerControl.Panel2.Controls.Add(btnCalc);
                    }
                    #endregion
                    index++;
                }
            }
            #endregion
            #region Button
            int bWidth = 60;
            int bY = 0;
            var btnEdit = new SimpleButton()
            {
                Text = "Chỉnh sửa",
                Location = new Point(5 + 5*bY + bWidth * bY, 50 + 30 * index),
                Width = bWidth,
                Enabled = !(CurrentMDI is PhanQuyen) && gridView.SelectedRowsCount > 0
            };
            var btnCancelEdit = new SimpleButton()
            {
                Text = "Dừng sửa",
                Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
                Visible = false
            };
            bY++;
            var btnUpdate = new SimpleButton()
            {
                Text = "Cập nhật",
                Location = new Point(5 + 5*bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
                Enabled = false
            };
            bY++;
            var btnCreateNew = new SimpleButton()
            {
                Text = "Tạo mới",
                Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
            };
            var btnCancelNew = new SimpleButton()
            {
                Text = "Dừng thêm",
                Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
                Visible = false
            };
            bY++;
            var btnAddNew = new SimpleButton()
            {
                Text = "Thêm mới",
                Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
                Enabled = false
            };
            bY++;
            var btnDelete = new SimpleButton()
            {
                Text = "Xoá",
                Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                Width = 60,
                Enabled = gridView.SelectedRowsCount > 0
            };

            #endregion
            #region Func
            var Element = EntityType.CreateNew();

            Func<string, Control> GetControlByName = delegate(string Name)
            {
                foreach(Control c in splitContainerControl.Panel2.Controls)
                    if(c.Name == Name)
                        return c;

                return null;
            };

            Action<Exception> ValidateEntity = delegate(Exception e)
            {
                dxErrorProvider.ClearErrors();
                if (e is DbEntityValidationException)
                {
                    var dbEx = e as DbEntityValidationException;
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            //Err += string.Format("Bảng: {0}, Thuộc tính: {1}, Lỗi: {2}",
                            //    validationErrors.Entry.Entity.GetType().FullName,
                            //    validationError.PropertyName,
                            //    validationError.ErrorMessage) + "\r\n";
                            dxErrorProvider.SetError(GetControlByName(validationError.PropertyName), validationError.ErrorMessage, ErrorType.Default);
                        }
                    }
                }
                else
                {
                    ShowError(e);                    
                }
            };

            Action<bool> SetReadOnly = delegate(bool IsReadOnly)
            {
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        (control as BaseEdit).Properties.ReadOnly = IsReadOnly;
                        if (CurrentMDI.IsKey(control.Name) && !IsReadOnly && !btnAddNew.Enabled)
                        {
                            (control as BaseEdit).Properties.ReadOnly = true;
                        }
                        if (control.Tag != null)
                        {
                            (control.Tag as Control).Enabled = !IsReadOnly;
                        }
                    }
                }
            };

            Action DefaultButtonDisplay = delegate()
            {
                btnEdit.Enabled = btnEdit.Visible = true;
                btnCancelEdit.Visible = false;
                btnUpdate.Enabled = false;
                btnCreateNew.Enabled = btnCreateNew.Visible = true;
                btnCancelNew.Visible = false;
                btnAddNew.Enabled = false;
                btnDelete.Enabled = true;
            };

            #endregion
            #region Button Events
            btnEdit.Click += new EventHandler(delegate(object sender, EventArgs e)
                {
                    foreach (Control control in splitContainerControl.Panel2.Controls)
                    {
                        if (control is BaseEdit)
                        {
                            Element.SetPropertyValue(control.Name, (control as BaseEdit).EditValue);
                        }
                    }
                    DefaultButtonDisplay();                    
                    btnCancelEdit.Visible = btnUpdate.Enabled = true;
                    btnEdit.Visible = btnCreateNew.Enabled = btnDelete.Enabled = false;
                    SetReadOnly(false);
                    DataGridView.Enabled = false;
                });
            btnCancelEdit.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        (control as BaseEdit).EditValue = Element.GetPropertyValue(control.Name);
                    }
                }
                DefaultButtonDisplay();
                SetReadOnly(true);
                DataGridView.Enabled = true;
                dxErrorProvider.ClearErrors();

            });
            btnUpdate.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                var NewElement = EntityType.CreateNew();
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        NewElement.SetPropertyValue(control.Name, (control as BaseEdit).EditValue);
                    }
                }
                try
                {
                    db.Update(Element, NewElement);
                    dxErrorProvider.ClearErrors();
                    MessageBox.Show("Cập nhật thành công!");
                    DefaultButtonDisplay();
                    SetReadOnly(true);
                    DataGridView.Enabled = true;
                }
                catch (Exception ex)
                {
                    ValidateEntity(ex);
                    //db.Unchanges();
                    //btnCancelEdit.PerformClick();
                }
            });

            btnCreateNew.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                gridView.AddNewRow();
                DefaultButtonDisplay();
                btnCancelNew.Visible = btnAddNew.Enabled = true;
                btnCreateNew.Visible = btnEdit.Enabled = btnDelete.Enabled = false;
                SetReadOnly(false);
                DataGridView.Enabled = false;
            });

            btnCancelNew.Click += new EventHandler(delegate(object sender, EventArgs e){
                gridView.DeleteSelectedRows();
                DefaultButtonDisplay();
                DataGridView.Enabled = true;
                dxErrorProvider.ClearErrors();
            });


            btnAddNew.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                var NewElement = EntityType.CreateNew();
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        NewElement.SetPropertyValue(control.Name, (control as BaseEdit).EditValue);
                    }
                }
                try
                {
                    db.AddNew(NewElement);
                    dxErrorProvider.ClearErrors();
                    MessageBox.Show("Thêm mới thành công!");
                    DefaultButtonDisplay();
                    SetReadOnly(true);
                    DataGridView.Enabled = true;
                }
                catch (System.Exception ex)
                {
                    ValidateEntity(ex);
                    //db.Unchanges();
                    //btnCancelNew.PerformClick();
                }
            });

            btnDelete.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                var AElement = EntityType.CreateNew();
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        AElement.SetPropertyValue(control.Name, (control as BaseEdit).EditValue);
                    }
                }
                try
                {
                    gridView.DeleteSelectedRows();
                    db.Delete(AElement);
                    MessageBox.Show("Xoá thành công!");
                }
                catch (System.Exception ex)
                {
                    ValidateEntity(ex);
                    //MessageBox.Show("Lỗi: " + ex.Message);
                }
            });
            #endregion

            splitContainerControl.Panel2.Controls.AddRange(new Control[] { btnEdit, btnCancelEdit, btnUpdate, btnCreateNew, btnCancelNew, btnAddNew, btnDelete });
        }

    }
}
