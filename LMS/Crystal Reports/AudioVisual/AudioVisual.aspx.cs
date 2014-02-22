using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Crystal_Reports_AudioVisual_AudioVisual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        CrystalReportViewer1.HasDrilldownTabs = false;
        CrystalReportViewer1.BestFitPage = true;
    }
}