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
    public partial class GPAdvisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                SqlCommand GpAdvisors = new SqlCommand("Select * From Advisors_Graduation_Plan", conn);
                conn.Open();

                SqlDataReader rdr = GpAdvisors.ExecuteReader(CommandBehavior.CloseConnection);
                DataTable dataTable = new DataTable();
                dataTable.Load(rdr);

                GridView1.DataSource = dataTable;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("ERROR: " + ex.ToString());
                return;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPart2Main.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}