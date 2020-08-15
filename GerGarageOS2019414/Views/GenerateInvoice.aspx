<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="GenerateInvoice.aspx.cs" Inherits="GerGarageOS2019414.Views.GenerateInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
        <div class="container">
        <div class="col-md-6 col-lg-4">
            <h3>List all books</h3>
            <p>
                Customer Name:
            <asp:TextBox class="form-control" ID="TxtCName" runat="server" ReadOnly="true"></asp:TextBox>
            </p>            
            <p>
                Service Type:
            <asp:TextBox class="form-control" ID="TxtSvcTp" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Service Price:
            <asp:TextBox class="form-control" ID="TxtSvcPrc" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Service Status:
            <asp:TextBox class="form-control" ID="TxtSvcStatus" runat="server" ReadOnly="true"></asp:TextBox>                
            </p>
            
            <p>
                Other supplies:            
                <asp:DropDownList ID="DropDwSupplies" runat="server"></asp:DropDownList>
            </p>

            <asp:Button class="btn btn-outline-secondary" ID="BtnInvoice" runat="server" Text="Generate order" OnClick="BtnInvoice_Click"/>
            <asp:Button class="btn btn-outline-secondary" ID="BtnCancelInvoice" runat="server" Text="Cancel" OnClick="BtnCancelInvoice_Click"/>
            <asp:Button class="btn btn-outline-secondary" ID="BtnReturn" runat="server" Text="Return" Visible="false" OnClick="BtnReturn_Click"/>
            <p>
                <asp:Label ID="LblMsg" runat="server" Text="" Visible="false"></asp:Label></p>
        </div>
    </div>

</asp:Content>
