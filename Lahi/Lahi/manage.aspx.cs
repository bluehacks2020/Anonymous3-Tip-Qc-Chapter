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
    public partial class manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null || Session["email"].ToString() == "")
            {

                Response.Redirect("default.aspx");

            }
            else
            {
                Label1.Text = Session["email"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (fp1.HasFile)
            {
                byte[] pic = null;
                //To create a PostedFile
                HttpPostedFile File = fp1.PostedFile;
                //Create byte Array with file len
                pic = new Byte[File.ContentLength];
                //force the control to load data in array
                File.InputStream.Read(pic, 0, File.ContentLength);

                string title = TextBox1.Text;
                string post = TextBox2.Text;
                string author = Session["email"].ToString();
                string date = DateTime.Now.ToString();
                string constring = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
                string query = "insert into posts(author,title,post,priority,date_published,image) values(@a1,@a2,@a3,@a4,@a5,@a6)";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@a1", author);
                cmd.Parameters.AddWithValue("@a2", title);
                cmd.Parameters.AddWithValue("@a3", post);
                cmd.Parameters.AddWithValue("@a4", "3");
                cmd.Parameters.AddWithValue("@a5", date);
                cmd.Parameters.AddWithValue("@a6", pic);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("manage.aspx");
            }
        }

        protected void editbtn_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                byte[] pic = null;
                //To create a PostedFile
                HttpPostedFile File = FileUpload1.PostedFile;
                //Create byte Array with file len
                pic = new Byte[File.ContentLength];
                //force the control to load data in array
                File.InputStream.Read(pic, 0, File.ContentLength);

                string id = edit1.Text;
                string title = edit2.Text;
                string posts = edit3.Text;
                string constring1 = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
                string query1 = "update posts set title=@a1, post=@a2, image=@a4 where post_id=@a3";
                SqlConnection con1 = new SqlConnection(constring1);
                SqlCommand cmd1 = new SqlCommand(query1, con1);
                cmd1.Parameters.AddWithValue("@a1", title);
                cmd1.Parameters.AddWithValue("@a2", posts);
                cmd1.Parameters.AddWithValue("@a3", id);
                cmd1.Parameters.AddWithValue("@a4", pic);
                con1.Open();
                cmd1.ExecuteNonQuery();
                con1.Close();
                Response.Redirect("manage.aspx");
            }


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string id = TextBox6.Text;
            string constring = ConfigurationManager.ConnectionStrings["ConnectionStringdb"].ConnectionString;
            string query = "delete from posts where post_id = @a1";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@a1", id);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("manage.aspx");

        }
    }
}