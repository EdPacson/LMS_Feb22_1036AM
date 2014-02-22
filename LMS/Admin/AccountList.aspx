<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ADMP.Master" AutoEventWireup="true" CodeFile="AccountList.aspx.cs" Inherits="Admin_AccountList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
        <title>Account List &diams; Library MS</title>
        <style type="text/css">
            .navAAcc
            {
	            background-color: #15A65A;
	            font-weight: bold;	
            }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPH" Runat="Server">
        <asp:Panel ID="Panel2" runat="server" style="margin-bottom: 1px">
        <asp:GridView ID="grdAccounts" runat="server" AutoGenerateColumns="False" 
        PagerSettings-Mode="Numeric"  PageButtonCount="4" 
        OnPageIndexChanging="grdAccounts_PageIndexChanging" 
        onselectedindexchanged="grdAccounts_SelectedIndexChanged" 
        CssClass="table table-hover GridStyle" AllowPaging="True" PageSize="10" 
                onsorting="grdAccounts_Sorting">
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#0B5730"/>
            <Columns>
            
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/assets/img/btnSelect03.png" ControlStyle-Height="25" ControlStyle-Width="25" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" ItemStyle-BackColor="#0b5730"  HeaderStyle-BorderColor="#0b5730" ItemStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="AccountID" HeaderText="Account ID" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="UserType" HeaderText="User Type" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="LName" HeaderText="Last Name" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="FName" HeaderText="First Name" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730" />
                <asp:BoundField DataField="MName" HeaderText="Middle Name" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Gender" HeaderText="Gender" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="AccountStatus" HeaderText="Account Status" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanList1.png" width="35" height="35" /></td>
            <td><h4>Account List</h4></td>
        </tr>
        <tr>
            <td></td>
            <td>This page allows you to view all users currently registered with LMS. Administrators can disable accounts if necessary.</td>
        </tr>
    </table>
    <table>
        <tr>
            <td>Account ID</td>
            <td><asp:TextBox ID="txtAccountID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="txtLName" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <td>First Name</td>
            <td><asp:TextBox ID="txtFName" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Middle Name</td>
            <td><asp:TextBox ID="txtMName" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td><asp:TextBox ID="txtGender" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" CssClass="text-left"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <asp:DropDownList ID="drpStatus" runat="server" Width="190px" CssClass="dll2">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">                
                <asp:LinkButton ID="btnUpdate" runat="server" Text="Update Account" 
                    onclick="btnUpdate_Click" CssClass="aspButton btn btn-success btn-block"><i class="icon-check-sign"></i>&nbsp;&nbsp;Update Account</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="btnReset" runat="server" onclick="btnReset_Click" 
                    CssClass="aspButton btn btn-warning btn-block"><i class="icon-refresh"></i>&nbsp;&nbsp;Reset Password</asp:LinkButton>
            </td>
        </tr>
    </table>
        <br /><asp:Label ID="lblMessage" runat="server" Text="Account Updated!"></asp:Label>
    </asp:Panel>
</asp:Content>

