using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class AdvisorMainForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            welcome_label.Controls.Add(new Label() { Text = welcome_label.Text + Session["user"].ToString() });

            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();

            SqlCommand AdminListStudentsWithAdvisors = new SqlCommand("AdminListStudentsWithAdvisors", conn);
            AdminListStudentsWithAdvisors.CommandType = CommandType.StoredProcedure;

            SqlDataReader rdr = AdminListStudentsWithAdvisors.ExecuteReader(CommandBehavior.CloseConnection);

            DataTable dataTable = new DataTable();
            dataTable.Load(rdr);

            GridView_table.DataSource = dataTable;
            GridView_table.DataBind();

            //while (rdr.Read())
            //{
            //    Int32 student_id = rdr.GetInt32(rdr.GetOrdinal("student_id"));
            //    String student_f_name = rdr.GetString(rdr.GetOrdinal("f_name"));
            //    String student_l_name = rdr.GetString(rdr.GetOrdinal("l_name"));
            //    Int32 advisor_id = rdr.GetInt32(rdr.GetOrdinal("advisor_id"));
            //    String advisor_name = rdr.GetString(rdr.GetOrdinal("advisor_name"));

            //    if (Session["user"].ToString() != ""+advisor_id)
            //    {
            //        continue;
            //    } 

            //    Label student_id_l = new Label();
            //    student_id_l.Text = student_id+"";

            //    Label student_f_name_l = new Label();
            //    student_f_name_l.Text = student_f_name;

            //    Label student_l_name_l = new Label();
            //    student_l_name_l.Text = student_l_name;

            //    Label advisor_id_l = new Label();
            //    advisor_id_l.Text = advisor_id+"";

            //    Label advisor_name_l = new Label();
            //    advisor_name_l.Text = advisor_name;

            //    form1.Controls.Add(student_id_l);
            //    form1.Controls.Add(student_f_name_l);
            //    form1.Controls.Add(student_l_name_l);
            //    form1.Controls.Add(advisor_id_l);
            //    form1.Controls.Add(advisor_name_l);
            //}

        }
        protected void logout_onClick(object sender, EventArgs e)
        {
            Response.Redirect("AdvisorSignupForm.aspx");
        }

        protected void GridView_table_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int advisorIdColumnIndex = 3;

                string advisorId = DataBinder.Eval(e.Row.DataItem, "advisor_id").ToString();

                if (Session["user"].ToString() != advisorId)
                {
                    e.Row.Visible = false;
                }

            }
        }

        protected void GridView_table_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView_table_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        //    if (e.CommandName.Equals("add_course"))
        //    {
        //        Response.Redirect("AdvisorAddCourseForm.aspx");
        //    }
        //    else if (e.CommandName.Equals("add_gp"))
        //    {
        //        Response.Redirect("AdvisorAddGPForm.aspx");
        //    } 
        //    else if (e.CommandName.Equals("delete_course"))
        //    {
        //        Response.Redirect("AdvisorDeleteCourseForm.aspx");
        //    }
        //    else if (e.CommandName.Equals("update_date_gp"))
        //    {
        //        Response.Redirect("AdvisorUpdateExpectedGPDateForm.aspx");
        //    }
        //    else
        //    {
        //        return;
        //    }
        }
    }
}