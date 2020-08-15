<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="ManageInvoice.aspx.cs" Inherits="GerGarageOS2019414.Views.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
        <div style="position: relative; min-height: 100%; top: 0px;">

        <div style="width: 85%; margin: 0 auto;" class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b>Invoice</b></h2>
                        </div>                        
                    </div>
                </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:GridView CssClass="table table-striped" ID="GridViewInvoice" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="Booking nº" DataField="id_booking" />
                        <asp:BoundField HeaderText="Date" DataField="reservationDate" />
                        <asp:ButtonField CommandName="Status" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Status" />
                        <asp:ButtonField CommandName="Invoice" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-secondary" Text="Invoice" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

    </div>

</asp:Content>
