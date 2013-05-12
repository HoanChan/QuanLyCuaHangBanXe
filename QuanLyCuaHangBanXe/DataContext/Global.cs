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


        public static object CreateOurNewObject(List<String> Names, List<Type> Types, List<Object> Values)
        {
            // create a dynamic assembly and module
            AssemblyName assemblyName = new AssemblyName();
            assemblyName.Name = "tmpAssembly";
            AssemblyBuilder assemblyBuilder = Thread.GetDomain().DefineDynamicAssembly(assemblyName, AssemblyBuilderAccess.Run);
            ModuleBuilder module = assemblyBuilder.DefineDynamicModule("tmpModule");

            // create a new type builder
            TypeBuilder typeBuilder = module.DefineType("BindableRowCellCollection", TypeAttributes.Public | TypeAttributes.Class);

            // Loop over the attributes that will be used as the properties names in out new type
            for (int Index = 0; Index < Names.Count; Index++) 
            {
                string propertyName = Names[Index];

                // Generate a private field
                FieldBuilder field = typeBuilder.DefineField("_" + propertyName, typeof(string), FieldAttributes.Private);
                // Generate a public property
                PropertyBuilder property =
                    typeBuilder.DefineProperty(propertyName,
                                     PropertyAttributes.None,
                                     Types[Index],
                                     new Type[] { Types[Index] });

                // The property set and property get methods require a special set of attributes:

                MethodAttributes GetSetAttr =
                    MethodAttributes.Public |
                    MethodAttributes.HideBySig;

                // Define the "get" accessor method for current private field.
                MethodBuilder currGetPropMthdBldr =
                    typeBuilder.DefineMethod("get_value",
                                               GetSetAttr,
                                               Types[Index],
                                               Type.EmptyTypes);

                // Intermediate Language stuff...
                ILGenerator currGetIL = currGetPropMthdBldr.GetILGenerator();
                currGetIL.Emit(OpCodes.Ldarg_0);
                currGetIL.Emit(OpCodes.Ldfld, field);
                currGetIL.Emit(OpCodes.Ret);

                // Define the "set" accessor method for current private field.
                MethodBuilder currSetPropMthdBldr =
                    typeBuilder.DefineMethod("set_value",
                                               GetSetAttr,
                                               null,
                                               new Type[] { Types[Index] });

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

            // Now we have our type. Let's create an instance from it:
            object generetedObject = Activator.CreateInstance(generetedType);

            // Loop over all the generated properties, and assign the values from our XML:
            PropertyInfo[] properties = generetedType.GetProperties();

            int propertiesCounter = 0;

            // Loop over the values that we will assign to the properties
            foreach (var value in Values)
            {
                properties[propertiesCounter].SetValue(generetedObject, value, null);
                propertiesCounter++;
            }

            //Yoopy ! Return our new genereted object.
            return generetedObject;
        }

    }
}
