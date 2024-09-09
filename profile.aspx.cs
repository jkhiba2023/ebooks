using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class profile : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    string username = Session["user"].ToString();
                    LoadUserProfile(username);
                }
                else
                {
                    Response.Redirect("Signin.aspx");
                }
            }
        }

        private void LoadUserProfile(string username)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Register WHERE Username = @username";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@username", username);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        // Log column names for debugging
                        for (int i = 0; i < dr.FieldCount; i++)
                        {
                            System.Diagnostics.Debug.WriteLine($"Column {i}: {dr.GetName(i)}");
                        }

                        fullnametxt.Text = $"{dr["FirstName"]} {dr["LastName"]}";

                        if (ColumnExists(dr, "DateOfBirth") && dr["DateOfBirth"] != DBNull.Value)
                        {
                            dobtxt.Text = Convert.ToDateTime(dr["DateOfBirth"]).ToString("yyyy-MM-dd");
                        }

                        contactxt.Text = dr["ContactNo"].ToString();
                        if (ColumnExists(dr, "Email"))
                        {
                            txtEmailID.Text = dr["Email"].ToString();
                        }
                        if (ColumnExists(dr, "UserID"))
                        {
                            Usertxt.Text = dr["UserID"].ToString();
                        }
                        if (ColumnExists(dr, "Password"))
                        {
                            txtpassword.Text = dr["Password"].ToString();
                        }
                        if (ColumnExists(dr, "State"))
                        {
                            DDstate.SelectedValue = dr["State"].ToString();
                        }
                        if (ColumnExists(dr, "City"))
                        {
                            citytxt.Text = dr["City"].ToString();
                        }
                        if (ColumnExists(dr, "Pincode"))
                        {
                            pincodetxt.Text = dr["Pincode"].ToString();
                        }
                        if (ColumnExists(dr, "FullAddress"))
                        {
                            Addresstxt.Text = dr["FullAddress"].ToString();
                        }
                        if (ColumnExists(dr, "AccountStatus"))
                        {
                            Label1.Text = dr["AccountStatus"].ToString();
                        }
                    }
                }
                else
                {
                    lblMessage.Text = "No user data found.";
                }
                con.Close();
            }
        }

        private bool ColumnExists(SqlDataReader reader, string columnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i).Equals(columnName, StringComparison.OrdinalIgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }

        

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"UPDATE Register SET 
                                 DateOfBirth = @dob, 
                                 ContactNo = @contact, 
                                 Email = @Email, 
                                 State = @state, 
                                 City = @city, 
                                 Pincode = @pincode, 
                                 FullAddress = @address,
                                 Password = @newpassword 
                                 WHERE UserID = @userid";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@dob", Convert.ToDateTime(dobtxt.Text).ToString("dd-MM-yyyy"));
                cmd.Parameters.AddWithValue("@contact", contactxt.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                cmd.Parameters.AddWithValue("@state", DDstate.SelectedValue);
                cmd.Parameters.AddWithValue("@city", citytxt.Text);
                cmd.Parameters.AddWithValue("@pincode", pincodetxt.Text);
                cmd.Parameters.AddWithValue("@address", Addresstxt.Text);
                cmd.Parameters.AddWithValue("@newpassword", txtnewpassword.Text);
                cmd.Parameters.AddWithValue("@userid", Usertxt.Text);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    string script = "alert('Profile updated successfully.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ProfileUpdated", script, true);

                }
                else
                {
                    lblMessage.Text = "Profile update failed. Please try again.";
                }
                con.Close();
            }
        }
    }
}