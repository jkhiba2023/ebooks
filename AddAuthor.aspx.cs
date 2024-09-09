using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace E_book
{
    public partial class AddAuthor : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindAuthorRepeater();
        }

        private void BindAuthorRepeater()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblAuthors", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrAuthor.DataSource = dt;
                        rptrAuthor.DataBind();
                    }
                }
            }
        }

        protected void btnAddAuthor_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblAuthors(AuthorName) Values('"+ txtAuthor.Text+"')",con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Author  Name Added Successfully'); </script>");
                txtAuthor.Text = string.Empty;
                con.Close();
                txtAuthor.Focus();
            }
        }
    }
}