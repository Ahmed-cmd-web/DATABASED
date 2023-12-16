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
    public partial class viewrequiredcourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentOptions1.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string semestercode = semestercodeid.Text;

            if (string.IsNullOrWhiteSpace(semestercode))
            {
                Response.Write("semestercode is either null, empty, or contains only white spaces.");
                return;
            }
            conn.Open();

            SqlCommand Procedures_ViewRequiredCourses = new SqlCommand("Procedures_ViewRequiredCourses", conn);
            Procedures_ViewRequiredCourses.CommandType = CommandType.StoredProcedure;

            Procedures_ViewRequiredCourses.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            Procedures_ViewRequiredCourses.Parameters.Add(new SqlParameter("@current_semester_code", semestercode));

            SqlDataReader rdr = Procedures_ViewRequiredCourses.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView3.DataSource = dataTable;
            GridView3.DataBind();
            conn.Close();
            semestercodeid.Text = "";
        }
    }
}