<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="height"></div>

    <table width="90%" class="log-form">

        <tr>
            <th class="text" colspan="2"><center>Please Enter Your Username and Password.<br /><a href="Register.aspx">Register</a> If You Don't have an Account.</center></th>
            <td rowspan="4"><img height="450px" class="reg_img" width="100%" src="images/Login.jpg"></td>
        </tr>

        <tr>
            <td class="text"><asp:Label ID="Label1" runat="server" Text="UserName"></asp:Label></td>
            <td class="input"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="username" runat="server"  CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="username" ErrorMessage="UserName is Reqired"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
            <td class="text"><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
            <td class="input"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="password" runat="server"  CssClass="bo-rad-10 sizefull txt10 p-l-20" TextMode="Password"></asp:TextBox></div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password" ErrorMessage="Password is Reqired"></asp:RequiredFieldValidator>
                <asp:Label ID="L1" runat="server"></asp:Label></td>
            
        </tr>

        <tr>
            <td colspan="2" align="center"><div class="wrap-btn-booking flex-c-m m-t-13"><asp:Button ID="Button1" runat="server" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" Text="Log In" onclick="Button1_Click" /></div></td>
        </tr>

    </table>

    <div class="height"></div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
</asp:Content>

