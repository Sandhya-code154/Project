using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataSet ds = new DataSet();
        string user_id, user_name;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool IsAdminLogin()
        {

            {
                bool result = true;
                ds = d1.GetDataSet("select * from tbl_adminmaster where i_autoid='" + Id.Text + "' and username='" + Email.Text + "' and password='" + Pwd.Text + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    user_name = ds.Tables[0].Rows[0]["username"].ToString();
                    user_id = ds.Tables[0].Rows[0]["i_autoid"].ToString();
                    return result;

                }
                else
                {
                    result = false;
                    return result;

                }

            }

        }



        protected void LogBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string emailId = Email.Text;
                string pass = Pwd.Text;

                if (IsAdminLogin())
                {
                    Session["username"] = user_id;
                    Response.Redirect("dashboard.aspx", false);
                }

                else
                {
                    Response.Write("<script>alert('Invalid username and password')</script>");
                }
            }

            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}
