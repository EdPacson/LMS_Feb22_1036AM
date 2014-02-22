using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Admin"))
            Response.Redirect("../Login.aspx");

        txtBday.Attributes.Add("readonly", "readonly");
        txtBirthday.Attributes.Add("readonly", "readonly");
       
    }

    void UserRegistration(string accountid, string usertype, string lname, string fname, string mname,
        string address, string gender, string birthday, string contactno, string email, string password)
    {
        Account account = new Account();
        account.UserRegistration(accountid, usertype, lname, fname, mname, address, gender, birthday, 
            contactno, email, password);
    }

    void AdminRegistration(string accountid, string usertype, string lname, string fname, string mname,
       string address, string gender, string birthday, string contactno, string email, string password)
    {
        Account account = new Account();
        account.AdminRegistration(accountid, usertype, lname, fname, mname, address, gender, birthday,
            contactno, email, password);
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        try
        {
            if (drpUserType.SelectedValue.Equals("Choose Here"))
            {
                lblError.Visible = true;
                lblError.Text = "Invalid choice! Please choose again!";
            }
            else
            {
                UserRegistration(txtAccountID.Text, drpUserType.Text, txtLName.Text, txtFName.Text, txtMName.Text,
                txtAddress.Text, drpGender.Text, txtBirthday.Text, txtContactNo.Text, txtEmail.Text, txtPassword.Text);
                lblGood.Visible = true; lblNo.Visible = false;
                lblGood.Text = "You have successfully registered an account.";
            }
        }
        catch
        {
            lblNo.Visible = true; lblGood.Visible = false;
            lblNo.Text = "You have failed to register an account.";
        }

        txtAccountID.Text = ""; txtFName.Text = ""; txtLName.Text = ""; txtMName.Text = ""; txtAddress.Text = "";
        txtBirthday.Text = ""; txtContactNo.Text = ""; txtEmail.Text = ""; txtPassword.Text = "";
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        try
        {
            if (drpType.SelectedValue.Equals("Choose Here"))
            {
                lblError.Visible = true;
                lblError.Text = "Invalid choice! Please choose again!";
            }
            else
            {
                AdminRegistration(txtAcctID.Text, drpType.Text, txtLast.Text, txtFirst.Text, txtMiddle.Text,
                    txtAdd.Text, drpGen.Text, txtBday.Text, txtContact.Text, txtE.Text, txtPass.Text);
                lblOk.Visible = true; lblError.Visible = false;
                lblOk.Text = "You have successfully registered an account.";
            }
        }
        catch
        {
            lblError.Visible = true; lblOk.Visible = false;
            lblError.Text = "You have failed to register an account.";
        }

        txtAcctID.Text = ""; txtFirst.Text = ""; txtLast.Text = ""; txtMiddle.Text = ""; txtAdd.Text = "";
        txtBday.Text = ""; txtContact.Text = ""; txtE.Text = ""; txtPass.Text = "";
    }

    protected void drpSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpSelect.SelectedValue.Equals("Finance / Librarian"))
        {
            LibrarianFinance.Visible = true;
            Toggle.Visible = false;
            StudentFaculty.Visible = false;
        }
        else if (drpSelect.SelectedValue.Equals("Student / Faculty"))
        {
            StudentFaculty.Visible = true;
            Toggle.Visible = false;
            LibrarianFinance.Visible = false;
        }
        else
        {
            Toggle.Visible = true;
            LibrarianFinance.Visible = false;
            StudentFaculty.Visible = false;
        }
    }
}