using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class ForgotPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Otpdiv.Visible = false;
            }
        }

        protected void ResBtn_Click(object sender, EventArgs e)
        {
            try
            {
                DB d1 = new DB();
                DataSet ds = new DataSet();
                string Email = txtEmail.Text;
                
                ds = d1.GetDataSet("Select Email_ID from dbo.User_details where Email_ID='" + Email + "'");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["EmailId"] = Email;
                    try
                    {
                        MailMessage mail = new MailMessage();
                        SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
                        mail.From = new MailAddress("s3021089@gmail.com");
                        mail.To.Add(Email);
                        mail.Subject = "Test Email";
                        Random num = new Random();
                        int otp = num.Next(100000, 1000000);
                        mail.Body = "Your Otp is" + " " + otp;
                        Session["otp"] = otp.ToString();
                        smtpserver.Port = 587;
                        smtpserver.EnableSsl = true;
                        smtpserver.UseDefaultCredentials = false;
                        smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
                        smtpserver.Send(mail);
                        card.Visible = false;
                        Otpdiv.Visible = true;
                        Msg.InnerText = "Enter the otp that send on your registerd email id";

                    }
                    catch (Exception ex)
                    {
                        Response.Write(" Error  " + ex.ToString());
                    }


                }
                else
                {

                    errMsg.Text = "A user with this email does not exist";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void otpBtn_Click(object sender, EventArgs e)
        {
            try
            {
                /* if (txtotp.Equals(Session["otp"].ToString()))
                 {

                     Response.Redirect("UpdatePwd.aspx");
                 }
                 else
                 {
                     Response.Write("Wrong otp number");
                 }*/
                if (Session["otp"].ToString() == txtotp.Text.ToString())
                {

                    Response.Redirect("UpdatePwd.aspx");
                }
                else
                {
                    if (IsPostBack)
                    {

                        Otpdiv.Visible = true;
                        Label2.Text = "Invalid Otp";
                    }
                }
            }
            catch
            {
                Response.Write("<script>alert('Some Error is occured')</script>");
            }
        }
    }
}