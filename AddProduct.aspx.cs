using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace E_book
{
    public partial class AddProduct : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAuthor();
                ddlEdition.Enabled = false;
                ddlCategory.Enabled = false;
                ddlSubCategory.Enabled = false;
                ddlLanguage.Enabled = false;
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertBook", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BName", txtBookName.Text);
                cmd.Parameters.AddWithValue("@BPrice", txtPrice.Text);
                cmd.Parameters.AddWithValue("@BSellingPrice", txtsellPrice.Text);
                cmd.Parameters.AddWithValue("@BAuthor", ddlAuthorName.SelectedItem.Value );
                cmd.Parameters.AddWithValue("@BEdition", ddlEdition.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@BCategory", ddlCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@BSubCategory", ddlSubCategory.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@BLanguage", ddlLanguage.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@BDescription", txtDescription.Text);
                cmd.Parameters.AddWithValue("@BBookDetails", txtBookDetails.Text);
                if (chFD.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery",1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
                }
                
                if (ch7Return.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@7DayReturn", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@7DayReturn", 0.ToString());
                }

                if (chCOD.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@COD", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@COD", 0.ToString());
                }

                con.Open();
                Int64 BID = Convert.ToInt64(cmd.ExecuteScalar());
                
                //Insert Quantity
                for(int i=0; i < ddlLanguage .Items.Count; i++)
                {
                    if (ddlLanguage.Items [i].Selected == true)
                    {
                        Int64 LanguageID = Convert.ToInt64(ddlLanguage.Items [i].Value);
                        int BQuantity = Convert.ToInt32(txtQuantity.Text);

                        SqlCommand cmd1 = new SqlCommand("insert into tblBookQuantity Values('" + BID + "','" + LanguageID + "','" + BQuantity + "')", con);
                        cmd1.ExecuteNonQuery();

                    }
                    
                }
                //Insert & Upload Image
                if (img01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Book_Cover/Image/") + BID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);
                    }
                    string Extention = Path.GetExtension(img01.PostedFile.FileName);
                    img01.SaveAs(SavePath + "\\" + txtBookName.Text.ToString() + Extention);
                    SqlCommand cmd4 = new SqlCommand("insert into tblBooksImages values('" + BID + "','" + txtBookName.Text.ToString() + "','" + Extention + "')", con);
                    cmd4.ExecuteNonQuery();
                }
                
                
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "showAlert('Book Added Successfully');", true);
                Clean();
                con.Close();
            }
            
        }

        private void Clean()
        {


            txtBookName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtsellPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtBookDetails.Text = string.Empty;
            txtQuantity.Text = string.Empty;


            ddlAuthorName.ClearSelection();
            ddlAuthorName.Items.FindByValue("0").Selected = true;

            ddlEdition.ClearSelection();
            ddlEdition.Items.FindByValue("0").Selected = true;

            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;

            ddlSubCategory.ClearSelection();
            ddlSubCategory.Items.FindByValue("0").Selected = true;

            ddlLanguage.ClearSelection();
            ddlLanguage.Items.FindByValue("0").Selected = true;

            Response.Redirect(Request.Url.AbsoluteUri);
        }



        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedIndex != 0)
            {
                ddlSubCategory.Enabled = true;
            }
            else
            {
                ddlSubCategory.Enabled = false;
            }

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

        protected void ddlAuthorName_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                if (ddlAuthorName.SelectedIndex != 0)
                {
                    ddlEdition.Enabled = true;
                }
                else
                {
                    ddlEdition.Enabled = false;
                }


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

        protected void ddlEdition_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                if (ddlEdition.SelectedIndex != 0)
                {
                    ddlCategory.Enabled = true;
                }
                else
                {
                    ddlCategory.Enabled = false;
                }
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

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                if (ddlSubCategory.SelectedIndex != 0)
                {
                    ddlLanguage.Enabled = true;
                }
                else
                {
                    ddlLanguage.Enabled = false;
                }

                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblLanguage", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlLanguage.DataSource = dt;
                    ddlLanguage.DataTextField = "LanguageName";
                    ddlLanguage.DataValueField = "LanguageID";
                    ddlLanguage.DataBind();
                    ddlLanguage.Items.Insert(0, new ListItem("-select-", "0"));

                }
            }
        }

    }
}