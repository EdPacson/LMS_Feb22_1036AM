<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true" CodeFile="Reservation.aspx.cs" Inherits="Librarian_Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
<title>Reservation &diams; Library MS</title>
        <style type="text/css">
        .navReserve
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
    <table class="table">
        <tr>
            <td><img src="../assets/img/spanIMGS/spanReserve2.png" width="35" height="35"/></td>
            <td><h4>Reservation</h4></td>
        </tr>
        <tr>
            <td></td>
            <td>
    <p>At the right side of the panel, you can search for reservation by entering the Account ID. You can also update the reservation status the reserved items.</p>            
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server">
    <table class="table">
        <tr id="searchVBG" runat="server">
            <td>Search</td>
            <td>
                <asp:DropDownList ID="drpSearch" runat="server" Width="165px" CssClass="dll3">
                    <asp:ListItem>Choose Here</asp:ListItem>
                    <asp:ListItem>Book</asp:ListItem>
                    <asp:ListItem>AV Asset</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="validationBG" runat="server">
            <td>Account ID</td>
            <td><asp:TextBox ID="txtAcctID" runat="server" data-mask="99999999" 
                    class="inputmask" placeholder="ex. 20130002"></asp:TextBox>
                    <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controltovalidate="txtAcctID"
            ErrorMessage="<i class='icon-exclamation-sign'></i> &nbsp;Required"
             Display="Dynamic" CssClass="label label-important aspLabel"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
        <center><asp:LinkButton ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click"  CssClass="btn btn-success"><i class="icon-search"></i>&nbsp;&nbsp;Account Search</asp:LinkButton></center>
        <asp:Label ID="lblOk" runat="server" Text="Label" Visible = "false" CssClass="label label-important aspLabel"></asp:Label>
        <asp:Label ID="lblNo" runat="server" Text="Label" Visible ="false"  CssClass="label label-important aspLabel"></asp:Label>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="PanelBook" runat="server">
        <center><h4>Book Reservation List</h4></center>
        <asp:GridView ID="grdBook" runat="server" AllowPaging="True" PageSize="5" 
            CssClass="table GridStyle" HeaderStyle-BackColor="#0b5730" 
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderWidth="2px" 
            onpageindexchanging="grdBook_PageIndexChanging" >
            <EmptyDataTemplate>
                <h4>No records found!</h4>
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <br />
    <asp:Panel ID="PanelAVAsset" runat="server">
        <center><h4>AV Asset Reservation List</h4></center>
            <asp:GridView ID="grdAV" runat="server" AllowPaging="True" PageSize="5"
            HeaderStyle-BackColor="#0b5730" CssClass="table GridStyle"
        HeaderStyle-ForeColor="White" BorderColor="#0B5730" BorderWidth="2px" 
            onpageindexchanging="grdAV_PageIndexChanging" >
                <EmptyDataTemplate>
                    No records found!
                </EmptyDataTemplate>
            </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="PanelReservations" runat="server" Visible="false">
    <center><h4>Reservations</h4></center>
        <asp:GridView ID="grdReservations" runat="server" AllowPaging="True" 
            PageSize="5" onselectedindexchanged="grdReservations_SelectedIndexChanged"
            CssClass="table GridStyle" HeaderStyle-ForeColor="White" 
            BorderColor="#0B5730" BorderWidth="2px" 
            onpageindexchanging="grdReservations_PageIndexChanging" >
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/assets/img/btnSelect03.png" ControlStyle-Height="25" ControlStyle-Width="25" HeaderStyle-BackColor="#0b5730" HeaderStyle-ForeColor="White" ItemStyle-BackColor="#0b5730"  HeaderStyle-BorderColor="#0b5730" ItemStyle-BorderColor="#0b5730"/>
            </Columns>
            <EmptyDataTemplate>
                No records found!
            </EmptyDataTemplate>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="PanelAccountInfo" runat="server" Visible="false">
    <table class="table GridStyle">
        <tr>
            <td colspan="2" style="display: none"><asp:Label ID="ReservationID" runat="server" Text="lblReservationID"></asp:Label></td>
        </tr>
        <tr>
            <td class="style1"><strong>Account ID:</strong></td>
            <td><asp:Label ID="lblAcctID" runat="server" Text="lblAcctID"></asp:Label></td>
        </tr>
        <tr>
            <td class="style1"><strong>Name:</strong></td>
            <td><asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label></td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="PanelBookToReserve" runat="server" Visible="false">
    <table class="table">
        <tr>
            <td><strong>Book Title:</strong></td>
            <td><asp:Label ID="lblTitle" runat="server" Text="lblTitle"></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Author:</strong></td>
            <td><asp:Label ID="lblAuthor" runat="server" Text="lblAuthor"></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Date Reserved:</strong></td>
            <td><asp:Label ID="lblDate" runat="server" Text="lblDateReserved"></asp:Label></td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="PanelAVToReserve" runat="server" Visible="false">
     <table class="table GridStyle">
        <tr>
            <td><strong>Brand:</strong></td>
            <td><asp:Label ID="lblBrand" runat="server" Text="Brand"></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Model:</strong></td>
            <td><asp:Label ID="lblModel" runat="server" Text="Model"></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Serial Number:</strong></td>
            <td><asp:Label ID="lblSerial" runat="server" Text="Serial No."></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Type:</strong></td>
            <td><asp:Label ID="lblType" runat="server" Text="Type"></asp:Label></td>
        </tr>
        <tr>
            <td><strong>Date Reserved:</strong></td>
            <td><asp:Label ID="lblDateReserved" runat="server" Text="Date Reserved"></asp:Label></td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="PanelDropDown" runat="server" Visible = "false">
    <table class="table table-bordered">
        <tr>
            <td><strong>Change Status: </strong></td>
            <td><asp:DropDownList ID="drpStatus" runat="server">
                <asp:ListItem>Choose Here</asp:ListItem>
                <asp:ListItem>Claimed</asp:ListItem>
                <asp:ListItem>Unclaimed</asp:ListItem>
                <asp:ListItem>Cancelled</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-warning" Visible="false" onclick="btnBack_Click"><i class="icon-backward"></i>&nbsp;&nbsp;Back</asp:LinkButton></td>
       <td>
            <asp:LinkButton ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                Text="Update" CssClass ="btn btn-success"/>
            <asp:LinkButton ID="btnCancel" runat="server"
                onclick="btnCancel_Click" CssClass="btn btn-warning"><i class="icon-remove-sign"></i>&nbsp;&nbsp;Cancel</asp:LinkButton></td>
                        </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblUpdateMessage" runat="server" Text="Update Status" Visible="false" CssClass="label alert-success aspLabel"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="Error Message" Visible="false" CssClass="label label-important aspLabel"></asp:Label>
</asp:Content>

