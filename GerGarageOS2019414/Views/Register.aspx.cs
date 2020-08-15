using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                
            }
        }

        public void CleanScreen() 
        {
            TxtName.Text = "";
            TxtPhone.Text = "";
            TxtEmail.Text = "";
            TxtPassword.Text = "";            
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();

            var ckemail = (from f in Dtx.Customers where f.email == TxtEmail.Text select f).Count();

            if (ckemail == 0)
            {
                if (TxtPassword.Text.Trim() != "")
                {
                    Customer c = new Customer();

                    c.name = TxtName.Text;
                    c.phone = TxtPhone.Text;
                    c.email = TxtEmail.Text;
                    c.password = TxtPassword.Text;

                    Dtx.Customers.InsertOnSubmit(c);
                    LblMsgEmail.Text = "";
                    Dtx.SubmitChanges();

                    Session["loginidct"] = c.id_customer;

                    if (c.email != null)
                    {
                        Response.Redirect(@"\Views\Calendar.aspx");
                    }
                }
                else 
                {
                    LblMsgEmail.Text = "It is not possible to register without a password";
                }
            }
            else
            {

                LblMsgEmail.Text = "This e-mail is already registred, please use another.";
            }

        }
    }
}