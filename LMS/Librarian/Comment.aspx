<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/LIBP.master" AutoEventWireup="true" CodeFile="Comment.aspx.cs" Inherits="Librarian_Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <table>
        <tr>
        <td>Name</td>
        <td>
            <asp:TextBox ID="Name" runat="server" runat="server" ReadOnly="true" Text='<%# Bind("Name") %>' Width="220px"></asp:TextBox></td>
        </tr>
        <tr>
        <td>Email</td>
        <td>
            <asp:TextBox ID="Email" runat="server" ReadOnly="true" Text='<%# Bind("Email") %>'  Width="220px"></asp:TextBox></td>
        </tr>
        <tr>
        <td>Comment</td>
        <td>
            <asp:TextBox ID="Comment" runat="server"  TextMode="MultiLine" Height="100px" TextRows="5" data-maxsize="250"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Comment" ErrorMessage="<i class='icon-exclamation'></i> &nbsp; Required" ValidationGroup="FinLibFeedback" CssClass="alert alert-error"></asp:RequiredFieldValidator></td>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="<i class='icon-exclamation'></i> &nbsp; Invalid Character/s!" CssClass="alert alert-error" 
                ValidationExpression="^\s*[a-zA-Z0-9,\s]+\s*$" ControlToValidate="Comment" Display="Dynamic" ValidationGroup="FinLibFeedback"></asp:RegularExpressionValidator>  
        </tr>
        <tr>
                <asp:HiddenField ID="hidTimeDate" runat="server" Value='<%# Bind("date") %>' />
            </tr>
        <tr>
           <td>
               <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" ValidationGroup="FinLibFeedback" /></td>
        </tr>
        <asp:Label ID="lblSuccess" runat="server" Visible="False" CssClass="alert-success" Text="Label"></asp:Label>
        </table>
    </asp:Panel>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
</asp:Content>

