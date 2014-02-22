<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true"
    CodeFile="Clearance.aspx.cs" Inherits="Librarian_Clearance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" runat="Server">
    <title>Clearance &diams; Library MS</title>
    <style type="text/css">
        .navCle
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
        <td><img src="../assets/img/spanIMGS/spanClear1.png" width="35" height="35" /></td>
        <td><h4>Clearance</h4></td>        
        </tr>
            <td></td>
            <td><p>Once a student or a faculty user has incurred a penalty, a record will display on this page. To begin search for a user account.</p></td>
        </table>
        <table class="table table-condensed">
            <tr>
                <td>
                    Account ID
                </td>
                <td>
                    <asp:TextBox ID="txtAccountID" runat="server" data-mask="99999999" class="inputmask" placeholder="ex. 20130002"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="ReqAcct" ControlToValidate="txtAccountID" ErrorMessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" CssClass="label label-important aspLabel"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:LinkButton ID="btnSearch" runat="server" CssClass="aspButton btn btn-success btn-block"
                        Height="28px" OnClick="btnSearch_Click"><i class="icon-search"></i>&nbsp;&nbsp;Account Search</asp:LinkButton>
                    <asp:LinkButton ID="btnBackSearch" runat="server" CssClass="aspButton btn btn-warning btn-block"
                        Visible="False" OnClick="btnBackSearch_Click"><i class="icon-backward"></i>&nbsp;&nbsp;Back</asp:LinkButton>
                </td>
            </tr>
        </table>
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
        <hr />
        <h2>Pending Clearance Record</h2>
        <asp:GridView ID="grdClearance" runat="server" AutoGenerateColumns="False" CssClass="table GridStyle" onrowcommand="grdClearance_RowCommand"
            AllowPaging="true" PagerSettings-Mode="NextPreviousFirstLast"  PageButtonCount="4" 
            OnPageIndexChanging="grdClearance_PageIndexChanging" PageSize="4" 
            HorizontalAlign="Center" PagerSettings-NextPageText="Next" 
            PagerSettings-PreviousPageText="Previous" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last"
            HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderWidth="2px">
            <Columns>
                <asp:BoundField DataField="PenaltyID" HeaderText="Transaction No. #" 
                    DataFormatString="{0:D5}" />
                <asp:BoundField DataField="AccountID" HeaderText="ID No. #" />
                <asp:BoundField DataField="PenaltyFee" HeaderText="Penalty Fee" />
                <asp:BoundField DataField="PenaltyType" HeaderText="Type" />
                <asp:BoundField DataField="DateRecorded" DataFormatString="{0:d}" 
                    HeaderText="Recorded" />
                <asp:BoundField DataField="RecordedBy" HeaderText="Record By" />
                <asp:BoundField DataField="PenaltyStatus" HeaderText="Status" />
                <asp:ButtonField CommandName="ClearRecord" Text="Clear" />
            </Columns>
            <EmptyDataTemplate>
                <h4>
                    No records found!</h4>
            </EmptyDataTemplate>
        </asp:GridView>
        <hr />
    </asp:Panel>
    <asp:GridView ID="grdList" runat="server" AllowPaging="True" CssClass="table GridStyle"
        onpageindexchanging="grdList_PageIndexChanging" HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderWidth="2px" >
        <EmptyDataTemplate>
            <h4>No records found!</h4>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>
