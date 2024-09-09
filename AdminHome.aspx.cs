using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                lblAdmin.Text = "Welcome to Dashboard of Admin " + Session["Username"].ToString();
            }
            else
            {
                Response.Redirect("~/Signin.aspx");
            }
        }
    }
}