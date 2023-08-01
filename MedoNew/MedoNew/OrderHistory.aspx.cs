using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew
{
    public partial class UserAccount : System.Web.UI.Page
    {
        DB d1 = new DB();
        DataSet ds, ds1, ds2;

        static string id;

        string date = DateTime.Now.ToShortDateString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            string query4 = "select ROW_NUMBER() OVER(ORDER BY OrderId ASC) AS Row, OrderId,Orderdate,OrderAmount,OrderDiscount,OrderFinalAmount,OrderStatusUpdate from OrderDetails where UserId=" + Session["UserId"];
            ds = d1.GetDataSet(query4);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Repeater2.DataSource = ds;
                Repeater2.DataBind();
            }
        }


    }

}
