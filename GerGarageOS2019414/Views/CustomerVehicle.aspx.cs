using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Models.ValidationUser.isValidAcess(Convert.ToString(Session["loginidct"])) == false)
            {
                Response.Redirect(@"\Views\LoginUser.aspx");
            }
        }
    }
}