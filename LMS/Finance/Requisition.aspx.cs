using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Finance_Requisition : System.Web.UI.Page
{
    Request req = new Request();
    Account account = new Account();
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Finance"))
            Response.Redirect("../Login.aspx");

        ViewProfile(Convert.ToInt32(Session["AccountId"]));
        ViewRequestApproval(); btnApproval.Visible = false; lblMessage.Visible = false;
    }

    void ViewProfile(int accountid)
    {
        account = account.GetAccountInfo(accountid);
        txtAccountID.Text = accountid.ToString();
        txtApprovedBy.Text = string.Format("{0}, {1} {2}", account.LastName, account.FirstName, account.MiddleName) ;
    }

    void Req(int requestid, int accountid, string approvedby, string requeststatus, string remarks)
    {
        req.RequestApproval(requestid, accountid, approvedby, requeststatus, remarks);
    }

    void ViewRequestApproval()
    {
        grdRequisition.DataSource = req.ViewRequestApproval();
        grdRequisition.DataBind();
    }

    void ViewApprovedReq()
    {
        grdRequisition.DataSource = req.ViewApprovedRequest();
        grdRequisition.DataBind();
    }

    void ViewRejectedReq()
    {
        grdRequisition.DataSource = req.ViewRejectRequest();
        grdRequisition.DataBind();
    }

    void ViewPendingReq()
    {
        grdRequisition.DataSource = req.ViewPendingRequest();
        grdRequisition.DataBind();
    }

    void ViewPendingRequest()
    {
        txtAccountID.Text = grdRequisition.SelectedRow.Cells[2].Text;
        txtApprovedBy.Text = grdRequisition.SelectedRow.Cells[12].Text;
        drpStatus.Text = grdRequisition.SelectedRow.Cells[13].Text;
        txtRemarks.Text = grdRequisition.SelectedRow.Cells[14].Text;
    }

    public SortDirection sort
    {
        get
        {
            if (ViewState["state"] == null)
            {
                ViewState["state"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["state"];
        }
        set
        {
            ViewState["state"] = value;
        }
    }

    protected void btnApproval_Click(object sender, EventArgs e)
    {
        //AccountID, UserType, Activity, ActivityDate
        string financeID = Session["AccountId"].ToString();

        if (drpRequestStatus.SelectedValue.Equals("Pending"))
        {
            PanelViewRequest.Visible = true;
            ViewPendingReq();

            if(drpStatus.SelectedValue.Equals("Choose Here"))
            {
                lblMessage.Text = "Invalid Choice!";
            }
            else
            {
            txtApprovedBy.Text = Session["Name"].ToString();
            Req(int.Parse(grdRequisition.SelectedRow.Cells[1].Text), int.Parse(grdRequisition.SelectedRow.Cells[2].Text),
                txtApprovedBy.Text, drpStatus.Text, txtRemarks.Text);
            }
        }

        audit.AddAuditTrail(financeID, "Finance", "Approved Requests");

        txtRemarks.Text = "";
    }
    protected void grdRequisition_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpRequestStatus.SelectedValue.Equals("Pending"))
        {
            btnApproval.Visible = true;
            ViewPendingReq();
        }
        else if(drpRequestStatus.SelectedValue.Equals("Approve") || drpRequestStatus.SelectedValue.Equals("Reject"))
        {
            btnApproval.Visible = false;
            PanelViewRequest.Visible = false;
            lblMessage.Visible = true;
            lblMessage.CssClass = "label label-important aspLabel";
            lblMessage.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;This request has already been processed.";
        }
    }

    protected void drpRequestStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpRequestStatus.SelectedValue.Equals("Approve"))
        {
            PanelViewRequest.Visible = true;
            ViewApprovedReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("Reject"))
        {
            PanelViewRequest.Visible = true;
            ViewRejectedReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("Pending"))
        {
            PanelViewRequest.Visible = true;
            ViewPendingReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("All Requests"))
        {
            PanelViewRequest.Visible = true;
            ViewRequestApproval();
        }
        else
        {
            PanelViewRequest.Visible = false;
        }
    }

    protected void grdRequisition_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRequisition.PageIndex = e.NewPageIndex;
        grdRequisition.DataSource = Session["SortedObjects"];
        if (drpRequestStatus.SelectedValue.Equals("Pending"))
        {
            ViewPendingReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("Approve"))
        {
            ViewApprovedReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("Reject"))
        {
            ViewRejectedReq();
        }
        else if (drpRequestStatus.SelectedValue.Equals("All Requests"))
        {
            ViewRequestApproval();
        }
    }
}