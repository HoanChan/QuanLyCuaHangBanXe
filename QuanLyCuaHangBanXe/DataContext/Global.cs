using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Threading;

namespace DataContext
{
    public static class Global
    {
        /// <summary>
        /// Chuyển chuỗi bất kỳ thành chuỗi có dạng chữ hoa đầu từ
        /// VD: "LE hoan cHan" ==> "Le Hoan Chan"
        /// </summary>
        /// <param name="str">Chuỗi ban đầu</param>
        /// <returns>Chuỗi có các từ bắt đầu bằng chữ hoa</returns>
        public static string ToBeauty(this string str)
        {
            return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str.ToLower());
        }
        /// <summary>
        /// Lấy kiểu dữ liệu thông qua tên của nó
        /// Hàm này hỗ trợ lấy các Type trong Namespace DataContext
        /// </summary>
        /// <param name="Name">Tên kiểu dữ liệu</param>
        /// <returns>Kiểu dữ liệu tìm được, là null nếu không thấy</returns>
        public static Type GetType(string Name)
        {
            return Type.GetType("DataContext." + Name);
        }
        /// <summary>
        /// Lấy tên của 1 kiểu dữ liệu thông qua Metadata của nó.
        /// </summary>
        /// <returns>Đọc từ Metadata TypeDisplay, nếu không có thì lấy tên nó luôn</returns>
        public static string GetName(this Type X)
        {
            try
            {
                return ((TypeDisplay)(X.GetCustomAttribute(typeof(TypeDisplay), false))).Name;
            }
            catch (Exception)
            {
                return X.Name;
            }
        }
        /// <summary>
        /// Lấy tên của một thuộc tính
        /// </summary>
        /// <param name="X"></param>
        /// <returns>Đọc từ Metadata Display, nếu không có thì lấy tên nó luôn</returns>
        public static string GetName(this PropertyInfo X)
        {
            try
            {
                return ((DisplayAttribute)(X.GetCustomAttribute(typeof(DisplayAttribute), false))).Name;
            }
            catch (Exception)
            {
                return X.Name;
            }
        }
        /// <summary>
        /// Lấy khoá ngoại của một thuộc tính
        /// </summary>
        /// <returns>Nếu thuộc tính ko chứa khoá ngoại thì null</returns>
        public static string GetForeignKeyTargetName(this PropertyInfo X)
        {
            try
            {
                return ((ForeignKeyAttribute)(X.GetCustomAttribute(typeof(ForeignKeyAttribute), false))).Name;
            }
            catch (Exception)
            {
                return null;
            }

        }
        /// <summary>
        /// Kiểm tra thuộc tính có phải là một khoá ngoại không
        /// (Là khoá ngoại nếu có chứa thẻ metadata là ForeignKey)
        /// </summary>
        /// <param name="aType">Kiểu dữ liệu</param>
        /// <param name="propertyName">Tên thuộc tính</param>
        public static bool IsForeignKey(this Type aType, String propertyName)
        {
            try
            {
                return aType.GetProperty(propertyName).GetCustomAttributes(typeof(ForeignKeyAttribute), false).Count() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// Kiểm tra thuộc tính có phải là một khoá ngoại không
        /// (Là khoá ngoại nếu có chứa thẻ metadata là ForeignKey)
        /// </summary>
        /// <param name="objName">Biến bất kỳ</param>
        /// <param name="propertyName">Tên thuộc tính</param>
        public static bool IsForeignKey(this object objName, String propertyName)
        {
            return IsForeignKey(objName.GetType(), propertyName);
        }

        public static bool IsFKContained(this Type aType, String propertyName)
        {
            try
            {
                return aType.GetProperty(propertyName).GetCustomAttributes(typeof(FKContained), false).Count() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool IsFKContained(this object objName, String propertyName)
        {
            return IsFKContained(objName.GetType(), propertyName);
        }

        /// <summary>
        /// Kiểm tra thuộc tính có là khoá chính hay không
        /// (Là khoá chính nếu có chứa thẻ metadata là Key)
        /// </summary>
        /// <param name="propertyName">Tên thuộc tính</param>
        public static bool IsPrimaryKey(this object objName, String propertyName)
        {
            try
            {
                return objName.GetType().GetProperty(propertyName).GetCustomAttributes(typeof(KeyAttribute), false).Count() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// Kiểm tra thuộc tính có là khoá hay không (khoá chính/khoá ngoại)
        /// </summary>
        /// <param name="propertyName">Tên thuộc tính</param>
        public static bool IsKey(this object objName, String propertyName)
        {
            try
            {
                if (objName.IsPrimaryKey(propertyName))
                {
                    return true;
                }
                else if (objName.IsForeignKey(propertyName))
                {
                    var ForeignKeyName = objName.GetType().GetProperty(propertyName).GetForeignKeyTargetName();
                    return objName.IsPrimaryKey(ForeignKeyName);
                }
                else return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// Tìm tên cột là khoá ngoại tham chiếu tới 1 bảng cho trước
        /// </summary>
        /// <param name="Table">Bảng được tham chiếu</param>
        /// <returns>null nếu tìm không thấy</returns>
        public static string GetForeignKeyColumn(this object objName, string Table)
        {
            foreach (var Pro in objName.GetType().GetProperties())
            {
                if (objName.IsForeignKey(Pro.Name))
                {
                    var ForeignInfo = Pro.GetForeignKeyTargetName();
                    var TableName = ForeignInfo.Substring(0, ForeignInfo.IndexOf("_"));
                    var KeyName = ForeignInfo.Substring(ForeignInfo.IndexOf("_") + 1);
                    if(TableName == Table)
                        return Pro.Name;
                }
            }
            return null;
        }
        /// <summary>
        /// Gán dữ liệu vào thuộc tính
        /// </summary>
        /// <param name="propertyName">Tên của thuộc tính</param>
        /// <param name="value">Dữ liệu cần gán</param>
        public static void SetPropertyValue(this object objName, string propertyName, object value)
        {
            objName.GetType().GetProperty(propertyName).SetValue(objName, (value is DBNull) ? null : value); 
        }
        /// <summary>
        /// Lấy dữ liệu của một thuộc tính
        /// </summary>
        /// <param name="propertyName">Tên thuộc tính</param>
        /// <returns>Dữ liệu lấy được</returns>
        public static object GetPropertyValue(this object objName, string propertyName)
        {
            return objName.GetType().GetProperty(propertyName).GetValue(objName);
        }
        /// <summary>
        /// Gán dữ liệu từ các thuộc tính tương ứng của một obj này cho obj kia
        /// </summary>
        /// <param name="objName">obj đích</param>
        /// <param name="value">obj nguồn</param>
        public static void SetPropertiesValue(this object objName, object value)
        {
            foreach (var Pro in objName.GetType().GetProperties())
            {
                if (Pro.CanWrite)
                {
                    objName.SetPropertyValue(Pro.Name, value.GetPropertyValue(Pro.Name));
                }
            }
        }
        /// <summary>
        /// Tạo một phiên bản thực tế từ một kiểu dữ liệu cho trước
        /// </summary>
        public static object CreateNew(this Type T)
        {
            return Activator.CreateInstance(T);
        }
        /// <summary>
        /// Tạo một kiểu dữ liệu động
        /// </summary>
        /// <param name="Names">Danh sách tên các thuộc tính</param>
        /// <param name="Types">Danh sách kiểu dữ liệu của từng thuộc tính tương ứng</param>
        public static Type CreateDynamicType(List<String> Names, List<Type> Types)
        {
            // create a dynamic assembly and module
            AssemblyName assemblyName = new AssemblyName();
            assemblyName.Name = "tmpAssembly";
            AssemblyBuilder assemblyBuilder = Thread.GetDomain().DefineDynamicAssembly(assemblyName, AssemblyBuilderAccess.Run);
            ModuleBuilder module = assemblyBuilder.DefineDynamicModule("tmpModule");

            // create a new type builder
            TypeBuilder typeBuilder = module.DefineType("DynamicItem", TypeAttributes.Public | TypeAttributes.Class);

            // Loop over the attributes that will be used as the properties names in out new type
            for (int Index = 0; Index < Names.Count; Index++) 
            {
                string propertyName = Names[Index];

                // Generate a private field
                FieldBuilder field = typeBuilder.DefineField(propertyName, Types[Index], FieldAttributes.Private);
                // Generate a public property
                PropertyBuilder property =
                    typeBuilder.DefineProperty(propertyName, PropertyAttributes.None, Types[Index], new Type[] { Types[Index] });

                // The property set and property get methods require a special set of attributes:

                MethodAttributes GetSetAttr = MethodAttributes.Public | MethodAttributes.HideBySig;

                // Define the "get" accessor method for current private field.
                MethodBuilder currGetPropMthdBldr = typeBuilder.DefineMethod("get_value", GetSetAttr, Types[Index], Type.EmptyTypes);

                // Intermediate Language stuff...
                ILGenerator currGetIL = currGetPropMthdBldr.GetILGenerator();
                currGetIL.Emit(OpCodes.Ldarg_0);
                currGetIL.Emit(OpCodes.Ldfld, field);
                currGetIL.Emit(OpCodes.Ret);

                // Define the "set" accessor method for current private field.
                MethodBuilder currSetPropMthdBldr = typeBuilder.DefineMethod("set_value", GetSetAttr, null, new Type[] { Types[Index] });

                // Again some Intermediate Language stuff...
                ILGenerator currSetIL = currSetPropMthdBldr.GetILGenerator();
                currSetIL.Emit(OpCodes.Ldarg_0);
                currSetIL.Emit(OpCodes.Ldarg_1);
                currSetIL.Emit(OpCodes.Stfld, field);
                currSetIL.Emit(OpCodes.Ret);

                // Last, we must map the two methods created above to our PropertyBuilder to
                // their corresponding behaviors, "get" and "set" respectively.
                property.SetGetMethod(currGetPropMthdBldr);
                property.SetSetMethod(currSetPropMthdBldr);
            }

            // Generate our type
            Type generetedType = typeBuilder.CreateType();
            return generetedType;
        }

    }
}
