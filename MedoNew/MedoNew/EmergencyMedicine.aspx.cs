using Razorpay.Api;
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
    public partial class EmergencyMedicine : System.Web.UI.Page
    {

        DB d1 = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                bind_DropDownList();

            }
        }

        private void bind_DropDownList()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from Location");
            DropDownList3.DataSource = ds.Tables[0];
            DropDownList3.DataValueField = "Locid";
            DropDownList3.DataTextField = "LocationName";
            DropDownList3.DataBind();
            DropDownList3.DataSource = ds;
            DropDownList3.Items.Insert(0, new ListItem("None", ""));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            int submit = d1.ExecuteQuery("insert into emergency_details (MedicineName,UserId,LocationName) values('" + txtmed.Text + "','" + Session["UserId"] + "','" + DropDownList3.SelectedValue + "')");
            if (submit > 0)
            {
                string Email = "";
                Response.Write("<script>alert('Your Request Is Submitted Successfully')</script>");
                Email = Session["Email"].ToString();
                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress("s3021089@gmail.com");
                    mail.To.Add(Email);
                    mail.Subject = "Email From Medo Online";
                    mail.Body = "Your Request For Emergency Medicine Is Submited Succesfully,We Will Contact You As Early As Possible";
                    smtpserver.Port = 587;
                    smtpserver.EnableSsl = true;
                    smtpserver.UseDefaultCredentials = false;
                    smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
                    smtpserver.Send(mail);
                    Clear();

                }
                catch (Exception ex)
                {
                    Response.Write(" Error  " + ex.ToString());
                }
            }
            else
            {
                Response.Write("error");
            }

        }

        public void Clear()
        {
            txtmed.Text = txtname.Text = DropDownList3.SelectedValue = "";
        }
    }
}