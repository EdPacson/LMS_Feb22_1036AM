using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] != null && Session["UserType"] != null)
            if (Session["UserType"].ToString().Equals("Faculty"))
                Response.Redirect("StudentFaculty/Profile.aspx");
            else if(Session["UserType"].ToString().Equals("Student"))
                Response.Redirect("StudentFaculty/Profile.aspx");
            else if (Session["UserType"].ToString().Equals("Finance"))
                Response.Redirect("Finance/Profile.aspx");
            else if (Session["UserType"].ToString().Equals("Librarian"))
                Response.Redirect("Librarian/Profile.aspx");
            else if (Session["UserType"].ToString().Equals("Admin"))
                Response.Redirect("Admin/Profile.aspx");
    }

    void CheckLogin(string accountid, string password)
    {
        Account account = new Account();
        if (account.CheckIfLoginIsValid(accountid, password))
        {
            string usertype = account.GetLoginUserType(accountid, password);
            string name = account.GetLoginFullName(txtAccountID.Text, txtPassword.Text);
            Session["AccountId"] = accountid;
            Session["UserType"] = usertype;
            Session["Name"] = name;

            audit.AddAuditTrail(accountid, usertype, "User Login");

            if (usertype.Equals("Admin"))
                Response.Redirect("../LMS/Admin/Profile.aspx");
            else if (usertype.Equals("Librarian"))
                Response.Redirect("../LMS/Librarian/Profile.aspx");
            else if (usertype.Equals("Finance"))
                Response.Redirect("../LMS/Finance/Profile.aspx");
            else if (usertype.Equals("Student") || usertype.Equals("Faculty"))
                Response.Redirect("../LMS/StudentFaculty/Profile.aspx");
        }
        else
        {
            labelError.Visible = true;
            Label1.Visible = true;
            labelError.Text = "<i class='icon-remove-sign'></i>&nbsp; Incorrect Login. <a href='#loginModal' data-toggle='modal' style='color:inherit'><strong>Try again</strong></a>.";
            Label1.Text = "<i class='icon-remove-sign'></i>&nbsp; Login Attempt Unsuccessful. Try again.";
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    { 
        CheckLogin(txtAccountID.Text, txtPassword.Text);

        //for decrypting password if forgotten
        //Account acc = new Account();
        //string pass = acc.Decrypt(txtPassword.Text);
        //Response.Write("Password:" + pass);
    }
}