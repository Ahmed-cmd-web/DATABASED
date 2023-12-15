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
    public partial class viewmissingcourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            SqlCommand Procedures_ViewMS = new SqlCommand("Procedures_ViewMS", conn);
            Procedures_ViewMS.CommandType = CommandType.StoredProcedure;

            Procedures_ViewMS.Parameters.Add(new SqlParameter("@StudentID", Session["user"]));
            

            SqlDataReader rdr = Procedures_ViewMS.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView4.DataSource = dataTable;
            GridView4.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentOptions1.aspx");
        }
    }
}