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
    public partial class AdvisorViewStudentMajor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void filter_OnClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand Procedures_AdvisorViewAssignedStudents = new SqlCommand("Procedures_AdvisorViewAssignedStudents", conn);
            Procedures_AdvisorViewAssignedStudents.CommandType = CommandType.StoredProcedure;

            try {
                Procedures_AdvisorViewAssignedStudents.Parameters.Add(new SqlParameter("@AdvisorID", Convert.ToInt32(Session["user"])));
                Procedures_AdvisorViewAssignedStudents.Parameters.Add(new SqlParameter("@major", major_textboxID.Text));

                SqlDataReader rdr = Procedures_AdvisorViewAssignedStudents.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();
                dataTable.Load(rdr);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
            catch (Exception ex) {
                Response.Write("Error : "+ex.Message);
                return;
            }
            Response.Write("     ----->Done !");
        }

        protected void backToMain_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorMainForm.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}