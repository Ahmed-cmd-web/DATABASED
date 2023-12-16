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
    public partial class AdminPart2Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteCourse.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeleteSlots.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMakeupExam.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStudentPayments.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("IssueInstallments.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateStudentStatus.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetailsActiveStudent.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("GPAdvisors.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentTranscriptDetails.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("SemestersOfferedCourses.aspx");
        }
    }
}