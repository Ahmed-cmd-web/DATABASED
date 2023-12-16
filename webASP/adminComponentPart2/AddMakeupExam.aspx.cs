using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class AddMakeupExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddExam(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                string type = ExamType.Text;
                DateTime date = DateTime.SelectedDate;
                int courseID = Int16.Parse(CourseID.Text);

                SqlCommand AddMakeUpExam = new SqlCommand("Procedures_AdminAddExam", conn);
                AddMakeUpExam.CommandType = CommandType.StoredProcedure;
                AddMakeUpExam.Parameters.Add(new SqlParameter("@Type", type));
                AddMakeUpExam.Parameters.Add(new SqlParameter("@courseID", courseID));
                AddMakeUpExam.Parameters.Add(new SqlParameter("@date", date));

                conn.Open();
                AddMakeUpExam.ExecuteNonQuery();
                conn.Close();
                string l = "Course Has Been Added Successfully";
                Label1.Text = l;
                
            }
            catch (Exception ex)
            {
                Response.Write("ERROR: " + ex.ToString());
                return;
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPart2Main.aspx");
        }
    }
}