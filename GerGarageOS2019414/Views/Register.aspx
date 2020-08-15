<%@ Page Title="Register" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GerGarageOS2019414.Views.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="Server">
    <div class="container">
        <div>
            <h2 class="font-weight-light">Welcome to Ger's Garage</h2>

            <p class="font-weight-light">Please, signup to access the booking system.</p>
        </div>
        <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">
            <p style="margin-top: 20px">Name:
            <asp:TextBox class="form-control" ID="TxtName" Enabled="true" runat="server"></asp:TextBox></p>
            <p style="margin-top: 20px">Email:
            <asp:TextBox class="form-control" ID="TxtEmail" Enabled="true" runat="server"></asp:TextBox></p>
            <p style="margin-top: 20px">Phone:
            <asp:TextBox class="form-control" ID="TxtPhone" Enabled="true" runat="server"></asp:TextBox></p>
            <p style="margin-top: 20px">Password:
            <asp:TextBox class="form-control" ID="TxtPassword" TextMode="Password" Enabled="true" runat="server" MaxLength="10"></asp:TextBox></p>
        </div>
        <div>
            <asp:Button class="btn btn-outline-secondary" ID="BtnSave" runat="server" Text="Register" OnClick="BtnSave_Click" />
            <asp:Label ID="LblMsgEmail" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
