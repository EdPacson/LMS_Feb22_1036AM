﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Crystal_Reports_AudioVisual_AudioVisual_A : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CRVAudio.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;
        CRVAudio.HasDrilldownTabs = false;
    }
}