using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Runtime.CompilerServices;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using iTextSharp;
using iTextSharp.text.pdf.parser;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace MedoNew
{
    public partial class Cart : System.Web.UI.Page
    {

        DB d1 = new DB();
        DataTb Dt1 = new DataTb();
        DataTable dt = new DataTable();

        public int qty = 0;
        /* int qnt_inc;
         double Max_Price = 0;
 */
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
                total_prices = 0.0;
                DataList1.DataSource = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();



                DataRow[] result = dt.Select();



                if (result.Length > 0)
                {

                    foreach (DataRow row in result)
                    {

                        product_qty = Convert.ToInt32(row[3]);
                        row[3] = product_qty;

                        product_prices = Convert.ToDouble(row[4]);

                        /*total_prices += product_qty * product_prices;*/
                        total_prices += product_qty * product_prices;


                        Session["FinalPrice"] = total_prices;
                        totalPrice.InnerText = total_prices.ToString();
                        /*Response.Write("total price" + Session["FinalPrice"].ToString());*/



                    }
                    LastPrice.Text = (total_prices + 100).ToString();
                    string t = LastPrice.Text;
                    Session["FinalOrderPay"] = t;
                    double n = Convert.ToDouble(t);
                    Session["LastPrice"] = n;
                }





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

        public void add_tocart(int product_id, String product_name, String product_img, int prodQn, string product_price,int chemistid)
        {



            if (Session["CurrentTable2"] == null)
            {
                dt = Dt1.CreateDataTable();
            }
            else
            {
                dt = (DataTable)Session["CurrentTable2"];
            }

            int qty = 1;
            int qnt_inc = 0;
            double a = Convert.ToDouble(product_price);
            Session["a"] = a;
            double b = Convert.ToDouble(prodQn);
            /*int DelCharge = delCharges;*/
            double c;
            c = a * b;
            double total_price = c;
            Session["St"] = c;
            DataSet ds = new DataSet();

            Session["ProdId"] = product_id;
            DataRow[] result = dt.Select("ProdID = '" + product_id + "'");



            if (result.Length > 0)
            {

                foreach (DataRow row in result)
                {

                    product_qty = Convert.ToInt32(row[3]) + 1;
                    row[3] = product_qty;

                    product_prices = Convert.ToDouble(row[4]);

                    total_prices += product_qty * product_prices;
                    Session["FinalPrice"] = total_prices;
                    totalPrice.InnerText = total_prices.ToString();




                }

                LastPrice.Text = (total_prices + 100).ToString();

                string t = LastPrice.Text;
                double n = Convert.ToDouble(t);
                Session["LastPrice"] = LastPrice.Text;
                BindDataList();


            }


            else
            {

                Dt1.AddRecord(product_id, product_name, product_img, prodQn, product_price,chemistid, dt);

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
                    string query = "Select * from  dbo.ProductDetails where ProductId ='" + ID + "'";
                    DataSet checkdb = d1.GetDataSet(query);

                    if (checkdb.Tables[0].Rows.Count > 0)
                    {
                        int id = (int)checkdb.Tables[0].Rows[0]["ProductId"];
                        String name = checkdb.Tables[0].Rows[0]["Prod_Name"].ToString();
                        String img = checkdb.Tables[0].Rows[0]["Image"].ToString();
                        string price = checkdb.Tables[0].Rows[0]["Price"].ToString();
                        int qn = (int)checkdb.Tables[0].Rows[0]["user_id"];
                        /* int DelChrges = (int)checkdb.Tables[0].Rows[0]["DeliveryCharges"];*/
                        int chemistid = Convert.ToInt32(checkdb.Tables[0].Rows[0]["ChemistId"].ToString());
                        add_tocart(id, name, img, qn, price,chemistid);
                        
                    }
                    else
                    {

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

                                Session["ProdId"] = row[0];

                                qty = Convert.ToInt32(row[3]) - 1;
                                if (qty == 0 || qty < 0)
                                {
                                    row[3] = 1;
                                }
                                else
                                {
                                    row[3] = qty;

                                }

                                Label lb = (Label)Page.Master.FindControl("quna");
                                /* Response.Write(lb.Text);*/

                            }
                            if (Session["FinalPrice"] != null)
                            {
                                foreach (DataRow row in result)
                                {

                                    double FinalPriceIs = (double)Session["FinalPrice"];
                                    double ProdPrice = (double)Session["a"];
                                    double FinalPriceN = FinalPriceIs - ProdPrice;
                                    totalPrice.InnerText = FinalPriceN.ToString();
                                    double FinalPrice = FinalPriceIs - ProdPrice + 100;
                                    LastPrice.Text = FinalPrice.ToString();

                                    Session["LastPrice"] = FinalPrice;


                                }
                            }

                            Session["CurrentTable2"] = dab;
                            BindDataList();
                           /* Response.Write(Session["ProdId"].ToString());*/
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
                    int DiscountNumber = (int)ds.Tables[0].Rows[0]["CopDiscount"];


                    if (Session["LastPrice"] != null)
                    {


                        double price = Convert.ToDouble(Session["FinalOrderPay"]);


                        double DiscountPrice= (Convert.ToDouble(DiscountNumber) / 100) * price;

                        double NewPriceAfterDiscount = price -DiscountPrice;
                        LastPrice.Text=NewPriceAfterDiscount.ToString();    
                        CopDiscount.Text = DiscountPrice.ToString();


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

        protected void OrderConfirm_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {


                int result = 0;
                Random rnd = new Random();
                int OrderID = rnd.Next(10000000, 99999999);
                Session["OrderId"] = OrderID;
                String current_date = System.DateTime.Now.ToLongDateString();
                String User_id = Session["UserId"].ToString();
                String Discount_amount =CopDiscount.Text;
                String Order_amount = Session["FinalPrice"].ToString();
                String Final_Amount = Session["FinalOrderPay"].ToString();
                String Order_Status = "pending";
                String Order_Status_Update = "pending";
                String Order_update_date = System.DateTime.Now.ToLongDateString();
                String Order_Status_update_date = System.DateTime.Now.ToLongDateString();
                /* string Cid = "";
                 if (Session["FId"]!=null)
                 {
                     Cid = Session["FId"].ToString();
                 }
                 else
                 {
                     Cid = "";
                 }*/
                /* string Cid = Session["FId"].ToString();*/



                /*  string Query = "Insert into OrderDetails(OrderId,OrderDate,OrdeUpdatedate,OrderAmount,OrderDiscount,OrderFinalAmount,OrderStatus,OrderStatusUpdate,OrderStatusUpdateDate,UserId) values('" + OrderID + "','" + current_date + "','" + Order_update_date + "','" + Order_amount + "','" + Discount_amount + "','" + Final_Amount + "','" + Order_Status + "','" + Order_Status_Update + "','" + Order_Status_update_date + "','" + User_id +"')";*/

                string Query = "Insert into OrderDetails(OrderId,OrderAmount,OrderDiscount,OrderFinalAmount,OrderStatus,OrderStatusUpdate,UserId,OrdeUpdatedate,OrderStatusUpdateDate,OrderDate) values('" + OrderID  + "','" + Order_amount + "','" + Discount_amount + "','" + Final_Amount + "','" + Order_Status + "','" + Order_Status_Update + "','"  + User_id + "',getdate(),getdate(),getdate())";
                result = d1.ExecuteQuery(Query);

                if (result >= 1)
                {
                    if (Session["UserId"] != null)
                    {

                        DataTable dab = (DataTable)Session["CurrentTable2"];

                        if (dab.Rows.Count > 0)
                        {
                            for (int i = 0; i < dab.Rows.Count; i++)
                            {
                                // insert into purchase order item

                                String product_ID = dab.Rows[i]["ProdId"].ToString();


                                String Product_Price = dab.Rows[i]["ProdPrice"].ToString();
                                String Product_Quantity = dab.Rows[i]["ProdQuan"].ToString();

                                  String ChemistId = dab.Rows[i]["ChemistId"].ToString();

                                string query = "Insert into Order_Details_items(order_id,product_id,qty,price,ChemistId,OrderDate) values('" + Session["OrderId"].ToString() + "','" + product_ID + "','" + Product_Quantity + "','" + Product_Price + "','"+ ChemistId + "',getdate())";

                                d1.ExecuteQuery(query);


                            }
                            Session.Remove("CurrentTable2");


                            ClientScriptManager CSM = Page.ClientScript;
                            Generate_invoice(Session["OrderId"].ToString());
                            string strconfirm = "<script>if(window.confirm('Your Order is Place Successfully Please Complete your payment')){window.location.href='payment.aspx'}</script>";
                            CSM.RegisterClientScriptBlock(this.GetType(), "Ok   ", strconfirm, false);

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Login Required')</script>");
                    }


                }

            }

            else
            {
                Response.Redirect("Login.aspx");
            }


        }



        public void Send_Invoice(string Email, string path)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("s3021089@gmail.com");
                mail.To.Add(Email);
                mail.Subject = "Medo Online Purchase Invoice Download";

                string fileName = System.IO.Path.GetFileName(path);
                FileStream fileStream = new FileStream(path, FileMode.Open, FileAccess.Read);
                mail.Attachments.Add(new Attachment(fileStream, fileName));


                Random num = new Random();
                int otp = num.Next(100000, 1000000);
                mail.Body = "Download Your Invoice";
                //Session["otp"] = otp.ToString();
                smtpserver.Port = 587;
                smtpserver.EnableSsl = true;
                smtpserver.UseDefaultCredentials = false;
                smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
                smtpserver.Send(mail);


            }
            catch (Exception ex)
            {
                Response.Write(" Error  " + ex.ToString());
            }

        }


        private void Generate_invoice(String order_id)
        {

            DataSet ds = new DataSet();
            DB d1 = new DB();
            string Query = "select pd.name,pd.Descp,odi.qty,odi.price,od.OrderAmount,od.OrderFinalAmount from dbo.OrderDetails as od LEFT JOIN dbo.Order_Details_items as odi on odi.order_id = od.OrderId LEFT JOIN dbo.ProductDetails as pd on pd.Productid = odi.product_id WHERE  od.OrderId=" + order_id + "";
            ds = d1.GetDataSet(Query);

            // File Name

            String file_name = Server.MapPath("Invoice/") + order_id + ".pdf";
            //C://data//invoice1.pdf

            // Create a new PDF document
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, new FileStream(file_name, FileMode.Create));
            document.Open();

            // Add invoice header
            Paragraph header = new Paragraph("Invoice", new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
            header.Alignment = Element.ALIGN_CENTER;
            document.Add(header);

            // Add invoice information
            Paragraph invoiceInfo = new Paragraph();
            invoiceInfo.SpacingBefore = 20;
            invoiceInfo.SpacingAfter = 20;

            invoiceInfo.Add(new Chunk("Invoice Number: "));
            invoiceInfo.Add(new Chunk(order_id));
            invoiceInfo.Add(new Chunk("\n"));
            invoiceInfo.Add(new Chunk("Date: "));
            invoiceInfo.Add(new Chunk(DateTime.Now.ToShortDateString()));

            document.Add(invoiceInfo);

            // Add invoice table
            PdfPTable table = new PdfPTable(4);
            table.SpacingBefore = 20;
            table.SpacingAfter = 20;
            table.WidthPercentage = 100;

            // Add table headers
            table.AddCell("Product");
            table.AddCell("Description");
            table.AddCell("Quantity");
            table.AddCell("Price");
            string subtotal = "";
            string finaltotal = "";
            foreach (DataRow drRow in ds.Tables[0].Rows)
            {
                subtotal = drRow["OrderAmount"].ToString();
                finaltotal = drRow["OrderFinalAmount"].ToString();
                // Add table rows
                table.AddCell(drRow["name"].ToString());
                table.AddCell(drRow["Descp"].ToString());
                table.AddCell(drRow["qty"].ToString());
                table.AddCell(drRow["price"].ToString());
            }

            /*table.AddCell("Product 2");
            table.AddCell("Description of Product 2");
            table.AddCell("1");
            table.AddCell("$5.00");*/

            table.AddCell("");
            table.AddCell("");
            table.AddCell("Subtotal:");
            table.AddCell(subtotal);

            table.AddCell("");
            table.AddCell("");
            table.AddCell("Tax:");
            table.AddCell((Int32.Parse(finaltotal) - Int32.Parse(subtotal)).ToString());


            table.AddCell("");
            table.AddCell("");
            table.AddCell("Total:");
            table.AddCell(finaltotal);

            document.Add(table);

            // Close the document
            document.Close();

            Send_Invoice(Session["Email"].ToString(), file_name);


        }


    }



    
}