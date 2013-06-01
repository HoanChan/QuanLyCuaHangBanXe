using DataContext;
using DevExpress.Utils;
using DevExpress.XtraBars;
using DevExpress.XtraBars.Ribbon;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Controls;
using DevExpress.XtraEditors.DXErrorProvider;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
namespace QuanLyCuaHangBanXe
{
    public partial class Main
    {
        /// <summary>
        /// Cập nhật Gridview, xoá những gì đang hiển thị, hiển thị dữ liệu mới
        /// Dữ liệu hiểu thị được lấy lên từ CSDL dựa kiểu dữ liệu của MDI
        /// Dữ liệu có thể được lọc bằng tên 1 cột và giá trị cần lọc
        /// </summary>
        /// <param name="MDI">Kiểu dữ liệu cần hiển thị</param>
        /// <param name="Name">Tên cột cần lọc</param>
        /// <param name="Value">Giá trị cần lọc</param>
        private void UpdateGridView(MasterDetailInfo MDI, String Name = null, object Value = null)
        {
            if (string.IsNullOrEmpty(Name))
            {
                siStatus.Caption = MDI.GetName();
            }
            else
            {
                siStatus.Caption = CurrentMDI.GetName()+" / " + MDI.GetName() + "[" + Name + " = " + Value.ToString() + "]";
            }
            CurrentMDI = MDI;
            DataGridView.BeginUpdate();
            DataGridView.DataSource = null;
            gridView.Columns.Clear();
            ReportList = Table.GetList(CurrentMDI.GetType(), Name, Value, false);
            DataGridView.DataSource = new BindingSource(ReportList, "");
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
            CreateDetail(CurrentMDI.GetType(), Name, Value);
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

        private void CreateDetail(Type EntityType, String Name = null, object Value = null)
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
                    if(EntityType.IsForeignKey(Pro.Name))
                    {
                        var ForeignInfo = Pro.GetForeignKeyTargetName();
                        var TableName = ForeignInfo.Substring(0, ForeignInfo.IndexOf("_"));
                        var KeyName = ForeignInfo.Substring(ForeignInfo.IndexOf("_") + 1);
                        var x = Global.GetType(TableName);
                        var aList = x.Equals(typeof(DataContext.Menu)) ? GetMenuList() :
                                   (x.Equals(typeof(Quyen)) ? GetQuyenList() : Table.GetList(x, null, null, false));
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
                                foreach (var Column in x.GetProperties())
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
                    else if (Pro.PropertyType == typeof(DateTime))
                    {
                        var rDate = new DateEdit();
                        var rTime = new TimeEdit();

                        rDate.Properties.MinValue = new DateTime(1753, 1, 1); // SQL min value
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
            int bX = 0;
            var btnEdit = new SimpleButton()
            {
                Text = "Chỉnh sửa",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = bWidth,
                Enabled = CurrentMDI.EnabledModify() && CurrentMDI.EnabledEdit() && gridView.SelectedRowsCount > 0
            };
            var btnCancelEdit = new SimpleButton()
            {
                Text = "Dừng sửa",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Visible = false
            };
            bX++;
            var btnUpdate = new SimpleButton()
            {
                Text = "Cập nhật",
                Location = new Point(5 + 5*bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Enabled = false
            };
            bX++;
            var btnCreateNew = new SimpleButton()
            {
                Text = "Tạo mới",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Enabled = CurrentMDI.EnabledModify()
            };
            var btnCancelNew = new SimpleButton()
            {
                Text = "Dừng thêm",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Visible = false
            };
            bX++;
            var btnAddNew = new SimpleButton()
            {
                Text = "Thêm mới",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Enabled = false
            };
            bX++;
            var btnDelete = new SimpleButton()
            {
                Text = "Xoá",
                Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                Width = 60,
                Enabled = CurrentMDI.EnabledModify() && gridView.SelectedRowsCount > 0
            };
            index++;
            #endregion
            
            #region Func
            var Element = EntityType.CreateNew();

            Func<string, Control> GetControlByName = delegate(string ControlName)
            {
                foreach(Control c in splitContainerControl.Panel2.Controls)
                    if(c.Name == ControlName)
                        return c;

                return null;
            };

            Func<Exception, bool> ValidateEntity = delegate(Exception e)
            {
                dxErrorProvider.ClearErrors();
                bool isOk = false;
                if (e is SqlException)
                {
                    var dbEx = e as SqlException;
                    foreach (SqlError validationError in dbEx.Errors)
                    {
                        if (validationError.Message.IndexOf("]") > 0)
                        {
                            var PropertyName = validationError.Message.Substring(validationError.Message.IndexOf("[") + 1, validationError.Message.IndexOf("]")-1);
                            var ErrorMessage = validationError.Message.Substring(validationError.Message.IndexOf("]") + 1);
                            if (PropertyName.Equals("_Msg"))
                            {
                                MessageBox.Show(ErrorMessage);
                                isOk = true;
                            }
                            else
                            {
                                dxErrorProvider.SetError(GetControlByName(PropertyName), ErrorMessage, ErrorType.Default);
                            }
                        }
                        
                    }
                }
                else
                {
                    ShowError(e);                    
                }
                return isOk;
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
                        if (control.Name == Name)
                        {
                            (control as BaseEdit).Properties.ReadOnly = true;
                        }
                    }
                }
            };

            Action DefaultButtonDisplay = delegate()
            {
                btnEdit.Enabled = CurrentMDI.EnabledEdit() && gridView.SelectedRowsCount > 0;
                btnEdit.Visible = true;
                btnCancelEdit.Visible = false;
                btnUpdate.Enabled = false;
                btnCreateNew.Enabled = btnCreateNew.Visible = true;
                btnCancelNew.Visible = false;
                btnAddNew.Enabled = false;
                btnDelete.Enabled = gridView.SelectedRowsCount > 0;
            };

            Func<MasterDetailInfo> GetCurrentRecord = delegate()
            {
                var AElement = EntityType.CreateNew();
                foreach (Control control in splitContainerControl.Panel2.Controls)
                {
                    if (control is BaseEdit)
                    {
                        AElement.SetPropertyValue(control.Name, (control as BaseEdit).EditValue);
                    }
                }
                return (AElement as MasterDetailInfo);
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
                var NewElement = GetCurrentRecord();
                bool isOk = false;
                try
                {
                    Table.Update(NewElement);
                }
                catch (Exception ex)
                {
                    isOk = ValidateEntity(ex);
                }
                finally
                {
                    if (isOk)
                    {
                        dxErrorProvider.ClearErrors();
                        DefaultButtonDisplay();
                        SetReadOnly(true);
                        DataGridView.Enabled = true;
                    }
                }
            });

            btnCreateNew.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                gridView.AddNewRow();
                (GetControlByName(Name) as BaseEdit).EditValue = Value;
                DefaultButtonDisplay();
                btnCancelNew.Visible = btnAddNew.Enabled = true;
                btnCreateNew.Visible = btnEdit.Enabled = btnDelete.Enabled = false;
                SetReadOnly(false);
                DataGridView.Enabled = false;
            });

