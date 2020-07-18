<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="height"></div>

    <h2 class='colorred'>Customize Category</h2>

    <div class="wrap-btn-booking flex-c-m m-t-13">
        <asp:Button ID="Button1" runat="server" Width="200px" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" onclick="Button1_Click" Text="Food Category" />
    </div>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <div class="wrap-btn-booking flex-c-m m-t-13">
        <asp:Button ID="Button2" runat="server" Width="200px" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" onclick="Button2_Click" Text="Food Item" />
    </div>
    
    <div class="bottom_space_order"></div>
    <div class="bottom_space"></div>

</asp:Content>

