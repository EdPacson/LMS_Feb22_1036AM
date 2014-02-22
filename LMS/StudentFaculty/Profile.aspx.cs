using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentFaculty_Profile : System.Web.UI.Page
{
    Account account = new Account();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        else
        {
            string a = Session["UserType"].ToString();
            if (a.Equals("Admin") || a.Equals("Finance") || a.Equals("Librarian"))
                Response.Redirect("../Login.aspx");
        }
        ViewProfile(Convert.ToInt32(Session["AccountId"])); lblMessage.Visible = false;
    }

    void ViewProfile(int accountid)
    {
        account = account.GetAccountInfo(accountid);
        txtAccountID.Text = accountid.ToString();
        txtLName.Text = account.LastName;
        txtFName.Text = account.FirstName;
        txtMName.Text = account.MiddleName;
        txtEmail.Text = account.Email;
        txtEPurse.Text = account.EPurseBalance.ToString();
    }

    void UpdatePassword(int accountid, string oldpassword, string password)
    {
        if (account.CheckIfPasswordIsMatch(accountid, oldpassword))
        {
            account.UpdateProfile(accountid, password);
            lblMessage.Visible = true;
            lblMessage.CssClass = "label label-success aspLabel";
            lblMessage.Text = "<i class='icon-check-sign'></i>&nbsp;Password Updated Successfully!";
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "label label-important aspLabel";
            lblMessage.Text = "<i class='icon-remove'></i>&nbsp;Old Password do not match.";
        }
    }
    protected void btnUpdateAccount_Click(object sender, EventArgs e)
    {
        UpdatePassword(int.Parse(txtAccountID.Text), txtOld.Text, txtNew.Text);
    }
}