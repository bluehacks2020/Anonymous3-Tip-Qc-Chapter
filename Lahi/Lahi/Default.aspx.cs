using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Lahi
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == "" || Session["email"] == "" || Session["email"] == null || Session["user"] == null)
            {
                acc_email.Text = "Guest";
                logout.Visible = false;
                manage.Visible = false;
            }
            else
            {
                acc_email.Text = Session["email"].ToString();
                logout.Visible = true;
                manage.Visible = true;
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }

        protected void manage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
            string query = "select * from posts order by date_published desc";
            SqlConnection con = new SqlConnection(constring);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string author = dr["author"].ToString();
                    string title = dr["title"].ToString();
                    string post = dr["post"].ToString();
                    string priority = dr["priority"].ToString();
                    string datePublished = dr["date_published"].ToString();

                    authorlbl.Text = author;
                    titlelbl.Text = title;
                    postlbl.Text = post;
                    datelbl.Text = datePublished;
                }
            }
        }
    }
}
