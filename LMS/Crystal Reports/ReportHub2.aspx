<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportHub2.aspx.cs" Inherits="Crystal_Reports_ReportHub2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet"/>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'/>
 	<link href="../assets/css/globalStyles2.css" rel="stylesheet"/>
    <link href="../assets/img/site_icon08.png" rel="shortcut icon"/>
    <style type="text/css">
    #test
    {
        width: 100%;
        height: inherit;
    }
    #formBodyCustom
	{
	    margin-top: auto;
		height: 1250px;
		transition: all 0.50s ease-in-out;
		-webkit-transition: all 0.50s ease-in-out;
		-moz-transition: all 0.50s ease-in-out;
		padding:15px;

	}	
        
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="divers" CssClass="navbar nav navbar-fixed-top" runat="server">
        <div class="navbar-inner">
            <div class="container">	
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-list"></span>
          </a>
          <div class="nav-collapse collapse">
            <ul class="nav">
                <li><a href="../Finance/Transaction.aspx"><i class="icon-chevron-left"></i>&nbsp; Back to LibraryMS</a></li>                                      
            </ul>
            <ul class="nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Reimbursements</a>
                <ul class="dropdown-menu">
            	    <li class="divider"></li>                               
                    <li><a href="Reimbursing/Reimburse-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Reimbursing/Reimburse-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Reimbursing/Reimburse.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                </ul></li>
                       <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Reloading</a>
                <ul class="dropdown-menu">
            	    <li class="divider"></li>                               
                    <li><a href="Reload/Reload-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Reload/Reload-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Reload/Reload.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                </ul></li>
            
            </ul>                


 
          </div><!--/.nav-collapse -->
       </div><!-- container div -->
    </div><!-- navbar-inner div -->
</asp:Panel><!-- navbar nav div -->

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12" id="formBodyCustom">
            <iframe frameborder="0" name="test" id="test"></iframe>
            
            </div>        
        </div>    
    </div>
    </form>
        <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap-collapse.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap-transition.js" type="text/javascript"></script>
</body>
</html>
