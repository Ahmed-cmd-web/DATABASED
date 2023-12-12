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
    public partial class AdvisorAddCourseForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("AdvisorAddCourseForm");

        }

        protected void BTN_Insert_course_Click(object sender, EventArgs e)
        {
            string Semester_code = semCode_textboxID.Text;

            Regex regexSC = new Regex(@"^[WS]\d{2}(R\d{1,2})?$");

            if (!regexSC.IsMatch(Semester_code))
            {
                Response.Write("Input Error : " + "Semester code is in invalid format!");
                return;

            }
            int student_id;

            try
            {
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

            SqlCommand Procedures_AdvisorAddCourseGP = new SqlCommand("Procedures_AdvisorAddCourseGP", conn);
            Procedures_AdvisorAddCourseGP.CommandType = CommandType.StoredProcedure;


            Procedures_AdvisorAddCourseGP.Parameters.Add(new SqlParameter("@Semester_code", Semester_code));
            Procedures_AdvisorAddCourseGP.Parameters.Add(new SqlParameter("@course_name", coursNameID.Text));
            Procedures_AdvisorAddCourseGP.Parameters.Add(new SqlParameter("@student_id", student_id));


            try
            {
                Procedures_AdvisorAddCourseGP.ExecuteNonQuery();

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

        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }
    }
}