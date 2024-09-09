using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class ViewBooks : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblSuccess.Text = "&nbsp;&nbsp;&nbsp;" + Session["Username"].ToString();
                BindViewBooks();
            }
            else
            {
                Response.Redirect("~/Signin.aspx");
            }
        }

        private void BindViewBooks()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("BindViewAllBooks", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrViewBooks.DataSource = dt;
                        rptrViewBooks.DataBind();
                    }
                }
            }
        }
    }
}