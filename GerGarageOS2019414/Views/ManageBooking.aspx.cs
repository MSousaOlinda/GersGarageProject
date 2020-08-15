using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (ValidationUser.staffAcess(Convert.ToString(Session["loginidst"])) != null)
                {
                    DataContextDataContext Dtx = new DataContextDataContext();

                    var Booking = from b in Dtx.VW_Bookings select b;
                    GridviewBooking.DataSource = Booking;
                    GridviewBooking.DataBind();
                }
                else 
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");
                }
            }
        }

        protected void GridviewBooking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Order")
            {
                var bookorder = GridviewBooking.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;
                Session["bookorder"] = bookorder;
                Response.Redirect("~/Views/GenerateOrder.aspx");
            }
            else if (e.CommandName == "Status")
            {
                var bookorder = GridviewBooking.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;
                Session["bookorder"] = bookorder;
                Response.Redirect("~/Views/Status.aspx");
            }
        }
    }
}