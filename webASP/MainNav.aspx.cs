using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webASP
{
    public partial class MainNav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //admin part1
            Response.Redirect("");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //admin part2
            Response.Redirect("adminComponentPart2/AdminPart2Main.aspx");

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //advisor
            Response.Redirect("advisorComponent/AdvisorSignupForm.aspx");

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //student part1/part2
            Response.Redirect("studentComponentPart1/StudentLogin.aspx");

        }
    }
}