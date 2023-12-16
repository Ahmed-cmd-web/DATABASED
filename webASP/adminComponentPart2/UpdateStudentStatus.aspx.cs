using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class UpdateStudentStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPart2Main.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int studentID = Int16.Parse(StudentID.Text);

                SqlCommand updateStudentStatus = new SqlCommand("Procedure_AdminUpdateStudentStatus", conn);
                updateStudentStatus.CommandType = CommandType.StoredProcedure;

                updateStudentStatus.Parameters.Add(new SqlParameter("@student_id", studentID));

                conn.Open();
                updateStudentStatus.ExecuteNonQuery();
                conn.Close();
                string l = "Status Has Been Updated Successfully";
                Label2.Text = l;
            }
            catch (Exception ex)
            {
                Response.Write("ERROR: " + ex.ToString());
                return;
            }
        }
    }
}