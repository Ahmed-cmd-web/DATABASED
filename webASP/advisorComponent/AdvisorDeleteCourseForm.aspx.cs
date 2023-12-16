using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class AdvisorDeleteCourseForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }
        protected void BTN_Delete_course_OnClick(object sender, EventArgs e)
        {
            string Semester_code = semCode_textboxID.Text;

            Regex regexSC = new Regex(@"^[WS]\d{2}(R\d{1,2})?$");

            if (!regexSC.IsMatch(Semester_code))
            {
                Response.Write("Input Error : " + "Semester code is in invalid format!");
                return;

            }

            int course_id;
            int student_id;

            try
            {
                course_id = Int16.Parse(CourseID_TextBoxID.Text);
                student_id = Int16.Parse(studentID_textboxID.Text);
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                return;

            }

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorDeleteFromGP = new SqlCommand("Procedures_AdvisorDeleteFromGP", conn);
            Procedures_AdvisorDeleteFromGP.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorDeleteFromGP.Parameters.Add(new SqlParameter("@studentID", student_id));
            Procedures_AdvisorDeleteFromGP.Parameters.Add(new SqlParameter("@sem_code", Semester_code));
            Procedures_AdvisorDeleteFromGP.Parameters.Add(new SqlParameter("@courseID", course_id));


            try
            {
                Procedures_AdvisorDeleteFromGP.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Response.Write("Error : " + ex.Message);
                conn.Close();
                return;
            }
            conn.Close();

            Response.Write("    ------>DONE !");


        }
    }
}