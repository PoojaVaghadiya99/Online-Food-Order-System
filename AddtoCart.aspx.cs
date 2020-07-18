using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;



public partial class _Default : System.Web.UI.Page
{
    static Boolean availabledesignid = false;
    protected void Page_Load(object sender, EventArgs e)
    {

       if (!IsPostBack)
        {

            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("fid");
            dt.Columns.Add("food_item");
            dt.Columns.Add("qty");
            dt.Columns.Add("price");
            dt.Columns.Add("total");

            if (Request.QueryString["fid"] != null)
            {

                if (Session["Buyitems"] == null)
                {
                    dr = dt.NewRow();
                    String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
                    SqlConnection cn = new SqlConnection(str);
                   
                    String myquery = "select * from food_item where fid=" + Request.QueryString["fid"];
                    SqlCommand cmd = new SqlCommand(myquery,cn);
                  
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    
                    String id = Request.QueryString["fid"];
                    String qty = Request.QueryString["qty"];

                    dr["sno"] = 1;
                    dr["fid"] = ds.Tables[0].Rows[0]["fid"].ToString();
                    dr["food_item"] = ds.Tables[0].Rows[0]["food_item"].ToString();
                    dr["qty"] = qty.ToString();
                    dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();
                    

                    int price = Convert.ToInt16(ds.Tables[0].Rows[0]["price"].ToString());
                    int quantity = Convert.ToInt16(Request.QueryString["qty"].ToString());
                    int totalprice = price * quantity;
                    dr["total"] = totalprice;

                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;

                    GridView1.FooterRow.Cells[1].Text = "Total Amount";
                    GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                    Response.Redirect("AddToCart.aspx");

                }
                else
                {
                    checkdesignid();
                    if (availabledesignid == true)
                    {
                        Response.Write("Designid " + Request.QueryString["fid"] + " " + availabledesignid);
                        updatequantity();
                        DataTable dt1;
                        dt1 = (DataTable)Session["buyitems"];
                        GridView1.DataSource = dt1;
                        GridView1.DataBind();
                        availabledesignid = false;
                    }
                    else
                    {

                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;

                        dr = dt.NewRow();
                        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
                        SqlConnection cn = new SqlConnection(str);

                        String myquery = "select * from food_item where fid=" + Request.QueryString["fid"];
                        SqlCommand cmd = new SqlCommand(myquery, cn);

                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        String qty = Request.QueryString["qty"];

                        dr["sno"] = sr + 1;
                        dr["fid"] = ds.Tables[0].Rows[0]["fid"].ToString();
                        dr["food_item"] = ds.Tables[0].Rows[0]["food_item"].ToString();
                        dr["qty"] = qty.ToString();
                        dr["price"] = ds.Tables[0].Rows[0]["price"].ToString();



                        int price = Convert.ToInt16(ds.Tables[0].Rows[0]["price"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["qty"].ToString());
                        int totalprice = price * quantity;
                        dr["total"] = totalprice;

                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;


                        GridView1.FooterRow.Cells[1].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    }

                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {

                    GridView1.FooterRow.Cells[1].Text = "Total Amount";
                    GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();

                }

            }

        }

    }

    public int grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int gtotal = 0;
        while (i < nrow)
        {
            gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["total"].ToString());

            i = i + 1;
        }
        return gtotal;
    }
   
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];


        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text ;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);

            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                //Label1.Text = "Item Has Been Deleted From Shopping Cart";
                break;

            }
        }

        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();
        }

        Session["buyitems"] = dt;
        Response.Redirect("AddtoCart.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PlaceOrder.aspx");
    }
    private void checkdesignid()
    {
        DataTable dt1;
        int designid;
        int querydesignid = Convert.ToInt16(Request.QueryString["fid"]);
        dt1 = (DataTable)Session["buyitems"];
        foreach (DataRow row in dt1.Rows)
        {
            designid = Convert.ToInt16(row["fid"].ToString());
            if (designid == querydesignid)
            {
                availabledesignid = true;
            }
        }
    }
    private void updatequantity()
    {
        DataTable dt1;
        int designid;
        int querydesignid = Convert.ToInt16(Request.QueryString["fid"]);
        dt1 = (DataTable)Session["buyitems"];
        foreach (DataRow row in dt1.Rows)
        {
            designid = Convert.ToInt16(row["fid"].ToString());
            if (designid == querydesignid)
            {
                int newquantity = Convert.ToInt16(row["qty"].ToString()) + Convert.ToInt16(Request.QueryString["qty"].ToString());
                row["qty"] = newquantity;
                Int64 price = Convert.ToInt64(row["price"].ToString());
                Int64 totalprice = price * newquantity;
                row["total"] = totalprice;
                break;
            }
        }
        Session["buyitems"] = dt1;
    }

}