using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace webASP
{
    public partial class StudentRegisterationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Register(System.Object sender, System.EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            string first_name = first_nameid.Text;
            string last_name = last_nameid.Text;
            string password = passwordid.Text;
            string email = emailid.Text;
            string faculty = facultyid.Text;
            string major = majorid.Text;
            int semester = 0;
            try { semester = Int16.Parse(semesterid.Text); }
            catch (Exception ex){ Response.Write("enter a number"); return; }
            if (string.IsNullOrWhiteSpace(first_name))
            {
                Response.Write("first name is either null, empty, or contains only white spaces.");
                return;
            }
            if (string.IsNullOrWhiteSpace(last_name))
            {
                Response.Write("last name is either null, empty, or contains only white spaces.");
                return;
            }
            if (string.IsNullOrWhiteSpace(password))
            {
                Response.Write("password is either null, empty, or contains only white spaces.");
                return;
            }
            if (string.IsNullOrWhiteSpace(email))
            {
                Response.Write("email is either null, empty, or contains only white spaces.");
                return;
            }
            if (string.IsNullOrWhiteSpace(faculty))
            {
                Response.Write("faculty is either null, empty, or contains only white spaces.");
                return;
            }
            if (string.IsNullOrWhiteSpace(major))
            {
                Response.Write("major is either null, empty, or contains only white spaces.");
                return;
            }
            SqlCommand Procedures_StudentRegistration = new SqlCommand("Procedures_StudentRegistration", conn);
            Procedures_StudentRegistration.CommandType = CommandType.StoredProcedure ;
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@first_name", first_name));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@last_name", last_name));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@password", password));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@faculty", faculty));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@email", email));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@major", major));
            Procedures_StudentRegistration.Parameters.Add(new SqlParameter("@Semester", semester));

            SqlParameter Student_id = Procedures_StudentRegistration.Parameters.Add("@Student_id", SqlDbType.Int);
            Student_id.Direction = ParameterDirection.Output;
            conn.Open();
            Procedures_StudentRegistration.ExecuteNonQuery();
            conn.Close();
            Response.Write("thank you for registering this is your student id:"+ Student_id.Value);

        }
    }
}