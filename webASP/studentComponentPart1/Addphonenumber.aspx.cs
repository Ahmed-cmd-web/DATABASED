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
    public partial class Addphonenumber : System.Web.UI.Page
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
            string phonenumber = phonenumberid.Text;
            if (string.IsNullOrWhiteSpace(phonenumber))
            {
                Response.Write("phonenumber is either null, empty, or contains only white spaces.");
                return;
            }
            int id = (int)Session["user"];
            SqlCommand Procedures_StudentaddMobile = new SqlCommand("Procedures_StudentaddMobile", conn);
            Procedures_StudentaddMobile.CommandType = CommandType.StoredProcedure;
            Procedures_StudentaddMobile.Parameters.Add(new SqlParameter("@StudentID", id));
            Procedures_StudentaddMobile.Parameters.Add(new SqlParameter("@mobile_number", phonenumber));
            conn.Open();
            try
            { Procedures_StudentaddMobile.ExecuteNonQuery(); }
            catch (Exception ex) { Response.Write("phone number already added"); return; }
            conn.Close();
            Response.Write("phone number added");
            phonenumberid.Text = "";

        }
    }
}