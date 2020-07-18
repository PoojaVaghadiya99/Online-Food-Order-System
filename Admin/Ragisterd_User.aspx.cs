using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "select * from register_user ORDER BY id DESC";
        SqlCommand cmd = new SqlCommand(q, cn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            Response.Write("<div class='height'></div><h2 class='colorred'>Ragisterd User</h2>");
            Response.Write("<table class='disptable' width='96%'>");
            Response.Write("<tr>");
            Response.Write("<th align='center'>User Name</th>");
            Response.Write("<th align='center'>Email</th>");
            Response.Write("<th align='center'>Password</th>");
            Response.Write("</tr>");

            while (dr.Read())
            {
                Response.Write("<tr><td>" + dr[1].ToString() + "</td>");
                Response.Write("<td>" + dr[2].ToString() + "</td>");
                Response.Write("<td>" + dr[3].ToString() + "</td></tr>");


            }
            Response.Write("</table>");
        }



        cn.Close();
    }   
}