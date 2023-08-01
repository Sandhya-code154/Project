using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegBtn_Click(object sender, EventArgs e)
        {
            DB d1 = new DB();
            string Username = Name.Text;
            string LastName=txtlname.Text;
            string EmailId = Email.Text;
            string Pwd = Password.Text;
            string address = txtAddress.Text;

            int res = d1.ExecuteQuery("Insert into dbo.User_details(First_Name,Last_Name,Email_Id,Password,Mobile_no,Address,Date) values('" + Username + "','"+LastName+"','" + EmailId + "','" + Pwd + "','"+number.Text+"','"+txtAddress.Text+"',getdate())");
            if (res > 0)
            {
                Response.Write("<script>alert('Login now')</script>");
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("Fail");
            }

        }

    }
}