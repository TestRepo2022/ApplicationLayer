using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using Microsoft.Data.SqlClient;
using Microsoft.Data;
using System.Data;

namespace UtilityLayer
{
   public class DBAction
    {

        public static string ExecuteScalarSP(string spName,ArrayList Paramters)
        {
            SqlCommand command = new SqlCommand(spName, ConnectDb.Connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            foreach(SqlParameter p in Paramters)
            {
                SqlParameter sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = p.ParameterName;
                sqlParameter.Value = p.Value;
                sqlParameter.SqlDbType = p.SqlDbType;
                sqlParameter.Direction = p.Direction;

                command.Parameters.Add(sqlParameter);

            }
            if (ConnectDb.Connection.State == System.Data.ConnectionState.Closed)
            {
                ConnectDb.Connection.Open();
            }
            string result = command.ExecuteScalar().ToString();
            ConnectDb.Connection.Close();
            return result;

        }

        public static DataTable ExecuteReaderSP(string spName, ArrayList Paramters)
        {
            // SqlCommand command = new SqlCommand(spName, ConnectDb.Connection);
            // command.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter dataAdapter = new SqlDataAdapter(spName, ConnectDb.Connection);

            foreach (SqlParameter p in Paramters)
            {
                SqlParameter sqlParameter = new SqlParameter();
                sqlParameter.ParameterName = p.ParameterName;
                sqlParameter.Value = p.Value;
                sqlParameter.SqlDbType = p.SqlDbType;
                sqlParameter.Direction = p.Direction;

                dataAdapter.SelectCommand.Parameters.Add(sqlParameter);

            }          

            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);
            return dt;

        }

    }
}
