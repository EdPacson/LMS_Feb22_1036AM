using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_ADMP : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            lblSession.Text += Session["Name"].ToString();
        }
    }
    protected void lnkOut_Click(object sender, EventArgs e)
    {
        Session["Name"] = null;
        Session["AccountId"] = null;
        Session["Usertype"] = null;
        Response.Redirect("../Login.aspx");
    }
}
