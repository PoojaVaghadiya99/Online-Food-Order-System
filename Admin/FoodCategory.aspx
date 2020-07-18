<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="FoodCategory.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="height"></div>
    
 <h2 class='colorred'>Customize Food Category</h2>
<center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" Width="100%"  DataKeyNames="id" DataSourceID="SqlDataSource1" 
        ForeColor="Black" GridLines="Horizontal" ShowFooter="True">
        <Columns>
                <asp:BoundField />
            <asp:CommandField HeaderText="Action" HeaderStyle-VerticalAlign="Middle" 
                HeaderStyle-HorizontalAlign="Center" ShowDeleteButton="True" 
                ShowEditButton="True" ShowHeader="True" >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
            </asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="food_category" HeaderText="Food Category" 
                SortExpression="food_category" />
            <asp:BoundField DataField="image" HeaderText="Image Path" SortExpression="image" />
        </Columns>
        <FooterStyle Height="60px" BackColor="White" HorizontalAlign="Center" ForeColor="Black" />
        <HeaderStyle Height="60px" BackColor="#036" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
            
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView></center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:con %>" 
        SelectCommand="SELECT [id], [food_category], [image] FROM [category_food]" 
        DeleteCommand="DELETE FROM [category_food] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [category_food] ([food_category], [image]) VALUES (@food_category, @image)" 
        UpdateCommand="UPDATE [category_food] SET [food_category] = @food_category, [image] = @image WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="food_category" Type="String" />
            <asp:Parameter Name="image" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="food_category" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

