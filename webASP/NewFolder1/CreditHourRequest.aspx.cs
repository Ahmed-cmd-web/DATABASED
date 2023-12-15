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
    public partial class CreditHourRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string type = TypeID2.Text;
            string comment = CommentID2.Text;
            int Studentid = (int)Session["user"];
            int credit_hours = 0;
            try { credit_hours = Int16.Parse(credit_hoursID.Text); }
            catch (Exception ex) { Response.Write("enter a number"); return; }
            SqlCommand Procedures_StudentSendingCHRequest = new SqlCommand("Procedures_StudentSendingCHRequest", conn);
            Procedures_StudentSendingCHRequest.CommandType = CommandType.StoredProcedure;
            Procedures_StudentSendingCHRequest.Parameters.Add(new SqlParameter("@StudentID", Studentid));
            Procedures_StudentSendingCHRequest.Parameters.Add(new SqlParameter("@credit_hours", credit_hours));
            Procedures_StudentSendingCHRequest.Parameters.Add(new SqlParameter("@type", type));
            Procedures_StudentSendingCHRequest.Parameters.Add(new SqlParameter("@comment", comment));
            if (string.IsNullOrWhiteSpace(type) || string.IsNullOrWhiteSpace(comment))
            {
                Response.Write("string is either null, empty, or contains only white spaces.");
                return;
            }
            conn.Open();
            Procedures_StudentSendingCHRequest.ExecuteNonQuery();
            conn.Close();
            Response.Write("request sent");
            TypeID2.Text = "";
            CommentID2.Text = "";
            credit_hoursID.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentOptions1.aspx");
        }
    }
}