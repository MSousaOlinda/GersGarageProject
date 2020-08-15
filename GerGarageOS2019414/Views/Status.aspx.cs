using GerGarageOS2019414.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414.Views
{
    public partial class Status : System.Web.UI.Page
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
                    TxtBTm.Text = Convert.ToString(result.time) + ":00";                    
                    TxtCNotes.Text = result.customer_notes;
                    TxtSvcType.Text = result.service_type;
                    TxtVehModel.Text = result.model;
                    TxtVehBrand.Text = result.brand;


                    var restatus = from sst in Dtx.Service_Status select sst;
                    DropDwSvcStatus.DataSource = restatus;
                    DropDwSvcStatus.DataValueField = "id_status";
                    DropDwSvcStatus.DataTextField = "status_type";
                    DropDwSvcStatus.DataBind();

                    var restaff = from st in Dtx.Staffs select st;
                    DropDwStaff.DataSource = restaff;
                    DropDwStaff.DataValueField = "id_staff";
                    DropDwStaff.DataTextField = "staff_name";
                    DropDwStaff.DataBind();

                }
                else
                {
                    Response.Redirect(@"\Views\LoginAdmin.aspx");
                }
            }

        }

        protected void BtnUpDate_Click(object sender, EventArgs e)
        {
            DataContextDataContext Dtx = new DataContextDataContext();
            var btup = (from f in Dtx.Bookings where f.id_booking == Convert.ToInt32(Session["bookorder"]) select f).FirstOrDefault();
            btup.id_staff = Convert.ToInt32(DropDwStaff.SelectedValue);
            btup.id_status = Convert.ToInt32(DropDwSvcStatus.SelectedValue);

            Dtx.SubmitChanges();

            Response.Redirect(@"\Views\ManageBooking.aspx");

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(@"\Views\ManageBooking.aspx");
        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {

        }
    }
}