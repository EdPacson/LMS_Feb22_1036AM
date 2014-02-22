using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentFaculty_Reservation : System.Web.UI.Page
{
    Reservation reserve = new Reservation();
    Resource asset = new Resource();

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
    }

    protected void btnSearchBookTitle_Click(object sender, EventArgs e)
    {
        PanelBook.Visible = true; PanelBookDetails.Visible = false; PanelAVAsset.Visible = false; PanelAVAssetDetails.Visible = false;
        reserve.SearchBookTitle(txtSearch.Text);
        grdBook.DataSource = reserve.SearchBookTitle(txtSearch.Text);
        grdBook.DataBind();
    }

    protected void btnBookAuthor_Click(object sender, EventArgs e)
    {
        PanelBook.Visible = true; PanelBookDetails.Visible = false; PanelAVAsset.Visible = false; PanelAVAssetDetails.Visible = false;
        reserve.SearchBookAuthor(txtSearch.Text);
        grdBook.DataSource = reserve.SearchBookAuthor(txtSearch.Text);
        grdBook.DataBind();
    }

    protected void btnBookCall_Click(object sender, EventArgs e)
    {
        PanelBook.Visible = true; PanelBookDetails.Visible = false; PanelAVAsset.Visible = false; PanelAVAssetDetails.Visible = false;
        reserve.SearchBookCallNumber(txtSearch.Text);
        grdBook.DataSource = reserve.SearchBookCallNumber(txtSearch.Text);
        grdBook.DataBind();
    }

    protected void btnAssetBrand_Click(object sender, EventArgs e)
    {
        PanelAVAsset.Visible = true; PanelBook.Visible = false; PanelBookDetails.Visible = false;
        reserve.SearchAVAssetBrand(txtSearch.Text);
        grdAsset.DataSource = reserve.SearchAVAssetBrand(txtSearch.Text);
        grdAsset.DataBind();
    }

    protected void btnAssetType_Click(object sender, EventArgs e)
    {
        PanelAVAsset.Visible = true; PanelBook.Visible = false; PanelBookDetails.Visible = false;
        reserve.SearchAVAssetType(txtSearch.Text);
        grdAsset.DataSource = reserve.SearchAVAssetType(txtSearch.Text);
        grdAsset.DataBind();
    }

    protected void btnAssetModel_Click(object sender, EventArgs e)
    {
        PanelAVAsset.Visible = true; PanelBook.Visible = false; PanelBookDetails.Visible = false;
        reserve.SearchAVAssetModel(txtSearch.Text);
        grdAsset.DataSource = reserve.SearchAVAssetModel(txtSearch.Text);
        grdAsset.DataBind();
    }

    protected void btnSeries_Click(object sender, EventArgs e)
    {
        PanelBook.Visible = true; PanelAVAsset.Visible = false; PanelAVAssetDetails.Visible = false;
        reserve.SearchBookSeries(txtSearch.Text);
        grdBook.DataSource = reserve.SearchBookSeries(txtSearch.Text);
        grdBook.DataBind();
    }
    //End Search

    protected void grdBook_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("ViewDetails"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grdBook.Rows[index];
            GetBook(row.Cells[0].Text);

            //red font for availability
            if (CheckIfBookIsUnavailable())
            {
                btnReserveBook.Enabled = false;
                lblAvailability.ForeColor = System.Drawing.Color.Red;
            }

            else if (CheckIfBookIsReservedByUser(Convert.ToInt32(Session["AccountId"]), int.Parse(lblbookID.Text)))
            {
                LabelBookNotification.Visible = true;
                btnReserveBook.Visible = false;
                btnCancelBookReservation.Visible = true;
            }
            else
            {
                //Reset
            }

            PanelAVAsset.Visible = false;
            PanelBook.Visible = false;
            PanelAVAssetDetails.Visible = false;
            PanelBookDetails.Visible = true;
        }
    }

    protected void grdAsset_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("ViewDetails"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grdAsset.Rows[index];
            GetAVAsset(row.Cells[0].Text);

            ////check if AVAsset is reserved
            //red font for availability
            if (CheckIfAVAssetIsUnavailable())
            {
                btnReserveAVAsset.Enabled = false;
                lblAVAvailability.ForeColor = System.Drawing.Color.Red;
            }

            else if (CheckIfAVAssetIsReservedByUser(Convert.ToInt32(Session["AccountId"]), int.Parse(lblAVAsset.Text)))
            {
                LabelAVAssetNotification.Visible = true;
                btnReserveAVAsset.Visible = false;
                btnCancelAssetReservation.Visible = true;
            }

            PanelAVAsset.Visible = false;
            PanelBook.Visible = false;
            PanelAVAssetDetails.Visible = true;
            PanelBookDetails.Visible = false;
        }
    }

    protected void btnReserveBook_Click(object sender, EventArgs e)
    {
        ReserveBook(Convert.ToInt32(Session["AccountId"]), Convert.ToInt32(lblbookID.Text));
        PanelBook.Visible = true;
        PanelBookDetails.Visible = false;

        lblAvailability.ForeColor = System.Drawing.Color.Black;
        LabelBookNotification.Visible = false;
        btnCancelBookReservation.Visible = false;
        btnReserveBook.Visible = true;
        btnReserveBook.Enabled = true;
    }

    protected void btnReserveAVAsset_Click(object sender, EventArgs e)
    {
        ReserveAV(Convert.ToInt32(Session["AccountId"]), Convert.ToInt32(lblAVAsset.Text));
        PanelAVAsset.Visible = true;
        PanelAVAssetDetails.Visible = false;

        lblAVAvailability.ForeColor = System.Drawing.Color.Black;
        LabelAVAssetNotification.Visible = false;
        btnCancelAssetReservation.Visible = false;
        btnReserveAVAsset.Visible = true;
        btnReserveAVAsset.Enabled = true;
    }

    protected void btnCancelBookReservation_Click(object sender, EventArgs e)
    {
        reserve.CancelReserveBook(Convert.ToInt32(Session["AccountId"]), int.Parse(lblbookID.Text));
        PanelBook.Visible = true;
        PanelBookDetails.Visible = false;

        lblAvailability.ForeColor = System.Drawing.Color.Black;
        LabelBookNotification.Visible = false;
        btnCancelBookReservation.Visible = false;
        btnReserveBook.Visible = true;
        btnReserveBook.Enabled = true;
    }

    protected void btnCancelAssetReservation_Click(object sender, EventArgs e)
    {
        reserve.CancelReserveAVAsset(Convert.ToInt32(Session["AccountId"]), int.Parse(lblAVAsset.Text));
        PanelAVAsset.Visible = true;
        PanelAVAssetDetails.Visible = false;

        lblAVAvailability.ForeColor = System.Drawing.Color.Black;
        LabelAVAssetNotification.Visible = false;
        btnCancelAssetReservation.Visible = false;
        btnReserveAVAsset.Visible = true;
        btnReserveAVAsset.Enabled = true;
    }

    void GetAVAsset(string assetno)
    {
        asset = asset.GetAVAssetInfoByID(assetno);
        lblAVBrand.Text = asset.Brand;
        lblAVType.Text = asset.Type;
        lblAVAsset.Text = asset.AVAssetID.ToString();
        lblAVSerialNo.Text = asset.SerialNo;
        lblAVModel.Text = asset.Model;
        lblAVAvailability.Text = asset.AVAssetAvailability;
    }

    void GetBook(string barcode)
    {
        asset = asset.GetBookInfoByBarcode(barcode);
        lblbookID.Text = asset.BookID.ToString();
        lblTitle.Text = asset.Title;
        lblItem.Text = asset.ItemDescription;
        lblSeries.Text = asset.Series;
        lblAuthor.Text = asset.Author;
        lblPublisher.Text = asset.Publisher;
        lblDate.Text = string.Format("{0:d}", Convert.ToDateTime(asset.DatePublished));
        lblCall.Text = asset.CallNumber;
        lblCatalogNo.Text = asset.CatalogNo;
        lblCopyNo.Text = asset.CopyNo;
        lblAvailability.Text = asset.Availability;
    }

    void SearchTitle(string search)
    {
        reserve.SearchBookTitle(search);
    }

    void SearchSeries(string search)
    {
        reserve.SearchBookSeries(search);
    }

    void SearchAuthor(string search)
    {
        reserve.SearchBookAuthor(search);
    }

    void SearchCall(string search)
    {
        reserve.SearchBookCallNumber(search);
    }

    void SearchBrand(string search)
    {
        reserve.SearchAVAssetBrand(search);
    }

    void SearchModel(string search)
    {
        reserve.SearchAVAssetModel(search);
    }

    void SearchType(string search)
    {
        reserve.SearchAVAssetType(search);
    }

    void ReserveBook(int accountid, int assetid)
    {
        reserve.ReserveBook(accountid, assetid);
    }

    void ReserveAV(int accountid, int assetid)
    {
        reserve.ReserveAVAsset(accountid, assetid);
    }

    protected void btnBookBack_Click(object sender, EventArgs e)
    {
        PanelAVAsset.Visible = false;
        PanelBook.Visible = true;
        PanelAVAssetDetails.Visible = false;
        PanelBookDetails.Visible = false;
        //ResetBook
        lblAvailability.ForeColor = System.Drawing.Color.Black;
        LabelBookNotification.Visible = false;
        btnCancelBookReservation.Visible = false;
        btnReserveBook.Visible = true;
        btnReserveBook.Enabled = true;
    }

    protected void btnAVBack_Click(object sender, EventArgs e)
    {
        PanelAVAsset.Visible = true;
        PanelBook.Visible = false;
        PanelAVAssetDetails.Visible = false;
        PanelBookDetails.Visible = false;
        //ResetAVAsset
        lblAVAvailability.ForeColor = System.Drawing.Color.Black;
        LabelAVAssetNotification.Visible = false;
        btnCancelAssetReservation.Visible = false;
        btnReserveAVAsset.Visible = true;
        btnReserveAVAsset.Enabled = true;
    }

    bool CheckIfBookIsUnavailable()
    {
        if (lblAvailability.Text.Equals("Unavailable"))
            return true;
        else
            return false;
    }

    bool CheckIfBookIsReservedByUser(int accountid, int bookid)
    {
        if (reserve.CheckIfBookReservationExist(accountid, bookid))
            return true;
        else
            return false;
    }

    bool CheckIfAVAssetIsUnavailable()
    {
        if (lblAVAvailability.Text.Equals("Unavailable"))
            return true;
        else
            return false;
    }

    bool CheckIfAVAssetIsReservedByUser(int accountid, int assetid)
    {
        if (reserve.CheckIfAVAssetReservationExist(accountid, assetid))
            return true;
        else
            return false;
    }

    protected void grdBook_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBook.PageIndex = e.NewPageIndex;
        grdBook.DataBind();
    }

    protected void grdAsset_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAsset.PageIndex = e.NewPageIndex;
        grdAsset.DataBind();
    }
}