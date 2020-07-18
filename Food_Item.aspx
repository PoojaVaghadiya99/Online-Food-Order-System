<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Food_Item.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 328px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="height"></div>

    <h2 class='colorred'>Choose Food Item</h2>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:con %>" 
        
        SelectCommand="SELECT [fid], [food_item], [price], [id] FROM [food_item] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
     <table>
             <tr>
                <th class="style1">Food Item</th>
                <th class="style1">Price</th>
                <th class="style1">Quentity</th>
                <th class="style1">Action</th>
             </tr>
      </table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        Width="1315px" onitemcommand="DataList1_ItemCommand" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Horizontal">
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle Height="60px" BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
           
              <table>   
                <tr>
                    <td class="style1"><%# Eval("food_item") %></td>
                    <td class="style1"><%# Eval("price") %> &#8377</td>
                    <td class="style1">

                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style1"><asp:ImageButton ID="ImageButton1" class="imgcart" runat="server" 
                            CommandArgument='<%# Eval("fid")%>' CommandName="addtocart" Height="15px"
                            ImageUrl="~/images/AddtoCart.png" Width="80px" onclick="ImageButton1_Click" /></td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
</asp:Content>

