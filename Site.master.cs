using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            L1.Text = "   " + Session["id"].ToString();
            HyperLink1.Visible = false;
            LinkButton1.Visible = true;
            Image1.Visible = true;

        }
        else
        {
            L1.Text = " ";
            HyperLink1.Visible = true;
            LinkButton1.Visible = false;
            Image1.Visible = false;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("index.aspx");
    }
}
