<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/FINP.master" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Finance_Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Transactions &diams; Library MS</title>
    <style type="text/css">
        .navTra
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanAudit1.png" width="35" height="35" /></td>
            <td><h4>Audit Trail</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>All user related activities for financers are displayed here. E-Purse transactions, requests approval and user logins are listed down on the right panel.</p></td>
        </tr>
    </table>

    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanCReports1.png" width="35" height="35" /></td>
            <td><h4>Library Reports</h4></td>
        </tr>
        <tr>
            <td></td>
            <td>Reports exclusive to finance users are listed here.</td>
        </tr>
            <tr>
                <td></td>
                <td>
                Reports for the Library are ready.
                <br />
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">               
                <a target="_blank" href="../Crystal Reports/ReportHub2.aspx"><i class="icon-arrow-right"></i>&nbsp;&nbsp;Click Here</a>
                </a>                  
                </td>
            </tr>
    </table>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:GridView ID="grdTransaction" runat="server" 
    PagerSettings-Mode="Numeric"  PageButtonCount="4" 
    OnPageIndexChanging="grdTransaction_PageIndexChanging" 
    CssClass="table GridStyle" AllowPaging="True" PageSize="10" 
    HorizontalAlign="Center" AllowSorting="True" 
        onsorting="grdTransaction_Sorting">
    <HeaderStyle BackColor="#0B5730" ForeColor="White" BorderColor="#0B5730" BorderWidth="2px"></HeaderStyle>
    </asp:GridView>
</asp:Content>

