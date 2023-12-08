using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace webASP
{
    public partial class AdvisorRegisterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BTN_Create_New_Advisor_Account_onClick(object sender, EventArgs e)
        {
            String input_name;
            String input_password;
            String input_email;
            String input_office;
            try
            {
                input_name = advisor_name.Text;
                input_password = advisor_password.Text;
                input_email = advisor_email.Text;
                input_office = advisor_office.Text;
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : "+ex.Message);
                return;
            }

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorRegistration = new SqlCommand("Procedures_AdvisorRegistration", conn);
            Procedures_AdvisorRegistration.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorRegistration.Parameters.Add(new SqlParameter("@advisor_name", input_name));
            Procedures_AdvisorRegistration.Parameters.Add(new SqlParameter("@password", input_password));
            Procedures_AdvisorRegistration.Parameters.Add(new SqlParameter("@email", input_email));
            Procedures_AdvisorRegistration.Parameters.Add(new SqlParameter("@office", input_office));
            SqlParameter Advisor_id = new SqlParameter("@Advisor_id", SqlDbType.Int);
            Advisor_id.Direction = ParameterDirection.Output;
            Procedures_AdvisorRegistration.Parameters.Add(Advisor_id);

            Procedures_AdvisorRegistration.ExecuteNonQuery();

            conn.Close();

            try {
                Response.Write("Your New Advisor ID : "+Advisor_id.Value);

            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
        protected void BTN_I_Have_One_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorSignupForm.aspx");
        }
    }
}