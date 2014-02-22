<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ADMP.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Admin_Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Registration &diams; Library MS</title>
    <style type="text/css">
        .navAAdm
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }        
        .style1
        {
            width: 267px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" runat="server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanReg1.png" width="35" height="35" /></td>
            <td><h4>User Registration</h4></td>
        </tr>
        <tr>
            <td></td>    
            <td>
                <p>Please select the registration form you would like to access.</p>
                <asp:DropDownList ID="drpSelect" runat="server" 
                    onselectedindexchanged="drpSelect_SelectedIndexChanged" 
                    AutoPostBack="True" CssClass="ddl" Width="215px">
                    <asp:ListItem>Choose Here</asp:ListItem>
                    <asp:ListItem Value="Finance / Librarian">Finance / Librarian</asp:ListItem>
                    <asp:ListItem Value="Student / Faculty">Student / Faculty</asp:ListItem>
                </asp:DropDownList>  
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="Toggle" runat="server">
        <h4><img src="../assets/img/spanIMGS/spanClick1.png" width="64" height="64" alt="" />To get started, please access the controls on the left.</h4>
    </asp:Panel>
    <asp:Panel ID="StudentFaculty" runat="server" Visible="False">  
    <div class="accordion" id="accordion2">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                <h4>1. <i class="icon-user"></i>&nbsp;&nbsp;Account Information</h4></a>                
            </div>
            <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <table class="table table-condensed borderless">
                        <tr>
                            <td><asp:Label ID="Label11" runat="server" Text="User Type"></asp:Label></td>
                            <td>
			                    <asp:DropDownList ID="drpUserType" runat="server" Width="215px" CssClass="ddl">
				                    <asp:ListItem>Choose Here</asp:ListItem>
				                    <asp:ListItem>Faculty</asp:ListItem>
                                    <asp:ListItem>Student</asp:ListItem>
                                </asp:DropDownList>		
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label12" runat="server" Text="Account ID"></asp:Label></td>
                            <td>
                            <asp:TextBox ID="txtAccountID" runat="server" data-mask="99999999" class="inputmask" placeholder="ex. 20130002" Width="200px"></asp:TextBox>
                            <asp:requiredfieldvalidator id="ReqField1" controltovalidate="txtAccountID" validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />   
                            </td>
                            <td></td> 
                            <td></td>
                            <td></td>
                            <td></td>                       
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label18" runat="server" Text="Password"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" Width="200px" 
                                    pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                                    TextMode="Password"></asp:TextBox>
                                <asp:requiredfieldvalidator id="ReqField9" controltovalidate="txtPassword"
                                validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />                            
                            </td>
                            <td></td>    
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </table>
                </div>
            </div>
        </div>
        <!-- ACCORDION 2 -->
            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                        <h4>2. <i class="icon-folder-open"></i>&nbsp;&nbsp;Personal Information</h4>
                    </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                    <div class="accordion-inner">
                       <table class="table table-condensed borderless">
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label></td>
                            <td>
				                <asp:TextBox ID="txtLName" runat="server" Width="200px" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" placeholder="Mendoza"></asp:TextBox>
                                <br /><asp:requiredfieldvalidator id="ReqField2" controltovalidate="txtLName"
                                validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<i class='icon-exclamation'></i>&nbsp; Invalid Character/s!" CssClass="alert alert-error" 
                                ControlToValidate="txtLName" ValidationExpression="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" ValidationGroup="StudentFacultyRegistration" Display="Dynamic"></asp:RegularExpressionValidator>            
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="First Name"></asp:Label></td>
                            <td>
				                <asp:TextBox ID="txtFName" runat="server" Width="200px" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" placeholder="Mark"></asp:TextBox>
				                <br /><asp:requiredfieldvalidator id="ReqField3" controltovalidate="txtFName"
				                validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel"/>
				                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="<i class='icon-remove-sign'></i>&nbsp; Invalid Character/s!" CssClass="label label-important aspLabel" 
                                ControlToValidate="txtFName" ValidationExpression="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" ValidationGroup="StudentFacultyRegistration" Display="Dynamic"></asp:RegularExpressionValidator>	            
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="Middle Name"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtMName" runat="server" Width="200px" pattern="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" 
                                                placeholder="Veluz"></asp:TextBox>
                                <br /><asp:requiredfieldvalidator id="ReqField4" controltovalidate="txtMName"
                                validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="<i class='icon-remove-sign'></i>&nbsp; Invalid Character/s!" CssClass="label label-important aspLabel" 
                                ControlToValidate="txtMName" ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" ValidationGroup="StudentFacultyRegistration" Display="Dynamic"></asp:RegularExpressionValidator>	               
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label13" runat="server" Text="Address"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Width="200px" pattern="^[a-zA-Z0-9,.\/\- ]+$" placeholder="1345, Pasay City"></asp:TextBox>
                                <br /><asp:requiredfieldvalidator id="ReqField5" controltovalidate="txtAddress"
                                validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel"/>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="<i class='icon-remove-sign'></i>&nbsp; Invalid Character/s" CssClass="label label-important aspLabel" 
                                ControlToValidate="txtAddress" ValidationExpression="^[a-zA-Z0-9,.\/\- ]+$" ValidationGroup="StudentFacultyRegistration" Display="Dynamic"></asp:RegularExpressionValidator>            
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label14" runat="server" Text="Gender"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="drpGender" runat="server" Width="215" CssClass="ddl">
                                    <asp:ListItem>Rather Not Say</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>            
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>  
                        <tr>
                            <td><asp:Label ID="Label15" runat="server" Text="BirthDate"></asp:Label></td>
                            <td>
                                          <div class="input-append date" id="dpYears" data-date="2008-12-31" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                                <asp:TextBox ID="txtBirthday" runat="server" Width="175px"></asp:TextBox>
				                <span class="add-on" id="custom"><i class="icon-calendar"></i></span>
			                  </div>
                              <br /><asp:requiredfieldvalidator id="ReqField6" controltovalidate="txtBirthday"
                                 validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel"/>
                              <asp:RangeValidator id="birthDateRangeTest" runat="server"
                              Type="Date" ControlToValidate="txtBirthday" 
                              MinimumValue="1/1/1960" 
                              MaximumValue="12/31/2008"
                              ErrorMessage="<i class='icon-remove-sign'></i>&nbsp; Birth years accepted are between 1960 and 2008." 
                              validationgroup="StudentFacultyRegistration" CssClass="label label-important aspLabel" Display="Dynamic"/>
                            </td>
                            <td></td>    
                            <td></td>
                            <td></td>
                            <td></td>    
                        </tr>
                    </table>  
                    </div>
                </div>
            </div>
        <!-- ACCORDION 3 -->
            <div class="accordion-group">
                <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                        <h4>3. <i class="icon-phone-sign"></i>&nbsp;&nbsp;Contact Information</h4>
                    </a>
                </div>
                <div id="collapseThree" class="accordion-body collapse">
                    <div class="accordion-inner">
                        <table class="table table-condensed borderless">
                                <tr>
                                    <td><asp:Label ID="Label16" runat="server" Text="Mobile Number"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtContactNo" runat="server" data-mask="99999999999" class="inputmask" placeholder="ex. 09096485660" Width="200px"></asp:TextBox> 
                                        <asp:requiredfieldvalidator id="ReqField7" controltovalidate="txtContactNo"
                                        validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />               
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>   
                                <tr>
                                    <td><asp:Label ID="Label17" runat="server" Text="Email"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Width="200px" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="eg. jrss@example.com"></asp:TextBox>
                                        <asp:requiredfieldvalidator id="ReqField8" controltovalidate="txtEmail"
                                        validationgroup="StudentFacultyRegistration" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" Display="Dynamic" runat="server" CssClass="label label-important aspLabel" />            
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr> 
                            </table>
                    </div>
                </div>
            </div>
    </div>

      <center>
        <asp:LinkButton ID="Register" validationgroup="StudentFacultyRegistration" runat="server" onclick="Register_Click" 
                    CssClass="aspButton btn btn-success btn-large"><i class="icon-ok-sign"></i>&nbsp;&nbsp; Register User</asp:LinkButton>
      </center>

        <asp:Label ID="lblNo" runat="server" Text="" CssClass="alert-danger" Visible="false"></asp:Label>
        <asp:Label ID="lblGood" runat="server" Text="" CssClass="alert-success" Visible="false"></asp:Label>  


    </asp:Panel>

    <!---------------------------------------------------------------------------------------------------------------------------->

    <asp:Panel ID="LibrarianFinance" runat="server" Visible="False">
    <div class="accordion" id="accordion3">
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseOne_2">
                <h4>1. <i class="icon-user"></i>&nbsp;&nbsp;Account Information</h4></a>
            </div>

            <div id="collapseOne_2"  class="accordion-body collapse in">
                <div class="accordion-inner">
                  <table class="table borderless">
                        <tr>
                            <td><asp:Label ID="Label6" runat="server" Text="User Type"></asp:Label></td>
                            <td class="style1">
                            <asp:DropDownList ID="drpType" runat="server" Width="215px" CssClass="ddl">
                                <asp:ListItem>Choose Here</asp:ListItem>
                                <asp:ListItem>Finance</asp:ListItem>
                                <asp:ListItem>Librarian</asp:ListItem>
                            </asp:DropDownList>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label7" runat="server" Text="Account ID"></asp:Label></td>
                            <td class="style1">
                            <asp:TextBox ID="txtAcctID" runat="server" data-mask="99999999" class="inputmask" placeholder="ex. 20130002" Width="200px"></asp:TextBox>
                             <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator1" controltovalidate="txtAcctID"
                             validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>                   
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="labellabel" runat="server" Text="Password"></asp:Label></td>
                            <td class="style1">
                            <asp:TextBox ID="txtPass" runat="server" Width="200px" 
                                pattern="^([a-zA-Z0-9@*#/)(_!?&6%|{}\]{8,15})$" placeholder="mypassword" 
                                TextMode="Password"></asp:TextBox>
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator9" controltovalidate="txtPass"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo_2">
                <h4>2. <i class="icon-folder-open"></i>&nbsp;&nbsp;Personnel Information</h4></a>
            </div>

            <div id="collapseTwo_2"  class="accordion-body collapse">
                <div class="accordion-inner">
                    <table class="table borderless">
                        <tr>
                            <td><asp:Label ID="Label8" runat="server" Text="Last Name"></asp:Label></td>
                            <td>
                            <asp:TextBox ID="txtLast" runat="server" Width="200px" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" 
                                                            placeholder="Sanchez"></asp:TextBox>
                            <br />    <asp:requiredfieldvalidator id="Requiredfieldvalidator2" controltovalidate="txtLast"
                                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>  
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="<i class='icon-exclamation'></i>&nbsp; Invalid Character/s" CssClass="label label-important" 
                                            ControlToValidate="txtLast" ValidationExpression="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" ValidationGroup="LibrarianFinanceRegistration" Display="Dynamic"></asp:RegularExpressionValidator>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label9" runat="server" Text="First Name"></asp:Label></td>
                            <td>
            <asp:TextBox ID="txtFirst" runat="server" Width="200px" pattern="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" 
                                            placeholder="Annie"></asp:TextBox>
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator3" controltovalidate="txtFirst"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="<i class='icon-exclamation'></i>&nbsp; Invalid Character/s" CssClass="alert alert-error" 
                            ControlToValidate="txtFirst" ValidationExpression="^[a-zA-Z ]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z ]*)*$" ValidationGroup="LibrarianFinanceRegistration" Display="Dynamic"></asp:RegularExpressionValidator>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label10" runat="server" Text="Middle Name"></asp:Label></td>
                            <td>
                            <asp:TextBox ID="txtMiddle" runat="server" Width="200px" pattern="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" 
                                            placeholder="Calejo"></asp:TextBox>
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator4" controltovalidate="txtMiddle"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="<i class='icon-exclamation'></i>&nbsp; Invalid Character/s" CssClass="alert alert-error" 
                            ControlToValidate="txtMiddle" ValidationExpression="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$" ValidationGroup="LibrarianFinanceRegistration" Display="Dynamic"></asp:RegularExpressionValidator>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="adderss" runat="server" Text="Address"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtAdd" runat="server" Width="200px" pattern="^[a-zA-Z0-9,.\/\- ]+$" placeholder="1345, Pasay City"></asp:TextBox>
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator5" controltovalidate="txtAdd"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="<i class='icon-exclamation'></i>&nbsp; Invalid Character/s" CssClass="label label-important aspLabel" ControlToValidate="txtAdd" ValidationExpression="^[a-zA-Z0-9,.\/\- ]+$" ValidationGroup="LibrarianFinanceRegistration" Display="Dynamic"></asp:RegularExpressionValidator>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="genders" runat="server" Text="Gender"></asp:Label></td>
                            <td>
                            <asp:DropDownList ID="drpGen" runat="server" Width="215px" CssClass="ddl">
                                <asp:ListItem>Rather Not Say</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="bdayday" runat="server" Text="Birth Date"></asp:Label></td>
                            <td>
                          <div class="input-append date" id="dpYears2" data-date="2008-12-31" data-date-format="yyyy-mm-dd" data-date-viewmode="years">
                            <asp:TextBox ID="txtBday" runat="server" Width="175px"></asp:TextBox>
				            <span class="add-on" id="custom"><i class="icon-calendar"></i></span>
			              </div>
                          <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator6" controltovalidate="txtBday"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>                               
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                
                </div>
            </div>
        </div>
        <div class="accordion-group">
            <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion3" href="#collapseThree_2">
                <h4>3. <i class="icon-phone-sign"></i>&nbsp;&nbsp;Contact Information</h4></a>
            </div>

            <div id="collapseThree_2"  class="accordion-body collapse">
                <div class="accordion-inner">
                    <table class="table borderless">
                        <tr>
                            <td><asp:Label ID="cNumber" runat="server" Text="Mobile Number"></asp:Label></td>
                            <td>
                            <asp:TextBox ID="txtContact" runat="server" data-mask="99999999999" class="inputmask" placeholder="ex. 09096485660" Width="200px"></asp:TextBox>    
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator7" controltovalidate="txtContact"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic" />                  
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="eMail" runat="server" Text="Email"></asp:Label></td>
                            <td>
                            <asp:TextBox ID="txtE" runat="server" Width="200px" pattern="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" placeholder="eg. jrss@example.com"></asp:TextBox>
                            <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator8" controltovalidate="txtE"
                            validationgroup="LibrarianFinanceRegistration" errormessage="<i class='icon-exclamation'></i>&nbsp; Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>                
                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>                
                </div>
            </div>
        </div>

    </div>
  




        <center>
                <asp:LinkButton ID="btnReg" runat="server" validationgroup="LibrarianFinanceRegistration" onclick="btnReg_Click" CssClass="aspButton btn btn-success btn-large"><i class="icon-ok-sign"></i>&nbsp;&nbsp; Register User</asp:LinkButton>
        </center>

        <asp:Label ID="lblError" runat="server" Text="" CssClass="alert-danger" Visible="false"></asp:Label>
        <asp:Label ID="lblOk" runat="server" Text="" CssClass="alert-success" Visible="false"></asp:Label>
    </asp:Panel>
</asp:Content>

