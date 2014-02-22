<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/STUP.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="StudentFaculty_Profile" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Accounts &diams; Library MS</title>
        <style type="text/css">
            .navAcc
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
            <td><p>If you would like to update any information related to your account, please accomplish the form on the right panel.</p></td>
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
                <asp:TextBox ID="txtAccountID" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>First Name</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Middle Name</td>
            <td>
                <asp:TextBox ID="txtMName" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
       <tr>
            <td>Old Password</td>
            <td>
            <asp:TextBox ID="txtOld" runat="server"  Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" TextMode="Password"></asp:TextBox><asp:requiredfieldvalidator id="ReqField1" controltovalidate="txtOld"
                validationgroup="StudFacProfile" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" />                                
            </td>
        </tr>
        <tr>
            <td>New Password</td>
            <td>
                <asp:TextBox ID="txtNew" runat="server"  Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                    TextMode="Password"></asp:TextBox>
                    <asp:requiredfieldvalidator id="ReqField2" controltovalidate="txtNew"
                validationgroup="StudFacProfile" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" Display="Dynamic"/>       
                <asp:RegularExpressionValidator Display = "Dynamic" 
ControlToValidate = "txtNew" ID="RegularExpressionValidator3" 
ValidationExpression = "^[\s\S]{6,12}$" runat="server" 
ErrorMessage="<i class='icon-remove-sign'></i> &nbsp;Passwords must be 6-12 characters"  validationgroup="StudFacProfile"  CssClass="label label-important aspLabel"></asp:RegularExpressionValidator>       
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server"  Width="200px" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" TextMode="Password"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField3" controltovalidate="txtConfirm"
                validationgroup="StudFacProfile" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" 
                CssClass="label label-important aspLabel" Display="Dynamic"/>            
            </td>
        </tr>
        <tr>
            <td>EPurse</td>
            <td>
                <asp:TextBox ID="txtEPurse" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:LinkButton ID="btnUpdateAccount" validationgroup="StudFacProfile" runat="server" Text="Update Account" 
                    CssClass="aspButton btn btn-success btn-large aspButton" 
                    onclick="btnUpdateAccount_Click"><i class="icon-edit"></i>&nbsp;&nbsp; Update Account</asp:LinkButton>
            </td>
        </tr>
    </table>
        <asp:CompareValidator ID="CV1" runat="server" 
            ErrorMessage="New and Confirm Password value does not match!" 
            ControlToCompare="txtNew" ControlToValidate="txtConfirm" 
            ValidationGroup="StudFacProfile" ForeColor="Red" />
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Visible="false" />
</asp:Content>

