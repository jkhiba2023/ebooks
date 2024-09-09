using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class User : System.Web.UI.MasterPage
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void profile_Click1(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }

        protected void Signoutbtn_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Signin.aspx");
        }
    }
}