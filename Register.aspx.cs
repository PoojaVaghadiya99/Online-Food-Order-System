using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
      

    protected void  Register_Click(object sender, EventArgs e)
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "insert into register_user(username,email,password) values ('" + username.Text + "','" + email.Text + "','" + password.Text + "')";

        SqlCommand cmd = new SqlCommand(q, cn);


        cmd.ExecuteNonQuery();
        Response.Redirect("Login.aspx");
        cn.Close();
    }
}