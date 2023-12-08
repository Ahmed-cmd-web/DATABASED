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
    public partial class AdvisorMainForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand AdminListStudentsWithAdvisors = new SqlCommand("AdminListStudentsWithAdvisors", conn);
            AdminListStudentsWithAdvisors.CommandType = CommandType.StoredProcedure;

            SqlDataReader rdr = AdminListStudentsWithAdvisors.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                Int32 student_id = rdr.GetInt32(rdr.GetOrdinal("student_id"));
                String student_f_name = rdr.GetString(rdr.GetOrdinal("f_name"));
                String student_l_name = rdr.GetString(rdr.GetOrdinal("l_name"));
                Int32 advisor_id = rdr.GetInt32(rdr.GetOrdinal("advisor_id"));
                String advisor_name = rdr.GetString(rdr.GetOrdinal("advisor_name"));

                if (Session["user"].ToString() != ""+advisor_id)
                {
                    continue;
                } 

                Label student_id_l = new Label();
                student_id_l.Text = student_id+"";

                Label student_f_name_l = new Label();
                student_f_name_l.Text = student_f_name;

                Label student_l_name_l = new Label();
                student_l_name_l.Text = student_l_name;

                Label advisor_id_l = new Label();
                advisor_id_l.Text = advisor_id+"";

                Label advisor_name_l = new Label();
                advisor_name_l.Text = advisor_name;
                
                form1.Controls.Add(student_id_l);
                form1.Controls.Add(student_f_name_l);
                form1.Controls.Add(student_l_name_l);
                form1.Controls.Add(advisor_id_l);
                form1.Controls.Add(advisor_name_l);
            }
            welcome_label.Controls.Add(new Label() { Text = welcome_label.Text+ Session["user"].ToString() });
        }
        protected void logout_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorSignupForm.aspx");
        }
    }
}