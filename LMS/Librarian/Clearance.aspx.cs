using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librarian_Clearance : System.Web.UI.Page
{
    Account account = new Account();
    Circulation penalty = new Circulation();
    Clearance clear = new Clearance();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");

        grdList.DataSource = clear.ViewClearanceList();
        grdList.DataBind();
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        PanelStudentInfo.Visible = true;
        GetClearanceInfo(txtAccountID.Text);
        GetAccountInfo(txtAccountID.Text);
    }
    protected void btnBackSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clearance.aspx");
    }

    void GetAccountInfo(string accountid)
    {
        int value = Convert.ToInt32(accountid);
        account = account.GetAccountInfo(Convert.ToInt32(value));
        LblStudentName.Text = string.Format("{0}, {1} {2}", account.LastName, account.FirstName, account.MiddleName);
        lblBalance.Text = string.Format("{0:f2}", account.EPurseBalance);
        lblUsertype.Text = account.UserType;
        lblStatus.Text = account.AccountStatus;
    }

    void GetClearanceInfo(string accountid)
    {
        int value = Convert.ToInt32(accountid);
        grdClearance.DataSource = penalty.GetPenaltyOfAccount(value);
        grdClearance.DataBind();
    }
    protected void grdClearance_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("ClearRecord"))
        {

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grdClearance.Rows[index];
            if (double.Parse(lblBalance.Text) >= double.Parse(row.Cells[2].Text))
            {
                ClearRecord(int.Parse(row.Cells[0].Text), double.Parse(row.Cells[2].Text));
            }
            else
            {
                Response.Write("<script>alert('You have insufficient credits. Please reload your E-Purse.')</script>");
            }
            GetClearanceInfo(txtAccountID.Text);
            GetAccountInfo(txtAccountID.Text);
        }

        grdList.DataSource = clear.ViewClearanceList();
        grdList.DataBind();
    }

    protected void ClearRecord(int penaltyid, double amount)
    {
        penalty.UpdatePenalty(penaltyid);
        penalty.UpdateEPurseThroughPenalty(int.Parse(txtAccountID.Text), amount);

    }

    protected void grdClearance_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdClearance.PageIndex = e.NewPageIndex;
        grdClearance.DataBind();
    }

    protected void grdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdList.PageIndex = e.NewPageIndex;
        grdList.DataBind();
    }
}