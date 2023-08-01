using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class Product : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataTb d2 = new DataTb();
        DataTable dab = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                bind_datalist();

            }
        }




        private void bind_datalist()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("Select * from  dbo.ProductDetails");

            if (ds.Tables[0].Rows.Count > 0)
            {

                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();

            }

        }
        public void add_tocart(int product_id, String product_Img, String product_name, int prodQn, string product_price,int chemistid)
        {


            int flg = 0;
            if (Session["CurrentTable2"] == null)
            {
                dab = d2.CreateDataTable();
            }
            else
            {
                flg = 1;
                dab = (DataTable)Session["CurrentTable2"];
            }

            int quantity = 1;
            double a = Convert.ToDouble(product_price);
            double b = Convert.ToDouble(quantity);
            double c;
            c = a * b;
            String total_price = c.ToString();


            DataRow[] result = dab.Select("ProdID = '" + product_id + "'");

            if (result.Length > 0)
            {

                foreach (DataRow row in result)
                {


                    Console.WriteLine("{0}, {1}", row[0], row[1]);

                    int qty = Convert.ToInt32(row[3].ToString());

                    row[3] = qty + 1;

                    Double total = Convert.ToDouble(row[4].ToString());


                    Session["Total"] = row[4];



                }
            }
            else
            {
                d2.AddRecord(product_id, product_Img, product_name, prodQn, product_price, chemistid, dab);

            }
            Session["CurrentTable2"] = dab;
            Session["Qn"] = b;


        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


            if (e.CommandName == "add_cart") // check command is cmd_delete
            {

                
                int ID = Convert.ToInt32(e.CommandArgument); // value from CommandArgument





                string query = "Select * from dbo.ProductDetails where ProductId ='" + ID + "'";
                DataSet checkdb = d1.GetDataSet(query);

                if (checkdb.Tables[0].Rows.Count > 0)
                {
                    int id = (int)checkdb.Tables[0].Rows[0]["ProductId"];
                    String name = checkdb.Tables[0].Rows[0]["Prod_Name"].ToString();
                    string price = checkdb.Tables[0].Rows[0]["Price"].ToString();
                    String Img = checkdb.Tables[0].Rows[0]["Image"].ToString();
                    int qn = (int)checkdb.Tables[0].Rows[0]["user_id"];
                    int chemistid = Convert.ToInt32(checkdb.Tables[0].Rows[0]["ChemistId"].ToString());
                    /* Session["FId"] = checkdb.Tables[0].Rows[0]["ChemistId"];*/
                    //*int delvCharge = (int)checkdb.Tables[0].Rows[0]["DeliveryCharges"];*//*
                    add_tocart(id, Img, name, qn, price,chemistid);
                    Response.Write("<script language=javascript>alert('Added to cart');</script>");

                }


            }

        }
    }
}