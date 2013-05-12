using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;

namespace DataContext
{
    public static class Global
    {
        //public static T GetAttributeFrom<T>(this object instance, string propertyName) where T : Attribute
        //{
        //    var attrType = typeof(T);
        //    var property = instance.GetType().GetProperty(propertyName);
        //    return (T)property.GetCustomAttributes(attrType, false).First();
        //}
        //} 

        public static string GetName(this Type X)
        {
            try
            {
                return ((TypeDisplay)(X.GetCustomAttributes(typeof(TypeDisplay), false).First())).Name;
            }
            catch (Exception)
            {
                return X.Name;
            }
        }

        public static string GetName(this PropertyInfo X)
        {
            try
            {
                return ((DisplayAttribute)(X.GetCustomAttributes(typeof(DisplayAttribute), false).First())).Name;
            }
            catch (Exception)
            {
                return X.Name;
            }
        }

        public static string GetForeignKeyTargetName(this PropertyInfo X)
        {
            try
            {
                return ((ForeignKeyAttribute)(X.GetCustomAttributes(typeof(ForeignKeyAttribute), false).First())).Name;
            }
            catch (Exception)
            {
                return null;
            }

        }

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

        public static bool IsForeignKey(this object objName, String propertyName)
        {
            try
            {
                return objName.GetType().GetProperty(propertyName).GetCustomAttributes(typeof(ForeignKeyAttribute), false).Count() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

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



        public static void SetPropertyValue(this object objName, string propertyName, object value)
        {
            objName.GetType().GetProperty(propertyName).SetValue(objName, (value is DBNull) ? null : value); 
        }

        public static object GetPropertyValue(this object objName, string propertyName)
        {
            return objName.GetType().GetProperty(propertyName).GetValue(objName);
        }

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

        public static object CreateNew(this Type T)
        {
            return Activator.CreateInstance(T);
        }


    }
}
