<%@ Page Language="C#" AutoEventWireup="true" CodeFile="image_ex.aspx.cs" Inherits="image_ex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>

    <table>
    <tr><td><img src="<%#Eval("image") %>" height="100" width="100" /></td>
    <td><%#Eval("food_category") %></td></tr>
    </table>

   </ItemTemplate>
   </asp:DataList>
    </form>
</body>
</html>
