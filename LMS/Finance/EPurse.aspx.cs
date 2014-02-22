using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Finance_EPurse : System.Web.UI.Page
{
    EPurse ep = new EPurse();
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Finance"))
            Response.Redirect("../Login.aspx");

        if (!IsPostBack)
            ShowTransactionRecords();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtAccountID.Text == null)
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-exclamation-sign'></i>&nbsp;&nbsp;Please enter Account ID!";
        }
        else
            SearchStudent(int.Parse(txtAccountID.Text));
    }

    protected void btnEPurse_Click(object sender, EventArgs e)
    {
        string financeID = Session["AccountId"].ToString();
        audit.AddAuditTrail(financeID, "Finance", "e-Purse Reloading/Reimbursing");
        if (drpAmount.SelectedValue.Equals("Choose Here"))
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;Please choose an amount to process.";
        }
        else
        {
            EPurseRecord(int.Parse(txtAccountID.Text), float.Parse(drpAmount.SelectedValue), Session["Name"].ToString(), drpRecordType.SelectedValue);
        }
         
        SearchStudent(int.Parse(txtAccountID.Text));
    }

    void SearchStudent(int accountid)
    {
        Account account = new Account();
        if (account.CheckIfAccountExist(accountid))
        {
            Account user = account.GetAccountInfo(accountid);
            LblStudentName.Text = Helper.ConvertToNameFormat(user.FirstName, user.MiddleName, user.LastName);
            lblUsertype.Text = user.UserType;
            lblBalance.Text = user.EPurseBalance.ToString();
            lblStatus.Text = user.AccountStatus;
            grdEPurse.DataSource = ep.GetEPurseRecordByAccountID(accountid);
            grdEPurse.DataBind();
            PanelAccountInfo.Visible = true;
            lblMessage.Visible = false;
            PanelControl.Visible = true;
            PanelSearch.Visible = false;
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;No Account found!";
        }
    }

    void ShowTransactionRecords()
    {
        EPurse ep = new EPurse();
        grdEPurse.DataSource = ep.ViewEPurse();
        grdEPurse.DataBind();
    }

    void EPurseRecord(int accountid, float amount, string recordedby, string recordtype)
    {
        if ((float.Parse(lblBalance.Text) < float.Parse(drpAmount.SelectedValue)) && drpRecordType.SelectedValue.Equals("Reimburse"))
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;Insufficient balance to reimburse! Please reload!";
        }
        //Additional changes (check if balance is greater than 1,000)
        else if ((((float.Parse(lblBalance.Text) + float.Parse(drpAmount.SelectedValue)) > 1000.00)) && drpRecordType.SelectedValue.Equals("Reload"))
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;Maximum e-Purse value reached. Please reimburse or use credits.";
        }
        // check balance if less than 0
        else if ((((float.Parse(lblBalance.Text) - float.Parse(drpAmount.SelectedValue)) < 0.00)) && drpRecordType.SelectedValue.Equals("Reimburse"))
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;E-Purse Balance should not be less than Php 0.00";
        }
        else
        {
            ep.ComputeEPurseRecord(accountid, amount, recordedby, recordtype);
            Label2.Visible = true; Label1.Visible = false;
            Label2.Text = "<i class='icon-check-sign'></i>&nbsp;&nbsp;E-Purse Balance reloaded / reimbursed successfully.";
        }
    }

    void ViewEPurse()
    {
        grdEPurse.DataSource = ep.ViewEPurse();
        grdEPurse.DataBind();
    }

    void EPurseBalance(int accountid)
    {
        ep.EPurseBalance(accountid);
    }

    protected void Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EPurse.aspx");
    }

    protected void grdEPurse_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEPurse.PageIndex = e.NewPageIndex;
        ViewEPurse();
        ShowTransactionRecords();
    }


}