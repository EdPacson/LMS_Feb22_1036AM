<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ADMP.master" AutoEventWireup="true" CodeFile="AuditTrail.aspx.cs" Inherits="Admin_AuditTrail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Audit Trail &diams; Library MS</title>
    <style type="text/css">
        .navAud
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
            <td><p>This page displays a tally of all user entries with LMS. Account IDs and exact entry are recorded.</p></td>
        </tr>        
    </table>
    
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:GridView ID="grdAuditTrail" runat="server"
    PagerSettings-Mode="Numeric"  PageButtonCount="4" 
    OnPageIndexChanging="grdAuditTrail_PageIndexChanging" 
    AllowPaging="True"  HeaderStyle-BackColor="#0b5730"     
        onsorting="grdAuditTrail_Sorting" AllowSorting="True" CssClass="table GridStyle">
               <HeaderStyle BackColor="#0B5730" ForeColor="White"></HeaderStyle>
        <SortedAscendingHeaderStyle CssClass="sortasc"/>
        <SortedDescendingHeaderStyle CssClass="sortdesc" />
    </asp:GridView>
</asp:Content>

