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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regbtn_Click(object sender, EventArgs e)
        {
            try
            {
                string mail = email.Text;
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString);
                connection.Open();
                string query1 = "Select * from accounts where email=@a1";
                SqlCommand command = new SqlCommand(query1, connection);
                command.Parameters.AddWithValue("@a1", mail);
                command.ExecuteNonQuery();
                SqlDataReader dr = command.ExecuteReader();
                if (dr.HasRows)
                {
                    Response.Write("<script>alert('Data already in database')</script>");
                }
                else
                {
                    try
                    {
                        string constring = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
                        string query = "insert into accounts (fullname,address,contact,email,password,usertype,datecreated) values (@a1,@a2,@a3,@a4,@a5,@a6,@a7)";
                        SqlConnection con = new SqlConnection(constring);
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@a1", fullname.Text);
                        cmd.Parameters.AddWithValue("@a2", address.Text);
                        cmd.Parameters.AddWithValue("@a3", contact.Text);
                        cmd.Parameters.AddWithValue("@a4", email.Text);
                        cmd.Parameters.AddWithValue("@a5", password.Text);
                        cmd.Parameters.AddWithValue("@a6", "user");
                        cmd.Parameters.AddWithValue("@a7", DateTime.Now.ToString());
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Registered Successfully');window.location.href='login.aspx'</script>");

                    }
                    catch (Exception error)
                    {
                        Response.Write("<script>alert('An Error Has Occured:"+error.ToString()+"')</script>");
                    }
                }
            }
            catch (Exception error)
            {
                Response.Write("Error: " + error);
            }
        }
    }
}