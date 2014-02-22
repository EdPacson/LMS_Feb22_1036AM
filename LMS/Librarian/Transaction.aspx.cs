using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Librarian_Transaction : System.Web.UI.Page
{
    Circulation asset = new Circulation();//get penalties and borrow/return actions
    Account account = new Account();//search account
    Resource resource = new Resource();//get book/multimedia info
    AuditTrail audit = new AuditTrail();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] == null || Session["UserType"] == null)
            Response.Redirect("../Login.aspx");
        if (!Session["UserType"].ToString().Equals("Librarian"))
            Response.Redirect("../Login.aspx");
        grdAuditTrail.DataSource = audit.GetAuditTrailByUserType("Librarian");
        grdAuditTrail.DataBind();   
    }

    protected void btnTransact_Click(object sender, EventArgs e)
    {
        if (LabelSelectionIndicator.Visible)
        {
            asset.ReturnAsset(Convert.ToInt32(txtAccountID.Text), Convert.ToInt32(lblAssetNo.Text), lblAssetType.Text, Session["Name"].ToString(), drpRecordType.SelectedValue);
            if (!drpRecordType.Equals("Good Condition"))
                Response.Redirect("Transaction.aspx");
            Response.Write("<script>alert('You have returned an asset.')</script>");
        }
        else
        {
            asset.BorrowAsset(Convert.ToInt32(txtAccountID.Text), Convert.ToInt32(lblAssetNo.Text), lblAssetType.Text, Session["Name"].ToString(), drpRecordType.SelectedValue);
            Response.Write("<script>alert('You have borrowed an asset.')</script>");
        }

        CheckSelectionIndicator();
    }

    protected void btnBarcode_Click(object sender, EventArgs e)
    {
        bool assetIsOk = true;
        if (asset.CheckIfBookExists(txtBarcode.Text))
        {
            GetBookInfo(txtBarcode.Text);
            AssetControl(true);
            if (resource.InStock <= 0)
            {
                assetIsOk = false;
                lblAvailability.Text = "Unavailable";
                lblAvailability.ForeColor = System.Drawing.Color.Red;
            }
            else
                assetIsOk = true;

            lblAssetType.Text = "Book";

            if (!txtAccountID.Enabled)
            {
                if (lblAssetType.Text.Equals("Book"))
                {
                    if (asset.CheckIfBookCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                    {
                        LabelSelectionIndicator.Visible = true;
                    }
                }
                else
                {
                    if (asset.CheckIfMultimediaCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                    {
                        LabelSelectionIndicator.Visible = true;
                    }
                }
            }
        }

        //if multimedia
        else if (asset.CheckIfMultimediaExists(txtBarcode.Text))// multimedia
        {
            GetMultimediaInfo(txtBarcode.Text);
            AssetControl(true);
            if (resource.MultimediaAvailability.Equals("Unavailable"))
            {
                assetIsOk = false;
                lblAvailability.ForeColor = System.Drawing.Color.Red;
            }
            else
                assetIsOk = true;

            lblAssetType.Text = "Multimedia";
        }
        else
        {
            Label4.Visible = true;
        }

        btnTransact.Enabled = (assetIsOk && !txtAccountID.Enabled);
    }

    void CheckSelectionIndicator()
    {
        lblAvailability.ForeColor = System.Drawing.Color.Black;
        LabelSelectionIndicator.Visible = false;

        if (lblAssetType.Text.Equals("Book"))
        {
            if (asset.CheckIfBookExists(lblBarcode.Text))
            {
                GetBookInfo(lblBarcode.Text);
                if (resource.InStock <= 0)
                {
                    lblAvailability.Text = "Unavailable";
                    lblAvailability.ForeColor = System.Drawing.Color.Red;
                }

                if (asset.CheckIfBookCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                {
                    LabelSelectionIndicator.Visible = true;
                }
            }
        }
        else
        {
            if (asset.CheckIfMultimediaExists(lblBarcode.Text))// multimedia
            {
                GetMultimediaInfo(lblBarcode.Text);
                if (resource.MultimediaAvailability.Equals("Unavailable"))
                {
                    lblAvailability.ForeColor = System.Drawing.Color.Red;
                }

                if (asset.CheckIfMultimediaCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                {
                    LabelSelectionIndicator.Visible = true;
                }
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (account.CheckIfAccountExist(Convert.ToInt32(txtAccountID.Text)))
        {
            if (asset.CheckIfAccountHasPenalty(Convert.ToInt32(txtAccountID.Text)))
                AccountControl(false, true);
            else
                AccountControl(false);

            GetAccountInfo(txtAccountID.Text);
        }
        else
            Label1.Visible = true;

        if (PanelBookInfo.Visible)
        {
            if (lblAssetType.Text.Equals("Book"))
            {
                if (asset.CheckIfBookCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                {
                    LabelSelectionIndicator.Visible = true;
                }
            }
            else
            {
                if (asset.CheckIfMultimediaCirculationExist(txtAccountID.Text, lblAssetNo.Text))
                {
                    LabelSelectionIndicator.Visible = true;
                }
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        AssetControl(false);
    }

    protected void btnBackSearch_Click(object sender, EventArgs e)
    {
        AccountControl(true);
        AssetControl(false);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transaction.aspx");
    }

    void AccountControl(bool visible, bool hasPenalty = false)
    {
        PanelStudentInfo.Visible = !visible;
        btnSearch.Visible = visible;
        btnBackSearch.Visible = !visible;
        txtAccountID.Enabled = visible;
        btnTransact.Enabled = !visible;

        Label1.Visible = false;
        if (hasPenalty)
        {
            PanelBookInfo.Visible = false;
            PanelBarcode.Visible = false;
            PanelControl.Visible = false;
        }
        Label3.Visible = hasPenalty;
    }

    void AssetControl(bool visible)
    {
        PanelBookInfo.Visible = visible;
        PanelBarcode.Visible = !visible;
        PanelControl.Visible = visible;
        Label4.Visible = false;
        lblAvailability.ForeColor = System.Drawing.Color.Black;
        LabelSelectionIndicator.Visible = false;
    }

    void GetBookInfo(string barcode)
    {
        string value = barcode;
        resource = resource.GetBookInfoByBarcode(value);
        lblTitle.Text = resource.Title;
        lblAuthor.Text = resource.Author;
        lblPublished.Text = string.Format("{0:d}", Convert.ToDateTime(resource.DatePublished));
        lblBarcode.Text = txtBarcode.Text;
        lblAvailability.Text = resource.Availability;
        lblAvailStock.Text = resource.InStock.ToString();
        lblAssetNo.Text = resource.BookID.ToString();
    }

    void GetMultimediaInfo(string barcode)
    {
        string value = barcode;
        resource = resource.GetMultimediaInfoByID(value);
        lblTitle.Text = resource.MultimediaTitle;
        lblAuthor.Text = resource.Director;
        lblPublished.Text = string.Format("{0:d}", Convert.ToDateTime(resource.ReleaseDate));
        lblBarcode.Text = txtBarcode.Text;
        lblAvailability.Text = resource.MultimediaAvailability;
        lblAvailStock.Text = "NA";
        lblAssetNo.Text = resource.MultimediaID.ToString();
    }

    void GetAccountInfo(string accountid)
    {
        int value = Convert.ToInt32(txtAccountID.Text);
        account = account.GetAccountInfo(Convert.ToInt32(value));
        LblStudentName.Text = string.Format("{0}, {1} {2}", account.LastName, account.FirstName, account.MiddleName);
        lblBalance.Text = string.Format("PHP {0:f2}", account.EPurseBalance);
        lblUsertype.Text = account.UserType;
        lblStatus.Text = account.AccountStatus;
    }

    void GetAudit(string usertype)
    {
        grdAuditTrail.DataSource = audit.GetAuditTrailByUserType(usertype);
        grdAuditTrail.DataBind();
    }
}