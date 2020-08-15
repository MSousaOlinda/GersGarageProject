<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="GerGarageOS2019414.Views.LoginAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <div class="container">
        <div>
            <h2 class="font-weight-light">Welcome to Admin area</h2>

            <p class="font-weight-light">Please, login to access the booking lists.</p>
        </div>
        <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">
            <p class="h5">
                Name:
            <asp:TextBox class="form-control" ID="TxtAdmin" runat="server"></asp:TextBox>
            </p>
            <p class="h5">
                Password:
            <asp:TextBox class="form-control" ID="TxtPassAdmin" MaxLength="10" runat="server" TextMode="Password"></asp:TextBox>
            </p>
        </div>
        <div>

            <asp:Button class="btn btn-outline-secondary" ID="BtnLogAdmin" runat="server" Text="Login" OnClick="BtnLogAdmin_Click" />
            <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
