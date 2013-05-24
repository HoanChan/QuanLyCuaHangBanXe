using DataProvider;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
namespace DataContext
{
    public class Table
    {
        public static Data db = new Data(@"(localdb)\v11.0", "CUAHANG_BANXE");
        /// <summary>
        /// Lấy danh sách giá trị trong bảng
        /// </summary>
        /// <param name="ItemType">Kiểu dữ liệu của bảng</param>
        /// <param name="Name">Tên cột cần lọc, mặc định = null sẽ lấy hết không lọc</param>
        /// <param name="Value">Giá trị sẽ lọc</param>
        /// <returns>Danh sách</returns>
        public static IList GetList(Type ItemType, string Name = null, object Value = null)
        {
            var aData = GetData(ItemType);
            if (string.IsNullOrEmpty(Name))
            {
                var aList = (IList)(typeof(List<>).MakeGenericType(ItemType).CreateNew());
                foreach (DataRow Row in aData.Tables[0].Rows) 
                {
                    var Item = ItemType.CreateNew();
                    foreach (var pro in ItemType.GetProperties())
                    {
                        var aValue = Row[pro.Name] == DBNull.Value ? null : Row[pro.Name];
                        Item.SetPropertyValue(pro.Name, aValue);
                    }
                    aList.Add(Item);
                }
                return aList;
            }
            else
            {
                var Names = new List<string>();
                var Types = new List<Type>();
                foreach (var pro in ItemType.GetProperties())
                {
                    var aName = pro.GetName().ToBeauty().Replace(" ", string.Empty);
                    Names.Add(aName);
                    Types.Add(pro.PropertyType);
                }
                var DynamicType = Global.CreateDynamicType(Names, Types);

                var aList = (IList)(typeof(List<>).MakeGenericType(DynamicType).CreateNew());
                foreach (DataRow Row in aData.Tables[0].Rows)
                {
                    var Item = DynamicType.CreateNew();
                    var IsOk = false;
                    foreach (var pro in ItemType.GetProperties())
                    {
                        var aName = pro.GetName().ToBeauty().Replace(" ", string.Empty);
                        var aValue = Row[pro.Name] == DBNull.Value ? null : Row[pro.Name];
                        Item.SetPropertyValue(aName, aValue);
                        if (aValue == null)
                            IsOk = false;
                        else if (pro.Name == Name) 
                        {
                            IsOk = aValue.Equals(Value);
                        }
                    }
                    if (IsOk)
                    {
                        aList.Add(Item);
                    }
                }
                return aList;
            }
        }

        public static DataSet GetData(Type ItemType)
        {
            return db.ExecuteQueryDataSet("sp_" + ItemType.Name + "_Select", CommandType.StoredProcedure);
        }

        public static void Insert(object Item)
        {
            CheckItemValues(Item);
            db.RunStoredProcedure("sp_" + Item.GetType().Name + "_Insert", Item);
        }

        public static void Delete(object Item)
        {
            List<SqlParameter> paramList = new List<SqlParameter>();
            foreach (var pro in Item.GetType().GetProperties())
            {
                if (Item.IsPrimaryKey(pro.Name))
                {
                    paramList.Add(new SqlParameter("@" + pro.Name, pro.GetValue(Item)));
                }
            }
            db.ExecuteNonQuery("sp_" + Item.GetType().Name + "_Delete", CommandType.StoredProcedure, paramList.ToArray());
        }

        public static void Update(object Item)
        {
            CheckItemValues(Item);
            db.RunStoredProcedure("sp_" + Item.GetType().Name + "_Update", Item);
        }

        private static void CheckItemValues(object Item)
        {
            foreach (var pro in Item.GetType().GetProperties())
            {
                if (pro.PropertyType.Equals(typeof(DateTime)))
                {
                    var avalue = (DateTime)pro.GetValue(Item);
                    if (avalue.Year < 1753) //sql min
                        pro.SetValue(Item, null);
                }
                else if (pro.PropertyType.Equals(typeof(string)))
                {
                    var avalue = (string)pro.GetValue(Item);
                   if(string.IsNullOrWhiteSpace(avalue))
                        pro.SetValue(Item, null);
                }
            }
        }
    }
}