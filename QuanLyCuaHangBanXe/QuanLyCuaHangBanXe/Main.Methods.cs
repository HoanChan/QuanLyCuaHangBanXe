using System;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using DataContext;
using DevExpress.Utils;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Controls;
using DevExpress.XtraEditors.DXErrorProvider;
using DevExpress.XtraGrid;
using DevExpress.XtraGrid.Columns;
namespace QuanLyCuaHangBanXe
{
    public partial class Main
    {

        private void UpdateGridView()
        {
            DataGridView.BeginUpdate();
            DataGridView.DataSource = null;
            gridView.Columns.Clear();
            DataGridView.DataSource = new BindingSource(Table.GetList(CurrentMDI.GetType()), "");
            //DataGridView.DataSource = new BindingSource(EntityQuery.Local, "");
            var EntityProperties = CurrentMDI.GetType().GetProperties();
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
            CreateDetail(CurrentMDI.GetType());
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
                    else if(EntityType.IsForeignKey(Pro.Name))
                    {
                        var ForeignInfo = Pro.GetForeignKeyTargetName();
                        var TableName = ForeignInfo.Substring(0, ForeignInfo.IndexOf("_"));
                        var KeyName = ForeignInfo.Substring(ForeignInfo.IndexOf("_") + 1);
                        var x = Global.GetType(TableName);
                        var aList = Table.GetList(x);
                        if (aList != null)
                        {
                            var Ri = new LookUpEdit();
                            Ri.Properties.NullText = "Không có giá trị";
                            Ri.Properties.DataSource = aList;
                            Ri.Properties.ValueMember = KeyName;
                            Ri.Properties.BestFitMode = BestFitMode.BestFitResizePopup;
                            Ri.BindingContextChanged += new EventHandler(delegate(object sender, EventArgs e)
                            {
                                var Lookup = (sender as LookUpEdit);
                                Lookup.Properties.PopulateColumns();
                                Lookup.Properties.BestFit();
                                Lookup.Properties.AllowNullInput = DefaultBoolean.True;
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
                Enabled = CurrentMDI.EnabledEdit() && gridView.SelectedRowsCount > 0
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
                if (e is SqlException)
                {
                    var dbEx = e as SqlException;
                    foreach (SqlError validationError in dbEx.Errors)
                    {
                        if (validationError.Message.IndexOf("]") > 0)
                        {
                            var PropertyName = validationError.Message.Substring(validationError.Message.IndexOf("[") + 1, validationError.Message.IndexOf("]")-1);
                            var ErrorMessage = validationError.Message.Substring(validationError.Message.IndexOf("]") + 1);
                            dxErrorProvider.SetError(GetControlByName(PropertyName), ErrorMessage, ErrorType.Default);
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
                    Table.Update(NewElement);
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
                    Table.Insert(NewElement);
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
                    Table.Delete(AElement);
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

            #region Relation
            var Count = CurrentMDI.GetRelationCount();
            index += 1;
            bY = 0;
            bWidth = 105;
            for (int i = 0; i < Count; i++)
            {
                var MDI = (MasterDetailInfo)CurrentMDI.GetRelationType(i).CreateNew();
                var aButton = new SimpleButton()
                {
                    Text = MDI.GetName(),
                    Location = new Point(5 + 5 * bY + bWidth * bY, 50 + 30 * index),
                    Width = bWidth
                };

                aButton.Click += new EventHandler(delegate(object sender, EventArgs e)
                {
                    var ColumnName = CurrentMDI.GetType().Name;
                    var KeyValue = CurrentMDI.GetKeyValue();
                    CurrentMDI = MDI;
                    UpdateGridView();
                    gridView.Columns[0].FilterInfo = new ColumnFilterInfo(gridView.Columns[ColumnName], KeyValue);
                });
                splitContainerControl.Panel2.Controls.Add(aButton);
                index = bY > 1 ? index + 1 : index;
                bY = bY > 1 ? 0 : bY + 1;
            }
            #endregion
        }

    }
}
