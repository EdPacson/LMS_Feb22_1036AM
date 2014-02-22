using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Librarian_Requisition : System.Web.UI.Page
{
    Request request = new Request();
    Account account = new Account();
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");

        ViewReq();
        ViewProfile(Convert.ToInt32(Session["AccountId"]));
    }

    void ViewProfile(int accountid)
    {
        account = account.GetAccountInfo(accountid);
        txtAccountID.Text = accountid.ToString();
        txtRecordedBy.Text = Session["Name"].ToString();
    }

    void Requisition(int accountid, string title, string series, string author, string publisher, int quantity, float price,
        string recordedby)
    {
        request.Requisition(accountid, title, series, author, publisher, price, quantity, recordedby);
    }

    void ViewReq()
    {
        grdRequisition.DataSource = request.ViewRequest();
        grdRequisition.DataBind();
    }

    protected void btnRequest_Click(object sender, EventArgs e)
    {
        string librarianID = Session["AccountId"].ToString();
        audit.AddAuditTrail(librarianID, "Librarian", "Submit Request");

        // check for price
        if (float.Parse(txtPrice.Text) < 0.00)
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Price cannot be less than Php 0!";
        }
        else if (float.Parse(txtPrice.Text) == 0.00)
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Price cannot be equal to Php 0!";
        }
        else if (float.Parse(txtPrice.Text) > 0.00 && float.Parse(txtPrice.Text) < 100.00)
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Minimum price is 100.";
        }
        else if (float.Parse(txtPrice.Text) > 5000.00)
        {
            Label1.Visible = true; Label2.Visible = false;
            Label1.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Maximum price is 5000.";
        }
        else
        {
            Requisition(int.Parse(txtAccountID.Text), txtTitle.Text, txtSeries.Text, txtAuthor.Text, txtPublisher.Text,
                   int.Parse(txtQuantity.Text), float.Parse(txtPrice.Text), txtRecordedBy.Text);

            Label1.Visible = false; Label2.Visible = true;
            Label2.Text = "<i class='icon-check-sign'></i>&nbsp; Request Submitted!";
        }
        ViewReq();
        txtTitle.Text = ""; txtSeries.Text = ""; txtAuthor.Text = ""; txtPublisher.Text = ""; txtQuantity.Text = ""; txtPrice.Text = ""; 
    }

    protected void grdRequisition_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRequisition.PageIndex = e.NewPageIndex;
        ViewReq();
    }
}