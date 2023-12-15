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
    public partial class viewavailablecourses : System.Web.UI.Page
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
            string semestercode = semestercodeID.Text;
            if (string.IsNullOrWhiteSpace(semestercode))
            {
                Response.Write("semestercode is either null, empty, or contains only white spaces.");
                return;
            }
            conn.Open();
            SqlCommand FN_SemsterAvailableCourses = new SqlCommand("SELECT * FROM FN_SemsterAvailableCourses(" + "'"+ semestercode+"'"+ ")", conn);

            SqlDataReader rdr = FN_SemsterAvailableCourses.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView2.DataSource = dataTable;
            GridView2.DataBind();
            conn.Close();
            semestercodeID.Text = "";
        }
    }
}