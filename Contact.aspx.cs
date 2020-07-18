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
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "insert into feedback(name,email,contact,message) values ('" + name.Text + "','" + email.Text + "','" + phone.Text + "','" + message.Text + "')";

        SqlCommand cmd = new SqlCommand(q, cn);

        cmd.ExecuteNonQuery();

        cn.Close();

    }
}