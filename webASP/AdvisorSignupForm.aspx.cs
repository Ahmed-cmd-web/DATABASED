using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace webASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTN_login_onClick(object sender, EventArgs e)
        {
            int advisor_id;

            try
            {
                advisor_id = Int16.Parse(advisor_ID.Text);
            }catch(Exception ex)
            {
                Response.Write("Input Error : "+ex.Message);
                return;

            }
            String pass = advisor_password.Text;



            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand FN_AdvisorLogin = new SqlCommand("FN_AdvisorLogin", conn);
            FN_AdvisorLogin.CommandType = CommandType.StoredProcedure;

            FN_AdvisorLogin.Parameters.Add(new SqlParameter("@advisor_Id", advisor_id));
            FN_AdvisorLogin.Parameters.Add(new SqlParameter("@password", pass));

            SqlParameter success = new SqlParameter();
            success.ParameterName = "@success";
            success.Direction = ParameterDirection.ReturnValue;

            FN_AdvisorLogin.Parameters.Add(success);

            FN_AdvisorLogin.ExecuteScalar();

            bool returnVal = Convert.ToBoolean(success.Value);

            conn.Close();

            if (returnVal) 
            {
                Response.Write("Hello Advisor");
            }
            else {
                Response.Write("Error : Advisor is not found!");
            }
        }
    }
}