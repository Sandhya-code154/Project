using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class Home : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataTb d2 = new DataTb();
        DataTable dab = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                bind_datalist();

            }
        }




        private void bind_datalist()
        {
            DataSet ds = new DataSet();
            ds = d1.GetDataSet("Select * from  dbo.CategoryDetails");

            if (ds.Tables[0].Rows.Count > 0)
            {

                CategoryList.DataSource = ds.Tables[0];
                CategoryList.DataBind();

            }

        }

    }
}