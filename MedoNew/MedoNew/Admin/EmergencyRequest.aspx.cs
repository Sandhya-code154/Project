using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Admin
{
    public partial class EmergencyRequest : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataSet ds, ds1, ds2;

        static string id;

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                DB d1 = new DB();
                DataSet ds = new DataSet();

                ds = d1.GetDataSet("Select * from emergency_details where UserId='" + txtid.Text + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    {

                        ds = d1.GetDataSet("Select * from User_details where User_Id='" + txtid.Text + "'");

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            string Email = ds.Tables[0].Rows[0]["Email_ID"].ToString(); ;
                            try
                            {
                                MailMessage mail = new MailMessage();
                                SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
                                mail.From = new MailAddress("s3021089@gmail.com");
                                mail.To.Add(Email);
                                mail.Subject = "Email Form Medo Online";
                                /* mail.Body = "Your Requested Emergency Medicine Is Available,We Will Try To Deliver Your Order As Early As Possible,At The Time Of Order Receiving,You Have To Pay '"+txtprice.Text+"'";*/
                                mail.Body =txtmsg.Text+",Total Amount You Have to Pay At The Time Of Delivery Is "+txtprice.Text;
                                smtpserver.Port = 587;
                                smtpserver.EnableSsl = true;
                                smtpserver.UseDefaultCredentials = false;
                                smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
                                smtpserver.Send(mail);
                                txtprice.Text = txtid.Text = txtid.Text = "";
                                Response.Write("Message Sended To The User Successfully");

                            }
                            catch (Exception ex)
                            {
                                Response.Write(" Error  " + ex.ToString());
                            }


                        }

                        else
                        {

                            /*  errMsg.Text = "A user with this email does not exist";*/
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Check User Id')</script>");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            string query4 = "Select * from [dbo].[emergency_details]";
            ds = d1.GetDataSet(query4);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater2.DataSource = ds;
                Repeater2.DataBind();
            }
            else
            {
                msg.Visible = true;
            }
        }



    }

}

