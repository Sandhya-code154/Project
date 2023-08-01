using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MedoNew
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        DB d1 = new DB();
        DataTb d2 = new DataTb();
        DataTable dab = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

           
            logout.Visible = false;
            if (Session["Qn"]!= null)
            {
                string qn = Session["Qn"].ToString();
                quna.Text = qn;
            }
            NotDiv.Visible=false;
            if (Session["UserId"] != null)
            {
                
                logout.Visible = true;
                LinkButton2.Visible = true;
                HideShow.Visible = false;

                

            }
            else
            {
                logout.Visible = true;
                HideShow.Visible = true;
            }



            if (!IsPostBack)
            {
                bind_datalist();
                bind_DropDownList();

            }
        }

        private void bind_DropDownList()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from CategoryDetails");
            droplist_category.DataSource = ds.Tables[0];
            droplist_category.DataValueField = "Categoryid";
            droplist_category.DataTextField = "Name";
            droplist_category.DataBind();
            droplist_category.DataSource = ds;
            droplist_category.Items.Insert(0, new ListItem("Shop By Category", ""));
        }



        private void bind_datalist()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("Select * from  dbo.CategoryDetails");

            if (ds.Tables[0].Rows.Count > 0)
            {

                MenueList.DataSource = ds.Tables[0];
                MenueList.DataBind();

            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            DB d1 = new DB();
            string Query = "Select * from  ProductDetails where Name like '%' + '" + searchInput.Text+ "' + '%'"; ;
            ds = d1.GetDataSet(Query);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
            else
            {
                NotDiv.Visible = true;
                NotDiv.Style.Add("display", "block");
            }
        }

        protected void droplist_category_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(droplist_category.SelectedIndex != 0)
            {
                Response.Redirect("Shop.aspx?category_id="+droplist_category.SelectedValue);
            }
        }

       

        protected void LinkButton2_Click1(object sender, EventArgs e)
        {
            Session.Remove("UserId");
            Session.RemoveAll();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}