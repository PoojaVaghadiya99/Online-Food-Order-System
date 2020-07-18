using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "select * from food_orders ORDER BY id DESC";
        SqlCommand cmd = new SqlCommand(q, cn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<div class='height'></div><h2 class='colorred'>Food Orders</h2>");
            Response.Write("<table class='disptable' width='96%'>");
            Response.Write("<tr>");
            Response.Write("<th width='5%' align='center'>Order ID</th>");
            Response.Write("<th width='5%' align='center'>Date</th>");
            Response.Write("<th width='5%' align='center'>Name</th>");
            Response.Write("<th width='5%' align='center'>Phone No</th>");
            Response.Write("<th width='10%' align='center'>Address</th>");
            Response.Write("<th width='10%' align='center'>Food Item</th>");
            Response.Write("<th width='2%' align='center'>QTY</th>");
            Response.Write("<th width='3%' align='center'>Price</th>");
            Response.Write("<th width='3%' align='center'>Total</th>");
            Response.Write("<th width='4%' align='center'>Amount</th>");
            Response.Write("<th width='5%' align='center'>Pament Type</th>");
            Response.Write("</tr>");

            while (dr.Read())
            {
                Response.Write("<tr><td>" + dr[1].ToString() + "</td>");
                Response.Write("<td>" + dr[4].ToString() + "</td>");
                Response.Write("<td>" + dr[3].ToString() + "</td>");
                Response.Write("<td>" + dr[5].ToString() + "</td>");
                Response.Write("<td>" + dr[6].ToString() + "</td>");
                Response.Write("<td>" + dr[7].ToString() + "</td>");
                Response.Write("<td>" + dr[8].ToString() + "</td>");
                Response.Write("<td>" + dr[9].ToString() + "</td>");
                Response.Write("<td>" + dr[10].ToString() + "</td>");
                Response.Write("<td>" + dr[11].ToString() + "</td>");
                Response.Write("<td>" + dr[12].ToString() + "</td></tr>");


            }
            Response.Write("</table>");
        }



        cn.Close();


    }
}