using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;

public partial class Crystal_Reports_Reload_Reload : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        CrystalReportViewer1.HasDrilldownTabs = false;
    }

}