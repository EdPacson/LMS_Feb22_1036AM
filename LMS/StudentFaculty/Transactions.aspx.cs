using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentFaculty_Transactions : System.Web.UI.Page
{
    StudentTransactions transact = new StudentTransactions();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        else
        {
            string a = Session["UserType"].ToString();
            if (a.Equals("Admin") || a.Equals("Finance") || a.Equals("Librarian"))
                Response.Redirect("../Login.aspx");
        }

        GetAV(Convert.ToInt32(Session["AccountId"])); 
        GetBook(Convert.ToInt32(Session["AccountId"])); 
        GetBookCirc(Convert.ToInt32(Session["AccountId"])); 
        GetMultiCirc(Convert.ToInt32(Session["AccountId"]));
    }

    void GetAV(int accountid)
    {
        grdAVReservation.DataSource = transact.ViewAVReservation(Convert.ToInt32(Session["AccountId"]));
        grdAVReservation.DataBind();
    }

    void GetBook(int accountid)
    {
        grdBookReservation.DataSource = transact.ViewBookReservation(Convert.ToInt32(Session["AccountId"]));
        grdBookReservation.DataBind();
    }

    void GetBookCirc(int accountid)
    {
        grdBookCirculation.DataSource = transact.ViewBookCirculation(Convert.ToInt32(Session["AccountId"]));
        grdBookCirculation.DataBind();
    }

    void GetMultiCirc(int accountid)
    {
        grdMultiCirculation.DataSource = transact.ViewMultimediaCirculation(Convert.ToInt32(Session["AccountId"]));
        grdMultiCirculation.DataBind();
    }
   
    protected void grdBookCirculation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBookCirculation.PageIndex = e.NewPageIndex;
        grdBookCirculation.DataBind();
    }

    protected void grdAVReservation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAVReservation.PageIndex = e.NewPageIndex;
        grdAVReservation.DataBind();
    }

    protected void grdMultiCirculation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdMultiCirculation.PageIndex = e.NewPageIndex;
        grdMultiCirculation.DataBind();
    }

    protected void grdBookReservation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBookReservation.PageIndex = e.NewPageIndex;
        grdBookReservation.DataBind();
    }
}