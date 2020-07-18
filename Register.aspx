<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="height"></div>
    
    <h2 class='colorred'>Ragistration</h2>
    <table width="90%" class="reg-form">

        <tr>
            <td class="margin"><asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label></td>
            <td class="padding"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="username" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="User Name is Reqired"></asp:RequiredFieldValidator></td>
            <td rowspan="5"><img height="550px" class="reg_img" width="100%" src="images/intro-01.jpg"></td>
        </tr>

        <tr>
            <td class="margin"><asp:Label ID="Label2" runat="server" Text="E-mail"></asp:Label></td>
            <td class="padding"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="email" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Email Id is Reqired"></asp:RequiredFieldValidator>
                 &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Please Enter Correct E-mail Id" 
                 ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator></td>
        </tr>
        
        <tr>
            <td class="margin"><asp:Label ID="Label3" runat="server" Text="Password"></asp:Label></td>
            <td class="padding"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="password" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20" TextMode="Password"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password" ErrorMessage="Password is Reqired"></asp:RequiredFieldValidator></td>
        </tr>
        
        <tr>
            <td class="margin"><asp:Label ID="Label4" runat="server" Text="Conform password"></asp:Label></td>
            <td class="padding"><div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23"><asp:TextBox ID="confirmpass" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20" TextMode="Password"></asp:TextBox></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="confirmpass" ErrorMessage="Confirm password is required"></asp:RequiredFieldValidator> &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="password" ControlToValidate="confirmpass" ErrorMessage="Password Must be same"></asp:CompareValidator></td>
        </tr>

        <tr>
            <td colspan="2" align="center"><div class="wrap-btn-booking flex-c-m m-t-13"><asp:Button ID="Register" runat="server" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" Text="Register" onclick="Register_Click" /></div></td>
        </tr>

    </table>
    
    <div class="height"></div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />

</asp:Content>

