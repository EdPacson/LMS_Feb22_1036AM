using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librarian_Reservation : System.Web.UI.Page
{
    Account acct = new Account();
    Reservation reserve = new Reservation();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");
        
        ViewBookReservations(); ViewAVReservations();
    }

    void GetAccountInfo(string acctid)
    {
        int id = Convert.ToInt32(txtAcctID.Text);
        acct = acct.GetAccountInfo(Convert.ToInt32(id));
    }

    void ViewBookReservations()
    {
        grdBook.DataSource = reserve.ViewReservedBook();
        grdBook.DataBind();
    }

    void ViewAVReservations()
    {
        grdAV.DataSource = reserve.ViewReservedAV();
        grdAV.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (acct.CheckIfAccountExist(Convert.ToInt32(txtAcctID.Text)))
        {
            GetAccountInfo(txtAcctID.Text);
        }
        else
        {
            lblNo.Visible = true;
        }
        if (drpSearch.SelectedValue.Equals("Book"))
        {
            PanelReservations.Visible = true;
            PanelBook.Visible = false;  PanelAVAsset.Visible = false;
            grdReservations.DataSource = reserve.ViewBookReservation(Convert.ToInt32(txtAcctID.Text));
            grdReservations.DataBind();
            txtAcctID.Text = "";
        }
        else if (drpSearch.SelectedValue.Equals("AV Asset"))
        {
            PanelReservations.Visible = true;
            PanelBook.Visible = false; PanelAVAsset.Visible = false;
            grdReservations.DataSource = reserve.ViewAVReservation(Convert.ToInt32(txtAcctID.Text));
            grdReservations.DataBind();
            txtAcctID.Text = "";
        }
        else
        {
            lblNo.Visible = true; lblNo.Text = "Invalid Choice";
        }

        lblUpdateMessage.Visible = false; 
    }

    protected void grdReservations_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelDropDown.Visible = true; 

        if(drpSearch.SelectedValue.Equals("Book"))
        {
            PanelBookToReserve.Visible = true; PanelReservations.Visible = false;
            ReservationID.Text = grdReservations.SelectedRow.Cells[1].Text;
            lblAcctID.Text = grdReservations.SelectedRow.Cells[2].Text;
            lblName.Text = grdReservations.SelectedRow.Cells[3].Text;
            lblTitle.Text = grdReservations.SelectedRow.Cells[4].Text;
            lblAuthor.Text = grdReservations.SelectedRow.Cells[5].Text;
            lblDate.Text = grdReservations.SelectedRow.Cells[6].Text;
        }
        else if(drpSearch.SelectedValue.Equals("AV Asset"))
        {
            PanelReservations.Visible = false;  PanelAVToReserve.Visible = true;
            ReservationID.Text = grdReservations.SelectedRow.Cells[1].Text;
            lblAcctID.Text = grdReservations.SelectedRow.Cells[2].Text;
            lblName.Text = grdReservations.SelectedRow.Cells[3].Text;
            lblBrand.Text = grdReservations.SelectedRow.Cells[4].Text;
            lblModel.Text = grdReservations.SelectedRow.Cells[5].Text;
            lblSerial.Text = grdReservations.SelectedRow.Cells[6].Text;
            lblType.Text = grdReservations.SelectedRow.Cells[7].Text;
            lblDateReserved.Text = grdReservations.SelectedRow.Cells[8].Text;
        }
        else
        {
        }

        btnBack.Visible = false;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reservations.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (drpStatus.SelectedValue.Equals("Claimed"))
        {
            if (drpSearch.SelectedValue.Equals("Book"))
            {
                reserve.UpdateBookReservationStatus(Convert.ToInt32(ReservationID.Text), "Claimed");
                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
            else if (drpSearch.SelectedValue.Equals("AV Asset"))
            {
                reserve.UpdateAVReservationStatus(Convert.ToInt32(ReservationID.Text), "Claimed");
                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Invalid choice! Please choose again!";
            }
        }
        else if (drpStatus.SelectedValue.Equals("Unclaimed"))
        {
            double fee = 100;

            if (drpSearch.SelectedValue.Equals("Book"))
            {
                reserve.UpdateBookReservationStatus(Convert.ToInt32(ReservationID.Text), "Unclaimed");

                if (reserve.IfBookDateDued(lblAcctID.Text, ReservationID.Text))
                {
                    reserve.AddPenaltyFee(Convert.ToInt32(lblAcctID.Text), fee, Session["Name"].ToString());
                }
                
                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
            else if (drpSearch.SelectedValue.Equals("AV Asset"))
            {
                reserve.UpdateAVReservationStatus(Convert.ToInt32(ReservationID.Text), "Unclaimed");

                reserve.AddPenaltyFee(Convert.ToInt32(lblAcctID.Text), fee, Session["Name"].ToString());
                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
        }
        else if (drpStatus.SelectedValue.Equals("Cancelled"))
        {
            double fee = 100;

            if (drpSearch.SelectedValue.Equals("Book"))
            {
                reserve.UpdateBookReservationStatus(Convert.ToInt32(ReservationID.Text), "Cancelled");

                if (reserve.IfBookDateDued(lblAcctID.Text, ReservationID.Text))
                {
                    reserve.AddPenaltyFee(Convert.ToInt32(lblAcctID.Text), fee, Session["Name"].ToString());
                }

                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
            else if (drpSearch.SelectedValue.Equals("AV Asset"))
            {
                reserve.UpdateAVReservationStatus(Convert.ToInt32(ReservationID.Text), "Cancelled");
                lblUpdateMessage.Visible = true;
                lblUpdateMessage.Text = "<i class='icon-check-sign'></i>&nbsp; Reservation Status Successfully Updated!";
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Invalid choice! Please choose again!";
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnBack.Visible = true; lblError.Visible = false;
    }

    protected void grdBook_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBook.PageIndex = e.NewPageIndex;
        ViewBookReservations();
    }

    protected void grdAV_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAV.PageIndex = e.NewPageIndex;
        ViewAVReservations();
    }

    protected void grdReservations_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (drpSearch.SelectedValue.Equals("Book"))
        {
            grdBook.PageIndex = e.NewPageIndex;
            ViewBookReservations();
        }
        else if (drpSearch.SelectedValue.Equals("AV Asset"))
        {
            grdAV.PageIndex = e.NewPageIndex;
            ViewAVReservations();
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "<i class='icon-exclamation-sign'></i>&nbsp; Invalid choice! Please choose again!";
        }
    }
}