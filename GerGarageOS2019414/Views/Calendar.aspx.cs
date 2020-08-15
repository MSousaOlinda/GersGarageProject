using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Models.ValidationUser.isValidAcess(
                        Convert.ToString(Session["loginidct"])) == false)
                    {
                        Response.Redirect(@"\Views\LoginUser.aspx");
                    }
                }
                catch (Exception)
                {
                    Response.Redirect(@"\Views\LoginUser.aspx");
                }
            }
        }

        protected void CldBook_SelectionChanged(object sender, EventArgs e)
        {

            DateTime bookdate = CldBook.SelectedDate.Date;
            DataContextDataContext Dtx = new DataContextDataContext();

            if (Convert.ToString(bookdate.DayOfWeek) == "Sunday")
            {
                LblSunday.Text = "It is not possible booking on Sunday";
                Gridview1.Visible = false;
            }
            else
            {
                LblSunday.Text = "";
                Gridview1.Visible = true;
                var teste = (from f in Dtx.PR_TimeAvailable(bookdate.ToString("yyyy-MM-dd")) 
                             select new { f.id_time, time = f.time + ":00", f.Status }).ToList();
                Gridview1.DataSource = teste;
                Gridview1.DataBind();

                LblTime.Visible = true;
            }
        }

        protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //variavel armazena a hora selecionada na tela de booking
            var idTime = Gridview1.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;

            Session["IdDtBooking"] = CldBook.SelectedDate.Date;
            Session["IdTmBooking"] = idTime;

            Response.Redirect("~/Views/Booking.aspx");

            //string timeSelecionado = "alert('O time selecionado é {0}');";

            //ScriptManager.RegisterStartupScript(this,
            //        this.GetType(),
            //        "mensagem",
            //        string.Format(timeSelecionado,
            //                      Gridview1.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text),
            //        true);

        }

        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.Cells[2].Text.Equals("not available"))
            {
                try
                {
                    var notav = (Button)e.Row.Cells[3].Controls[0];
                    notav.Enabled = false;
                }
                catch (Exception)
                {


                }
                //e.Row.BackColor = System.Drawing.Color.DarkRed;
                //e.Row.ForeColor = System.Drawing.Color.White;               

            }

        }
    }
}