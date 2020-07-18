<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="height"></div>

    <h2 class='colorred'>Order Now</h2>

<div class="g-view">

<div class="l-view">
    <center>
        <asp:Label ID="Label3" runat="server" Text="Food Cart"></asp:Label></center>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="90%" 
        ShowFooter="True" BackColor="White" BorderColor="#CCCCCC" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="NO" />
            <asp:BoundField DataField="food_item" HeaderText="Food Item" />
            <asp:BoundField DataField="qty" HeaderText="Quantity" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="total" HeaderText="Total Price" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="Black" Font-Bold="true" />
        <HeaderStyle Height="60px" BackColor="#333333" Font-Bold="True" 
            ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
</div>

<div class="r-view">
    <table width="80%">
    <tr>
        <td class="style1">Order id</td>
        <td><asp:Label class="text" ID="Label1" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td class="style1">Order Date</td>
        <td><asp:Label class="text" ID="Label2" runat="server"></asp:Label></td>
    </tr>
   
    </table>
    <br />
    <table width="80%">
        <tr>
            <td>Name</td>
            <td><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="TextBox1" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="TextBox1" ErrorMessage="please enter your name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Moile No</td>
            <td><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="TextBox2" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage=" please enter your mobile no"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="TextBox3" runat="server"  CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"  ErrorMessage="please enter your address"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Payment</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>&nbsp;&nbsp;Online Payment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem>&nbsp;&nbsp;Cash On Delivery&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
      <!--  <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Your Card Validity" ></asp:Label></td>
            <td><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox  ID="TextBox4" runat="server"  CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div></td>
        </tr>-->

        <tr>
            <td colspan="2" align="center"><div class="wrap-btn-booking flex-c-m m-t-13"><asp:Button ID="Button1" runat="server" Text="Place Order" onclick="Button1_Click" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" /></div></td>
        </tr>
    </table>

</div>

</div>
<div class="bottom_space_order"></div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    
</asp:Content>

