using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class Userss : System.Web.UI.MasterPage
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                logoutbtn.Visible = true;
                loginbtn.Visible = false;
            }
            else
            {
                logoutbtn.Visible = false;
                loginbtn.Visible = true;
                Response.Redirect("~/Default.aspx");
            }

        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Signin.aspx");
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["Username"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}