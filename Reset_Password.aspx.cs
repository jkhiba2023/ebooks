using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class Reset_Password : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;

        string GUIDvalue;
        DataTable dt = new DataTable();
        int Uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                
                GUIDvalue = Request.QueryString["id"];

                if(GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from ForgotPass where Id=@Id",con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@Id", GUIDvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    
                    sda.Fill(dt);
                    if(dt.Rows.Count != 0)
                    {
                        Uid = Convert.ToInt32(dt.Rows[0][1]);
                    }
                    else
                    {
                        lblMsg.Text = "Your Reset Password Link Got Expired or Invalid ....<br/>Please Try Again";
                        lblMsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtConfirmPass.Visible = true;
                    txtNewPass.Visible = true;
                    btnResetPass.Visible = true;
                }
                else
                {
                    lblMsg.Text = "Your Reset Password Link Got Expired or Invalid ....<br/>Please Try Again";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            if(txtNewPass.Text != "" && txtConfirmPass.Text !="" && txtNewPass.Text==txtConfirmPass.Text)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Users set Password=@p where Uid=@Uid", con);
                    cmd.Parameters.AddWithValue("@p", txtNewPass.Text);
                    cmd.Parameters.AddWithValue("@Uid", Uid);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script> alert('Password Reset Successfully Done'); </script>");

                    SqlCommand cmd1 = new SqlCommand("delete from ForgotPass where Uid='" + Uid + "'", con);
                    cmd1.ExecuteNonQuery();
                    
                    Response.Redirect("Signin.aspx");
                }
            }
        }
    }
}