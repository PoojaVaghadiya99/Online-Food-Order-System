using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "select * from table_book ORDER BY id DESC";
        SqlCommand cmd = new SqlCommand(q, cn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<div class='height'></div><h2 class='colorred'>Table Booking</h2>");
            Response.Write("<table class='disptable' width='96%'>");
            Response.Write("<tr>");
            Response.Write("<th align='center'>Name</th>");
            Response.Write("<th align='center'>Table No</th>");
            Response.Write("<th align='center'>Date</th>");
            Response.Write("<th align='center'>Start Time</th>");
            Response.Write("<th align='center'>End time</th>");
            Response.Write("<th align='center'>People</th>");
            Response.Write("<th align='center'>Phone</th>");
            Response.Write("</tr>");

            while (dr.Read())
            {
                Response.Write("<tr><td>" + dr[1].ToString() + "</td>");
                Response.Write("<td>" + dr[2].ToString() + "</td>");
                Response.Write("<td>" + dr[3].ToString() + "</td>");
                Response.Write("<td>" + dr[4].ToString() + "</td>");
                Response.Write("<td>" + dr[5].ToString() + "</td>");
                Response.Write("<td>" + dr[6].ToString() + "</td>");
                Response.Write("<td>" + dr[7].ToString() + "</td></tr>");


            }
            Response.Write("</table>");
        }



        cn.Close();
    }
}