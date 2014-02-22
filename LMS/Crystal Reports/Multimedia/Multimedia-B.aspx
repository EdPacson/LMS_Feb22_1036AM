<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Multimedia-B.aspx.cs" Inherits="Crystal_Reports_Multimedia_Multimedia_B" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body class="metro">
    <form id="form1" runat="server">
            <center>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                AutoDataBind="true" ReportSourceID="CrystalReportSource1" />
            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                <Report FileName="~\\Crystal Reports\\Multimedia\\Multimedia-B.rpt">
                </Report>
            </CR:CrystalReportSource>
            </center>
    </form>
</body>
</html>
