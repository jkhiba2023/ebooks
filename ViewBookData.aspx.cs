using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_book
{
    public partial class ViewBookData : System.Web.UI.Page
    {
        String cs = ConfigurationManager.ConnectionStrings["ebook"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookImg();
                BindBookDetails();
            }
            else
            {
                Response.Redirect("~/ViewBooks.aspx");
            }
        }

        private void BindBookImg()
        {
            Int64 BID = Convert.ToInt64(Request.QueryString["BID"]);
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblBooksImages WHERE BID='" + BID + "'", con))
                {

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage.DataSource = dt;
                        rptrImage.DataBind();
                    }
                }
            }
        }

        private void BindBookDetails()
        {
            Int64 BID = Convert.ToInt64(Request.QueryString["BID"]);
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblBooks where BID='" + BID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrBookDetails.DataSource = dt;
                        rptrBookDetails.DataBind();
                    }
                }
            }
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            String BLanguage = string.Empty;

            if (BLanguage != "")
            {
                Int64 BID = Convert.ToInt64(Request.QueryString["BID"]);
                if (Request.Cookies["CartBID"] != "")
                {
                    string CookieBID = Request.Cookies["CartBID"].Value.Split('=')[1];
                    CookieBID = CookieBID + "," + BID + "-" + BLanguage;

                    HttpCookie CartBooks = new HttpCookie("CartBID");
                    CartBooks.Values["CartBID"] = BID.ToString();
                    CartBooks.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartBooks);
                }
                else
                {
                    HttpCookie CartBooks = new HttpCookie("CartBID");

                    CartBooks.Values["CartBID"] = BID.ToString() + "-" + BLanguage;
                    CartBooks.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartBooks);

                }
            }
        }
    }
}