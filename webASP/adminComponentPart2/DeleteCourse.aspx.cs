using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class DeleteCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void delete(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int courseID = Int16.Parse(CourseID.Text);

                SqlCommand deleteCourseproc = new SqlCommand("Procedures_AdminDeleteCourse", conn);
                deleteCourseproc.CommandType = CommandType.StoredProcedure;

                deleteCourseproc.Parameters.Add(new SqlParameter("@courseID", courseID));

                conn.Open();
                deleteCourseproc.ExecuteNonQuery();
                conn.Close();
                string l = "Course Has Been Deleted Successfully";
                Label2.Text = l;
            }
            catch(Exception ex)
            {
                Response.Write("ERROR: "+ex.ToString());
                return;
            }
        

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPart2Main.aspx");
        }
    }
}