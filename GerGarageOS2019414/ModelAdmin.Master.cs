using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414
{
    public partial class ModelAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["loginidst"]) == "")
            {
                BtnALogout.Visible = false;
            }
            else
            {
                Login.Visible = false;
                //Register.Visible = false;
            }
        }

        protected void BtnALogout_Click(object sender, EventArgs e)
        {
            Session["loginidst"] = "";
            Response.Redirect("~/index.aspx");
        }
    }
}