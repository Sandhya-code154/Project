using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class Test : System.Web.UI.Page
    {

        DB d1 = new DB();
        DataTb Dt1 = new DataTb();
        DataTable dt = new DataTable();

        public int qty = 0;
        int qnt_inc;
        double Max_Price = 0;

        int product_qty;
        double product_prices;
        static double total_prices;
        protected void Page_Load(object sender, EventArgs e)
        {
            emptycart.Visible = false;
            if (!IsPostBack)
            {

                BindDataList();


            }
        }

        protected void BindDataList()
        {

            DataTable dt = new DataTable();

            if (Session["CurrentTable2"] == null)
            {
                dt = Dt1.CreateDataTable();
            }
            else
            {
                dt = (DataTable)Session["CurrentTable2"];



            }


            if (dt.Rows.Count > 0)
            {

                DataList1.DataSource = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }
            else
            {
                DataList1.DataSource = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();

                total_prices = 0;

                emptycart.Visible = true;
                if (emptycart.Visible == true)
                {
                    BillDiv.Visible = false;
                    CopDiv.Visible = false;
                    UserSearcBx.Visible = false;
                }

            }

        }

        public void add_tocart(int product_id, String product_name, String product_img, int prodQn, decimal product_price,int cid)
        {



            if (Session["CurrentTable2"] == null)
            {
                dt = Dt1.CreateDataTable();
            }
            else
            {
                dt = (DataTable)Session["CurrentTable2"];
            }


            double a = Convert.ToDouble(product_price);
            Session["a"] = a;
            double b = Convert.ToDouble(prodQn);
            double c;
            c = a * b;
            double total_price = c;
            Session["St"] = c;
            DataSet ds = new DataSet();


            DataRow[] result = dt.Select("ProdID = '" + product_id + "'");

            if (result.Length > 0)
            {

                foreach (DataRow row in result)
                {

                    product_qty = Convert.ToInt32(row[3]) + 1;
                    row[3] = product_qty;

                    product_prices = Convert.ToDouble(row[4]);

                    total_prices += product_qty * c;


                    Session["FinalPrice"] = total_prices;
                    totalPrice.InnerText = total_prices.ToString();
                    LastPrice.Text = (total_prices + 100).ToString();


                }
                string t = LastPrice.Text;
                double n = Convert.ToDouble(t);
                Session["LastPrice"] = n;
                BindDataList();


            }


            else
            {

                Dt1.AddRecord(product_id, product_name, product_img, prodQn, product_price.ToString(),cid, dt);

            }
            Session["CurrentTable2"] = dt;

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "remove_cart")


            {
                DataTable dab = new DataTable();

                dab = (DataTable)Session["CurrentTable2"];

                int ID = Convert.ToInt32(e.CommandArgument);

                DataRow[] result = dab.Select("ProdId='" + ID + "'");

                if (result.Length > 0)
                {

                    foreach (DataRow row in result)
                    {

                        row.Delete();


                    }

                }

                Session["CurrentTable2"] = dab;
                BindDataList();

            }
            else
            {
                if (e.CommandName == "Add")
                {
                    int ID = Convert.ToInt32(e.CommandArgument);
                    if (Session["CurrentTable2"] == null)
                    {
                        dt = Dt1.CreateDataTable();
                    }

                    else
                    {
                        DataTable dab = new DataTable();
                        dab = (DataTable)Session["CurrentTable2"];
                        int Id1 = Convert.ToInt32(e.CommandArgument);

                        DataRow[] result = dab.Select("ProdId='" + Id1 + "'");

                        if (result.Length > 0)
                        {
                            foreach (DataRow row in result)
                            {


                                int qty = Convert.ToInt32(row[3]) + 1;
                                row[3] = qty;
                                Response.Write(qty);
                                double Price = Convert.ToDouble(row[4]);



                            }

                        }


                        else
                        {

                        }
                        BindDataList();




                    }
                }
                else
                {
                    if (e.CommandName == "Sub")
                    {
                        DataTable dab = new DataTable();

                        dab = (DataTable)Session["CurrentTable2"];

                        int ID = Convert.ToInt32(e.CommandArgument);

                        DataRow[] result = dab.Select("ProdId='" + ID + "'");

                        if (result.Length > 0)
                        {

                            int qty = 1;


                            foreach (DataRow row in result)
                            {

                                qty = Convert.ToInt32(row[3]) - 1;
                                if (qty == 0 || qty < 0)
                                {
                                    row[3] = 1;
                                }
                                else
                                {
                                    row[3] = qty;

                                }
                                Response.Write("heloo");



                            }

                            BindDataList();

                        }
                    }


                }


            }
        }


        protected void appBtn_Click(object sender, EventArgs e)
        {

            UserSearcBx.Style.Add("display", "block");
            CopDiv.Style.Add("display", "none");

        }

        protected void copBtn_Click(object sender, EventArgs e)
        {

            string Code = TextBox1.Text;

            if (Code == "" || Code == null)
            {
                msg.Text = "Please enter code";
            }
            else
            {
                msg.Text = "";
                DataSet ds = new DataSet();
                DB d1 = new DB();
                string Query = "select * from Coupon where CopCode='" + Code.Trim() + "'";
                ds = d1.GetDataSet(Query);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int DiscountNumber = (int)ds.Tables[0].Rows[0]["CouDiscount"];


                    if (Session["LastPrice"] != null)
                    {

                        double n = (double)Session["LastPrice"];
                        int L = Convert.ToInt32(n);
                        double DiscountPrice = (L / 100) * DiscountNumber;
                        CopDiscount.Text = DiscountPrice.ToString();
                        double PriceAfterDiscount = L - DiscountPrice;
                        LastPrice.Text = PriceAfterDiscount.ToString();

                        msg.Style.Add("color", "rgb(0, 179, 0)");
                        msg.Text = "Coupon applied";



                    }


                }
                else
                {
                    msg.Text = "Invalid coupon code";
                }
            }
        }


    }
}