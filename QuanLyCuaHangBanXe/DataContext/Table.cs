﻿using DataProvider;
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
        static Data db = new Data(@"(localdb)\v11.0", "CUAHANG_BANXE");
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
                        Item.SetPropertyValue(pro.Name, Row[pro.Name]);
                    }
                    aList.Add(Item);
                }
                return aList;
            }
            else
            {
                var aList = new List<Object>();
                foreach (DataRow Row in aData.Tables[0].Rows)
                {
                    //var Item = ItemType.CreateNew();
                    var IsOk = false;
                    var Names = new List<string>();
                    var Types = new List<Type>();
                    var Values = new List<object>();
                    foreach (var pro in ItemType.GetProperties())
                    {
                        var aName = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(pro.GetName().ToLower()).Replace(" ", string.Empty);
                        //Item.SetPropertyValue(pro.Name, Row[pro.Name]);
                        Names.Add(aName);
                        Types.Add(pro.PropertyType);
                        Values.Add(Row[pro.Name]);
                        if (pro.Name == Name)
                        {
                            IsOk = Row[pro.Name].Equals(Value);
                        }
                    }
                    if (IsOk)
                    {
                        var Item = Global.CreateOurNewObject(Names, Types, Values);
                        aList.Add(Item);
                    }
                }
                return aList;
            }
        }

        public static DataSet GetData(Type ItemType)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM " + ItemType.Name, CommandType.Text);
        }

        public static void Insert(object Item)
        {
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
            db.RunStoredProcedure("sp_" + Item.GetType().Name + "_Update", Item);
        }
    }
}
