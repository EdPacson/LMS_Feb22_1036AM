<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reloading-B.aspx.cs" Inherits="Crystal_Reports_Reloading_Reloading_B" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <title></title>
         <link rel="Stylesheet" href="../../assets/css/bootstrap.css" />
<link rel="Stylesheet" href="../../assets/css/globalStyles2.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'/>
<script src="../../assets/js/metro-slider.js" type="text/javascript"></script>
</head>
<body class="metro">
    <form id="form1" runat="server">
    <div>
              <center>
         <div class="alert alert-success alert-block">
            <div class="input-control switch">
                <table>
                    <tr>
                        <td>
                        <label>
                        <input type="checkbox" />
                        <span class="check" onclick='window.location="../Book/Book-B.aspx"'></span>&nbsp;
                        </label>
                        </td>
                       
                        <td>
                           <h4>Basic Preset is OFF</h4>
                           <p>Enabling this option will show you a streamlined, basic version of the report.</p> 
                        </td>

                    </tr>
                    <tr>
                        <td>

                    </tr>
                </table>
             </div>
          </div>

    </div>

    </form>
</body>
</html>
