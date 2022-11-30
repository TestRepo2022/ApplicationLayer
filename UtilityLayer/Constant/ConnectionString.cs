using System;
using System.Collections.Generic;
using System.Text;

namespace UtilityLayer.Constant
{
   public static class ConnectionString
    {
        private static string _CnnStr { get; }

         static ConnectionString()
        {
            _CnnStr = "Data Source=DESKTOP-A9J9S5H;Initial Catalog=online_test_db;Integrated Security=True;Pooling=False;TrustServerCertificate=True";
        }

        public static string CnnStr
        {
            get
            {
                return _CnnStr;
            }
        }
    }
}
