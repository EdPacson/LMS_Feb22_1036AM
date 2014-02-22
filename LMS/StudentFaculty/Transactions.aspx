<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/STUP.master" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" Inherits="StudentFaculty_Transactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
        <title>Transactions &diams; Library MS</title>
        <style type="text/css">
            .navTran
            {
	            background-color: #15A65A;
	            font-weight: bold;	
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
<h4>Transactions</h4>
<p>On this page, you will be able to view all your transactions related with the campus library facility. All borrowed and reserved materials can be seen on the panel at the right.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <center><h4>Book Circulation</h4></center>
        <asp:GridView ID="grdBookCirculation" runat="server" AllowPaging="True" 
            onpageindexchanging="grdBookCirculation_PageIndexChanging" PageSize="3" CssClass="table"   HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px">
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>
    
    <center><h4>Multimedia Circulation</h4></center>
        <asp:GridView ID="grdMultiCirculation" runat="server" AllowPaging="True" 
            PageSize="3" CssClass="table" 
            onpageindexchanging="grdMultiCirculation_PageIndexChanging"   HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px">
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>

    <center><h4>Book Reservation</h4></center>
        <asp:GridView ID="grdBookReservation" runat="server" AllowPaging="True" 
            PageSize="3" CssClass="table" 
            onpageindexchanging="grdBookReservation_PageIndexChanging"   HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px">
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>

    <center><h4>AV Reservation</h4></center>
        <asp:GridView ID="grdAVReservation" runat="server" AllowPaging="True" 
            PageSize="3" CssClass="table" 
            onpageindexchanging="grdAVReservation_PageIndexChanging"   HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px">
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
</asp:Content>

