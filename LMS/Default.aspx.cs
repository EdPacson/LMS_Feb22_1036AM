using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool IfBookDateDued(DateTime datedue, DateTime dateclaimed)
    {
        int result = DateTime.Compare(dateclaimed, datedue);
        if (result < 0)
            return true;
        else
            return false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IfBookDateDued(Convert.ToDateTime(TextBox1.Text), Convert.ToDateTime(TextBox2.Text)))
            Button1.Text = "TRUE";
        else
            Button1.Text = "FALSE";
    }
}