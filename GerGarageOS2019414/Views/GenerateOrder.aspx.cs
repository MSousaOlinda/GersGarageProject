using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ValidationUser.staffAcess(Convert.ToString(Session["loginidst"])) != null)
                {
                    TxtCName.Text = Convert.ToString(Session["bookorder"]);

                    DataContextDataContext Dtx = new DataContextDataContext();
                    var result = (from bo in Dtx.VW_Bookings where bo.id_booking == Convert.ToInt32(TxtCName.Text) select bo).FirstOrDefault();
                    TxtCName.Text = result.name;
                    TxtBDt.Text = Convert.ToString(result.reservationDate);
                    TxtBTm.Text = Convert.ToString(result.time)+ ":00";
                    TxtSvcTp.Text = result.service_type;
                    TxtVecDet.Text = result.model;
                    TxtCNotes.Text = result.customer_notes;
                    TxtSvcType.Text = result.service_type;
                    TxtSvcStatus.Text = result.status_type;
                    TxtStaff.Text = result.staff_name;

                    //var restatus = from sst in Dtx.Service_Status select sst;
                    //DropDwSvcStatus.DataSource = restatus;
                    //DropDwSvcStatus.DataValueField = "id_status";
                    //DropDwSvcStatus.DataTextField = "status_type";
                    //DropDwSvcStatus.DataBind();

                    //var restaff = from st in Dtx.Staffs select st;
                    //DropDwStaff.DataSource = restaff;
                    //DropDwStaff.DataValueField = "id_staff";
                    //DropDwStaff.DataTextField = "staff_name";
                    //DropDwStaff.DataBind();
                }
                else 
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");

                }
            }
        }

        protected void BtnOrder_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();
            var book = (from f in Dtx.VW_Bookings where f.id_booking == Convert.ToInt32(Session["bookorder"]) select f).FirstOrDefault();
            Border b = new Border();

            b.id_booking = book.id_booking;
            b.id_customer = book.id_customer;
            b.id_staff = book.id_staff;
            b.id_service = book.id_service;
            b.id_status = (int)book.id_status;
            b.order_notes = TxtGNotes.Text;


            Dtx.Borders.InsertOnSubmit(b);
            Dtx.SubmitChanges();

            //Clean();
            BtnOrder.Visible = false;
            BtnCancelOrder.Visible = false;
            BtnReturn.Visible = true;
            LblMsg.Visible = true;
            LblMsg.Text = "Successful booking";

        }

        protected void BtnCancelOrder_Click(object sender, EventArgs e)
        {
            Session["bookorder"] = "";
            Response.Redirect(@"\Views\ManageBooking.aspx");
        }

        public void Clean() 
        {
            TxtCName.Enabled = false;
            TxtBDt.Enabled = false;
            TxtBTm.Enabled = false;
            TxtSvcTp.Enabled = false;
            TxtVecDet.Enabled = false;
            TxtCNotes.Enabled = false;
            TxtSvcType.Enabled = false;
            TxtSvcStatus.Enabled = false;
            TxtStaff.Enabled = false;
            TxtGNotes.Enabled = false;
            //DropDwSvcStatus.Enabled = false;
            //DropDwStaff.Enabled = false;

            BtnOrder.Visible = false;
            BtnCancelOrder.Visible = false;
            
        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/ManageBooking.aspx");
        }
    }
}