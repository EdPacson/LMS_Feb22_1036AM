<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/STUP.master" AutoEventWireup="true"
    CodeFile="Reservation.aspx.cs" Inherits="StudentFaculty_Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" runat="Server">
    <title>Reservation &diams; Library MS</title>
    <style type="text/css">
        .navReq
        {
            background-color: #15A65A;
            font-weight: bold;
        }
        .rightMenu
        {
            position: relative;
            float: right;
        }
        .right-caret
        {
            border-bottom: 2px solid transparent;
            border-top: 2px solid transparent;
            border-left: 2px solid #FFF;
            display: inline-block;
            height: 0;
            opacity: 1;
            vertical-align: top;
            width: 0;
        }
        .right
        {
            float: right;
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" runat="Server">
    <asp:Panel ID="PanelControl" runat="server">
        <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanReserve1.png" width="35" height="35" /></td>
            <td><h4>Reservation</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>Welcome! If you would like to reserve Books or Audio Visual resources, please do so on this page. To begin, search for a title / AV first.</p></td>
        </tr>
    </table>
        <table class="table">
            <tr>
                <td>
                    Search
                </td>
                <td>
                    <asp:TextBox ID="txtSearch" runat="server" pattern="^[a-zA-Z0-9,.\/\- ]+$"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqSearch" ControlToValidate="txtSearch" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" ValidationGroup="StudFacRequest" Display="Dynamic"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-success aspButton" data-toggle="dropdown" href="#">Search &rsaquo;&rsaquo;&rsaquo; </a>
                        <ul class="dropdown-menu rightMenu">
                            <li>
                                <asp:LinkButton ID="btnSearchBookTitle" ValidationGroup="StudFacRequest" runat="server" 
                                OnClick="btnSearchBookTitle_Click">Title</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnSeries" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnSeries_Click">Series</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnBookAuthor" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnBookAuthor_Click">Author</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnBookCall" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnBookCall_Click">Call Number</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnAssetBrand" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnAssetBrand_Click">AV Asset Brand</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnAssetType" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnAssetType_Click">AV Asset Type</asp:LinkButton></li>
                            <li>
                                <asp:LinkButton ID="btnAssetModel" runat="server" ValidationGroup="StudFacRequest" 
                                OnClick="btnAssetModel_Click">AV Asset Model</asp:LinkButton></li>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" runat="Server">
    <asp:Panel ID="PanelBook" runat="server" Visible="False">
        <h1>Book Search</h1>
        <asp:GridView ID="grdBook" runat="server" AutoGenerateColumns="False" OnRowCommand="grdBook_RowCommand"
            PagerSettings-Mode="Numeric"  PageButtonCount="4" 
            OnPageIndexChanging="grdBook_PageIndexChanging" 
            CssClass="table table-hover" AllowPaging="True" PageSize="5" 
            HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="Barcode" HeaderText="Control No. #" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Title" HeaderText="Title" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Author's Name" HeaderText="Author" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField HeaderText="Availability" DataField="Availability" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:ButtonField CommandName="ViewDetails" ButtonType="Image" ControlStyle-Height="30" ControlStyle-Width="100" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" ImageUrl="~/assets/img/btnDetails01.png"/>
            </Columns>
            <EmptyDataTemplate>
            <h4>No Records Found!</h4>
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="PanelAVAsset" runat="server" Visible="False">
        <h1>Audio Visual Asset Search</h1>
        <asp:GridView ID="grdAsset" runat="server" AutoGenerateColumns="False" OnRowCommand="grdAsset_RowCommand"
        PagerSettings-Mode="Numeric"  PageButtonCount="4" 
        OnPageIndexChanging="grdAsset_PageIndexChanging" 
        CssClass="table table-hover" AllowPaging="True" PageSize="5" 
        HorizontalAlign="Center">

            <Columns>
                <asp:BoundField DataField="AssetNo" HeaderText="Control No.#"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="AVAssetID" HeaderText="Class No.#"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Brand" HeaderText="Brand"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Type" HeaderText="Asset Type"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Model" HeaderText="Model"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Availability" HeaderText="Availability"  HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:ButtonField CommandName="ViewDetails" ButtonType="Image" ControlStyle-Height="30" ControlStyle-Width="100" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" ImageUrl="~/assets/img/btnDetails01.png"/>
            </Columns>
            <EmptyDataTemplate>
            <h4>No Records Found!</h4>
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="PanelBookDetails" runat="server" Visible="False">
        <h1>
            Book Information</h1>
            <asp:Label ID="lblbookID" runat="server" Visible="false" Text="BookID" />
        <table class="table table-hover table-striped">
        <tr>
                <td>
                    Title
                </td>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text="Title" />
                </td>
            </tr><tr>    <td>
                    Item Description
                </td>
                <td>
                    <asp:Label ID="lblItem" runat="server" Text="Item" />
                </td>
            </tr><tr>    <td>
                    Series
                </td>
                <td>
                    <asp:Label ID="lblSeries" runat="server" Text="Series" />
                </td>
             </tr><tr>   <td>
                    Author
                </td>
                <td>
                    <asp:Label ID="lblAuthor" runat="server" Text="Author" />
                </td>
           </tr><tr>     <td>
                    Publisher
                </td>
                <td>
                    <asp:Label ID="lblPublisher" runat="server" Text="Publisher" />
                </td>
            </tr><tr>    <td>
                    Date Published
                </td>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date" />
                </td>
            </tr><tr>    <td>
                    Call Number
                </td>
                 <td>
                    <asp:Label ID="lblCall" runat="server" Text="Call" />
                </td>
            </tr><tr>    <td>
                    Catalog No
                </td>
                <td>
                    <asp:Label ID="lblCatalogNo" runat="server" Text="CatalogNo" />
                </td>
            </tr>
            <tr>
                <td>
                    Copy&nbsp; No.</td>
                <td>
                    <asp:Label ID="lblCopyNo" runat="server" Text="CopyNo"></asp:Label>
                </td>
            </tr>
            <tr>    <td>
                    Availability
                </td>
                <td>
                    <asp:Label ID="lblAvailability" runat="server" Text="Availability" />
                </td>
            </tr>
        </table>
        <asp:Label ID="LabelBookNotification" runat="server" Text="<i class='icon-check-sign'></i>&nbsp;You reserved this." Visible="false" class="aspLabel label label-success"/><br />
        <br /><asp:LinkButton ID="btnReserveBook" runat="server" 
            CssClass="btn btn-success btn-large aspButton" onclick="btnReserveBook_Click" 
            CausesValidation="False" ><i class="icon-star-empty"></i>&nbsp;&nbsp; Reserve</asp:LinkButton>
        <asp:LinkButton ID="btnCancelBookReservation" runat="server"
            CssClass="btn btn-danger aspButton btn-large" onclick="btnCancelBookReservation_Click" 
            Visible="False" CausesValidation="False"><i class="icon-remove-sign"></i>&nbsp;&nbsp; Cancel Reservation</asp:LinkButton>
        <asp:LinkButton ID="btnBookBack" runat="server"
            CssClass="btn btn-warning aspButton btn-large" onclick="btnBookBack_Click" 
            CausesValidation="False"><i class="icon-chevron-left"></i>&nbsp;&nbsp; Back</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="PanelAVAssetDetails" runat="server" Visible="False">
    <h1>Audio Visual Asset Information</h1>
        <table class="table table-hover">
            <tr>
                <td>
                    Class No.#
                </td>
                <td>
                    <asp:Label ID="lblAVAsset" runat="server" Text="Asset No" />
                </td>
            </tr>
            <tr>
                <td>
                    Brand
                </td>
                <td>
                    <asp:Label ID="lblAVBrand" runat="server" Text="Brand" />
                </td>
            </tr>
            <tr>
                <td>
                    Type
                </td>
                <td>
                    <asp:Label ID="lblAVType" runat="server" Text="Type" />
                </td>
            </tr>
            <tr>
                <td>
                    Serial Number
                </td>
                <td>
                    <asp:Label ID="lblAVSerialNo" runat="server" Text="SerialNo" />
                </td>
            </tr>
            <tr>
                <td>
                    Model
                </td>
                <td>
                    <asp:Label ID="lblAVModel" runat="server" Text="Model" />
                </td>
            </tr>
            <tr>
                <td>
                    Availability
                </td>
                <td>
                    <asp:Label ID="lblAVAvailability" runat="server" Text="Availability" />
                </td>
            </tr>
        </table>
        <asp:Label ID="LabelAVAssetNotification" runat="server" Text="<i class='icon-check-sign'></i>&nbsp;You reserved this." Visible="false" class="aspLabel label label-success"/><br />
        <br /><asp:LinkButton ID="btnReserveAVAsset" runat="server"
            CssClass="btn btn-success" onclick="btnReserveAVAsset_Click" 
            CausesValidation="False"><i class="icon-star-empty"></i>&nbsp;&nbsp; Reserve</asp:LinkButton>
        <asp:Button ID="btnCancelAssetReservation" runat="server" Text="Cancel Reservation" 
            CssClass="btn btn-primary" onclick="btnCancelAssetReservation_Click" 
            Visible="False" CausesValidation="False"/>
        <asp:Button ID="btnAVBack" runat="server" Text="Back" 
            CssClass="btn btn-warning" onclick="btnAVBack_Click" 
            CausesValidation="False" />
    </asp:Panel>
</asp:Content>
