using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class GenerateInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidationUser.staffAcess(Convert.ToString(Session["loginidst"])) != null)
                {
                    TxtCName.Text = Convert.ToString(Session["bookorder"]);
                    DataContextDataContext Dtx = new DataContextDataContext();
                    var result = (from or in Dtx.VW_Orders where or.id_booking == Convert.ToInt32(TxtCName.Text) select or).FirstOrDefault();
                    TxtCName.Text = result.name;
                    TxtSvcTp.Text = result.service_type;
                    TxtSvcPrc.Text = Convert.ToString(result.service_price);
                    TxtSvcStatus.Text = result.status_type;

                    var item = from f in Dtx.Items_Parts select f;
                    //DropDwSupplies.SelectedValue =
                }
                else
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");
                }

            }
        }

        protected void BtnInvoice_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();
            var iorder = (from f in Dtx.VW_Orders where f.id_booking == Convert.ToInt32(Session["bookorder"]) select f).FirstOrDefault();
            Invoice i = new Invoice();


        }

        protected void BtnCancelInvoice_Click(object sender, EventArgs e)
        {
            Session["bookorder"] = "";
            Response.Redirect(@"\Views\ManageOrder.aspx");
        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"\Views\ManageOrder.aspx");
        }
    }
}