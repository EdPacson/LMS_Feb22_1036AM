using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Library : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Admin"))
            Response.Redirect("../Login.aspx");
    }

    //protected void DataGrid1_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    //{
    //    DataGrid1.CurrentPageIndex = e.NewPageIndex;
    //    DataGrid1.DataBind();
    //}

    protected void grdFeedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFeedback.PageIndex = e.NewPageIndex;
        grdFeedback.DataBind();
    }
}