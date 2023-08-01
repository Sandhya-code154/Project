using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;



namespace MedoNew
{
    public partial class UplodaPrec : System.Web.UI.Page
    {
        DB d1 = new DB();
        string file_name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (FileUpload1.HasFile)
            {
                try
                {
                    sb.AppendFormat(" Uploading file: {0}", FileUpload1.FileName);

                    //saving the file
                    FileUpload1.SaveAs(Server.MapPath("Admin/Files/") + FileUpload1.FileName);
                    file_name = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    /* file_name = Path.GetFileName(FileUpload1.PostedFile.FileName);
                     FileUpload1.PostedFile.SaveAs(Server.MapPath("product/") + file_name);*/
                    //Showing the file information
                    sb.AppendFormat("<br/> Save As: {0}", FileUpload1.PostedFile.FileName);
                    sb.AppendFormat("<br/> File type: {0}", FileUpload1.PostedFile.ContentType);
                    sb.AppendFormat("<br/> File length: {0}", FileUpload1.PostedFile.ContentLength);
                    sb.AppendFormat("<br/> File name: {0}", FileUpload1.PostedFile.FileName);
                    string query = "Insert into UserPrescription(UserId,PrescriptionImage,MedicineName) values('" + Session["UserId"] +"','"+file_name+"','"+TextBox1.Text+"')";
                    int res = d1.ExecuteQuery(query);
                    if (res > 0)
                    {
                        Response.Write("<script>alert('Your Prescription Is Uploaded Successfully')</script>");
                        file_name = TextBox1.Text = "";
                    }
                    else
                    {
                        Response.Write("<script>alert('Some Error Is Occured')</script>");
                    }

                }
                catch (Exception ex)
                {
                    sb.Append("<br/> Error <br/>");
                    sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
                }
            }
            else
            {
                lblmessage.Text = sb.ToString();
            }
        }
    }
 
}