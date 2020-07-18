<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="FoodItem.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="height"></div>
 <h2 class='colorred'>Customize Food Item</h2>
           
    <asp:GridView AllowPaging="True" Width="100%" ID="GridView2" 
            runat="server" AutoGenerateColumns="False" 
            DataKeyNames="fid" DataSourceID="SqlDataSource2" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" 
        PagerSettings-Mode="NextPreviousFirstLast" PagerSettings-LastPageText="Last"
        PagerSettings-FirstPageText="First">
            <Columns>
                <asp:BoundField />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Action" HeaderStyle-VerticalAlign="Middle"/>
                <asp:BoundField  DataField="fid" HeaderText="Food ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="fid" />
                <asp:BoundField  DataField="food_item" HeaderText="Food Item" 
                    SortExpression="food_item" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:BoundField DataField="id" HeaderText="F-ID" SortExpression="id" />
            </Columns>
            <FooterStyle Height="60px" BackColor="#CCCC99" HorizontalAlign="Center" ForeColor="Black" />
            <HeaderStyle Height="60px" BackColor="#036" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NumericFirstLast" />
            <PagerStyle Height="60px" BackColor="White" ForeColor="Black" 
                HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:con %>" 
            DeleteCommand="DELETE FROM [food_item] WHERE [fid] = @fid" 
            InsertCommand="INSERT INTO [food_item] ([food_item], [price], [id]) VALUES (@food_item, @price, @id)" 
            SelectCommand="SELECT [fid], [food_item], [price], [id] FROM [food_item]" 
            
        UpdateCommand="UPDATE [food_item] SET [food_item] = @food_item, [price] = @price, [id] = @id WHERE [fid] = @fid">
            <DeleteParameters>
                <asp:Parameter Name="fid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="food_item" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="food_item" Type="String" />
                <asp:Parameter Name="price" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="fid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

</asp:Content>

