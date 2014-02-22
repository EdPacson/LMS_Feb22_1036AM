<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecoverPassword.aspx.cs" Inherits="RecoverPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="assets/css/bootstrap-responsive.css" />
    <link rel="Stylesheet" href="assets/css/bootstrap.css" />
    <link rel="Stylesheet" href="assets/css/globalStyles2.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'/> 
<script src="assets/js/jquery.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-transition.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.js" type="text/javascript"></script>


</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="span10" id="formBody3">
            <h4><i class="icon-exchange"></i>&nbsp;&nbsp;Retrieve your Password</h4>
            <p>It looks like your having trouble. Do not fret, we're here to help.</p>
            <table class="table borderless">
                <tr>
                    <td></td>
                    <td>
                    It'd be wonderful if we can ask for your email.<asp:TextBox ID="txtEmail" runat="server" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="eg. jrss@example.com" />
                    <br /><asp:requiredfieldvalidator id="ReqField1" ValidationGroup="email" controltovalidate="txtEmail" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />   
                    </td>    
                </tr>
                <tr>
                    <td></td>
                    <td>
                    Can you retype your email? That would be great.<asp:TextBox ID="txtEmail2" runat="server" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="eg. jrss@example.com"></asp:TextBox>
                    <br /><asp:requiredfieldvalidator id="ReqField2" ValidationGroup="email" controltovalidate="txtEmail2" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />   
                    </td>
                </tr>
                <tr>
                    <td>
                                               
                    </td>
                    <td>
                        <a href="Login.aspx"><asp:button class="btn btn-warning" CausesValidation="false"><i class="icon-double-angle-left"></i>&nbsp;&nbsp;I want to login instead</a>
                        <asp:LinkButton ID="btnSubmit" runat="server" ValidationGroup="email" onclick="btnSubmit_Click" CssClass="btn btn-success aspButton">
                            <i class="icon-mail-forward"></i>&nbsp;&nbsp;Send my password
                        </asp:LinkButton>                               
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbltxt" runat="server"></asp:Label>

            <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="<i class='icon-remove-sign'></i> &nbsp;Your email <strong>do not</strong> match." 
            ControlToCompare="txtEmail" ControlToValidate="txtEmail2" 
            ValidationGroup="email" CssClass="label label-important aspLabel"></asp:CompareValidator>

        </div>
    </div>
    </form>
</body>
</html>
