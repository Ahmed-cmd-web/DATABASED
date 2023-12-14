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
    public partial class AdvisorUpdateExpectedGPDateForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }
        protected void BTN_Update_expected_graduation_date_OnClick(object sender, EventArgs e)
        {
            string expected_graduation_date = date_textboxID.Text;

            Regex regexEGD = new Regex(@"^\d{4}-\d{2}-\d{2}$");

            if (!regexEGD.IsMatch(expected_graduation_date))
            {
                Response.Write("Input Error : " + "Expected Graduation Date is in invalid format!");
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

            SqlCommand Procedures_AdvisorUpdateGP = new SqlCommand("Procedures_AdvisorUpdateGP", conn);
            Procedures_AdvisorUpdateGP.CommandType = CommandType.StoredProcedure;


            Procedures_AdvisorUpdateGP.Parameters.Add(new SqlParameter("@expected_grad_date", expected_graduation_date));
            Procedures_AdvisorUpdateGP.Parameters.Add(new SqlParameter("@studentID", student_id));

            try
            {
                Procedures_AdvisorUpdateGP.ExecuteNonQuery();

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