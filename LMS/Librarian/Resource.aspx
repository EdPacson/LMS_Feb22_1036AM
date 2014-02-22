<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true" CodeFile="Resource.aspx.cs" Inherits="Librarian_Resource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Resources &diams; Library MS</title>
    <style type="text/css">
        .navRes
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
           .rightMenu {
            position:relative;
            float:right;
        }
        .right-caret {

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
            float:right;
            position: relative;          
        }              
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <h4>Resources</h4>
    <p>Please choose what record you would like to view.</p>
    <asp:Panel ID="DropDown" runat="server">
        <asp:DropDownList ID="drpSelect" runat="server" AutoPostBack="true"
            onselectedindexchanged="drpSelect_SelectedIndexChanged" CssClass="ddl" Width="215px">
            <asp:ListItem>Choose Here</asp:ListItem>
            <asp:ListItem>Book</asp:ListItem>
            <asp:ListItem>AV Asset</asp:ListItem>
            <asp:ListItem>Multimedia</asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
    <asp:Panel ID="BookCatalog" runat="server" Visible="false">
    <table class="table">
        <tr>
            <td>Author&#39;s Last Name</td>
            <td class="style1">
                <asp:TextBox ID="txtALName" runat="server" pattern="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z' ])?[a-zA-Z]*)*$" 
                placeholder="Denver"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfield1" controltovalidate="txtALName"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Author&#39;s First Name</td>
            <td class="style1">
                <asp:TextBox ID="txtAFName" runat="server" pattern="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" 
                placeholder="Carl"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfield2" controltovalidate="txtAFName"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Authors&#39;s Middle Name
            </td>
            <td>
                <asp:TextBox ID="txtAMName" runat="server" pattern="^[A-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" placeholder="Ray"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield3" controltovalidate="txtAMName"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Title</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" pattern="^[A-Za-z0-9 ]*[A-Za-z0-9][A-Za-z0-9 ]*$" placeholder="Book Title"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield4" controltovalidate="txtTitle"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                ISBN
            </td>
            <td>
                <asp:TextBox ID="txtISBN" runat="server" data-mask="999-99-999-9999-9" class="inputmask" placeholder="000-00-000-0000-000"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield5" controltovalidate="txtISBN"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Item Description</td>
            <td>
                
                <asp:TextBox ID="txtItem" runat="server" TextMode="MultiLine" placeholder="Item Description" Width="150px" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield6" controltovalidate="txtItem"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<i class='icon-exclamation'></i> &nbsp; Invalid Character/s!" CssClass="alert alert-error" 
                ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ControlToValidate="txtItem" Display="Dynamic" ValidationGroup="LibResourcesBook"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Series</td>
            <td>
                <asp:TextBox ID="txtSeries" runat="server" placeholder="eg. Vol.1" pattern="^[a-zA-Z0-9. ]+$"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield7" controltovalidate="txtSeries"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Publisher</td>
            <td>
                <asp:TextBox ID="txtPublisher" runat="server" placeholder="Publisher Name" pattern="^[a-zA-Z'. ]+$"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield8" controltovalidate="txtSeries"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Barcode
            </td>
            <td>
                <asp:TextBox ID="txtBarcode" runat="server" data-mask="9999999999" class="inputmask" placeholder="0000000000"></asp:TextBox>
