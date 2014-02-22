using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librarian_Profile : System.Web.UI.Page
{
    Account account = new Account();
    Reservation reserve = new Reservation();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");

        ViewProfile(Convert.ToInt32(Session["AccountId"])); lblMessage.Visible = false;
    }

    void ViewProfile(int accountid)
    {
        account = account.GetAccountInfo(accountid);
        txtAccountID.Text = accountid.ToString();
        txtLName.Text = account.LastName;
        txtFName.Text = account.FirstName;
        txtMName.Text = account.MiddleName;
    }

    void UpdatePassword(int accountid, string oldpassword, string password)
    {
        if (account.CheckIfPasswordIsMatch(accountid, oldpassword))
        {
            account.UpdateProfile(accountid, password);
            lblMessage.Visible = true;
            lblMessage.Text = "Password changed successfully.";
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Old Password do not match.";
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdatePassword(int.Parse(txtAccountID.Text), txtOld.Text, txtNew.Text);
    }
}