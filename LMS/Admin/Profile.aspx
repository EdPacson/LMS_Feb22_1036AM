<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ADMP.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Admin_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Profile &diams; Library MS</title>
    <style type="text/css">
        .navPro
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" runat="server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanProfile1.png" width="35" height="35" /></td>
            <td><h4>User Profile</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>If you would like to update any information related to your administrator account, please do so on the right panel.</p></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
<h1>Account Information</h1>
<br />
<table class="table table-condensed">
        <tr>
            <td>Account ID</td>
            <td>
                <asp:TextBox ID="txtAccountID" runat="server" Width="200px" ReadOnly="True" CssClass="aspTxtbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" Width="200px" ReadOnly="True" CssClass="aspTxtbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>First Name</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server" Width="200px" ReadOnly="True" CssClass="aspTxtbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Middle Name</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server" Width="200px" ReadOnly="True" CssClass="aspTxtbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Old Password</td>
            <td>
                <asp:TextBox ID="txtOld" runat="server" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password" Width="200px" CssClass="aspTxtbox"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField1" controltovalidate="txtOld"
                validationgroup="AdminProfile" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" 
                CssClass="aspLabel label label-important" />

            </td>
        </tr>
        <tr>
            <td>New Password</td>
            <td>
                <asp:TextBox ID="txtNew" runat="server" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password" Width="200px" CssClass="aspTxtbox"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField2" controltovalidate="txtNew"
                validationgroup="AdminProfile" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" 
                CssClass="aspLabel label label-important" Display="Dynamic" />
                <asp:RegularExpressionValidator Display = "Dynamic" 
ControlToValidate = "txtNew" ID="RegularExpressionValidator3" 
ValidationExpression = "^[\s\S]{6,12}$" runat="server" 
errormessage="<i class='icon-remove-sign'></i> &nbsp;Passwords must be 6-12 characters"  validationgroup="AdminProfile"  CssClass="label label-important aspLabel"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password" Width="200px" CssClass="aspTxtbox"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField3" controltovalidate="txtConfirm"
                validationgroup="AdminProfile" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" 
                CssClass="aspLabel label label-important" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
               <%-- <asp:Button ID="btnUpdate" runat="server" Text="Update Account" 
                    onclick="btnUpdate_Click" validationgroup="AdminProfile" CssClass="aspButton btn btn-success"/>--%>
                <asp:LinkButton ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" ValidationGroup="AdminProfile" CssClass="aspButton btn btn-success btn-large"><i class="icon-edit"></i>&nbsp;&nbsp; Update Account</asp:LinkButton>
            </td>
        </tr>       
    </table>
    <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="aspLabel label label-important" errormessage="<i class='icon-remove-sign'></i> &nbsp;Your passwords <strong>do not</strong> match." ControlToCompare="txtNew" ControlToValidate="txtConfirm" ValidationGroup="AdminProfile"></asp:CompareValidator>
    <br />
    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
</asp:Content>