<br />
                <asp:requiredfieldvalidator id="Requiredfield11" controltovalidate="txtBarcode"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Call Number</td>
            <td>
                <asp:TextBox ID="txtCall" runat="server" placeholder="CE" pattern="^[a-zA-Z0-9]+$"></asp:TextBox>

                 <asp:requiredfieldvalidator id="Requiredfieldvalidator9" controltovalidate="txtCall"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Catalog No.</td>
            <td>
                <asp:TextBox ID="txtCatalogNo" placeholder="SBRO 345 2010" pattern="^[a-zA-Z0-9 ]+$" runat="server"></asp:TextBox>
                <br />
                 <asp:requiredfieldvalidator id="Requiredfieldvalidator10" controltovalidate="txtCatalogNo"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>
                Date Published&nbsp;
            </td>
            <td>
                <div ID="dpYears" class="input-append date" data-date="2013-11-06" 
                    data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                    <asp:TextBox ID="txtDate" runat="server" Width="120px"></asp:TextBox>
                    <span class="add-on" id="custom"><i class="icon-calendar"></i></span>
                </div>
                <br />
                <asp:RequiredFieldValidator ID="Requiredfield12" runat="server" 
                    controltovalidate="txtDate" CssClass="label label-important aspLabel" 
                    Display="Dynamic" 
                    errormessage="&lt;i class='icon-exclamation-sign'&gt;&lt;/i&gt; &nbsp;Required" 
                    validationgroup="LibResourcesBook" />
                    <br />
                <asp:RangeValidator ID="RangeV1" runat="server" ControlToValidate="txtDate" 
                    CssClass="label label-important aspLabel" Display="Dynamic" 
                    ErrorMessage="&lt;i class='icon-exclamation-sign'&gt;&lt;/i&gt; &nbsp; 2013 or below only" 
                    MaximumValue="12/31/2013" MinimumValue="1/1/2007" Type="Date" 
                    validationgroup="LibResourcesBook" />
            </td>
        </tr>
        <tr>
            <td>
                Copy No.</td>
            <td>
                <asp:TextBox ID="txtCopyNo" runat="server" placeholder="Copy1" pattern="^[a-zA-Z0-9]+$"></asp:TextBox>

                 <asp:requiredfieldvalidator id="Requiredfieldvalidator11" controltovalidate="txtCopyNo"
                validationgroup="LibResourcesBook" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:LinkButton ID="btnAdd" runat="server" onclick="btnAdd_Click" validationgroup="LibResourcesBook" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-plus"></i>&nbsp;&nbsp;Add
                </asp:LinkButton>
                
                <asp:LinkButton ID="btnUpdate" runat="server"
                    onclick="btnUpdate_Click" validationgroup="LibResourcesBook" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-pencil"></i>&nbsp;&nbsp;Update
                </asp:LinkButton>
                <asp:LinkButton ID="btnDelete" runat="server" 
                    onclick="btnDelete_Click" CausesValidation="false" CssClass="aspButton btn btn-danger btn-block">
                    <i class="icon-minus"></i>&nbsp;>&nbsp;Delete
                </asp:LinkButton>

                <asp:LinkButton ID="btnCancelBookCatalog" runat="server" Text="Cancel" CssClass="aspButton btn btn-warning btn-block"
                    onclick="btnCancelBookCatalog_Click" CausesValidation="false">
                    <i class="icon-undo"></i>&nbsp;&nbsp;Cancel
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="AVAsset" runat="server" Visible="False">
    <table class="table">
        <tr>
            <td>Brand</td>
            <td>
                <asp:TextBox ID="txtBrand" runat="server" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z' ]*)*$" placeholder="Brand Name"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator1" controltovalidate="txtBrand"
                validationgroup="LibResourcesAsset" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" />   </td>
        </tr>
        <tr>
            <td>
                Asset No.</td>
            <td>
                <asp:TextBox ID="txtAssetNo" runat="server" data-mask="9999999999" class="inputmask" placeholder="0000000000"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator2" controltovalidate="txtAssetNo"
                validationgroup="LibResourcesAsset" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" />   </td>
        </tr>
        <tr>
            <td>
                Type</td>
            <td>
                <asp:DropDownList ID="drpType" runat="server" CssClass="dll3" Width="165px">
                    <asp:ListItem>CD</asp:ListItem>
                    <asp:ListItem>DVD</asp:ListItem>
                    <asp:ListItem>VHS</asp:ListItem>
                    <asp:ListItem>DVD Player</asp:ListItem>
                    <asp:ListItem>Extension Cord</asp:ListItem>
                    <asp:ListItem>Projector with Remote</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Serial No.</td>
            <td>
                <asp:TextBox ID="txtSerialNo" runat="server" data-mask="999999999999" class="inputmask" placeholder="000000000000"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator3" controltovalidate="txtSerialNo"
                validationgroup="LibResourcesAsset" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" />            
            </td>
        </tr>
        <tr>
            <td>
                Model</td>
            <td>
                <asp:TextBox ID="txtModel" runat="server" pattern="^[a-zA-Z0-9]+$" placeholder="Product Model"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator4" controltovalidate="txtModel"
                validationgroup="LibResourcesAsset" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" /> 
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Availability" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpAvailability" runat="server" Visible="False">
                    <asp:ListItem>Available</asp:ListItem>
                    <asp:ListItem>Unavailable</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="btnAddAV" runat="server" onclick="btnAddAV_Click" validationgroup="LibResourcesAsset" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-plus"></i>&nbsp;&nbsp;Add
                </asp:LinkButton>
                <asp:LinkButton ID="btnUpdateAV" validationgroup="LibResourcesAsset" runat="server" 
                    onclick="btnUpdateAV_Click" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-pencil"></i>&nbsp;&nbsp;Update    
                </asp:LinkButton>
                <asp:LinkButton ID="btnDelAV" runat="server" CausesValidation="false" 
                    onclick="btnDelAV_Click" CssClass="aspButton btn btn-danger btn-block">
                    <i class="icon-minus"></i>&nbsp;&nbsp;Delete
                </asp:LinkButton>
                <asp:LinkButton ID="btnCancelAVCatalog" runat="server" CssClass="aspButton btn btn-warning btn-block"
                    onclick="btnCancelAVCatalog_Click" CausesValidation="false">
                    <i class="icon-undo"></i>&nbsp;&nbsp;Cancel
                </asp:LinkButton>
            </td>
            <td></td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="Multimedia" runat="server" Visible="False">
    <table class="table">
        <tr>
            <td>Title</td>
            <td>
                <asp:TextBox ID="txtMultiTitle" runat="server" pattern="^[A-Za-z0-9': ]*[A-Za-z0-9': ][A-Za-z0-9': ]*$" placeholder="Movie Title"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator5" controltovalidate="txtMultiTitle"
                validationgroup="LibResourcesMulti" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" /> 
            </td>
        </tr>
        <tr>
            <td>
                Director</td>
            <td>
                <asp:TextBox ID="txtDirector" runat="server" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z' ])?[a-zA-Z' ]*)*$"
                placeholder="KJ Rowling"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator6" controltovalidate="txtDirector"
                validationgroup="LibResourcesMulti" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Release Date</td>
            <td>
              <div class="input-append date" id="dpYears" data-date="2013-11-06" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                <asp:TextBox ID="txtRelease" runat="server" Width="120px"></asp:TextBox>
				<span class="add-on" id="custom"><i class="icon-calendar"></i></span>
			  </div>
              <asp:requiredfieldvalidator id="Requiredfieldvalidator7" controltovalidate="txtRelease"
                validationgroup="LibResourcesMulti" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" />
            </td>

        </tr>
        <tr>
            <td>
                Genre</td>
            <td>
                <asp:DropDownList ID="drpGenre" runat="server" Width="165px" CssClass="dll3">
                    <asp:ListItem>Action</asp:ListItem>
                    <asp:ListItem>Comedy</asp:ListItem>
                    <asp:ListItem>Documentary</asp:ListItem>
                    <asp:ListItem>Drama</asp:ListItem>
                    <asp:ListItem>Horror</asp:ListItem>
                    <asp:ListItem>Musical</asp:ListItem>
                    <asp:ListItem>Parody</asp:ListItem>
                    <asp:ListItem>Stage Play</asp:ListItem>
                    <asp:ListItem>Sci-Fi</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Barcode</td>
            <td>
                <asp:TextBox ID="txtMultiBarcode" runat="server" data-mask="9999999999" class="inputmask" placeholder="0000000000"></asp:TextBox>
                <br />
                <asp:requiredfieldvalidator id="Requiredfieldvalidator8" controltovalidate="txtSerialNo"
                validationgroup="LibResourcesMulti" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" />         
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Availability" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="drpAvailMulti" runat="server" Visible="False" CssClass="dll3" Width="165px">
                    <asp:ListItem>Available</asp:ListItem>
                    <asp:ListItem>Unavailable</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="btnMultiAdd" runat="server" validationgroup="LibResourcesMulti" 
                    onclick="btnMultiAdd_Click" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-plus"></i>&nbsp;&nbsp;Add
                </asp:LinkButton>
                <asp:LinkButton ID="btnUpdateMulti" runat="server" validationgroup="LibResourcesMulti" 
                    onclick="btnUpdateMulti_Click" CssClass="aspButton btn btn-success btn-block">
                    <i class="icon-pencil"></i>&nbsp;&nbsp;Update
                </asp:LinkButton>
                <asp:LinkButton ID="btnDelMulti" runat="server" CausesValidation="false"
                    onclick="btnDelMulti_Click" CssClass="aspButton btn btn-danger btn-block">
                    <i class="icon-minus"></i>&nbsp;&nbsp;Delete
                </asp:LinkButton>
                <asp:LinkButton ID="btnCancelMultiCatalog" runat="server" CssClass="aspButton btn btn-warning btn-block"
                    onclick="btnCancelMultiCatalog_Click" CausesValidation="false">
                    <i class="icon-undo"></i>&nbsp;&nbsp;Cancel
                </asp:LinkButton>
            </td>
            <td></td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="Toggle" runat="server">
        <h4><img src="../assets/img/spanIMGS/spanClick1.png" width="64" height="64" alt="" />To get started, please access the controls on the left.</h4>
    </asp:Panel>
    <asp:Panel ID="PanelGrid" runat="server">
        <table>
            <tr>
            <td>Search</td>
            <td><asp:TextBox ID="txtSearch" runat="server" pattern="^[a-zA-Z0-9,.\/\- ]+$"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="ReqSearch" ControlToValidate="txtSearch" ErrorMessage="<i class='icon-exclamation-sign'></i>&nbsp;Required" runat="server"  Display="Dynamic" CssClass="label label-important aspLabel" ValidationGroup="LibResources"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="btn-group" id="drpSearch">
                      <a class="btn dropdown-toggle btn-success aspButton" data-toggle="dropdown" href="#">
                        Search &rsaquo;&rsaquo;&rsaquo;                       
                      </a>
                      <ul class="dropdown-menu rightMenu">
                        <li> <asp:LinkButton ID="btnBookTitle" ValidationGroup="LibResources" runat="server" Text="Title" 
            onclick="btnBookTitle_Click">Book Title</asp:LinkButton></li>
                        <li> <asp:LinkButton ID="btnSearchAuthor" ValidationGroup="LibResources" runat="server" Text="Author" 
            onclick="btnSearchAuthor_Click">Author</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnSearchCall" ValidationGroup="LibResources" runat="server" Text="Call Number" 
            onclick="btnSearchCall_Click">Call Number</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnSearchSeries" ValidationGroup="LibResources" runat="server" Text="Series" 
            onclick="btnSearchSeries_Click">Series</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnMultiTitle" ValidationGroup="LibResources" runat="server" Text="Movie Title" 
            onclick="btnMultiTitle_Click">Movie Title</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnDirector" ValidationGroup="LibResources" runat="server" Text="Director" 
            onclick="btnDirector_Click">Director</asp:LinkButton></li>     
                        <li><asp:LinkButton ID="btnGenre" ValidationGroup="LibResources" runat="server" Text="Genre" 
            onclick="btnGenre_Click">Gender</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnBrand" ValidationGroup="LibResources" runat="server" Text="Brand" 
            onclick="btnBrand_Click">Brand</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnType" ValidationGroup="LibResources" runat="server" Text="Type" 
            onclick="btnType_Click">Type</asp:LinkButton></li>
                        <li><asp:LinkButton ID="btnModel" ValidationGroup="LibResources" runat="server" Text="Model" 
            onclick="btnModel_Click">Model</asp:LinkButton></li>                                            
                      </ul>
                    </div> 
                </td> 
            </tr>
        </table>
   </asp:Panel>
   <asp:Panel ID="PanelResources" runat="server">
        <asp:GridView ID="grdResources" runat="server" 
            onselectedindexchanged="grdResources_SelectedIndexChanged" 
            PagerSettings-Mode="Numeric"  PageButtonCount="4" 
            OnPageIndexChanging="grdResources_PageIndexChanging" 
            CssClass="table aspTable GridStyle" AllowPaging="True" PageSize="5" HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderWidth="2px">
            <EmptyDataTemplate>
                <h4>No records found!</h4>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#0B5730" ForeColor="White" />
         <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#0B5730"/>
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/assets/img/btnSelect03.png" ControlStyle-Height="25" 
                    ControlStyle-Width="25" HeaderStyle-BackColor="#0b5730" 
                    HeaderStyle-ForeColor="White" ItemStyle-BackColor="#0b5730"  
                    HeaderStyle-BorderColor="#0b5730" ItemStyle-BorderColor="#0b5730">
                <ControlStyle Height="25px" Width="25px" />
                <HeaderStyle BackColor="#0B5730" BorderColor="#0B5730" ForeColor="White" />
                <ItemStyle BackColor="#0B5730" BorderColor="#0B5730" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>

