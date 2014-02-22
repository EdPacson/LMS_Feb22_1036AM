<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AudioVisual-A.aspx.cs" Inherits="Crystal_Reports_AudioVisual_AudioVisual_A" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportViewer ID="CRVAudio" runat="server" 
            AutoDataBind="true" ReportSourceID="CRSAudioA" />
        <CR:CrystalReportSource ID="CRSAudioA" runat="server">
            <Report FileName="~\\Crystal Reports\\AudioVisual\\AudioVisual-A.rpt">
            </Report>
        </CR:CrystalReportSource>
    </div>
    </form>
</body>
</html>
