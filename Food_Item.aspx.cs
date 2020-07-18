using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("AddtoCart.aspx?fid=" + e.CommandArgument.ToString() + "&qty=" + dlist.SelectedItem.ToString());

    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["id"] == null)
        {
            Response.Redirect("NotLoginPage.aspx");
        }
        
    }
}