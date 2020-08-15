using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {

            }
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();

            var result = from f in Dtx.Customers where f.name == TxtName.Text select f;

            if (result.Count() == 0)
            {
                LblMsg.Text = "User not found";
            }
            else
            {

                if (TxtPassword.Text == result.FirstOrDefault().password.Trim())
                {
                    Session["loginidct"] = result.FirstOrDefault().id_customer;
                    Response.Redirect(@"\Views\Calendar.aspx");
                }
                else
                {
                    LblMsg.Text = "Email or password was entered incorrectly. Please, try again";
                }
            }
        }
    }
}
