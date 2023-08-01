using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Admin
{
    public partial class QueryDetails : System.Web.UI.Page
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
                bindGridview();
            }
        }

        public void bindGridview()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("select * from  UserContactUsDetails");
            dgv.DataSource = ds;
            dgv.DataBind();
        }

    }
}