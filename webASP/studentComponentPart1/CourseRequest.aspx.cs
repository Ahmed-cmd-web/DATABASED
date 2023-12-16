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
    public partial class CourseRequest : System.Web.UI.Page
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
            string type = TypeID.Text;
            string comment = CommentID.Text;
            int Studentid = (int)Session["user"];
            int Courseid = 0;
            try { Courseid = Int16.Parse(CourseID.Text); }
            catch (Exception ex) { Response.Write("enter a number"); return; }
            SqlCommand Procedures_StudentSendingCourseRequest = new SqlCommand("Procedures_StudentSendingCourseRequest", conn);
            Procedures_StudentSendingCourseRequest.CommandType = CommandType.StoredProcedure;
            Procedures_StudentSendingCourseRequest.Parameters.Add(new SqlParameter("@StudentID", Studentid));
            Procedures_StudentSendingCourseRequest.Parameters.Add(new SqlParameter("@courseID", Courseid));
            Procedures_StudentSendingCourseRequest.Parameters.Add(new SqlParameter("@type", type));
            Procedures_StudentSendingCourseRequest.Parameters.Add(new SqlParameter("@comment", comment));
            if (string.IsNullOrWhiteSpace(type)|| string.IsNullOrWhiteSpace(comment))
            {
                Response.Write("string is either null, empty, or contains only white spaces.");
                return;
            }
            conn.Open();
            Procedures_StudentSendingCourseRequest.ExecuteNonQuery();
            conn.Close();
            Response.Write("request sent");
            TypeID.Text = "";
            CommentID.Text = "";
            CourseID.Text = "";
        }
    }
}