using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_AccountList : System.Web.UI.Page
{
    Account account = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Admin"))
            Response.Redirect("../Login.aspx");

        ViewAccounts(); lblMessage.Visible = false; btnUpdate.Enabled = false; btnReset.Enabled = false;
    }

    void ResetPassword(int accountid, string password)
    {
        Account account = new Account();
        account.UpdateProfile(accountid, "12345");
    }

    void UpdateAccountStatus(int accountid, string status)
    {
        account.UpdateAccountStatus(accountid, status);
    }

    void ViewAccounts()
    {
        grdAccounts.DataSource = account.ViewAccountList();
        grdAccounts.DataBind();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ResetPassword(int.Parse(txtAccountID.Text), "12345");
        lblMessage.Text = "Password Reset Successful!";
        lblMessage.Visible = true;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateAccountStatus(int.Parse(txtAccountID.Text), drpStatus.SelectedValue);
        ViewAccounts();
        lblMessage.Visible = true;
        lblMessage.CssClass = "label label-success aspLabel";
        lblMessage.Text = "<i class='icon-check-sign'></i>&nbsp;&nbsp;Account Updated.";
    }

    protected void grdAccounts_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnUpdate.Enabled = true; btnReset.Enabled = true;
        txtAccountID.Text = grdAccounts.SelectedRow.Cells[1].Text;
        txtLName.Text = grdAccounts.SelectedRow.Cells[3].Text;
        txtFName.Text = grdAccounts.SelectedRow.Cells[4].Text;
        txtMName.Text = grdAccounts.SelectedRow.Cells[5].Text;
        txtGender.Text = grdAccounts.SelectedRow.Cells[6].Text;
        txtEmail.Text = grdAccounts.SelectedRow.Cells[7].Text;
        drpStatus.Text = grdAccounts.SelectedRow.Cells[8].Text;
    }

    protected void grdAccounts_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAccounts.PageIndex = e.NewPageIndex;
        grdAccounts.DataSource = Session["SortedObjects"];
        grdAccounts.DataBind();
        ViewAccounts();
    }

    protected void grdAccounts_Sorting(object sender, GridViewSortEventArgs e)
    {
        
    }
}