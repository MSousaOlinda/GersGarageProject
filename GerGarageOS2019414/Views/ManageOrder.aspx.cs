using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class ManageOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidationUser.staffAcess(Convert.ToString(Session["loginidst"])) != null)
                {
                    DataContextDataContext Dtx = new DataContextDataContext();

                    var Order = from b in Dtx.VW_Orders select b;
                    GridViewOrder.DataSource = Order;
                    GridViewOrder.DataBind();
                }
                else
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");
                }
            }
        }

        protected void GridViewOrder_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Invoice")
            {
                var bookorder = GridViewOrder.Rows[Convert.ToInt16(e.CommandArgument)].Cells[1].Text;
                Session["bookorder"] = bookorder;
                Response.Redirect("~/Views/GenerateInvoice.aspx");
            }

            else if (e.CommandName == "Status")
            {
                var bookorder = GridViewOrder.Rows[Convert.ToInt16(e.CommandArgument)].Cells[1].Text;
                Session["bookorder"] = bookorder;
                Response.Redirect("~/Views/Status.aspx");
            }
        }
    }
}