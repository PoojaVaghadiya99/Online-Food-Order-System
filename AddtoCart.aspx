<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddtoCart.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="height"></div>


    <h2 class='colorred'>Food Cart</h2>
   
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="40" ForeColor="Black" GridLines="Horizontal" Width="1230px" 
        onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" ShowFooter="True" 
        HorizontalAlign="Center" >
        <Columns>
            <asp:BoundField  DataField="sno" HeaderText="No" />
            <asp:BoundField DataField="food_item" HeaderText="Food Item" />
            <asp:BoundField DataField="qty" HeaderText="Quentity" />
            <asp:BoundField DataField="price" HeaderText="Price" />
            <asp:BoundField DataField="total" HeaderText="Total" />
            
            <asp:CommandField DeleteText="Remove" HeaderText="Remove Item" 
                ShowDeleteButton="True" />
            
        </Columns>
        <FooterStyle BackColor="White" ForeColor="Black" Font-Bold="true" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" 
            Height="60px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
     <p>
    <center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Add More Food Item</asp:HyperLink>
    </center>
    </p>
    
    
    <div class="wrap-btn-booking flex-c-m m-t-13"><center>
    <asp:Button ID="Button1" runat="server" Text="Order Now" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" onclick="Button1_Click" /></center>
    </div>
</asp:Content>

