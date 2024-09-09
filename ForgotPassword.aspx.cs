using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace E_book
{
    public partial class Forgot_Password : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsent_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    String myGUID=Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);

                    SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myGUID + "','"+Uid+"',GETDATE())",con);
                    cmd1.ExecuteNonQuery();

                    //Send Reset Link Via Email

                    String ToEmailAddress = dt.Rows[0][3].ToString();
                    String Username = dt.Rows[0][1].ToString();
                    String EmailBody = "Dear "+Username+ ",<br/> E Book Walla Customer,<br/><br/>  Click the link below to reset your password.<br/> https://localhost:44310/Reset_Password.aspx?id="+myGUID;

                    MailMessage PassRecMail = new MailMessage("jabir.k@mobilestyx.co.in",ToEmailAddress);  // password recover mail.
                                                                                                           // Your mail ID //             //Receiver//

                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml= true;
                    PassRecMail.Subject = "Reset Password Link";

                    using (SmtpClient client = new SmtpClient())
                    {
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential("jabir.k@mobilestyx.co.in", "sixf wctt mnvc vujl");
                        client.Host = "smtp.gmail.com";
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;

                        client.Send(PassRecMail);
                    }

                    //---------

                    lblErrorMsg.Text = "Reset Password Send to Your Registered Mail ID <br/> Please Check !!!!";
                    lblErrorMsg.ForeColor=System.Drawing.Color.Green;
                    txtEmailID.Text = string.Empty;
                }
                else
                {
                    lblErrorMsg.Text = "Oops!!!! This Mail ID Is Not Registed With Us.<br/> Please Check Your Mail ID Any Try Again.";
                    lblErrorMsg.ForeColor= System.Drawing.Color.Red;
                    txtEmailID.Text= string.Empty;
                    txtEmailID.Focus();
                }




            }

        }
    }
}