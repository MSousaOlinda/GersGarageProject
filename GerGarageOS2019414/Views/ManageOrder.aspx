<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="GerGarageOS2019414.Views.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <div style="position: relative; min-height: 100%; top: 0px;">

        <div style="width: 85%; margin: 0 auto;" class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div style="margin-bottom:40px" class="text-center">
                            <h2>Manage <b>Order</b></h2>
                            <p  class="font-weight-light">Here it is possible to select the order and choose the option,  
                            <br /> it could be to change the status of the booking to In Service, Fixed or Completed 
                            <br /> or Collected and generate the invoice and include Other supplies to be possible to send the value of the service.</p>
                    </div>                     
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:GridView CssClass="table table-striped" ID="GridViewOrder" runat="server" AutoGenerateColumns="false" OnRowCommand="GridViewOrder_RowCommand">
                    <Columns>
                        <asp:BoundField HeaderText="Order nº" DataField="id_order" />
                        <asp:BoundField HeaderText="Booking nº" DataField="id_booking" />                       
                        <asp:BoundField HeaderText="Date" DataField="reservationDate" />
                        <asp:BoundField HeaderText="Customer notes" DataField="customer_notes" />
                        <asp:BoundField DataField="id_customer" Visible="false" />
                        <asp:BoundField HeaderText="Custmoer Name" DataField="name" />
                        <%--<asp:BoundField DataField="id_vehicle" Visible="false" />
                        <asp:BoundField HeaderText="Vehicle model" DataField="model" />
                        <asp:BoundField HeaderText="Vehicle brand" DataField="brand" />--%>                        
                        <asp:BoundField DataField="id_service" Visible="false" />
                        <asp:BoundField HeaderText="Service type" DataField="service_type" />
                        <asp:BoundField HeaderText="Service price" DataField="service_price" />                        
                        <asp:BoundField DataField="id_status" Visible="false" />
                        <asp:BoundField HeaderText="Status type" DataField="status_type" />
                        <asp:BoundField DataField="id_staff" Visible="false" />
                        <asp:BoundField HeaderText="Staff" DataField="staff_name" />

                        <asp:ButtonField CommandName="Status" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Status" />
                        <asp:ButtonField CommandName="Invoice" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Invoice" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </div>
</asp:Content>
