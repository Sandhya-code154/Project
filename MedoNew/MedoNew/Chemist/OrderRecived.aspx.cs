using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Chemist
{
    public partial class OrderRecived : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataSet ds, ds1, ds2;

        static string id;

        string date = DateTime.Now.ToShortDateString();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
               
                string query4 = "select ROW_NUMBER() OVER(ORDER BY Order_Id ASC) AS Row,order_id,product_id,price,OrderDate,qty from Order_Details_items where ChemistId='" + Session["MId"] + "'";
                ds = d1.GetDataSet(query4);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Repeater2.DataSource = ds;
                    Repeater2.DataBind();
                }
            }
            else
            {
                Response.Redirect("ChemistLogin.aspx");

            }


        }


    }
}
