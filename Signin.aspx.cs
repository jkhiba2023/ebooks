using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace E_book
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["UPWD"] != null)
                {
                    txtUsername.Text=Request.Cookies["UNAME"].Value;
                    txtPass.Text = Request.Cookies["UPWD"].Value;
                    chckbox.Checked = true;
                }
            }
        }

        protected void btnsignout_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

     

        protected void btnsignin_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where Username=@username and Password=@pwd", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPass.Text);
                SqlDataAdapter sda= new SqlDataAdapter(cmd);
                DataTable dt= new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    if (chckbox.Checked)
                    {
                        Response.Cookies["UNAME"].Value = txtUsername.Text;
                        Response.Cookies["UPWD"].Value=txtPass.Text;

                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["UPWD"].Expires= DateTime.Now.AddDays(10);
                    }
                    else
                    {
                        Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UPWD"].Expires = DateTime.Now.AddDays(-1);
                    }
                    string Utype;

                    Utype = dt.Rows[0][5].ToString().Trim();

                    if(Utype == "User")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/UsersHM.aspx");
                    }
                    if (Utype == "Admin")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Please Check Your Username OR Password";
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                clr();
                con.Close();
            }
        }

        private void clr()
        {
            txtUsername.Text = string.Empty;
            txtPass.Text = string.Empty;
        }
    }
}