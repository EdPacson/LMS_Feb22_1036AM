using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Librarian_Resource : System.Web.UI.Page
{
    Resource resource = new Resource();
    Reservation reserve = new Reservation();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");

        txtRelease.Attributes.Add("readonly", "readonly");
        txtDate.Attributes.Add("readonly", "readonly");
        HideItems(); PanelGrid.Visible = false;
        Toggle.Visible = true;
    }

    void HideItems()
    {
        btnUpdate.Visible = false; btnDelete.Visible = false; btnUpdateAV.Visible = false; btnDelAV.Visible = false;
        btnUpdateMulti.Visible = false; btnDelMulti.Visible = false;
    }

    void AddBookCatalog(string lname, string fname, string mname, string title, string isbn, 
        string itemdescription, string series, string publisher, 
        string catalogno, string barcode, string callnumber, string datepublished, string copyno)
    {
        int author_id = resource.CheckIfAuthorExist(lname, fname, mname); ;
        if (author_id == 0)
        {
            resource.AddAuthor(lname, fname, mname);
            author_id = resource.CheckIfAuthorExist(lname, fname, mname);
        }

        resource.AddBook(author_id, title, isbn, itemdescription, series, publisher, catalogno, barcode, callnumber, datepublished, copyno);
    }

    void UpdateBook(int bookid, string lname, string fname, string mname, string title, string isbn, string itemdescription, string series, 
        string publisher, string catalogno, string barcode, string callnumber, string datepublished, string copyno)
    {
        int author_id = resource.CheckIfAuthorExist(lname, fname, mname); ;
        if (author_id == 0)
        {
            resource.AddAuthor(lname, fname, mname);
            author_id = resource.CheckIfAuthorExist(lname, fname, mname);
        }

        resource.UpdateBook(bookid, author_id, title, isbn, itemdescription, series, publisher,
           catalogno, barcode, callnumber, datepublished, copyno);
    }

    void ViewBooks()
    {
        grdResources.DataSource = resource.ViewBook();
        grdResources.DataBind();
    }

    void ViewBookCatalog()
    {
        btnUpdate.Visible = true; btnDelete.Visible = true;
        txtALName.Text = grdResources.SelectedRow.Cells[2].Text;
        txtAFName.Text = grdResources.SelectedRow.Cells[3].Text;
        txtAMName.Text = grdResources.SelectedRow.Cells[4].Text;
        txtTitle.Text = grdResources.SelectedRow.Cells[5].Text;
        txtISBN.Text = grdResources.SelectedRow.Cells[6].Text;
        txtItem.Text = grdResources.SelectedRow.Cells[7].Text;
        txtSeries.Text = grdResources.SelectedRow.Cells[8].Text;
        txtPublisher.Text = grdResources.SelectedRow.Cells[9].Text;
        txtCatalogNo.Text = grdResources.SelectedRow.Cells[11].Text;
        txtBarcode.Text = grdResources.SelectedRow.Cells[12].Text;
        grdResources.SelectedRow.Cells[13].Text = drpAvailability.SelectedValue.ToString();
        txtCall.Text = grdResources.SelectedRow.Cells[14].Text;
        txtDate.Text = grdResources.SelectedRow.Cells[15].Text;
        txtCopyNo.Text = grdResources.SelectedRow.Cells[16].Text;
    }

    void AddAV(string brand, string assetno, string type, string serialno, string model)
    {
        resource.AddAVAsset(brand, assetno, type, serialno, model);
    }

    void UpdateAV(int avassetid, string brand, string assetno, string type, string serialno, string model, string availability)
    {
        resource.UpdateAV(avassetid, brand, assetno, type, serialno, model, availability);
    }

    void ViewAV()
    {
        grdResources.DataSource = resource.ViewAV();
        grdResources.DataBind();
    }

    void ViewAVAsset()
    {
        btnUpdateAV.Visible = true; btnDelAV.Visible = true;
        Label1.Visible = true; drpAvailability.Visible = true; 
        txtBrand.Text = grdResources.SelectedRow.Cells[2].Text;
        txtAssetNo.Text = grdResources.SelectedRow.Cells[3].Text;
        drpType.Text = grdResources.SelectedRow.Cells[4].Text;
        txtSerialNo.Text = grdResources.SelectedRow.Cells[5].Text;
        txtModel.Text = grdResources.SelectedRow.Cells[6].Text;
        drpAvailability.Text = grdResources.SelectedRow.Cells[7].Text;
    }

    void AddMulti(string title, string director, DateTime releasedate, string genre, string barcode)
    {
        resource.AddMulti(title, director, releasedate, genre, barcode);
    }

    void UpdateMulti(int multimediaid, string title, string director, DateTime releasedate, string genre, string barcode, string availability)
    {
        resource.UpdateMulti(multimediaid, title, director, releasedate, genre, barcode, availability);
    }

    void ViewMulti()
    {
        grdResources.DataSource = resource.ViewMulti();
        grdResources.DataBind();
    }

    void ViewMultimedia()
    {
        btnUpdateMulti.Visible = true; btnDelMulti.Visible = true;
        Label2.Visible = true; drpAvailMulti.Visible = true; 
        txtMultiTitle.Text = grdResources.SelectedRow.Cells[2].Text;
        txtDirector.Text = grdResources.SelectedRow.Cells[3].Text;
        txtRelease.Text = grdResources.SelectedRow.Cells[4].Text;
        drpGenre.Text = grdResources.SelectedRow.Cells[5].Text;
        txtBarcode.Text = grdResources.SelectedRow.Cells[6].Text;
        drpAvailability.Text = grdResources.SelectedRow.Cells[7].Text;
    }

    void DeleteBook(int bookid)
    {
        resource.DeleteBook(bookid);
    }

    void DeleteAV(int subjectareaid)
    {
        resource.DeleteAV(subjectareaid);
    }

    void DeleteMulti(int multimediaid)
    {
        resource.DeleteMulti(multimediaid);    
    }

    void SearchTitle(string search)
    {
        resource.SearchBookTitle(search);
    }

    void SearchSeries(string search)
    {
        resource.SearchBookSeries(search);
    }

    void SearchAuthor(string search)
    {
        resource.SearchBookAuthor(search);
    }

    void SearchCall(string search)
    {
        resource.SearchBookCallNumber(search);
    }

    void SearchMultimediaTitle(string search)
    {
        reserve.SearchMultiTitle(search);
    }

    void SearchMultimediaDirector(string search)
    {
        reserve.SearchDirector(search);
    }

    void SearchMultimediaGenre(string search)
    {
        reserve.SearchGenre(search);
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

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        AddBookCatalog(txtALName.Text, txtAFName.Text, txtAMName.Text, txtTitle.Text, 
            txtISBN.Text, txtItem.Text, txtSeries.Text, txtPublisher.Text,
            txtCatalogNo.Text, txtBarcode.Text, txtCall.Text, txtDate.Text, txtCopyNo.Text);
        ViewBooks();

        txtALName.Text = ""; txtAFName.Text = ""; txtAMName.Text = ""; txtTitle.Text = ""; 
            txtISBN.Text = ""; txtItem.Text = ""; txtSeries.Text = ""; txtPublisher.Text ="";
            txtCatalogNo.Text = ""; txtBarcode.Text = "";
            txtCall.Text = ""; txtDate.Text = ""; txtCopyNo.Text = "";
    }

    protected void btnAddAV_Click(object sender, EventArgs e)
    {
        AddAV(txtBrand.Text, txtAssetNo.Text, drpType.Text, txtSerialNo.Text, txtModel.Text);
        ViewAV();
        txtBrand.Text = ""; txtAssetNo.Text = ""; txtSerialNo.Text = ""; txtModel.Text = "";
    }

    protected void btnUpdateAV_Click(object sender, EventArgs e)
    {
        UpdateAV(int.Parse(grdResources.SelectedRow.Cells[1].Text), txtBrand.Text, txtAssetNo.Text, 
            drpType.Text, txtSerialNo.Text, txtModel.Text, drpAvailability.Text);
        ViewAV();
        txtBrand.Text = ""; txtAssetNo.Text = ""; txtSerialNo.Text = ""; txtModel.Text = "";

        btnAddAV.Visible = true;
    }

    protected void btnMultiAdd_Click(object sender, EventArgs e)
    {
        AddMulti(txtMultiTitle.Text, txtDirector.Text, DateTime.Parse(txtRelease.Text), drpGenre.Text, txtMultiBarcode.Text);
        ViewMulti();

        txtMultiTitle.Text = ""; txtDirector.Text = ""; txtRelease.Text = ""; txtMultiBarcode.Text = "";
    }

    protected void btnUpdateMulti_Click(object sender, EventArgs e)
    {
        UpdateMulti(int.Parse(grdResources.SelectedRow.Cells[1].Text), txtMultiTitle.Text, txtDirector.Text, 
            Convert.ToDateTime(txtRelease.Text), drpGenre.Text, txtMultiBarcode.Text, drpAvailMulti.Text);
        ViewMulti();
        txtMultiTitle.Text = ""; txtDirector.Text = ""; txtRelease.Text = ""; txtMultiBarcode.Text = "";
        btnMultiAdd.Visible = true;
    }

    protected void btnDelAV_Click(object sender, EventArgs e)
    {
        DeleteAV(int.Parse(grdResources.SelectedRow.Cells[1].Text));
        ViewAV();
    }

    protected void btnDelMulti_Click(object sender, EventArgs e)
    {
        DeleteMulti(int.Parse(grdResources.SelectedRow.Cells[1].Text));
        ViewMulti();
    }

    protected void drpSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpSelect.SelectedValue == "Book")
        {
            Toggle.Visible = false;
            BookCatalog.Visible = true;
            AVAsset.Visible = false;
            Multimedia.Visible = false;
            PanelGrid.Visible = true;
            PanelResources.Visible = true;
            btnAdd.Visible = true;
            ViewBooks();
        }
        else if(drpSelect.SelectedValue == "AV Asset")
        {
            Toggle.Visible = false;
            AVAsset.Visible = true;
            BookCatalog.Visible = false;
            Multimedia.Visible = false;
            PanelGrid.Visible = true;
            PanelResources.Visible = true;
            btnAddAV.Visible = true;
            ViewAV();
        }
        else if (drpSelect.SelectedValue == "Multimedia")
        {
            Toggle.Visible = false;
            Multimedia.Visible = true;
            BookCatalog.Visible = false;
            AVAsset.Visible = false;
            PanelGrid.Visible = true;
            PanelResources.Visible = true;
            btnMultiAdd.Visible = true;
            ViewMulti();
        }
        else if (drpSelect.SelectedValue == "Choose Here")
        {
            Toggle.Visible = true;
            BookCatalog.Visible = false;
            AVAsset.Visible = false;
            Multimedia.Visible = false;
            PanelResources.Visible = false;
        }
    }
    protected void grdResources_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnAdd.Visible = false; btnAddAV.Visible = false; btnMultiAdd.Visible = false; 
        btnCancelBookCatalog.Visible = true; btnCancelAVCatalog.Visible = true; 
        btnCancelMultiCatalog.Visible = true; 

        if (drpSelect.SelectedValue == "Book")
        {
            ViewBookCatalog(); PanelGrid.Visible = true;
        }
        else if (drpSelect.SelectedValue == "AV Asset")
        {
            ViewAVAsset(); PanelGrid.Visible = true; 
        }
        else if (drpSelect.SelectedValue == "Multimedia")
        {
            ViewMultimedia(); PanelGrid.Visible = true; 
        }
        else
        {
            BookCatalog.Visible = false;
            AVAsset.Visible = false;
            Multimedia.Visible = false;
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UpdateBook(int.Parse(grdResources.SelectedRow.Cells[1].Text), 
            txtALName.Text, txtAFName.Text, txtAMName.Text, txtTitle.Text,
            txtISBN.Text, txtItem.Text, txtSeries.Text, txtPublisher.Text, 
            txtCatalogNo.Text, txtBarcode.Text, txtCall.Text, txtDate.Text, txtCopyNo.Text);
        ViewBooks();

        txtALName.Text = ""; txtAFName.Text = ""; txtAMName.Text = ""; txtTitle.Text = "";
        txtISBN.Text = ""; txtItem.Text = ""; txtSeries.Text = ""; txtPublisher.Text = "";
        txtCatalogNo.Text = ""; txtBarcode.Text = ""; txtCall.Text = ""; txtDate.Text = ""; txtCopyNo.Text = "";

        btnAdd.Visible = true;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        DeleteBook(int.Parse(grdResources.SelectedRow.Cells[1].Text));
    }

    protected void btnCancelBookCatalog_Click(object sender, EventArgs e)
    {
        BookCatalog.Visible = true; btnAdd.Visible = true;
    }

    protected void btnCancelAVCatalog_Click(object sender, EventArgs e)
    {
        AVAsset.Visible = true; btnAddAV.Visible = true;
    }

    protected void btnCancelMultiCatalog_Click(object sender, EventArgs e)
    {
        Multimedia.Visible = true; btnMultiAdd.Visible = true;
    }

    protected void btnBookTitle_Click(object sender, EventArgs e)
    {
        SearchTitle(txtSearch.Text);
        grdResources.DataSource = resource.SearchBookTitle(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnSearchAuthor_Click(object sender, EventArgs e)
    {
        SearchAuthor(txtSearch.Text);
        grdResources.DataSource = resource.SearchBookAuthor(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnSearchCall_Click(object sender, EventArgs e)
    {
        SearchCall(txtSearch.Text);
        grdResources.DataSource = resource.SearchBookCallNumber(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnSearchSeries_Click(object sender, EventArgs e)
    {
        SearchSeries(txtSearch.Text);
        grdResources.DataSource = resource.SearchBookSeries(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnMultiTitle_Click(object sender, EventArgs e)
    {
        SearchMultimediaTitle(txtSearch.Text);
        grdResources.DataSource = reserve.SearchMultiTitle(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnDirector_Click(object sender, EventArgs e)
    {
        SearchMultimediaDirector(txtSearch.Text);
        grdResources.DataSource = reserve.SearchDirector(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnGenre_Click(object sender, EventArgs e)
    {
        SearchMultimediaGenre(txtSearch.Text);
        grdResources.DataSource = reserve.SearchGenre(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnBrand_Click(object sender, EventArgs e)
    {
        SearchBrand(txtSearch.Text);
        grdResources.DataSource = reserve.SearchAVAssetBrand(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnType_Click(object sender, EventArgs e)
    {
        SearchType(txtSearch.Text);
        grdResources.DataSource = reserve.SearchAVAssetType(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void btnModel_Click(object sender, EventArgs e)
    {
        SearchModel(txtSearch.Text);
        grdResources.DataSource = reserve.SearchAVAssetModel(txtSearch.Text);
        grdResources.DataBind();
        PanelGrid.Visible = true;
    }

    protected void grdResources_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (drpSelect.SelectedValue == "Book")
        {
            ViewBooks();
            grdResources.PageIndex = e.NewPageIndex;
            grdResources.DataBind();
        }
        else if (drpSelect.SelectedValue == "AV Asset")
        {
            ViewAV();
            grdResources.PageIndex = e.NewPageIndex;
            grdResources.DataBind();
        }
        else if (drpSelect.SelectedValue == "Multimedia")
        {
            ViewMulti();
            grdResources.PageIndex = e.NewPageIndex;
            grdResources.DataBind();
        }
    }
}