<%@ Page Title="" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="LoginBook.aspx.cs" Inherits="GerGarageOS2019414.Views.LoginBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="server">
    <div class="container">
        <div>
            <h2 class="font-weight-light">Welcome to Ger's Garage</h2>

            <p class="font-weight-light">You are almost there.
                <br />If you already have an account login <asp:HyperLink class="nav-link text-dark" ID="BLogin" NavigateUrl="~/Views/LoginUser.aspx" runat="server">here</asp:HyperLink>
                
                , if you don not have register <asp:HyperLink class="nav-link text-dark" ID="BRegister" NavigateUrl="~/Views/Register.aspx" runat="server">here</asp:HyperLink>
                
                .</p>
        </div>
    </div>
</asp:Content>
