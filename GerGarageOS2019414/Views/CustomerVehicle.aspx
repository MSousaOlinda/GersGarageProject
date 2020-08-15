<%@ Page Title="Customer Vehicle" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerVehicle.aspx.cs" Inherits="GerGarageOS2019414.Views.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="Server">

    <div style="text-align: center">
        <img src="../Images/under_construction.jpg" />
    </div>

    <%--<div class="container">

        <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">            
            <p class="h5">
                Vehicle:
            <asp:TextBox class="form-control" ID="TxtVechicle" runat="server"></asp:TextBox>
            </p>
            <p class="h5">
                Brand:
            <asp:TextBox class="form-control" ID="TxtBrand" runat="server"></asp:TextBox>
            </p>
            <p class="h5">
                Engeni:
            <asp:TextBox class="form-control" ID="TxtEngine" runat="server"></asp:TextBox>
            </p>
                        <p class="h5">
                Licence:
            <asp:TextBox class="form-control" ID="TxtLicense" runat="server"></asp:TextBox>
            </p>
            <asp:Button class="btn btn-outline-secondary" ID="BtnEdit" runat="server" Text="Edit" />
            <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" Visible="false" />
            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" Visible="false" />
        </div>
    </div>--%>
</asp:Content>
