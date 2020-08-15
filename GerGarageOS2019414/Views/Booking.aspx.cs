using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GerGarageOS2019414
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                try
                {
                    //if (Session["loginidct"] == null)                 
                    if (Models.ValidationUser.isValidAcess(Convert.ToString(Session["loginidct"])) == false)
                    {
                        Response.Redirect(@"\Views\LoginUser.aspx");
                    }

                    LblDtBook.Text = Convert.ToString(Session["IdDtBooking"]);
                    LblTmBook.Text = Convert.ToString(Session["IdTmBooking"]);

                    DataContextDataContext Dtx = new DataContextDataContext();
                    var Vehicle = from v in Dtx.Vehicles select v;
                    DropDwVehicle.DataSource = Vehicle;
                    DropDwVehicle.DataValueField = "id_vehicle";
                    DropDwVehicle.DataTextField = "model";
                    DropDwVehicle.DataBind();

                    var SvcType = from s in Dtx.Service_Types select s;
                    DropDwServiceType.DataSource = SvcType;
                    DropDwServiceType.DataValueField = "id_service";
                    DropDwServiceType.DataTextField = "service_type1";
                    DropDwServiceType.DataBind();
                }
                catch (Exception)
                {
                    Response.Redirect(@"\Views\LoginUser.aspx");
                }
                
            }
        }

        protected void BtnReturn_Click(object sender, EventArgs e)
        {
            Session["IdDtBooking"] = "";
            Session["IdTmBooking"] = "";
            Response.Redirect("~/Views/Calendar.aspx");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                DataContextDataContext Dtx = new DataContextDataContext();
                Booking Bk = new Booking();
                Bk.reservationDate = Convert.ToDateTime(Session["IdDtBooking"]);
                Bk.customer_notes = TxtNotes.Text;
                Bk.id_customer = Convert.ToInt32(Session["loginidct"]);
                Bk.id_vehicle = Convert.ToInt32(DropDwVehicle.SelectedValue);
                Bk.id_service = Convert.ToInt32(DropDwServiceType.SelectedValue);
                Bk.id_time = Convert.ToInt32(Session["IdTmBooking"]);
                Bk.licence = TxtLicense.Text;
                Bk.id_status = 1;

                Dtx.Bookings.InsertOnSubmit(Bk);
                Dtx.SubmitChanges();

                LblMsg.Visible = true;
                LblMsg.Text = "Successful booking";
                

            }
            catch (Exception ex)
            {
                LblMsg.Visible = true;
                LblMsg.Text = "Please, try again. " + Environment.NewLine + ex.Message;
            }

            Response.Redirect("~/Views/CustomerHome.aspx");
        }
    }
}