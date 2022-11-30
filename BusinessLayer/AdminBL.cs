using CommanLayer;
using DataAccesLayer;
using System;

namespace BusinessLayer
{
    public class AdminBL
    {
        AdminDb adminDb = new AdminDb();

        public string LoginAdmin(UserLogin userLogin)
        {
            return adminDb.LoginAdmin(userLogin);
        }
    }
}
