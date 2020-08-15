<%@ Page Title="Customer Home" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="GerGarageOS2019414.Views.CustomerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="Server">
    <div class="container">
        
        <div>
            <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">
                <p class="h5">My Details</p>
                <p>
                    Name:
                <asp:TextBox class="form-control" ID="TxtName" runat="server" ReadOnly="true"></asp:TextBox>
                </p>
                <p>
                    Email:
                <asp:TextBox class="form-control" ID="TxtEmail" runat="server" ReadOnly="true"></asp:TextBox>
                </p>
                <p>
                    Phone:
                <asp:TextBox class="form-control" ID="TxtPhone" runat="server" ReadOnly="true"></asp:TextBox>
                </p>
                <asp:Button class="btn btn-outline-secondary" ID="BtnEdit" runat="server" Text="Edit" OnClick="BtnEdit_Click" />
                <asp:Button class="btn btn-outline-secondary" ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" Visible="false" />
                <asp:Button class="btn btn-outline-secondary" ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" Visible="false" />
            </div>

            <div>
                <%--<p class="h5">My Bookings</p>
                <p>
                    Booking Date:
                <asp:TextBox class="form-control" ID="TxtBkDate" runat="server"></asp:TextBox>
                </p>
                <p>Notes<asp:TextBox class="form-control" ID="TxtNotesBook" runat="server"></asp:TextBox></p>
                <p>Vehicle details:<asp:TextBox class="form-control" ID="TxtVehicleBook" runat="server"></asp:TextBox></p>
                <p>
                    Service Type:
                <asp:TextBox class="form-control" ID="TxtServiceBook" runat="server"></asp:TextBox>
                </p>

                <asp:Button class="btn btn-outline-secondary" ID="BtnCBooking" runat="server" Text="Cancel" OnClick="BtnCBooking_Click" />--%>
                <%--<asp:Button ID="Button2" runat="server" Text="Button" />--%>
            </div>

        </div>
        
        
        <div class="col-md-6 col-lg-4">
            <p class="h5">My Bookings</p>
        </div>
        <div style="width: 97%; margin: -30px auto 0 auto;" class="table-responsive">

            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:GridView CssClass="table table-striped" runat="server" ID="GridviewBooking" AutoGenerateColumns="false" OnRowCommand="GridviewBooking_RowCommand" OnRowDataBound="GridviewBooking_RowDataBound">
                    <Columns>
                        <asp:BoundField HeaderText="Booking nº" DataField="id_booking" />
                        <asp:BoundField HeaderText="Date" DataField="reservationDate" />
                        <asp:BoundField HeaderText="Customer notes" DataField="customer_notes" />
                        <asp:BoundField DataField="id_customer" Visible="false" />
                        <asp:BoundField HeaderText="Custmoer Name" DataField="name" Visible="false"/>
                        <asp:BoundField DataField="id_vehicle" Visible="false" />
                        <asp:BoundField HeaderText="Vehicle model" DataField="model" />
                        <asp:BoundField HeaderText="Vehicle brand" DataField="brand" />                        
                        <asp:BoundField DataField="id_service" Visible="false" />
                        <asp:BoundField HeaderText="Service type" DataField="service_type" />
                        <asp:BoundField DataField="id_time" Visible="false" />
                        <asp:BoundField DataField="time" Visible="false" />
                        <asp:BoundField DataField="id_status" Visible="false" />
                        <asp:BoundField HeaderText="Status type" DataField="status_type" />
                        <asp:BoundField DataField="id_staff" Visible="false" />
                        <asp:BoundField HeaderText="Staff" DataField="staff_name" />
                        <asp:ButtonField CommandName="CancelOrder" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Cancel" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
