using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librarian_Comment : System.Web.UI.Page
{
    Account account = new Account();
    comm com = new comm();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");

        ViewNameEmail(Convert.ToInt32(Session["AccountId"]));

        Grid();
    }

    void ViewNameEmail(int accountid)
    {
        account = account.GetAccountInfo(accountid);
        Name.Text = Session["Name"].ToString();
        Email.Text = account.Email;
    }

    void COMMENT(string Name, string Email, string Comment)
    {
        com.AddComment(Name, Email, Comment);
    }

    void Grid()
    {
        GridView1.DataSource = com.ViewComment();
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        COMMENT(Name.Text, Email.Text, Comment.Text);
        lblSuccess.Visible = true;
        lblSuccess.Text = "Feedback Sent Successfully";

        Comment.Text = "";

        GridView1.DataBind();
    }
}