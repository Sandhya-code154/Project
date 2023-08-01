using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogBtn_Click(object sender, EventArgs e)
        {
            DB d1 = new DB();
            DataSet ds = new DataSet();
            string EmailID = Email.Text;
            string Password = Pwd.Text;
            ds = d1.GetDataSet("Select * from dbo.User_details where Email_id='" + EmailID + "' and Password='" + Password + "'");
            if (ds.Tables[0].Rows.Count > 0)
            {

                Session["UserId"] = ds.Tables[0].Rows[0]["User_ID"].ToString();
                Session["MobileNo"] = ds.Tables[0].Rows[0]["Mobile_no"].ToString();
                Session["Email"] = ds.Tables[0].Rows[0]["Email_ID"].ToString();
                Response.Redirect("Home.aspx");

            }
            else
            {
                errmsg.InnerText = "Invalid Creantials";
            }
        }
    }
}