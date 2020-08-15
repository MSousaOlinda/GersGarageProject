<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="GerGarageOS2019414.Views.Status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">

    <div class="container">
        <div class="col-md-6 col-lg-4">
            <h2>List all bookings</h2>            
            <asp:TextBox class="form-control" AutoCompleteType="None" ID="TxtOrderN" runat="server" Visible="false"></asp:TextBox>            
            <asp:TextBox class="form-control" AutoCompleteType="None" ID="TxtBooking" runat="server" Visible="false"></asp:TextBox>            
            <p>Date:
            <asp:TextBox class="form-control" ID="TxtBDt" runat="server" ReadOnly="true"></asp:TextBox>
            </p>            
            <p>Time:
            <asp:TextBox class="form-control" ID="TxtBTm" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>Customer Name:
            <asp:TextBox class="form-control" ID="TxtCName" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>Customer notes:
            <asp:TextBox class="form-control" ID="TxtCNotes" runat="server" ReadOnly="true"></asp:TextBox>
            </p>            
            <p>Vehicle model:
            <asp:TextBox class="form-control" ID="TxtVehModel" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>Vehicle brand:
            <asp:TextBox class="form-control" ID="TxtVehBrand" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>Service Type:
            <asp:TextBox class="form-control" ID="TxtSvcType" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>Service Status:
            <asp:DropDownList class="form-control" ID="DropDwSvcStatus" runat="server"></asp:DropDownList>
            </p>
            <p>Staff:
            <asp:DropDownList class="form-control" ID="DropDwStaff" runat="server"></asp:DropDownList>
            </p>
            <p><asp:Label ID="LblMsg" runat="server" Text="" Visible="false"></asp:Label></p>
            <asp:Button class="btn btn-outline-secondary" ID="BtnUpDate" runat="server" Text="Save" OnClick="BtnUpDate_Click"/>
            <asp:Button class="btn btn-outline-secondary" ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click"/>
            <asp:Button class="btn btn-outline-secondary" ID="BtnReturn" runat="server" Text="Return" Visible="false" OnClick="BtnReturn_Click"/>            
        </div>
    </div>
</asp:Content>
