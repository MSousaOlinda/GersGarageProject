using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ubiety.Dns.Core;

namespace GerGarageOS2019414.Models
{
    public static class ValidationUser
    {
        public static bool isValidAcess(String idcustomer_) 
        {
            try
            {
                DataContextDataContext Dtx = new DataContextDataContext();
                var resultemail = (from c in Dtx.Customers where c.id_customer == Convert.ToInt32(idcustomer_) select c).Count();
                if (resultemail == 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch (Exception)
            {

                return false;
            }
            
        }

        public static Staff staffAcess(String idstaff_)
        {
            if (idstaff_ == "")
            {
                return null;
            }
            else
            {
                DataContextDataContext Dtx = new DataContextDataContext();
                var staffId = (from f in Dtx.Staffs where f.id_staff == Convert.ToInt32(idstaff_) select f).FirstOrDefault();
                return staffId;
            }
        }
    }
}