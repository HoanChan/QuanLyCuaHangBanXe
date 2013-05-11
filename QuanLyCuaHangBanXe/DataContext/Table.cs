using DataProvider;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace DataContext
{
    public class Table
    {
        static Data db = new Data(@"(localdb)\v11.0", "CUAHANG_BANXE");

        public static IList GetList(Type ItemType)
        {
            var aList = (IList)(typeof(List<>).MakeGenericType(ItemType).CreateNew());
            var aData = GetData(ItemType);
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

        public static DataSet GetData(Type ItemType)
        {
            return db.ExecuteQueryDataSet("SELECT * FROM " + ItemType.Name, CommandType.Text, null);
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
