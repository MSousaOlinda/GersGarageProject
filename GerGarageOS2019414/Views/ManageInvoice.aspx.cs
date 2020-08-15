using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidationUser.staffAcess(Convert.ToString(Session["loginidst"])) != null)
                {
                    
                }
                else
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");
                }
            }
        }
    }
}