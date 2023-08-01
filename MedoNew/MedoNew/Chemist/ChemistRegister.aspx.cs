using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MedoNew.Chemist
{
    public partial class ChemistRegister : System.Web.UI.Page
    {
        DB d1 = new DB();
        protected void Page_Load(object sender, EventArgs e)
        {
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
            DropDownList3.Items.Insert(0, new ListItem("--Select a location--", ""));
        }

        protected void RegBtn_Click(object sender, EventArgs e)
        {
            DB d1 = new DB();
            string Fname = txtfname.Text;
            string lname = txtlname.Text;
            string EmailId = Email.Text;
            string Pwd = Password.Text;
            string Address = txtadddress.Text;
            string PhoneNo = numb.Text;

            int res = d1.ExecuteQuery("Insert into dbo.Chemist_details(Chemist_FName,Chemist_LName,Email_Id,Password,Address,Mobile_No,LocationId,RegDate) values('" + Fname + "','" + lname + "','" + EmailId + "','" + Pwd + "','" + Address + "','" + PhoneNo + "','" + DropDownList3.SelectedValue + "',getdate())");

            if (res > 0)
            {
                Response.Write("<script>alert('Login now')</script>");


                Response.Redirect("ChemistLogin.aspx");
            }
            else
            {
                Response.Write("Fail");
            }
        }
    }
}
