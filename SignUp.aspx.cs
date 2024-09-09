using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class SignUp : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            
            if (isFormValid())
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into Users (Username,Name,Email,Password,Usertype) values('" + txtUname.Text + "','" + txtName.Text + "','" + txtEmail.Text + "','" + txtPass.Text + "','User')", con);
                    cmd.ExecuteNonQuery();
                    clr();
                    con.Close();
                    lblMsg.Text = "Registration Successfully Done";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                Response.Redirect("~/Signin.aspx");
            }
            else 
            {
                lblMsg.Text = "Registration Failed";
                lblMsg.ForeColor= System.Drawing.Color.Red;
            }
            
        }

        private bool isFormValid()
        {
            if (txtUname.Text == "")
            {
                Response.Write("<script> alert('Username is not valid); </script>");
                txtUname.Focus();
                return false;
            }
            else if (txtName.Text == "")
            {
                Response.Write("<script> alert('Please Enter Name');</script>");
                txtName.Focus();
                return false;
            }

            else if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Please Enter Valid Mail ID');</script>");
                txtEmail.Focus();
                return false;
            }
            else if (txtPass.Text != txtCPass.Text)
            {
                Response.Write("<script> alert('Entered Password Is InValide');</script>");
                txtPass.Focus();
                return false;
            }
            return true;

        }

        private void clr()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtUname.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtCPass.Text = string.Empty;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clr();
        }
    }
}