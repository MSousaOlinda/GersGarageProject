<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="ManageBooking.aspx.cs" Inherits="GerGarageOS2019414.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <div style="position: relative; min-height: 100%; top: 0px;">

        <%--https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=crud-data-table-for-database-with-modal-form--%>

        <div style="width: 85%; margin: 40px auto;" class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div style="margin-bottom:40px" class="text-center">
                            <h2>Manage <b>Booking</b></h2>
                            <p  class="font-weight-light">Here it is possible to select the booking and choose the option,  
                            <br /> it could be to change the status of the booking to confirmed booking 
                            <br /> or cancel and generate the order to be possible to send the price of the service.</p>
                    </div>                    
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:GridView CssClass="table table-striped" runat="server" ID="GridviewBooking" AutoGenerateColumns="false" OnRowCommand="GridviewBooking_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="Booking nº" DataField="id_booking" />
                        <asp:BoundField HeaderText="Date" DataField="reservationDate" />
                        <asp:BoundField HeaderText="Customer notes" DataField="customer_notes" />
                        <asp:BoundField DataField="id_customer" Visible="false" />
                        <asp:BoundField HeaderText="Custmoer Name" DataField="name" />
                        <asp:BoundField DataField="id_vehicle" Visible="false" />
                        <asp:BoundField HeaderText="Vehicle model" DataField="model" />
                        <asp:BoundField HeaderText="Vehicle brand" DataField="brand" />
                        <%--<asp:BoundField HeaderText="" DataField="type" />--%>
                        <asp:BoundField DataField="id_service" Visible="false" />
                        <asp:BoundField HeaderText="Service type" DataField="service_type" />
                        <asp:BoundField DataField="id_time" Visible="false" />
                        <asp:BoundField DataField="time" Visible="false" />
                        <asp:BoundField DataField="id_status" Visible="false" />
                        <asp:BoundField HeaderText="Status type" DataField="status_type" />
                        <asp:BoundField DataField="id_staff" Visible="false" />
                        <asp:BoundField HeaderText="Staff" DataField="staff_name" />
                        <asp:ButtonField CommandName="Status" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Status" />
                        <asp:ButtonField CommandName="Order" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Order" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>


        <%--formato pra table
            <div class="table-responsive">
            <table class="table">
                </table>
            </div>--%>
    </div>
</asp:Content>
