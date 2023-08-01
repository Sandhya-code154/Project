using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        DB d1 = new DB();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {

            }
            else
            {
               /* Response.Redirect("Login.aspx");*/
            }

            if (!IsPostBack)
            {
                bind_Gridview();
            }
        }

        private void bind_Gridview()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from CategoryDetails");
            dgv.DataSource = ds;
            dgv.DataBind();
        }

        private bool isSubmit()
        {
            string desp = txtdesp.Text.Replace("'", "");

            int submit = d1.ExecuteQuery("insert into CategoryDetails (Name,Descp) values('" + txtcatname.Text + "','" + desp + "')");
            if (submit > 0)
            {
                return true;
            }

            else
            {
                return false;
            }
        }

        private bool isUpdate()
        {
            int update = d1.ExecuteQuery("update CategoryDetails set Name='" + txtcatname.Text + "', Descp='" + txtdesp.Text + "' where Categoryid='" + txtcatid.Text + "'");
            if (update > 0)
            {
                return true;
            }

            else
            {
                return false;
            }
        }

        private bool isDelete()
        {
            int delete = d1.ExecuteQuery("delete CategoryDetails where Categoryid='" + txtcatid.Text + "'");
            if (delete > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (isSubmit())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Category Added Successfully...')</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(" + ex.Message + ")</script>");
            }
            bind_Gridview();
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            txtcatid.Text = "";
            txtcatname.Text = "";
            txtdesp.Text = "";
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                if (isUpdate())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Category Updated Successfully...')</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(" + ex.Message + ")</script>");
            }
            bind_Gridview();
        }

        protected void dgv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dgv.PageIndex = e.NewPageIndex;
                bind_Gridview();

                dgv.PageIndex = e.NewPageIndex;
                //BindResumeDetails();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(" + ex.Message + ")</script>");
            }
        }

        protected void dgv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblcatid");
                Label Category = (Label)dgv.Rows[e.RowIndex].FindControl("lblcatname");
                Label Desp = (Label)dgv.Rows[e.RowIndex].FindControl("lblcatdesp");

                txtcatid.Text = ID.Text;
                txtcatname.Text = Category.Text;
                txtdesp.Text = Desp.Text;
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(" + ex.Message + ")</script>");
            }
            bind_Gridview();
        }

        protected void dgv_RowDeleting(object sender, EventArgs e)
        {
            try
            {
                LinkButton btndetails = sender as LinkButton;
                GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
                string Category_ID = dgv.DataKeys[gvrow.RowIndex].Value.ToString();

                txtcatid.Text = Category_ID;

                if (isDelete())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Category Deleted Successfully...')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(" + ex.Message + ")</script>");
            }
            bind_Gridview();
        }

    }
}