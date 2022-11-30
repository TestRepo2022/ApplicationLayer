using CommanLayer;
using System;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Collections;
using UtilityLayer;

namespace DataAccesLayer
{
    public class AdminDb
    {
        public string LoginAdmin(UserLogin userLogin)
        {
            SqlParameter sqlParameter;
            string result = string.Empty;
            ArrayList paramters = new ArrayList();
            try
            {
                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@email";
                sqlParameter.Value = userLogin.Email;
                sqlParameter.Direction = ParameterDirection.Input;
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                paramters.Add(sqlParameter);

                sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = "@password";
                sqlParameter.Value = userLogin.Password;
                sqlParameter.Direction = ParameterDirection.Input;
                sqlParameter.SqlDbType = SqlDbType.VarChar;
                paramters.Add(sqlParameter);

              result=DBAction.ExecuteScalarSP("sp_admin_login", paramters);
            }
            catch (Exception e)
            {

                throw e;
            }
            return result;
        }
    }
}
