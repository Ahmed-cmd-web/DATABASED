using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class IssueInstallments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPart2Main.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Advising_System_DB"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                int paymentID = Int16.Parse(PaymentID.Text);

                SqlCommand IssueInstallment = new SqlCommand("Procedures_AdminIssueInstallment", conn);
                IssueInstallment.CommandType = CommandType.StoredProcedure;

                IssueInstallment.Parameters.Add(new SqlParameter("@payment_id", paymentID));

                conn.Open();
                IssueInstallment.ExecuteNonQuery();
                conn.Close();
                string l = "Installment Has Been Added Successfully";
                Label2.Text = l;
            }
            catch (Exception ex)
            {
                Response.Write("ERROR: " + ex.ToString());
                return;
            }


        }
    }
}