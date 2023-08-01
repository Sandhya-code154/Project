using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Chemist
{
    public partial class ChemistLogin : System.Web.UI.Page
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
                ds = d1.GetDataSet("select * from Chemist_details where Chemistid='" + Id.Text + "' and Email_Id='" + Email.Text + "' and Password='" + Pwd.Text + "'");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["MId"] = ds.Tables[0].Rows[0]["ChemistId"].ToString();
                    Session["locatioid"] = ds.Tables[0].Rows[0]["LocationId"].ToString();
                    user_name = ds.Tables[0].Rows[0]["Email_Id"].ToString();
                    user_id = ds.Tables[0].Rows[0]["Password"].ToString();

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
                    Response.Redirect("AddMedicine.aspx", false);
                }

                else
                {
                    Response.Write("<script>alert('Invalid Email and password')</script>");
                }
            }

            catch (Exception ex)
            {
                throw (ex);
            }
        }


    }
}
