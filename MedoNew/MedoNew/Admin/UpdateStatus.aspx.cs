using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Admin
{
    public partial class UpdateStatus : System.Web.UI.Page
    {
        DB d1 = new DB();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] != null)
            {
                bind_Gridview();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }


        }

        private void bind_Gridview()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from [dbo].[OrderDetails]");
            dgv.DataSource = ds;
            dgv.DataBind();
        }


        private bool isUpdate()
        {
            int update = d1.ExecuteQuery("update [dbo].[OrderDetails] set OrderStatusUpdate='" + status.Text + "',OrderStatusUpdateDate='"+System.DateTime.Now.ToShortDateString()+"' where OrderId='" + txtdesp.Text + "'");
            int Update2 = d1.ExecuteQuery("update [dbo].[OrderDetails] set OrderStatusUpdate='"+status.Text+ "',OrderStatusUpdateDate=getdate() where OrderId='"+txtdesp.Text+"'");
            if (Update2 > 0)
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
            int delete = d1.ExecuteQuery("delete from [dbo].[OrderDetails] where OrderId='" + txtdesp.Text + "'");
            if (delete > 0)
            {

                return true;
            }
            else
            {
                return false;
            }
        }


        protected void Reset_Click(object sender, EventArgs e)
        {
            txtcatid.Text = "";

            txtdesp.Text = "";
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                if (isUpdate())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Order Status Updated Successfully...')</script>");
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
                Label StatusNew = (Label)dgv.Rows[e.RowIndex].FindControl("lblstat");


                txtdesp.Text = ID.Text;
                status.Text = StatusNew.Text;
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

                txtdesp.Text = Category_ID;

                if (isDelete())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Order Canceled Successfully...')</script>");
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