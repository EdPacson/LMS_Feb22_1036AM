<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true"
    CodeFile="Transaction.aspx.cs" Inherits="Librarian_Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" runat="Server">
    <title>Transaction &diams; Library MS</title>
    <style type="text/css">
        .navTra
        {
            background-color: #15A65A;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" runat="Server">
    <asp:Panel ID="PanelSideControl" runat="server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanBorrow1.png" width="35" height="35" /></td>
            <td><h4>Book Transaction</h4></td>
        </tr>
       <tr>
        <td></td>
        <td>On this page, librarians can lease out books that an LMS user would like to borrow. To begin, please search for a user's ID.</td>
       </tr>
    </table>
           <asp:Panel ID="PanelControl" runat="server" Visible="false">
            <table class="table table-condensed">
                <tr>
                    <td colspan="2"><h4>Information</h4></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        Asset No.
                    </td>
                    <td>
                        <asp:Label ID="lblAssetNo" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Asset Type
                    </td>
                    <td>
                        <asp:Label ID="lblAssetType" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Record Type
                    </td>
                    <td>
                        <asp:DropDownList ID="drpRecordType" runat="server" Width="165px" CssClass="dll3">
                            <asp:ListItem>Good Condition</asp:ListItem>
                            <asp:ListItem>Partially Damaged</asp:ListItem>
                            <asp:ListItem>Lost</asp:ListItem>
                            <asp:ListItem>Damaged</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton ID="btnTransact" runat="server"  CssClass="aspButton btn btn-success btn-block"
                            OnClick="btnTransact_Click" Enabled="False"><i class="icon-barcode"></i>&nbsp;&nbsp; Lease Book</asp:LinkButton>
                        <asp:LinkButton ID="btnReset" runat="server" CssClass="aspButton btn btn-danger btn-block"
                            OnClick="btnReset_Click"><i class="icon-refresh"></i>&nbsp;&nbsp;Reset</asp:LinkButton>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*Please input AccountID first!"
                Visible="false"></asp:Label>
        </asp:Panel>
        <table class="table">
            <tr>
                <td>
                    Account ID
                </td>
                <td>
                    <asp:TextBox ID="txtAccountID" runat="server" data-mask="99999999" class="inputmask"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup = "account" ID="ReqAcct" ControlToValidate="txtAccountID" ErrorMessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" CssClass="label label-important aspLabel" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:LinkButton ID="btnSearch" runat="server" ValidationGroup = "account" CssClass="aspButton btn btn-success btn-block"
                        OnClick="btnSearch_Click"><i class="icon-search"></i>&nbsp;&nbsp;Account Search</asp:LinkButton>
                    <asp:LinkButton ID="btnBackSearch" runat="server" CssClass="aspButton btn btn-warning btn-block"
                        OnClick="btnBackSearch_Click" Visible="False"><i class="icon-backward"></i>&nbsp;&nbsp;Back</asp:LinkButton>
                </td>
            </tr>
        </table>
        <hr />
        <table class="table">
            <tr>
                <td><img src="../assets/img/spanIMGS/spanCReports1.png" width="35" height="35" /></td>
                <td><h4>Library Reports</h4></td>            
            </tr>
            <tr>
                <td></td>
                <td>
                Reports for the Library are ready.
                <br />
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">               
                <a target="_blank" href="../Crystal Reports/ReportHub.aspx"><i class="icon-arrow-right"></i>&nbsp;&nbsp;Click Here</a>
                </a>                  
                </td>
            </tr>
        
        </table>

        <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*No account found!" Visible="false"></asp:Label>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*No account found!" Visible="false"></asp:Label>
 
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" runat="Server">
    <asp:Panel ID="PanelStudentInfo" runat="server" Visible="false">
        <h1>
            Student Information</h1>
        <table class="table table-hover">
            <thead>
                <tr>
                    <td>
                        <strong>Name</strong>
                    </td>
                    <td>
                        <strong>e-Purse Balance</strong>
                    </td>
                    <td>
                        <strong>User Type</strong>
                    </td>
                    <td>
                        <strong>Status</strong>
                    </td>
                </tr>
            </thead>
            <tr>
                <td>
                    <asp:Label ID="LblStudentName" runat="server" Text="Label" />
                </td>
                <td>
                    <asp:Label ID="lblBalance" runat="server" Text="Label" />
                </td>
                <td>
                    <asp:Label ID="lblUsertype" runat="server" Text="Label" />
                </td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Text="Label" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*you have unsettled account/s. <a href='Clearance.aspx'>Click here to clear you're unsettled account</a>."
            Visible="true" />
        <hr />
    </asp:Panel>
    <asp:Panel ID="PanelBookInfo" runat="server" Visible="false">
        <h1>
            Book/Multimedia Information<asp:Label ID="LabelSelectionIndicator" 
                runat="server" ForeColor="Red"
                Text="<i class='icon-check-sign'></i>&nbsp;You reserved this." Visible="False" /></h1>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>
                        Title
                    </th>
                    <th>
                        Author
                    </th>
                    <th>
                        Date Published
                    </th>
                    <th>
                        Barcode
                    </th>
                    <th>
                        Availability
                    </th>
                    <th>
                        Available Copies
                    </th>
                </tr>
            </thead>
            <tr>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text="label" />
                </td>
                <td>
                    <asp:Label ID="lblAuthor" runat="server" Text="label" />
                </td>
                <td>
                    <asp:Label ID="lblPublished" runat="server" Text="label" />
                </td>
                <td>
                    <asp:Label ID="lblBarcode" runat="server" Text="label" />
                </td>
                <td>
                    <asp:Label ID="lblAvailability" runat="server" Text="label" />
                </td>
                <td>
                    <asp:Label ID="lblAvailStock" runat="server" Text="label" />
                </td>
            </tr>
            <thead>
                <tr>
                    <td colspan="5">
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="btnBack" runat="server" 
                            CssClass="aspButton btn btn-warning btn-block" OnClick="btnBack_Click" 
                            Text="Go Back" />
                    </td>
                </tr>
            </thead>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelBarcode" runat="server">
        <h1>
            Book / Multimedia</h1>
        Enter Barcode here:
        <asp:TextBox ID="txtBarcode" data-mask="9999999999" class="inputmask" runat="server" Font-Size="30px"></asp:TextBox>
        <asp:LinkButton ID="btnBarcode" runat="server" ValidationGroup = "bar" CssClass="aspButton btn btn-success btn-large"
            OnClick="btnBarcode_Click">
                <i class="icon-search"></i>
            </asp:LinkButton>
            <br />
        <asp:RequiredFieldValidator runat="server" ValidationGroup = "bar" ID="RequiredFieldValidator1" ControlToValidate="txtBarcode" ErrorMessage="<i class='icon-exclamation-sign'></i>&nbsp;&nbsp;Required" CssClass="label label-important aspLabel" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="Label4" runat="server" Text="*Asset not found!" CssClass="label label-warning aspLabel" Visible="false"></asp:Label>
    </asp:Panel>
<div id="auditModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header audit">
    <button type="button" class="btn btn-danger pull-right" data-dismiss="modal">X</button>
    <h3 id="myModalLabel">Audit Trail</h3>
  </div>
  <div class="modal-body">
        <asp:GridView ID="grdAuditTrail" runat="server" CssClass="table table-hover" >
        </asp:GridView>
  </div>

</div> 
</asp:Content>
