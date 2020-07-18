using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);
        cn.Open();
        SqlCommand cmd = new SqlCommand("select * from register_user where username='" + username.Text + "' and password='" +password.Text+ "' ", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        
        if (dr.Read())
        {
            Session["id"] = username.Text;
            Response.Redirect("index.aspx");
        }
        else if(username.Text=="admin" && password.Text=="admin")
        {
            Response.Redirect("Admin/Admin_Index.aspx");
            
        }
        else
        {
            L1.Text = "UserName Or Password is incorrect";
        }
    }
}