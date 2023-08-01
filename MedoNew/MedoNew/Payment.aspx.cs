using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography;
using System.Net.Mail;

namespace MedoNew
{
    public partial class Payment : Page
    {
        DB d1 = new DB();
        public static string key = "rzp_test_d2v3pJiZkS4CO3"; //Razor Pay Test Key

        public static string secret = "QgeW4c9OqU3jKJ4BPz8SgyCm"; // Razor Pay Secret
        protected void Page_Load(object sender, EventArgs e)
        {
            amount.Text = Session["FinalOrderpay"].ToString();
            mobile.Text = Session["MobileNo"].ToString();
            email.Text = Session["Email"].ToString();
        }


        [WebMethod(EnableSession = true)]

        public static Payment1 SelectDetailOnline(string email, string phone, string amount)

        {

            Payment1 py = new Payment1();

            string orderid = string.Empty;

            try

            {
                DataSet ds = new DataSet();

                DB d1 = new DB();

                string Orderid = HttpContext.Current.Session["OrderId"].ToString();
                string Amount = HttpContext.Current.Session["FinalOrderPay"].ToString();
                ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                String orderId = DateTime.Now.ToString("yyyyMMddHHmmssfff");

                RazorpayClient client = new RazorpayClient(key, secret);

                Dictionary<string, object> options = new Dictionary<string, object>();

                /*options.Add("amount", amount);*/
                options.Add("amount", Convert.ToInt32(Amount)*100);

                options.Add("receipt", orderId);

                options.Add("currency", "INR");

                options.Add("payment_capture", "0");

                Razorpay.Api.Order order = client.Order.Create(options);



                py.orderid = order.Attributes["id"];

                py.name = "Test";

                py.email = email;

                py.phone = phone;

                py.amount = (Convert.ToInt32(amount) * 100).ToString();

                py.status = "1";







            }

            catch (Exception ex)

            {

                py.status = "2";

                py.name = ex.Message;



            }

            finally

            {



            }

            return py;

        }


        [WebMethod(EnableSession = true)]
        public static string VerifyEmail(string email)
        {
            string msg = "no";
            DB d1 = new DB();
            DataSet ds = new DataSet();
            string query = "Select Email_Id from User_details where Email_ID='" + email + "'";
            ds = d1.GetDataSet(query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                msg = "yes";
                try
                {   
                    MailMessage mail = new MailMessage();
                    SmtpClient smtpserver = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress("s3021089@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Email From Medo Online";
                    mail.Body = "Your Payment Is Done Successfully,Thank You,We Will Try To Deliver Your Order As Early As Possible";
                    smtpserver.Port = 587;
                    smtpserver.EnableSsl = true;
                    smtpserver.UseDefaultCredentials = false;
                    smtpserver.Credentials = new System.Net.NetworkCredential("s3021089@gmail.com", "uxsmqareghsobihl");
                    smtpserver.Send(mail);
                }
                catch
                {

                }
            }

            else
            {
                msg = "no";
            }
            return msg;

        }
    


    public static string HmacSha256Digest(string message, string secret)

        {

            ASCIIEncoding encoding = new ASCIIEncoding();

            byte[] keyBytes = encoding.GetBytes(secret);

            byte[] messageBytes = encoding.GetBytes(message);

            System.Security.Cryptography.HMACSHA256 cryptographer = new System.Security.Cryptography.HMACSHA256(keyBytes);

            byte[] bytes = cryptographer.ComputeHash(messageBytes);

            return BitConverter.ToString(bytes).Replace("-", "").ToLower();

        }

        [WebMethod(EnableSession = true)]

        public static PaymentCaptured1 goToPayment2(string orderid, string paymentid, string signature)

        {

            PaymentCaptured1 pc = new PaymentCaptured1();

            string status = "", capture = "", createdat = "", contact = "", email = "", amount = "", stat = "";
            try
            {
                string Amount = HttpContext.Current.Session["FinalOrderPay"].ToString();
                decimal amtount = (Convert.ToDecimal( Amount) * 100);

                string newsignatue = HmacSha256Digest(orderid + "|" + paymentid, secret);
                if (signature == newsignatue)

                {

                    RazorpayClient client = new RazorpayClient(key, secret);

                    Razorpay.Api.Payment payment = client.Payment.Fetch(paymentid);

                    Dictionary<string, object> options = new Dictionary<string, object>();

                    options.Add("amount", amtount);

                    Razorpay.Api.Payment paymentCaptured = payment.Capture(options);

                    Razorpay.Api.Payment payment1 = client.Payment.Fetch(paymentid);



                    status = payment1.Attributes["status"];

                    capture = payment1.Attributes["captured"];

                    createdat = payment1.Attributes["created_at"];

                    contact = payment1.Attributes["contact"];

                    email = payment1.Attributes["email"];

                    amount = payment1.Attributes["amount"];

                }

                if (status == "captured")

                {

                    pc.status = "1";

                    pc.orderid = orderid;// Payment Done              









                }
                else if (status == "Authorized")

                {

                    RazorpayClient client = new RazorpayClient(key, secret);

                    Razorpay.Api.Payment payment = client.Payment.Fetch(paymentid);

                    Dictionary<string, object> options = new Dictionary<string, object>();

                    options.Add("amount", amtount);

                    Razorpay.Api.Payment paymentCaptured = payment.Capture(options);

                    Razorpay.Api.Payment payment1 = client.Payment.Fetch(paymentid);

                    status = payment1.Attributes["status"];

                    capture = payment1.Attributes["captured"];

                    createdat = payment1.Attributes["created_at"];

                    contact = payment1.Attributes["contact"];

                    email = payment1.Attributes["email"];

                    amount = payment1.Attributes["amount"];

                    if (status == "captured")

                    {

                        pc.status = "1";

                        pc.orderid = orderid;// Payment Done              





                    }



                }

                else

                {

                    pc.status = "0";

                }

            }

            catch (Exception ex)

            {

                pc.status = "2";

                pc.msg = ex.Message;

            }

            return pc;

        }

    }
}

public class Payment1

{

    public string orderid { get; set; }

    public string name { get; set; }

    public string address { get; set; }

    public string amount { get; set; }

    public string email { get; set; }

    public string phone { get; set; }

    public string status { get; set; }

}

public class PaymentCaptured1

{

    public string orderid { get; set; }

    public string Paymentid { get; set; }

    public string amount { get; set; }

    public string status { get; set; }

    public string msg { get; set; }

}
  
