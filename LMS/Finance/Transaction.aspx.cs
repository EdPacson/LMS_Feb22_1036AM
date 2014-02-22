using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Finance_Transaction : System.Web.UI.Page
{
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Finance"))
            Response.Redirect("../Login.aspx");
        GetAudit(Session["UserType"].ToString());

        if (!Page.IsPostBack)
        {
            grdTransaction.DataSource = audit.GetAuditTrailByUserType(Session["UserType"].ToString());
            grdTransaction.DataBind();
        }
    }

    void GetAudit(string usertype)
    {
        grdTransaction.DataSource = audit.GetAuditTrailByUserType(usertype);
        grdTransaction.DataBind();
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


    protected void grdTransaction_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdTransaction.PageIndex = e.NewPageIndex;
        grdTransaction.DataBind();
    }

    protected void grdTransaction_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;

        if (sort == SortDirection.Ascending)
        {
            sort = SortDirection.Descending;
            sortingDirection = "DESC";
        }
        else if (sort == SortDirection.Descending)
        {
            sort = SortDirection.Ascending;
            sortingDirection = "ASC";
        }

        DataView sortView = new DataView(audit.GetAuditTrailByUserType(Session["UserType"].ToString()));
        sortView.Sort = e.SortExpression + " " + sortingDirection;
        Session["SortedObjects"] = sortView;
        grdTransaction.DataSource = sortView;
        grdTransaction.DataBind();
    }
}