<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true" CodeFile="Requisition.aspx.cs" Inherits="Librarian_Requisition" %>

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
            <td><p>Page for submitting material requests subject for evaluation.</p></td>
        </tr>
    </table>
    <asp:Panel ID="BookRequisition" runat="server">
    <table class="table table-condensed">
        <tr>
            <td>Account ID</td>
            <td>
                <asp:TextBox ID="txtAccountID" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Title</td>
                <td>   
                <asp:TextBox ID="txtTitle"  pattern="^[A-Za-z0-9 ]*[A-Za-z0-9][A-Za-z0-9 ]*$" placeholder="Book Title" runat="server"></asp:TextBox>
                <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator1" controltovalidate="txtTitle"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/> 
            </td>
        </tr> 
        <tr>
            <td>
                Series</td>
            <td>
                <asp:TextBox ID="txtSeries" runat="server" placeholder="Series" pattern="^[a-zA-Z0-9. ]+$"></asp:TextBox>
                <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator2" controltovalidate="txtSeries"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" Display="Dynamic" CssClass="label label-important aspLabel" /> 
            </td>
        </tr>
        <tr>
            <td>
                Author</td>
            <td>
                <asp:TextBox ID="txtAuthor" runat="server"  placeholder="Author Name" pattern="^[a-zA-Z]+(([\'\,\.\- ][a-zA-Z' ])?[a-zA-Z]*)*$"></asp:TextBox>
                <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator3" controltovalidate="txtPublisher"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Publisher</td>
            <td>
                <asp:TextBox ID="txtPublisher" runat="server" pattern="^[a-zA-Z' ]+$" placeholder="Publisher Name"></asp:TextBox>
                <br /><asp:requiredfieldvalidator id="Requiredfieldvalidator4" controltovalidate="txtPublisher"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Quantity
            </td>
            <td>
                <asp:TextBox ID="txtQuantity" pattern="^[0-9]+$" placeholder="eg. 10" runat="server"></asp:TextBox>
                <asp:requiredfieldvalidator id="Requiredfieldvalidator8" MinimumValue="1" MaximumValue="10" controltovalidate="txtQuantity"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
                <asp:RangeValidator id="Quantity" runat="server"
                      Type="Integer" ControlToValidate="txtQuantity" 
                      MinimumValue="1" 
                      MaximumValue="10"
                      ErrorMessage="<i class='icon-exclamation-sign'></i> &nbsp;10 or below only." 
                      CssClass="label label-important aspLabel"
                      validationgroup="LibrarianRequisition" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Price</td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" pattern="^[+]?\d+(\.\d+)?$" placeholder="100"></asp:TextBox>
                <asp:requiredfieldvalidator id="Requiredfieldvalidator5" controltovalidate="txtPrice"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td>
                Recorded By</td>
            <td>
                <asp:TextBox ID="txtRecordedBy" runat="server" placeholder="Librarian's Name" 
                    ReadOnly="True"></asp:TextBox>
                <asp:requiredfieldvalidator id="Requiredfieldvalidator6" controltovalidate="txtRecordedBy"
                validationgroup="LibrarianRequisition" errormessage="<i class='icon-exclamation-sign'></i> &nbsp;Required" runat="server" CssClass="label label-important aspLabel" Display="Dynamic"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LinkButton ID="btnRequest" runat="server" Text="Request" 
                    onclick="btnRequest_Click" validationgroup="LibrarianRequisition" CssClass="aspButton btn btn-success btn-block"><i class="icon-tags"></i>&nbsp;&nbsp; Request</asp:LinkButton>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="Label1" runat="server" Text="Label" Visible="false" CssClass="label label-important aspLabel"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:Label ID="Label2" runat="server" Text="<i class='icon-exclamation-sign'></i>&nbsp;" Visible="false" CssClass="label label-success aspLabel"></asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="Panel2" runat="server">
        <asp:GridView ID="grdRequisition" runat="server"
            AutoGenerateColumns="False" AllowPaging="True" 
            PagerSettings-Mode="Numeric"  PageButtonCount="4" 
            OnPageIndexChanging="grdRequisition_PageIndexChanging" 
            CssClass="table table-hover" PageSize="5" 
            HorizontalAlign="Center" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="Account" HeaderText="Account ID" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Title" HeaderText="Title" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Series" HeaderText="Series" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Author" HeaderText="Author" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Publisher" HeaderText="Publisher" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Date Recorded" HeaderText="Date Recorded" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Date Approved" HeaderText="Date Approved" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Approved By" HeaderText="Approved By" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Req. Status" HeaderText="Req. Status" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
                <asp:BoundField DataField="Remarks" HeaderText="Remarks" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" HeaderStyle-BorderColor="#0b5730"/>
            </Columns>
        </asp:GridView>
    </asp:Panel>
</asp:Content>

