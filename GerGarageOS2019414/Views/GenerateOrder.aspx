<%@ Page Title="" Language="C#" MasterPageFile="~/ModelAdmin.Master" AutoEventWireup="true" CodeBehind="GenerateOrder.aspx.cs" Inherits="GerGarageOS2019414.Views.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminContent" runat="server">
    <%-- <div>
            <h3>List all orders</h3>
            <p>Staff<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></p>
            <p>Service Type: <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></p>
            <p>Items<asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList></p>
            <p>Service Status: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></p>
            <p>Maintenance notes<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></p>
        </div>--%>
    <div class="container">
        <div class="col-md-6 col-lg-4">
            <h2>List all books</h2>
            <p>
                Customer Name:
            <asp:TextBox class="form-control" ID="TxtCName" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Booking date:
            <asp:TextBox class="form-control" ID="TxtBDt" runat="server" ReadOnly="true"></asp:TextBox>
            </p>            
            <p>
                Booking time:
            <asp:TextBox class="form-control" ID="TxtBTm" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Service Type:
            <asp:TextBox class="form-control" ID="TxtSvcTp" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Vehicle details:
            <asp:TextBox class="form-control" ID="TxtVecDet" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Customer notes:
            <asp:TextBox class="form-control" ID="TxtCNotes" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Service Type:
            <asp:TextBox class="form-control" ID="TxtSvcType" runat="server" ReadOnly="true"></asp:TextBox>
            </p>
            <p>
                Service Status:
            <asp:TextBox class="form-control" ID="TxtSvcStatus" runat="server" ReadOnly="true"></asp:TextBox>                
            </p>
            <p>
                Staff:
                <asp:TextBox class="form-control" ID="TxtStaff" runat="server" ReadOnly="true"></asp:TextBox>                
            </p>
            <p class="h5">
                Garage notes:
        <asp:TextBox class="form-control" ID="TxtGNotes" TextMode="MultiLine" runat="server"></asp:TextBox>
            </p>
            <p>
                Other supplies:            
                <asp:DropDownList ID="DropDwIdBook" runat="server"></asp:DropDownList>
            </p>

            <asp:Button class="btn btn-outline-secondary" ID="BtnOrder" runat="server" Text="Generate order" OnClick="BtnOrder_Click" />
            <asp:Button class="btn btn-outline-secondary" ID="BtnCancelOrder" runat="server" Text="Cancel" OnClick="BtnCancelOrder_Click" />
            <asp:Button class="btn btn-outline-secondary" ID="BtnReturn" runat="server" Text="Return" OnClick="BtnReturn_Click" Visible="false" />
            <p>
                <asp:Label ID="LblMsg" runat="server" Text="" Visible="false"></asp:Label></p>
        </div>
    </div>
</asp:Content>
