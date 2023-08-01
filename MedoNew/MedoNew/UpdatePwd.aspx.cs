using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class UpdatePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ResBtn_Click(object sender, EventArgs e)
        {
            if (Session["EmailId"] != null)
            {
                
                try
                {
                    DB d1 = new DB();
                    int res = d1.ExecuteQuery("Update dbo.User_details set Password='" + password.Text + "'where Email_ID='" + Session["EmailId"] + "'");
                    if (res > 0)
                    {
                        Response.Write("<script language=javascript>alert('Successfully Updated');</script>");
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        errlab.InnerText = "Try Again later";
                        Response.Write("Fail");
                    }
                }
                catch
                {

                }
            }
        }
    }
}