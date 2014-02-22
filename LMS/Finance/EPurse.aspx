<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/FINP.master" AutoEventWireup="true" CodeFile="EPurse.aspx.cs" Inherits="Finance_EPurse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>e-Purse &diams; Library MS</title>
        <style type="text/css">
        .navEPu
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <asp:Panel ID="PanelSearch" runat="server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanEPurse1.png" width="35" height="35" /></td>
            <td><h4>e - Purse</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>On this page, finance officers can reload or reimburse the accounts of LMS users. Search for an account ID to get started.</p></td>
        </tr>
    </table>
    <table class="table">
        <tr>
            <td>Account ID</td>
            <td><asp:TextBox ID="txtAccountID" runat="server" data-mask="99999999" class="inputmask" placeholder="ex. 20130002"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RQ1" ControlToValidate="txtAccountID" ValidationGroup="ePurse" ErrorMessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/></td>
        </tr>
        <tr>
            <td colspan="3"><asp:LinkButton ID="btnSearch" runat="server" ValidationGroup="ePurse" onclick="btnSearch_Click" 
                    Text="Search" CssClass="aspButton btn btn-success btn-block"><i class="icon-search"></i>&nbsp;&nbsp;Search</asp:LinkButton></td>
        </tr>
        <tr>
            <td colspan="3"><asp:Label ID="lblMessage" runat="server" CssClass="label label-important aspLabel" Text="Label" Visible="false" /></td>
        </tr>
    </table>
    </asp:Panel>

    <asp:Panel ID="PanelControl" runat="server" Visible="false">
    
    <table class="table">
    <tr>
        <td>Amount</td>
        <td>
            <asp:DropDownList ID="drpAmount" runat="server" Width="165px" CssClass="dll3">
                <asp:ListItem>Choose Here</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
                <asp:ListItem>200</asp:ListItem>
                <asp:ListItem>300</asp:ListItem>
                <asp:ListItem>500</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>Record Type</td>
        <td>
            <asp:DropDownList ID="drpRecordType" runat="server" Width="165px" CssClass="dll3">
                <asp:ListItem>Reload</asp:ListItem>
                <asp:ListItem>Reimburse</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:LinkButton ID="btnEPurse" runat="server"
                onclick="btnEPurse_Click" CssClass="btn btn-success aspButton btn-block" ValidationGroup="amountValid">
                <i class="icon-plus"></i>&nbsp;&nbsp;Process Payment
                </asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="3"><asp:LinkButton ID="Cancel" runat="server" Text="Back" 
                CssClass="btn btn-warning aspButton btn-block" onclick="Cancel_Click"><i class="icon-backward"></i>&nbsp;&nbsp;Cancel Payment</asp:LinkButton></td>
    </tr>
    </table>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="PanelAccountInfo" runat="server" Visible="False">
        <h1>Account Information</h1>
        <table class="table table-hover">
            <tr>
                <td><strong>Name:</strong> <asp:Label ID="LblStudentName" runat="server" Text="Label" /></td>
                <td><strong>E-Purse Balance:</strong> <asp:Label ID="lblBalance" runat="server" Text="Label" /></td>
            </tr>
            <tr>
                <td><strong>Usertype:</strong> <asp:Label ID="lblUsertype" runat="server" Text="lblUsertype" /></td>
                <td><strong>Status:</strong> <asp:Label ID="lblStatus" runat="server" Text="Label" /></td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" CssClass="label label-important aspLabel"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" CssClass="label label-success aspLabel"></asp:Label>
        <br /><br />
        <h1>Transaction Records</h1><asp:GridView ID="grdEPurse" runat="server" 
            AutoGenerateColumns="False" CssClass="table table-hover table-condensed"
            PagerSettings-Mode="Numeric"  PageButtonCount="4" 
            OnPageIndexChanging="grdEPurse_PageIndexChanging" 
             AllowPaging="True" PageSize="5" 
            HorizontalAlign="Center">

            <Columns>
                <asp:BoundField DataField="EPurseRecordID" HeaderText="Transaction No." HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="AccountID" HeaderText="Account ID" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="DateRecorded" DataFormatString="{0:d}" 
                    HeaderText="Date Recorded" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="RecordedBy" HeaderText="Recorded By" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="RecordType" HeaderText="Type" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="RecordStatus" HeaderText="Status" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
            </Columns>
            <EmptyDataTemplate>
                <h4>No Records Found!</h4>
            </EmptyDataTemplate>
    </asp:GridView>
    </asp:Panel>
    </asp:Content>

