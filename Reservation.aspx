<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Reservation.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
   
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
	<!-- Title Page -->
	<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/bg-title-page-02.jpg);">
		<h2 class="tit6 t-center">
			Reservation
		</h2>
	</section>

	<!-- Reservation -->
		
<section class="section-reservation bg1-pattern p-t-100 p-b-113">
		<div class="container">
			
    <div class="gview">

        <div class="rview">

            <table width="80%">
                <tr>
                
                    <td> Date</td>
                    <td>
                        <div class="wrap-inputdate pos-relative txt10 size12 bo2 bo-rad-10 m-t-3 m-b-23">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="my-calendar bo-rad-10 sizefull txt10 p-l-20" name="date"></asp:TextBox>
							<i class="btn-calendar fa fa-calendar ab-r-m hov-pointer m-r-18" aria-hidden="true"></i>
						</div>
                    </td>
                </tr>
                

                <tr>
                    <td>Time</td>
                    <td>Start Time&nbsp;
                        <asp:DropDownList ID="start" runat="server">
                            <asp:ListItem>06:00</asp:ListItem>
                            <asp:ListItem>07:00</asp:ListItem>
                            <asp:ListItem>08:00</asp:ListItem>
                            <asp:ListItem>09:00</asp:ListItem>
                            <asp:ListItem>10:00</asp:ListItem>
                            <asp:ListItem>11:00</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End Time&nbsp;
                        <asp:DropDownList ID="end" runat="server">
                            <asp:ListItem>07:00</asp:ListItem>
                            <asp:ListItem>08:00</asp:ListItem>
                            <asp:ListItem>09:00</asp:ListItem>
                            <asp:ListItem>10:00</asp:ListItem>
                            <asp:ListItem>11:00</asp:ListItem>
                            <asp:ListItem>12:00</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                      </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="wrap-btn-booking flex-c-m m-t-13"><center>
                            <asp:Button Width="200px" ID="Button1" runat="server" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" Text="Check Avalibility" onclick="Button1_Click1" />
                            </center></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><center>
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                            <br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Visible="False" RepeatDirection="Horizontal">
                                <asp:ListItem>&nbsp;&nbsp;Table 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem>&nbsp;&nbsp;Table 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem>&nbsp;&nbsp;Table 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem>&nbsp;&nbsp;Table 4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem>&nbsp;&nbsp;Table 5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Please Select The Table For Your Choice."></asp:RequiredFieldValidator>
                            </center>
                        </td>
                    </tr>
            </table>
        </div>

        <div class="lview">

            <table width="80%">
            <tr>
                <td class="style1">Customer Name</td>
                <td>
                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please Give Your Name."></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style1">Number Of Person</td>
                <td>
                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please Give Number Of Person."></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr> 
            <tr>
                <td class="style1">Phone No</td>
                <td>
                    <div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="bo-rad-10 sizefull txt10 p-l-20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please Give Your Phone No."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Phone No is give into 10 numbaers." ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    
                </td>
            </tr>     
        </table>
    </div>	
</div>
<table width="100%"><tr><td><div class="wrap-btn-booking flex-c-m m-t-13"><center>
                    <asp:Button ID="Button2" runat="server" Text="Book Now" CssClass="btn3 flex-c-m size36 txt11 trans-0-4" onclick="Button2_Click" />
                    </center></div></td></tr></table>
<center><asp:Label ID="Label2" runat="server" Text="Label" Visible="false"></asp:Label></center>
<div class="info-reservation flex-w p-t-80">
				<div class="size23 w-full-md p-t-40 p-r-30 p-r-0-md">
					<h4 class="txt5 m-b-18">
						Reserve by Phone
					</h4>

					<p class="size25">
						Contect To Table Booking and
                        Any Information About Our Hotel.<br />
						<span class="txt25">Contect Us</span>
						<span class="txt24">(+91) 8989898989</span>
					</p>
				</div>

				<div class="size24 w-full-md p-t-40">
					<h4 class="txt5 m-b-18">
						For Event Booking
					</h4>

					<p class="size26">
                        Contect To Any Type Of Party, Birthday etc. Any Eent<br />
						<span class="txt24">(+91) 8989898989</span><br />
						8-A National High-Way
					</p>
				</div>

</div></section>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />

   
</asp:Content>

