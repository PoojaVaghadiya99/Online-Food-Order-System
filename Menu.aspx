<%@ Page Title="" Language="C#"  MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/bg-title-page-01.jpg);">
		<h2 class="tit6 t-center">
			Menu
		</h2>
	</section>

   
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>" SelectCommand="SELECT * FROM [category_food]">
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Text="Food Items In Your Cart : " Visible="false"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddtoCart.aspx" Visible="false">  |  Show Food Cart</asp:HyperLink>
        <asp:DataList CssClass="width_cart" ID="DataList1" runat="server" 
            DataKeyField="id" RepeatDirection="Horizontal" RepeatColumns="6"  DataSourceID="SqlDataSource1" Width="1335" >
            <ItemTemplate>

                <table>
                    <tr><td align="center"><div class="item-ourmenu bo-rad-10 hov-img-zoom pos-relative m-t-30"><img src="<%#Eval("image") %>" height="350px" width="300px"/></div></td></tr>
                    <tr><td align="center"><%#Eval("food_category") %></td></tr>
                    <tr><td align="center"><a href="Food_Item.aspx?id=<%#Eval("id") %>" >View Food Item</a></td></tr>
                    <tr><td></td></tr>
                </table>
    
            </ItemTemplate>
        </asp:DataList>
    

    
	
</asp:Content>

