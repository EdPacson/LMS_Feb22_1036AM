<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportHub.aspx.cs" Inherits="Crystal_Reports_ReportHub" %>

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
       <asp:Panel ID="divers2" CssClass="navbar nav navbar-fixed-top" runat="server">
        <div class="navbar-inner">
            <div class="container">	
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-list"></span>
          </a>
          <div class="nav-collapse collapse">
            <ul class="nav">
                <li><a href="../Librarian/Transaction.aspx"><i class="icon-chevron-left"></i>&nbsp; Back to LibraryMS</a></li>                                      
            </ul>
            <ul class="nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Audio Visuals</a>
                <ul class="dropdown-menu">
            	    <li class="divider"></li>                               
                    <li><a href="AudioVisual/AudioVisual-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="AudioVisual/AudioVisual-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="AudioVisual/AudioVisual.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                </ul></li>
            
            
            	    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Materials</a>
                <ul class="dropdown-menu">
                    <li class="divider"></li>                                                 
                   <li class="nav-header"><i class="icon-book"></i>&nbsp;&nbsp;Books</li>                       
                    <li><a href="Book/Book-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Book/Book-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Book/Book.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                    <li class="divider"></li>                      
                   <li class="nav-header"><i class="icon-music"></i>&nbsp;&nbsp;Multimedia</li>                                
                    <li><a href="Multimedia/Multimedia-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Multimedia/Multimedia-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Multimedia/Multimedia.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>                  
                </ul></li>
            
            	    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Borrowed</a>
                <ul class="dropdown-menu">
            	    <li class="divider"></li>
                    <li class="nav-header"><i class="icon-book"></i>&nbsp;&nbsp;Books</li>                                
                    <li><a href="BorrowedBook/Borrowed-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="BorrowedBook/Borrowed-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="BorrowedBook/Borrowed.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                    <li class="divider"></li>                       
                    <li class="nav-header"><i class="icon-music"></i>&nbsp;&nbsp;Multimedia</li>                                
                    <li><a href="BorrowedMultimdia/BorrowedM-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="BorrowedMultimdia/BorrowedM-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="BorrowedMultimdia/BorrowedM.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>                    
                </ul></li>
                
            	    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-angle-down"></i>&nbsp;Damaged</a>
                <ul class="dropdown-menu">
            	    <li class="divider"></li>
                    <li class="nav-header"><i class="icon-book"></i>&nbsp;&nbsp;Books</li>                                
                    <li><a href="Damaged/DamagedB-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Damaged/DamagedB-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Damaged/DamagedB.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>            
                    <li class="divider"></li>                       
                    <li class="nav-header"><i class="icon-music"></i>&nbsp;&nbsp;Multimedia</li>                                
                    <li><a href="Damaged/DamagedM-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Minimal</a></li>
                    <li><a href="Damaged/DamagedM-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Default</a></li>
                    <li><a href="Damaged/DamagedM.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;Advanced</a></li>                    
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

<%--    <div>

    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3" id="formBody2">
                <div class="accordion" id="accordion2">
                    <div class="accordion-group" id="customAccordion" runat="server">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                            <h4><i class="icon-headphones"></i>&nbsp;&nbsp;Audio Visuals</h4></a>                     
                        </div>
                        <div id="collapseOne" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <p>Reports for AV assets are stored here. Please choose a preset.</p>
                                    <ul >
                                    <li><a href="AudioVisual/AudioVisual.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Default</a></li>

                                    <li><a href="AudioVisual/AudioVisual-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Minimal</a></li>
                                    <li><a href="AudioVisual/AudioVisual-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Advanced</a></li>
                                    </ul>
                            </div>
                        </div>                    
                    </div>
                    <!----- Accordion 2 ------->
                    <div class="accordion-group" id="customAccordion">
                        <div class="accordion-heading">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                            <h4><i class="icon-book"></i>&nbsp;&nbsp;Book</h4></a>                     
                        </div>
                        <div id="collapseTwo" class="accordion-body collapse">
                            <div class="accordion-inner">
                                <p>Reports for Books are stored here. Please choose a preset.</p>
                                    <ul >
                                    <li><a href="Book/Book-A.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Default</a></li>

                                    <li><a href="Book/Book-B.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Minimal</a></li>
                                    <li><a href="Book/Book.aspx" target="test" onclick="document.getElementById('test').frameBorder=0"><img src="../assets/img/spanIMGS/spanCReports2.png" width="15" height="15" />&nbsp;&nbsp;Advanced</a></li>
                                    </ul>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>
            <!----- SPAN 2 ------->
            <div class="span9" id="formBodyCustom">
                
                <iframe frameborder="0" name="test" id="test"></iframe>
            </div>
        </div>    
    </div>--%>
    </form>
    <script src="../assets/js/jquery.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap-collapse.js" type="text/javascript"></script>
    <script src="../assets/js/bootstrap-transition.js" type="text/javascript"></script>
</body>
</html>
