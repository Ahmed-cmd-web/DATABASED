using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class DeleteSlots : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeleteSlot(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                string current_semester = Current_Semester.Text;

                SqlCommand deleteSlotproc = new SqlCommand("Procedures_AdminDeleteSlots", conn);
                deleteSlotproc.CommandType = CommandType.StoredProcedure;

                deleteSlotproc.Parameters.Add(new SqlParameter("@current_semester", current_semester));

                conn.Open();
                deleteSlotproc.ExecuteNonQuery();
                conn.Close();
                string l = "Slot Has Been Added Successfully";
                Label3.Text = l;
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
    }
}