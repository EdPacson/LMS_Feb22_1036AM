<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/FINP.master" AutoEventWireup="true" CodeFile="Requisition.aspx.cs" Inherits="Finance_Requisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Requisition &diams; Library MS</title>
    <style type="text/css">
        .navReq
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanRequsition1.png" width="35" height="35" /></td>
            <td><h4>Requisitions</h4></td>
        </tr>
        <tr>
            <td></td>
            <td><p>Here, finance officers can approve requests submitted by Librarian for book acquisitions. The list is sorted according to their approval status on the right panel.</p></td>
        </tr>
    </table>
    <table class="table">
        <tr>
            <td><asp:Label ID="AcctID" runat="server" Text="ID"></asp:Label></td>
            <td><asp:TextBox ID="txtAccountID" runat="server" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Appr" runat="server" Text="Approver"></asp:Label></td>
            <td><asp:TextBox ID="txtApprovedBy" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Status"></asp:Label></td>
            <td>
                    <asp:DropDownList ID="drpStatus" runat="server" Width="185px" CssClass="dll4">
                        <asp:ListItem>Choose Here</asp:ListItem>
                        <asp:ListItem>Approve</asp:ListItem>
                        <asp:ListItem>Reject</asp:ListItem>
                    </asp:DropDownList>            
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="Rems" runat="server" Text="Remarks"></asp:Label></td>
            <td>
                 <asp:TextBox ID="txtRemarks" runat="server" placeholder="Remarks" TextMode="MultiLine" Width="175px" BorderColor="#0B5730" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox> 
                    <br />
                <asp:requiredfieldvalidator id="ReqField3" controltovalidate="txtRemarks"
                validationgroup="FinRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<i class='icon-exclamation'></i> &nbsp; Invalid Character/s!" CssClass="label label-important aspLabel" 
                                ValidationExpression="^\s*[a-zA-Z,\s]+\s*$" ControlToValidate="txtRemarks" Display="Dynamic" ValidationGroup="FinRequisition"></asp:RegularExpressionValidator>                                            
            </td>
        </tr>
        <tr>
            <td colspan="2">
                    <asp:LinkButton ID="btnApproval" runat="server" onclick="btnApproval_Click" 
                        validationgroup="FinRequisition" 
                        CssClass="aspButton btn btn-success btn-block"><i class="icon-ok-sign"></i>&nbsp;&nbsp;Approve Request</asp:LinkButton>            
            </td>
            <td></td>
        </tr>
    </table>    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="PanelDropdown" runat="server">
        <table class="table">
            <tr>
                <td></td>
                <td><h4>List Viewer</h4></td>
            </tr>
                    <tr>
            <td></td>
            <td><p>
            Please choose the requsition list that you would like to view.
            <br />
            <asp:DropDownList ID="drpRequestStatus" runat="server" 
            onselectedindexchanged="drpRequestStatus_SelectedIndexChanged" 
            AutoPostBack="True" Width="185px" CssClass="dll4">
            <asp:ListItem>Choose Here</asp:ListItem>
            <asp:ListItem>Approve</asp:ListItem>
            <asp:ListItem>Reject</asp:ListItem>
            <asp:ListItem>Pending</asp:ListItem>
            <asp:ListItem>All Requests</asp:ListItem>
            </asp:DropDownList>     
            
        
            </p>
            </td>
        </tr>
        </table>

    </asp:Panel>
<asp:Panel ID="PanelViewRequest" runat="server" Visible="False">
        <asp:GridView ID="grdRequisition" runat="server" 
            onselectedindexchanged="grdRequisition_SelectedIndexChanged" 
            PagerSettings-Mode="Numeric" PageButtonCount="4" 
            OnPageIndexChanging="grdRequisition_PageIndexChanging" 
            CssClass="table aspTable GridStyle" AllowPaging="True" PageSize="4">
            
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
            
            <HeaderStyle BackColor="#0B5730" ForeColor="White" BorderColor="#0B5730" BorderWidth="2px"></HeaderStyle>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#0B5730" />
            
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/assets/img/btnSelect03.png" ControlStyle-Height="25" 
                    ControlStyle-Width="25" HeaderStyle-BackColor="#0b5730" 
                    HeaderStyle-ForeColor="White" ItemStyle-BackColor="#0b5730"  
                    HeaderStyle-BorderColor="#0b5730" ItemStyle-BorderColor="#0b5730">
                <ControlStyle Height="25px" Width="25px" />
                <HeaderStyle BackColor="#0B5730" BorderColor="#0B5730" ForeColor="White" />
                <ItemStyle BackColor="#0B5730" BorderColor="#0B5730" />
                </asp:CommandField>
            </Columns>
                        
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <br />
   <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
</asp:Content>

