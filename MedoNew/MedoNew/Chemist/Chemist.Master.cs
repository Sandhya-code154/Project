using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedoNew.Chemist
{
    public partial class Chemist : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Remove("username");
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("ChemistLogin.aspx");
        }
    }
}