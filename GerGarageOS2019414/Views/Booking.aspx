<%@ Page Title="Booking" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="GerGarageOS2019414.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="server">
    <div style="color:darkslategray" class="container">
        <p  class="h4; text">
            Please, confirm your booking details:
        </p>        
        <br />
        <div style="margin-bottom: 20px" class="col-md-6 col-lg-4">
            <p class="h5">
                Date:
                <asp:Label ID="LblDtBook" runat="server" Text=""></asp:Label>
            </p>
            <p class="h5">
                Time:
                <asp:Label ID="LblTmBook" runat="server" Text=""></asp:Label>
            </p>
            <p class="h5">
                Vehicle model:
                <asp:DropDownList ID="DropDwVehicle" runat="server"></asp:DropDownList>
            </p>
            <p class="h5">
                Vehicle brand:
                <asp:DropDownList ID="DropDownBrand" runat="server"></asp:DropDownList>
            </p>
            <p class="h5">
                Vehicle engine:
                <asp:DropDownList ID="DropDownEngine" runat="server"></asp:DropDownList>
            </p>
            <p class="h5">
                Licence:                
                <asp:TextBox class="form-control" ID="TxtLicense" runat="server" placeholder="Enter the licence number." MaxLength="20"></asp:TextBox>
                <%--<textarea maxlength="20" name="comment" id="TxtLicense" style="resize: none" cols="45" rows="2" class="schedule-form-input-long, h6" placeholder="Enter the licence number."></textarea>--%>
            </p>
            <p class="h5">
                Service type:
                <asp:DropDownList ID="DropDwServiceType" runat="server"></asp:DropDownList>
            </p>
            <div class="input-field">
                <p class="h5">
                    Comments and Questions:    
                    <asp:TextBox class="form-control" ID="TxtNotes" runat="server" placeholder="Your comments and questions go here.." MaxLength="200"></asp:TextBox>
                    <%--<textarea maxlength="200" name="comment" id="TxtNotes" style="resize: none" cols="45" rows="5" class="schedule-form-input-long, h6" placeholder="Your comments and questions go here.."></textarea>                    --%>
                </p>
            </div>
            <asp:TextBox class="form-control" ID="TxtSStatus" TextMode="MultiLine" runat="server" Visible="false"></asp:TextBox>
            <asp:Button class="btn btn-outline-secondary" ID="BtnSave" runat="server" Text="Submit" OnClick="BtnSave_Click" />
            <asp:Button class="btn btn-outline-secondary" ID="BtnReturn" runat="server" Text="Return" OnClick="BtnReturn_Click" />
            <p>
                <asp:Label ID="LblMsg" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <%--<p class="h6">Please note that the date and time you requested may not be available. We will contact you to confirm your actual appointment details.</p>--%>
        <p style="margin-right: 400px" class="h6">Thank you for choosing our services. We will contact you to confirm your actual appointment details.</p>
    </div>
</asp:Content>
