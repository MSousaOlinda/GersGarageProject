using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogAdmin_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();
            var logadm = from f in Dtx.Staffs where f.staff_name == TxtAdmin.Text select f;

            if (logadm.Count() == 0)
            {
                LblMsg.Text = "User not found, please try again.";
            }
            else
            {
                if (TxtPassAdmin.Text == logadm.FirstOrDefault().password.Trim())
                {
                    Session["loginidst"] = logadm.FirstOrDefault().id_staff;
                    Response.Redirect((@"\Views\ManageBooking.aspx"));
                }
                else
                {
                    LblMsg.Text = "Email or password was entered incorrectly.";
                }
            }
        }
    }
}