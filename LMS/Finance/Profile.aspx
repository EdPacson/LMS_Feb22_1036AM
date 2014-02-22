<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/FINP.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Finance_Profile" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanProfile1.png" width="35" height="35" /></td>
            <td><h4>User Profile</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>If you would like to update any information related to your account, please do so on the right panel.</p></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
<h1>Account Information</h1>
<br />
    <table class="table table-hover">
     <tr>
            <td>Account ID</td>
            <td>
                <asp:TextBox ID="txtAccountID" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>First Name</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Middle Name</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Old Password</td>
            <td>
                <asp:TextBox ID="txtOld" runat="server" Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField1" controltovalidate="txtOld"
                validationgroup="FinProfile" errormessage="<i class='icon-exclamation-sign'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>New Password</td>
            <td>
                <asp:TextBox ID="txtNew" runat="server" Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField2" controltovalidate="txtNew"
                validationgroup="FinProfile" errormessage="<i class='icon-exclamation-sign'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" Display="Dynamic" />
                <asp:RegularExpressionValidator Display = "Dynamic" 
ControlToValidate = "txtNew" ID="RegularExpressionValidator3" 
ValidationExpression = "^[\s\S]{6,12}$" runat="server" 
errormessage="<i class='icon-remove-sign'></i> &nbsp;Passwords must be 6-12 characters"  validationgroup="FinProfile"  CssClass="label label-important aspLabel"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server" Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField3" controltovalidate="txtConfirm"
                validationgroup="FinProfile" errormessage="<i class='icon-exclamation-sign'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:LinkButton ID="btnUpdate" runat="server"
                    validationgroup="FinProfile" onclick="btnUpdate_Click" CssClass="aspButton btn btn-success btn-large"><i class="icon-edit"></i>&nbsp;&nbsp; Update Account</asp:LinkButton>
            </td>
        </tr>   
        </table>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="<i class='icon-remove-sign'></i> &nbsp;Your passwords <strong>do not</strong> match." 
            ControlToCompare="txtNew" ControlToValidate="txtConfirm" 
            ValidationGroup="FinProfile" CssClass="label label-important aspLabel"></asp:CompareValidator>
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
</asp:Content>

