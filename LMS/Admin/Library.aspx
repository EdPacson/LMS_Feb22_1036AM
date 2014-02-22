<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ADMP.master" AutoEventWireup="true" CodeFile="Library.aspx.cs" Inherits="Admin_Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPH" Runat="Server">
    <title>Library &diams; Library MS</title>
    <style type="text/css">
        .navALib
        {
	        background-color: #15A65A;
	        font-weight: bold;	
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SideContentPH" Runat="Server">
                <div class="tabbable"> <!-- Only required for left/right tabs -->
                  <ul class="nav nav-pills nav-stacked nav-tabs">
                    <li><a href="#tab1" data-toggle="tab">About Us</a></li>
                    <li><a href="#tab2" data-toggle="tab">Contact Us</a></li>
                    <li><a href="#tab3" data-toggle="tab">Library Policy</a></li>
                    <li><a href="#tab4" data-toggle="tab">Comments</a></li>
                  </ul>
                </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPH" Runat="Server">
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
        <h1>The Campus</h1>
            <img src="../assets/img/JRSS_Facade01.PNG" width="675" height="400" class="img-polaroid"/>
                <br /><br /><p>Jesus the Risen Saviour School is a De La Salle accredited institution that is guided by the core 
                Lasallian Values. All practitioners teaching at the institution are Master's degree holders and are 
                regularly oriented with the De La Salle teaching values. As such, Jesus the Risen Saviour School focuses 
                on a learner - progressive centered approach wherein individual uniqueness and professional competency are 
                prioritized. It is the only campus in Laguna that offers subject electives such as Biochemistry, Physiology 
                and Public Speaking / Debate.</p>
                <p>Jesus the Risen Saviour School offers an academic library for enrolled students and faculties which houses a 
                variety of published medias that can aid in learning or teaching. Students are allowed to borrow campus materials 
                provided that: <br /> (i). The student presents all necessary requirements for borrowing. <br /> (ii). The student 
                is currently enrolled in the institution. <br /> Please note that students are restricted from using the ID of not 
                his belonging and is punishable by the Campus Handbook Article V Section B.</p>
    </div>
    <div class="tab-pane" id="tab2">
      <h1>Contact Us</h1>
        <iframe class="img-polaroid" width="640" height="480" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Jesus+the+Risen+Savior+School+(DLSUS),+Laguna,+Philippines&amp;aq=3&amp;oq=Jesus+the+Risen+Savior+S&amp;sll=12.07895,121.95925&amp;sspn=26.20468,43.286133&amp;ie=UTF8&amp;hq=Jesus+the+Risen+Savior+School+(DLSUS),+Laguna,&amp;hnear=Philippines&amp;t=h&amp;cid=12466785057567596085&amp;ll=14.365575,121.043265&amp;spn=0.009978,0.013733&amp;z=16&amp;iwloc=A&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Jesus+the+Risen+Savior+School+(DLSUS),+Laguna,+Philippines&amp;aq=3&amp;oq=Jesus+the+Risen+Savior+S&amp;sll=12.07895,121.95925&amp;sspn=26.20468,43.286133&amp;ie=UTF8&amp;hq=Jesus+the+Risen+Savior+School+(DLSUS),+Laguna,&amp;hnear=Philippines&amp;t=h&amp;cid=12466785057567596085&amp;ll=14.365575,121.043265&amp;spn=0.009978,0.013733&amp;z=16&amp;iwloc=A" style="color:#0000FF;text-align:left">View Larger Map</a></small>                    
        <table>
            <tr>
                <td class="pull-right"><h4>Telephone Hotline:</h4></td>
                <td>868-5092</td>
            </tr>
            <tr>
                <td></td>
                <td>420-2301/o3</td>
            </tr>
            <tr>
                <td class="pull-right"><h4>Email:</h4></td>
                <td>&nbsp;&nbsp;<a href="mailto:jrss1995@yahoo.com?Subject=Concern%20Ticket" target="_top">jrss1995@yahoo.com</a></td>
            </tr>
        </table>
    </div>
    <div class="tab-pane" id="tab3">
    <h1>Our Policy</h1>
    <table class="policy">
        <tr>
            <td>1. All personal belongings (back, thick folders, envelopes, etc) should be left fot sake keeping to the librarian before entering the LRC.</td>
        </tr>
        <tr>
            <td>2. The LRC is used for studying, reading, doing research work, borrowing books, materials or equivalent</td>
        </tr>
        <tr>
            <td>3. For group or class work use, a reservation slip should be filled out 3 days before actual date of use.</td>
        </tr>
        <tr>
            <td>4. Silence should be observed at all times. idle conversations, loud laughter and other unnecessary noise must be avoided.</td>
        </tr>
        <tr>
            <td>5. Eating and sleeping inside the library are strictly prohibited.</td>
        </tr>
        <tr>
            <td>6. Keep things in order. tables and floors should be kept clean and orderly at all times.</td>
        </tr>
        <tr>
            <td>7. Before leaving the library chairs must be pushed back against the table.</td>
        </tr>
        <tr>
            <td>8. All books taken from the shelves to be used only inside the LRC should be returned on the assigned area. the librarian will be the one to return the book to their respectivd shelves.</td>
        </tr>
        <tr>
            <td>9. Students should not commit acts such as stealing books or other library property and tearing out pages of books or periodicals. these acts are considered major offense.</td>
        </tr>
        <tr>
            <td>10. Students with overdue books or any outstanding obligation in the LRC are not allowed to checkout any materials until such obligation is settled.</td>
        </tr>
        <tr>
            <td>11. With the principal's approval, the librarian may suspend indefinitely any or all library privileges of any student for any repeated serious violations of library rules and regulations.</td>
        </tr>
        <tr>
            <td><h1>Borrowing Procedures</h1></td>
        </tr>
        <tr>
            <td>1. JRSS Students can borrow books as long as they comply with the needed requirements: (A) School ID (B) Enrolled (C) No Pending Library Clearance</td>
        </tr>
        <tr>
            <td>2. Highschool student can borrow a maximum of three books for one (1) week.</td>
        </tr>
        <tr>
            <td>3. A faculty member can borrow books used as reference for subject being taught or for other purposes. The requirements are the same with students.</td>
        </tr>
        <tr>
            <td><h1>Lost Materials</h1></td>
        </tr>
        <tr>    
            <td>1. A lost book must be reported immediately to avoid accumulation or fines.</td>
        </tr>
        <tr>
            <td>2. It must be paid for or replaced with the latest edition of the same title not later than 2 weeks after the library has been notified of the case.</td>
        </tr>
        <tr>
            <td>3. Books returned with missing pages should be the responsibility of the last borrower.</td>
        </tr>
        <tr>
            <td>4. Books checked out must be scanned carefully. Missing pages should be reported to the librarian so it does become the responsibility of the borrower.</td>
        </tr> 
      </table>
    </div>
     <div class="tab-pane" id="tab4">
    	<h1>FeedBacks</h1>

        <%--<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
        <ContentTemplate>
         
        <asp:DataGrid ID="DataGrid1" runat="server" DataSourceID="SqlDataSource1" 
            Width="593px" CellPadding="4" ForeColor="Black" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="0px" CellSpacing="2" 
                PagerSettings-Mode="Numeric"  PageButtonCount="4" OnPageIndexChanged = "DataGrid1_PageIndexChanged"
                CssClass="table table-hover" AllowPaging="True" PageSize="4">
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle Mode="NumericPages" />
        </asp:DataGrid>
   
        </ContentTemplate>
        
        </asp:UpdatePanel>--%>

         <asp:GridView ID="grdFeedback" DataSourceID="SqlDataSource1" runat="server" AllowPaging="True"
          PagerSettings-Mode="Numeric"  PageButtonCount="10" PageSize="10" CssClass="table table-hover"
           OnPageIndexChanging="grdFeedback_PageIndexChanging">
         </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:LMSConnectionString %>" 
            SelectCommand="SELECT [Name], [Email], [Comment], [Date] FROM [tblFeedback] ORDER BY [FeedbackID] DESC">
        </asp:SqlDataSource>
    </div>

  		</div>
</asp:Content>