            btnCancelNew.Click += new EventHandler(delegate(object sender, EventArgs e){
                gridView.DeleteSelectedRows();
                DefaultButtonDisplay();
                SetReadOnly(true);
                DataGridView.Enabled = true;
                dxErrorProvider.ClearErrors();
            });

            btnAddNew.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                var NewElement = GetCurrentRecord();
                bool isOk = false;
                try
                {
                    Table.Insert(NewElement);
                }
                catch (Exception ex)
                {
                    isOk = ValidateEntity(ex);
                }
                finally
                {
                    if (isOk)
                    {
                        dxErrorProvider.ClearErrors();
                        DefaultButtonDisplay();
                        SetReadOnly(true);
                        DataGridView.Enabled = true;
                    }
                }
            });

            btnDelete.Click += new EventHandler(delegate(object sender, EventArgs e)
            {
                var AElement = GetCurrentRecord();
                try
                {
                    gridView.DeleteSelectedRows();
                    Table.Delete(AElement);
                }
                catch (System.Exception ex)
                {
                    ValidateEntity(ex);
                }
            });
            #endregion
            
            splitContainerControl.Panel2.Controls.AddRange(new Control[] { btnEdit, btnCancelEdit, btnUpdate, btnCreateNew, btnCancelNew, btnAddNew, btnDelete });

            #region Relation
            var Count = CurrentMDI.GetRelationCount();
            bX = 0;
            bWidth = 160;
            for (int i = 0; i < Count; i++)
            {
                var MDI = (MasterDetailInfo)CurrentMDI.GetRelationType(i).CreateNew();
                var aButton = new SimpleButton()
                {
                    Text = MDI.GetName(),
                    Location = new Point(5 + 5 * bX + bWidth * bX, 50 + 30 * index),
                    Width = bWidth
                };
                aButton.Click += new EventHandler(delegate(object sender, EventArgs e)
                {
                    var TableName = CurrentMDI.GetType().Name;
                    var ColumnName = MDI.GetForeignKeyColumn(TableName);

                    var KeyValue = GetCurrentRecord().GetKeyValue();
                    UpdateGridView(MDI, ColumnName, KeyValue);
                    //gridView.Columns[0].FilterInfo = new ColumnFilterInfo(gridView.Columns[ColumnName], KeyValue);
                });
                splitContainerControl.Panel2.Controls.Add(aButton);
                index = bX > 0 ? index + 1 : index;
                bX = bX > 0 ? 0 : bX + 1;
            }
            #endregion
        }

        private List<DataContext.Menu> GetMenuList()
        {
            var result = new List<DataContext.Menu>();
            var TabList = new List<RibbonPage>() { QuanLyRibbonPage };
            foreach (var page in TabList)
            {
                foreach(var group in page.Groups.Cast<RibbonPageGroup>())
                {
                    var MenuList = group.ItemLinks.Cast<BarButtonItemLink>()
                                    .Select(m=>m.Item)
                                    .Where(c => c.GetType().Equals(typeof(BarButtonItem)))
                                    .Select(m => new DataContext.Menu()
                                    {
                                        Ma = m.Name,
                                        Ten = m.Caption,
                                        GhiChu = page.Name + "/" + group.Name + "/" + m.Name
                                    });
                    result.AddRange(MenuList);
                }
                
            }
            return result;
        }

        private List<Quyen> GetQuyenList()
        {
            return new List<Quyen>(){new Quyen(){ Ma=1, Ten="Xem", GhiChu="Chỉ Xem được nội dung bảng" },
                                     new Quyen(){ Ma=2, Ten="Toàn Quyền", GhiChu="Xem, Thêm mới, xoá, sửa đổi nội dung bảng"}};
        }
    }
}
