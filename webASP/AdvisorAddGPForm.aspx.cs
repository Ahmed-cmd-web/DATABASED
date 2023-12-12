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
    public partial class AdvisorAddGPForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }
        protected void InsertGraduationPlan_OnClick(object sender, EventArgs e)
        {

            string Semester_code = semCode_textboxID.Text;
            string expected_graduation_date = date_textboxID.Text;

            Regex regexSC = new Regex(@"^[WS]\d{2}(R\d{1,2})?$");
            Regex regexEGD = new Regex(@"^\d{4}-\d{2}-\d{2}$");

            if (!regexSC.IsMatch(Semester_code))
            {
                Response.Write("Input Error : " + "Semester code is in invalid format!");
                return;

            }

            if (!regexEGD.IsMatch(expected_graduation_date))
            {
                Response.Write("Input Error : " + "Expected Graduation Date is in invalid format!");
                return;

            }

            int sem_credit_hours;
            int advisor_id;
            int student_id;

            try
            {
                sem_credit_hours = Int16.Parse(CH_textboxID.Text);
                advisor_id = Int16.Parse(advisorID_textboxID.Text);
                student_id = Int16.Parse(studentID_textboxID.Text);
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                return;

            }

            if (advisor_id != Convert.ToInt32(Session["user"]))
            {
                Response.Write("Error : You are currently logged in with advisor id : "+ Convert.ToInt32(Session["user"]));
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorCreateGP = new SqlCommand("Procedures_AdvisorCreateGP", conn);
            Procedures_AdvisorCreateGP.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorCreateGP.Parameters.Add(new SqlParameter("@Semester_code", Semester_code));
            Procedures_AdvisorCreateGP.Parameters.Add(new SqlParameter("@expected_graduation_date", expected_graduation_date));
            Procedures_AdvisorCreateGP.Parameters.Add(new SqlParameter("@sem_credit_hours", sem_credit_hours));
            Procedures_AdvisorCreateGP.Parameters.Add(new SqlParameter("@advisor_id", advisor_id));
            Procedures_AdvisorCreateGP.Parameters.Add(new SqlParameter("@student_id", student_id));

            try
            {
                Procedures_AdvisorCreateGP.ExecuteNonQuery();

            }
            catch(Exception ex) {
                Response.Write("Error : " + ex.Message);
                conn.Close();
                return;
            }
            conn.Close();
            
            Response.Write("    ------>DONE !");
        }
    }
}