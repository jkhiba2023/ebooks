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
    public partial class AddLanguage : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuthor();
                BindMainCategory();
                BindEdition();
                BindLanguagerptr();
            }
        }

        private void BindLanguagerptr()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblLanguage A inner join tblAuthors B on B.AuthID =A.AuthID inner join tblCategory C on C.CatID=A.CatID inner join tblSubCategory D on D.SubCatID = A.SubCatID inner join tblEdition E on E.EdID =A.EdID", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrLanguages.DataSource = dt;
                        rptrLanguages.DataBind();
                    }
                }
            }
        }

        private void BindMainCategory()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-select-", "0"));

                }
            }
        }

        private void BindAuthor()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblAuthors", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlAuthorName.DataSource = dt;
                    ddlAuthorName.DataTextField = "AuthorName";
                    ddlAuthorName.DataValueField = "AuthID";
                    ddlAuthorName.DataBind();
                    ddlAuthorName.Items.Insert(0, new ListItem("-select-", "0"));

                }
            }
        }

        private void BindEdition()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblEdition", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlEdition.DataSource = dt;
                    ddlEdition.DataTextField = "Edition";
                    ddlEdition.DataValueField = "EdID";
                    ddlEdition.DataBind();
                    ddlEdition.Items.Insert(0, new ListItem("-select-", "0"));

                }
            }
        }


        protected void btnAddLanguage_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblLanguage (LanguageName,AuthID,EdID,CatID,SubCatID) Values('" + txtLanguage.Text + "','"+ ddlAuthorName.SelectedItem.Value+ "','"+ ddlEdition.SelectedItem.Value+ "','"+ ddlCategory.SelectedItem.Value + "','"+ ddlSubCategory .SelectedItem.Value+ "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Language Added Successfully'); </script>");
                    txtLanguage.Text = string.Empty;
                    con.Close();

                    ddlAuthorName.ClearSelection();
                    ddlAuthorName.Items.FindByValue("0").Selected = true;

                    ddlEdition.ClearSelection();
                    ddlEdition.Items.FindByValue("0").Selected = true;

                    ddlCategory.ClearSelection();
                    ddlCategory.Items.FindByValue("0").Selected = true;

                    ddlSubCategory.ClearSelection();
                    ddlSubCategory.Items.FindByValue("0").Selected = true;
            }
            BindLanguagerptr();
        }
        

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubCategory Where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-select-", "0"));

                }
            }
        }
    }
}