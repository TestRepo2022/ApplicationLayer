using System;
using Microsoft.Data.SqlClient;
using Microsoft.Data;
using UtilityLayer.Constant;

namespace UtilityLayer
{
    public class ConnectDb
    {
        public static SqlConnection Connection { get; }

         static ConnectDb()
        {
            Connection = new SqlConnection(ConnectionString.CnnStr);
        }
    }
}
