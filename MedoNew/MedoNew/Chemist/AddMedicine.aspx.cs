using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MedoNew.Chemist
{
    public partial class AddMedicine : System.Web.UI.Page
    {
        DB d1 = new DB();
        string file_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MId"] != null)
            {

            }
            else
            {
                Response.Redirect("ChemistLogin.aspx");
            }

            if (!IsPostBack)
            {
                bind_Gridview();
                bind_DropDownList();
                bind_FileUpload();
            }
        }

        private void bind_Gridview()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from ProductDetails Where ChemistId='" + Session["Mid"] +"'");
            dgv.DataSource = ds;
            dgv.DataBind();
        }

        private void bind_DropDownList()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from CategoryDetails");
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataValueField = "Categoryid";
            DropDownList1.DataTextField = "Name";
            DropDownList1.DataBind();
            DropDownList1.DataSource = ds;
            DropDownList1.Items.Insert(0, new ListItem("None", ""));
        }

        private void bind_FileUpload()
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    file_name = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("../Admin/product/") + file_name);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
            }
        }

        private bool isSubmit()
        {
            bind_FileUpload();
            string desp = txtdesp.Text.Replace("'", "");
            txtcreate.Text = Convert.ToString(Session["MId"]);

            //txtcreate.Text = "0";
            int submit = d1.ExecuteQuery("insert into ProductDetails (Categoryid,Name,Prod_name,Image,Descp,user_id,Price,ChemistId) values('" + DropDownList1.Text + "','" + txtname.Text + "','" + txtproname.Text + "','" + file_name + "','" + txtdesp.Text + "','" + txtcreate.Text + "','" + PriceN.Text + "','" + Session["MId"] +"')");
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
            int update = d1.ExecuteQuery("update ProductDetails set Categoryid='" + DropDownList1.Text + "', Name='" + txtname.Text + "', Prod_name='" + txtproname.Text +"', Descp='" + txtdesp.Text + "', user_id='" + txtcreate.Text + "',Price='" + PriceN.Text + "' where Productid='" + txtproid.Text + "'");
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
            int delete = d1.ExecuteQuery("delete ProductDetails where Productid='" + txtproid.Text + "'");
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
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Medicine Added Successfully...')</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Redirect("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
            }
            bind_Gridview();
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            txtproid.Text = "";
            DropDownList1.Text = "";
            txtname.Text = "";
            txtproname.Text = "";
            txtdesp.Text = "";
            txtcreate.Text = "";
            PriceN.Text = "";
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            try
            {
                if (isUpdate())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Product Updated Successfully...')</script>");
                }

                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Redirect("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
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
                Response.Redirect("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
            }
        }

        protected void dgv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                Label ID = (Label)dgv.Rows[e.RowIndex].FindControl("lblproid");
                Label Category = (Label)dgv.Rows[e.RowIndex].FindControl("lblcatid");
                Label Name = (Label)dgv.Rows[e.RowIndex].FindControl("lblname");
                Label Product = (Label)dgv.Rows[e.RowIndex].FindControl("lblproname");
                Label Description = (Label)dgv.Rows[e.RowIndex].FindControl("lbldesp");
                Label Create = (Label)dgv.Rows[e.RowIndex].FindControl("lblcreate");
                Label Price = (Label)dgv.Rows[e.RowIndex].FindControl("lblPrice");



                txtproid.Text = ID.Text;
                DropDownList1.Text = Category.Text;
                txtname.Text = Name.Text;
                txtproname.Text = Product.Text;
                txtdesp.Text = Description.Text;
                txtcreate.Text = Create.Text;
                PriceN.Text = Price.Text;



            }

            catch (Exception ex)
            {
                Response.Write(ex.Message);
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

                txtproid.Text = Category_ID;

                if (isDelete())
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Medicine Deleted Successfully...')</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Something is wrong. Please check...')</script>");
                }
            }

            catch (Exception ex)
            {
                Response.Redirect("<script>alert('" + Server.HtmlEncode(ex.Message) + "')</script>");
            }
            bind_Gridview();
        }
    }
}
