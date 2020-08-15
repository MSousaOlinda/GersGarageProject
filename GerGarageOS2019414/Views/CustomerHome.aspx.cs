using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class CustomerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    DataContextDataContext Dtx = new DataContextDataContext();

                    var result = (from c in Dtx.Customers where c.id_customer == Convert.ToInt32(Session["loginidct"]) select c).FirstOrDefault();
                    TxtName.Text = result.name;
                    TxtEmail.Text = result.email;
                    TxtPhone.Text = result.phone;

                    var Booking = from b in Dtx.VW_Bookings where b.id_customer == Convert.ToInt32(Session["loginidct"]) select b;
                    GridviewBooking.DataSource = Booking;
                    GridviewBooking.DataBind();
                }
                catch (Exception)
                {
                    Response.Redirect("~/Views/LoginUser.aspx");
                }
            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            TxtName.ReadOnly = false;
            TxtEmail.ReadOnly = false;
            TxtPhone.ReadOnly = false;
            BtnEdit.Visible = false;
            BtnSave.Visible = true;
            BtnCancel.Visible = true;
            enableBtn();
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();

            var result = (from c in Dtx.Customers where c.id_customer == Convert.ToInt32(Session["loginidct"]) select c).FirstOrDefault();
            result.name = TxtName.Text;
            result.phone = TxtPhone.Text;
            Dtx.SubmitChanges();

            disableBtn();
            BtnSave.Visible = false;
            BtnCancel.Visible = false;
            BtnEdit.Visible = true;

        }

        public void enableBtn()
        {
            TxtName.Enabled = true;
            TxtPhone.Enabled = true;
            //TxtEmail.Enabled = true;
        }
        public void disableBtn()
        {
            TxtName.Enabled = false;
            TxtPhone.Enabled = false;
            //TxtEmail.Enabled = false;
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            TxtName.ReadOnly= true;
            TxtPhone.ReadOnly = true;
            TxtEmail.ReadOnly = true;

            BtnSave.Visible = false;
            BtnCancel.Visible = false;
            BtnEdit.Visible = true;
        }

        protected void GridviewBooking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelOrder")
            {
                DataContextDataContext Dtx = new DataContextDataContext();
                var bookorder = GridviewBooking.Rows[Convert.ToInt16(e.CommandArgument)].Cells[0].Text;
                Htry_Stts_Bking hb = new Htry_Stts_Bking();
                hb.id_booking = Convert.ToInt32(bookorder);
                hb.id_status = 7;

                Dtx.Htry_Stts_Bkings.InsertOnSubmit(hb);
                Dtx.SubmitChanges();

                var result = (from f in Dtx.Bookings where f.id_booking == Convert.ToInt32(bookorder) select f).FirstOrDefault();
                result.id_status = 7;

                Dtx.SubmitChanges();

                Response.Redirect("~/Views/CustomerHome.aspx");
            }
        }

        protected void GridviewBooking_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // verifica a celula em que o evento Cancel booking esta para que ao clicar no Botao na celula 15 desative o botao
            if (e.Row.Cells[13].Text.Equals("Cancel booking"))
            {
                try
                {
                    var tst = (Button)e.Row.Cells[16].Controls[0];
                    tst.Enabled = false;
                }
                catch (Exception)
                {

                }
            }
        }
    }
}