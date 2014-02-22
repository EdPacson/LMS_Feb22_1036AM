using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_AuditTrail : System.Web.UI.Page
{
    AuditTrail audit = new AuditTrail();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        else
            GetAudit(Session["UserType"].ToString());
        if (!Session["UserType"].ToString().Equals("Admin"))
            Response.Redirect("../Login.aspx");

        if (!Page.IsPostBack)
        {
            grdAuditTrail.DataSource = audit.GetAuditTrail();
            grdAuditTrail.DataBind();
        }
    }

    void GetAudit(string activity)
    {
        grdAuditTrail.DataSource = audit.GetAuditTrailByActivity(activity);
        grdAuditTrail.DataBind();
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

    protected void grdAuditTrail_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAuditTrail.PageIndex = e.NewPageIndex;
        grdAuditTrail.DataSource = Session["SortedObjects"];
        grdAuditTrail.DataBind();
    }

    protected void grdAuditTrail_Sorting(object sender, GridViewSortEventArgs e)
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

        DataView sortView = new DataView(audit.GetAuditTrail());
        sortView.Sort = e.SortExpression + " " + sortingDirection;
        Session["SortedObjects"] = sortView;
        grdAuditTrail.DataSource = sortView;
        grdAuditTrail.DataBind();
    }
}