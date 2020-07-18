using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
        {
        }
        else
        {
            Label1.Visible = true;
            Label2.Visible = true;
            HyperLink1.Visible = true;
        }
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {

            Label2.Text = dt.Rows.Count.ToString();
        }
        else
        {
            Label2.Text = "0";
        }
    }


    
}