using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Lahi
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logbtn_Click(object sender, EventArgs e)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
                string validation = "select * from accounts where email=@email and password=@pass";
                SqlConnection con = new SqlConnection(constring);
                con.Open();
                SqlCommand cmd = new SqlCommand(validation, con);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@pass", password.Text);
                cmd.ExecuteNonQuery();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        string position = dr.GetString(6);

                        if (position.Equals("Admin"))
                        {
                            Session["user"] = "Admin";
                            Session["email"] = email.Text;
                            Response.Redirect("Default.aspx");
                            Session.RemoveAll();
                        }
                        else
                        {
                            Session["user"] = "User";
                            Session["email"] = email.Text;
                            Response.Redirect("Default.aspx");
                            Session.RemoveAll();
                        }
                    }
                }
                
            }
            catch (Exception err)
            {
                Response.Write(err.ToString());
            }
        }
    }
}