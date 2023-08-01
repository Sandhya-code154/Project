using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class CheckOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                MainDiv.Visible = false;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

            
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


            if (e.CommandName == "cancel") // check command is cmd_delete
            {

                int ID = Convert.ToInt32(e.CommandArgument); // value from CommandArgument


                DB db = new DB();

                string query = "update dbo.OrderDetails set OrderStatusUpdate='Canceled' where OrderId='" + ID + "'";
                int result = db.ExecuteQuery(query);

                if (result > 0)
                {
                    txtorder_number.Text = "";
                    Response.Write("<script language=javascript>alert('Your Order cancelled successfully.');</script>");


                }
                else
                {
                    Response.Write("<script language=javascript>alert('Could not cancel order contact support team');</script>");
                }

                //string query = "Select * from dbo.ProductDetails where Productid ='" + ID + "'";
                //DataSet checkdb = db.GetDataSet(query);

                //if (checkdb.Tables[0].Rows.Count > 0)
                //{
                //    int id = (int)checkdb.Tables[0].Rows[0]["Productid"];
                //    String name = checkdb.Tables[0].Rows[0]["Name"].ToString();
                //    string price = checkdb.Tables[0].Rows[0]["Price"].ToString();
                //    String Img = checkdb.Tables[0].Rows[0]["Image"].ToString();
                //    /* int qn = (int)checkdb.Tables[0].Rows[0]["BookQnantity"];*/
                //    int qn = (int)checkdb.Tables[0].Rows[0]["user_id"];

                //    Response.Write("<script language=javascript>alert('Added to cart');</script>");

                //}  

            }

        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            MainDiv.Visible = true;
            string query = "select * from OrderDetails where OrderId='" + txtorder_number.Text + "'";
            DB db = new DB();
            DataSet ds = new DataSet();
            ds.Clear();
            ds.Tables.Clear();
            ds = db.GetDataSet(query);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
                /* lblstatus.Text = ds.Tables[0].Rows[0]["OrderStatus"].ToString();*/
            }
            else
            {
                /* lblstatus.Text = "Order status is not available";*/
                msg.InnerText = "Please Check Your Order Id";
            }

        }
    }

}