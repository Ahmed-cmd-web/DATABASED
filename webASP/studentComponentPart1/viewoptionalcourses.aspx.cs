using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class viewoptionalcourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            int studentid = (int)Session["user"];
            string semestercode = SemestercodeID.Text;
            if (string.IsNullOrWhiteSpace(semestercode))
            {
                Response.Write("semestercode is either null, empty, or contains only white spaces.");
                return;
            }
            conn.Open();
            SqlCommand Procedures_ViewOptionalCourse = new SqlCommand("Procedures_ViewOptionalCourse", conn);
            Procedures_ViewOptionalCourse.CommandType = CommandType.StoredProcedure;
            Procedures_ViewOptionalCourse.Parameters.Add(new SqlParameter("@StudentID", studentid));
            Procedures_ViewOptionalCourse.Parameters.Add(new SqlParameter("@current_semester_code", semestercode));
            DataTable datatable = new DataTable();
            SqlDataReader rdr = Procedures_ViewOptionalCourse.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView1.DataSource = dataTable;
            GridView1.DataBind();
            conn.Close();
            SemestercodeID.Text = "";

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentOptions1.aspx");
        }
    }
}