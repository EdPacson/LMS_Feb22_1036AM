<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Log In &diams; LMS</title>
	<link href="assets/css/globalStyles.css" rel="stylesheet"/>          
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"/>
	<link href="assets/img/site_icon04.png" rel="shortcut icon"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'/> 
    <style type="text/css">
    .borderless td
    {
        border: none;
    }
    
    </style>
  </head>
  <body class="loginBody">
  <form ID="loginForm" runat="server">
	<div id="img_placeholder01">
    	<img src="assets/img/site_icon05.png" width="300" height="150" alt="LMS Logo"/>
        <br />
        <br />
        <br />
        <asp:Label ID="labelError" runat="server" CssClass="alert alert-error" Font-Size="28px" Visible="false"></asp:Label>    
    </div>
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="assets/img/booklets.png" alt=""/>
          <div class="container">
            <div class="carousel-caption">
              <h1>Your books, reserved.</h1>
              <p class="lead">LMS allows you to reserve books real time. Log In today.</p>
              <a class="btn btn-large btn-primary" href="#loginModal" data-toggle="modal">Enter Site</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/JRSS_Facade02.PNG" alt=""/>
          <div class="container">
            <div class="carousel-caption">
              <h1>Take control of your library payments.</h1>
              <p class="lead">With the Library Management System's E-Purse module, you will never have to lend out cash to pay your penalties again. Just use your ID number and we will take care of the rest.</p>
              <a class="btn btn-large btn-primary" href="#loginModal" data-toggle="modal">Enter Site</a>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="assets/img/libraryBack01.jpg" alt=""/>
          <div class="container">
            <div class="carousel-caption">
              <h1>Instantly find the materials you need.</h1>
              <p class="lead">The Library Management System has an advanced search feature that will greatly be of help to users who are in search of materials from JRSS's wide catalog in the library. Searching has not been this easy!</p>
              <a class="btn btn-large btn-primary" href="#loginModal" data-toggle="modal">Enter Site</a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->
    
   
 
<!-- Modal -->
<div id="loginModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header login">
    <button type="button" class="btn btn-danger pull-right" data-dismiss="modal">X</button>
    <h3 id="myModalLabel">Log In</h3>
  </div>
  <div class="modal-body">
    <table class="table borderless">
        <tr>
            <td style="color: #0B5730"><strong>Account ID</strong></td>
            <td>
                <asp:TextBox ID="txtAccountID" runat="server" data-mask="99999999" class="inputmask" placeholder="ex. 20130002" 
                    Width="200px" CssClass="textters" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0B5730"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField1" controltovalidate="txtAccountID"
                validationgroup="Login" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" 
                CssClass="alert alert-error" />
            </td>
        </tr>
        <tr>
            <td style="color: #0B5730"><strong>Password</strong></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="Account Password" 
                    TextMode="Password" Width="200px" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0B5730"></asp:TextBox>
                <asp:requiredfieldvalidator id="ReqField2" controltovalidate="txtPassword"
                validationgroup="Login" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required"  runat="server" 
                CssClass="alert alert-error" />
            </td>
        </tr>
        <tr>
        <td colspan="2"><asp:Label ID="Label1" runat="server" Text="Label" CssClass="alert alert-error" 
            Visible = "false"></asp:Label>
        </td><td></td>
        </tr>
    </table>
  </div>
  <div class="modal-footer" style="background-color:#fff; border-top:none;">
      <asp:HyperLink ID="HyperLink1" runat="server" href="RecoverPassword.aspx" CssClass="pull-left">Having trouble logging in?</asp:HyperLink>
                <%--<asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                    Text="Login" validationgroup="Login" CssClass="aspButton btn btn-primary btn-large"/>--%>
                <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnLogin_Click" ValidationGroup="Login" CssClass="aspButton btn btn-large btn" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="2px" BackColor="white" ForeColor="#0B5730"><i class="icon-signin"></i>&nbsp; &nbsp; Login</asp:LinkButton>
  </div>
</div> 
 
        

    

    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-transition.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-alert.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-modal.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-dropdown.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-collapse.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-carousel.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-typeahead.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-inputmask.js" type="text/javascript"></script>
    <script>
        $('#myCarousel').carousel({
            interval: 3000,
            pause: "false"
        })
        $('.inputmask').inputmask();
    </script>
</form>
  </body>
</html>
