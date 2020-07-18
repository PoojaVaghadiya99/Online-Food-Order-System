using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    static Int32 bookingid;
    static String startdt;
    static String enddt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String date = TextBox4.Text;
            //Response.Write(date);
           // Calendar1.SelectedDate = DateTime.Now.Date;
        }
        if (Session["id"] == null)
        {
            Response.Redirect("NotLoginPage.aspx");
        }

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
       // startdt = Calendar1.SelectedDate.Year + "-" + Calendar1.SelectedDate.Month + "-" + Calendar1.SelectedDate.Day + " " + start.Text;
        //enddt = Calendar1.SelectedDate.Year + "-" + Calendar1.SelectedDate.Month + "-" + Calendar1.SelectedDate.Day + " " + end.Text;
        //Response.Write(startdt);
        startdt = TextBox4.Text + "  " + start.Text;
        enddt = TextBox4.Text + "  " + end.Text;
        
        FindAvailableTable();
        RadioButtonList1.Visible = true;
    }

   

    private void FindAvailableTable()
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = " Select DISTINCT table_no from table_book where((time_start between '" + startdt + "' and '" + enddt + "') or (time_end between '" + startdt + "' and '" + enddt + "'))";

        SqlCommand cmd = new SqlCommand(q, cn);

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            //RadioButtonList1.Items.Clear();
            Label1.Visible = true;
            Label1.Text = "Available Tables Are Given Below";
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                RadioButtonList1.Items.Remove(RadioButtonList1.Items.FindByValue(dr["table_no"].ToString()));
            }
            if (RadioButtonList1.Items.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "No Table Available to Book";
            }
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Available Tables are Given below";
        }
        cn.Close();
    }

    public void GenerateBookingId()
    {
        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "Select id from table_book";

        SqlCommand cmd = new SqlCommand(q, cn);

        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        cn.Close();

        if (ds.Tables[0].Rows.Count < 1)
        {
            bookingid = 50001;

        }
        else
        {
            cn.Open();

            String q1 = "Select max(id) from table_book";

            SqlCommand cmd1 = new SqlCommand(q1, cn);

            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            bookingid = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
            bookingid = bookingid + 1;
            cn.Close();
        }
    }


  
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        GenerateBookingId();

        String str = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection cn = new SqlConnection(str);

        cn.Open();

        String q = "insert into table_book(id,name,table_no,date,time_start,time_end,phone,person) values (" + bookingid + ",'" + TextBox1.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + TextBox4.Text + "','" + startdt + "','" + enddt + "','" + TextBox3.Text + "','" + TextBox2.Text + "')";

        SqlCommand cmd = new SqlCommand(q, cn);

        cmd.ExecuteNonQuery();

        cn.Close();
        Label2.Visible = true;
        Label2.Text ="Yours Booking Id "+ bookingid +"  "+ RadioButtonList1.SelectedItem.Text + " Has Been Booked From " + startdt + " To " + enddt;
        String a = Label2.Text;
        //Response.Write("<script>alert(a);</script>");
    }
   
}