using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class StudentOptions1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentLogin.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Addphonenumber.aspx");

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("CourseRequest.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditHourRequest.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewoptionalcourses.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewavailablecourses.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewrequiredcourses.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewmissingcourses.aspx");
        }
    }
}