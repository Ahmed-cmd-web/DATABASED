using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace webASP
{
    public partial class AdvisorMainRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            conn.Open();

            SqlCommand FN_Advisors_Requests = new SqlCommand("SELECT * FROM FN_Advisors_Requests(" + Session["user"].ToString() + ")", conn);

            SqlDataReader rdr = FN_Advisors_Requests.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView1.DataSource = dataTable;
            GridView1.DataBind();

            conn.Close();
        }


        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void ViewPending_onClick(object sender, EventArgs e)
        {

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorViewPendingRequests = new SqlCommand("Procedures_AdvisorViewPendingRequests", conn);
            Procedures_AdvisorViewPendingRequests.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorViewPendingRequests.Parameters.Add(new SqlParameter("@Advisor_ID", Convert.ToInt32(Session["user"].ToString())));

            try {
                SqlDataReader rdr = Procedures_AdvisorViewPendingRequests.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();
                dataTable.Load(rdr);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error : " + ex.Message);
                return;
            }
            conn.Close();

        }

        protected void BTN_AcceptRejectCH_ID_Click(object sender, EventArgs e)
        {

            string Semester_code = curr_sem_code_TextBox_ID.Text;

            Regex regexSC = new Regex(@"^[WS]\d{2}(R\d{1,2})?$");

            if (!regexSC.IsMatch(Semester_code))
            {
                Response.Write("Input Error : " + "Semester code is in invalid format!");
                return;

            }

            int Request_ID_var;

            try
            {
                Request_ID_var = Int16.Parse(Request_ID_TextBox.Text);
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                return;

            }

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorApproveRejectCHRequest = new SqlCommand("Procedures_AdvisorApproveRejectCHRequest", conn);
            Procedures_AdvisorApproveRejectCHRequest.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorApproveRejectCHRequest.Parameters.Add(new SqlParameter("@requestID", Request_ID_var));
            Procedures_AdvisorApproveRejectCHRequest.Parameters.Add(new SqlParameter("@current_sem_code", Semester_code));

            try
            {
                Procedures_AdvisorApproveRejectCHRequest.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                conn.Close();
                return;

            }
            Response.Write("  ------>DONE Approve/Reject Credit Hours Request!");

        }
        protected void BTN_AcceptRejectC_ID_Click(object sender, EventArgs e)
        {

            string Semester_code = curr_sem_code_TextBox_ID.Text;

            Regex regexSC = new Regex(@"^[WS]\d{2}(R\d{1,2})?$");

            if (!regexSC.IsMatch(Semester_code))
            {
                Response.Write("Input Error : " + "Semester code is in invalid format!");
                return;

            }

            int Request_ID_var;

            try
            {
                Request_ID_var = Int16.Parse(Request_ID_TextBox.Text);
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                Response.Write("Input Error ");
                return;

            }

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorApproveRejectCourseRequest = new SqlCommand("Procedures_AdvisorApproveRejectCourseRequest", conn);
            Procedures_AdvisorApproveRejectCourseRequest.CommandType = CommandType.StoredProcedure;

            Procedures_AdvisorApproveRejectCourseRequest.Parameters.Add(new SqlParameter("@requestID", Request_ID_var));
            Procedures_AdvisorApproveRejectCourseRequest.Parameters.Add(new SqlParameter("@current_semester_code", Semester_code));


            try
            {
                Procedures_AdvisorApproveRejectCourseRequest.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("Input Error : " + ex.Message);
                conn.Close();
                return;

            }
            Response.Write("  ------>DONE Approve/Reject Course Request!");

        }
    }
}