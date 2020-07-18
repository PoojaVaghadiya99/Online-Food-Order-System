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
    

    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["id"] != null)
        {
            TextBox1.Text = Session["id"].ToString();
        }
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
                    SqlCommand cmd = new SqlCommand(myquery, cn);

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    String qty = Request.QueryString["qty"];

                    dr["sno"] = 1;
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

                    Label1.Text = "Total Amount = " + grandtotal().ToString();

                    GridView1.FooterRow.Cells[1].Text = "Total Amount";
                    GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                    Response.Redirect("AddToCart.aspx");

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


                        Label1.Text = "Total Amount = " + grandtotal().ToString();

                        GridView1.FooterRow.Cells[1].Text = "Total Amount";
                        GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();
                        Response.Redirect("AddToCart.aspx");
                    
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();

                if (GridView1.Rows.Count > 0)
                {

                    Label1.Text = "Total Amount = " + grandtotal().ToString();

                    GridView1.FooterRow.Cells[1].Text = "Total Amount";
                    GridView1.FooterRow.Cells[4].Text = grandtotal().ToString();

                }



            }
            Label2.Text = DateTime.Now.ToShortDateString();
            findorderid();



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
    public void findorderid()
    {
        String pass = "abcdefghijklmnopqrstuvwxyz123456789";
        Random r = new Random();
        char[] mypass = new char[5];
        for (int i = 0; i < 5; i++)
        {
            mypass[i] = pass[(int)(35 * r.NextDouble())];

        }
        String orderid;
        orderid = "ORD-" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(mypass);

        Label1.Text = orderid;


    }

   /* public void saveaddress()
    {
        String updatepass = "insert into orderaddress(orderid,address,mobilenumber) values('" + Label1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "')";
        String mycon1 = "Data Source=HP-PC\\SQLEXPRESS;Initial Catalog=ShoppingData;Integrated Security=True";
        SqlConnection s = new SqlConnection(mycon1);
        s.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = updatepass;
        cmd1.Connection = s;
        cmd1.ExecuteNonQuery();
        s.Close();
    }*/

    protected void Button1_Click(object sender, EventArgs e)
    {

        DataTable dt;
        dt = (DataTable)Session["buyitems"];

        int amt = grandtotal();

        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection cn = new SqlConnection(str);
            cn.Open();
           // String f = ((String)(dt.Rows[i]["food_item"]));
           // Response.Write("<br>" + f);


            String updatepass = "insert into food_orders(order_id,date,customer_name,mo_no,address,food_item,qty,price,total_price,total_amount,payment_type) values('" + Label1.Text + "','" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dt.Rows[i]["food_item"] + "'," + dt.Rows[i]["qty"] + "," + dt.Rows[i]["price"] + "," + dt.Rows[i]["total"] + "," + amt + ",'" + RadioButtonList1.SelectedItem.Text + "')";
            SqlCommand cmd1 = new SqlCommand(updatepass,cn);
           
            cmd1.ExecuteNonQuery();
            cn.Close();

        }
       // saveaddress();
    Response.Redirect("ConformOrder.aspx");


    }
   }