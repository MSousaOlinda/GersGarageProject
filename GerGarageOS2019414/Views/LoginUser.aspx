<%@ Page Title="Home" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="GerGarageOS2019414.Views.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="Server">
    <div class="container">
        <div>
            <h2 class="font-weight-light">Welcome to Ger's Garage</h2>

            <p class="font-weight-light">Please, login to access the booking system.</p>
        </div>
        <div>
            <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">
                <p class="h5">
                    Name:
                <asp:TextBox class="form-control" ID="TxtName" runat="server" MaxLength="20"></asp:TextBox>
                </p>
                <p class="h5">
                    Password:
                <asp:TextBox class="form-control" ID="TxtPassword" MaxLength="10" runat="server" TextMode="Password"></asp:TextBox>
                </p>

            </div>

            <div>
                <asp:Button class="btn btn-outline-secondary" ID="BtnLog" runat="server" OnClick="Btn_Click" Text="Login" />
            </div>
            <asp:Label ID="LblMsg" Text="" runat="server" />
        </div>
    </div>
</asp:Content>
