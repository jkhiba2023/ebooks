using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class AddEdition : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindEditionRepeater();
        }

        private void BindEditionRepeater()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblEdition", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrEdition.DataSource = dt;
                        rptrEdition.DataBind();
                    }
                }
            }
        }

        protected void btnAddEdition_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblEdition (Edition) Values('" + txtEdition.Text + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Edition Added Successfully'); </script>");
                txtEdition.Text = string.Empty;
                con.Close();
                txtEdition.Focus();
            }
        }
    }
}