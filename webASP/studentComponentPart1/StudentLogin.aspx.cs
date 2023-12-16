using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Linq.Expressions;
using System.Web.Management;

namespace webASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginexec(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            int student_id = 0;
            try { student_id = Int16.Parse(Studentidid.Text); }
            catch (Exception ex) { Response.Write("ID should be a number! "); return; }
            string password = passwordid.Text;
            if (string.IsNullOrWhiteSpace(password))
            {
                Response.Write("password is either null, empty, or contains only white spaces.");
                return;
            }
            SqlCommand FN_StudentLogin = new SqlCommand("select dbo.FN_StudentLogin(@Student_id,@password)", conn);
            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@Student_id";
            param1.SqlDbType = SqlDbType.Int;
            param1.Value = student_id;
            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@password";
            param2.SqlDbType = SqlDbType.VarChar;
            param2.Value = password;
            FN_StudentLogin.Parameters.Add(param1);
            FN_StudentLogin.Parameters.Add(param2);
            conn.Open();
            
            bool returnval = Convert.ToBoolean(FN_StudentLogin.ExecuteScalar());
            if (returnval)
            {
                Session["user"] = student_id;
                Response.Redirect("StudentOptions1.aspx");
            }
            else { Response.Write("ID or password is incorrect"); }
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentRegisterationForm.aspx");
        }
    }
    }
