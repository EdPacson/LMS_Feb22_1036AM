using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentFaculty_Library : System.Web.UI.Page
{
    Account account = new Account();

    protected void Page_Load(object sender, EventArgs e)
    {

        Account account = new Account();
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        else
        {
            string a = Session["UserType"].ToString();
            if (a.Equals("Admin") || a.Equals("Finance") || a.Equals("Librarian"))
                Response.Redirect("../Login.aspx");

           
        }

        ViewNameEmail(Convert.ToInt32(Session["AccountId"]));
    }

        void ViewNameEmail(int accountid)
        {
            account = account.GetAccountInfo(accountid);
            Name.Text = Session["Name"].ToString();
            Email.Text = account.Email;
        }

        protected void Insert(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            lblSuccess.Visible = true;
            lblSuccess.Text = "Feedback Sent Successfully";

            Comment.Text = "";
        }
}