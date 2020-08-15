<%@ Page Title="Calendar" Language="C#" MasterPageFile="~/ModelCustomer.Master" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="GerGarageOS2019414.Views.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomerContent" runat="Server">
    <div class="container">
        <div class="text-center">
            <p style="margin: 30px auto 40px auto" class="font-weight-light">
                Please select the date and time that best fits your schedule. 
                <br />
                Appointments are accepted as early as 8:00 AM and as late as 5:00 PM.
                <br />
                Please note that Saturday appointments are limited.
            </p>
        </div>
        <div style="margin-bottom: 20px" class="text-center h4">
            <asp:Label ID="LblDate" runat="server" Text="Date"></asp:Label>
        </div>

        <div style="width: 40%; margin: 0 auto; margin-bottom: 40px">
            <asp:Calendar ID="CldBook" runat="server" OnSelectionChanged="CldBook_SelectionChanged" ToolTip="Blog Archive Calendar" NextPrevFormat="ShortMonth" CssClass="Calendar">
                <SelectedDayStyle CssClass="SelectedDayStyle" />
                <TodayDayStyle CssClass="TodayDayStyle" />
                <OtherMonthDayStyle CssClass="OtherMonthDayStyle" />
                <DayHeaderStyle CssClass="DayHeaderStyle" />
                <DayStyle CssClass="DayStyle" />
                <TitleStyle CssClass="TitleStyle" />
            </asp:Calendar>
        </div>
        <div class="text-center h4">
            <asp:Label ID="LblSunday" runat="server" Text=""></asp:Label>
        </div>
        <div class="text-center h4">
            <asp:Label ID="LblTime" runat="server" Text="Time" Visible="false"></asp:Label>
        </div>

        <div style="width: 30%; margin: 0 auto;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:GridView CssClass="Grid" runat="server" ID="Gridview1" AutoGenerateColumns="False" OnRowCommand="Gridview1_RowCommand" OnRowDataBound="Gridview1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="id_time" ItemStyle-ForeColor="white" />
                    <asp:BoundField DataField="time" />
                    <asp:BoundField DataField="Status" />
                    <asp:ButtonField ButtonType="Button" Text="Select time" ControlStyle-CssClass="btn btn-outline-secondary" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
