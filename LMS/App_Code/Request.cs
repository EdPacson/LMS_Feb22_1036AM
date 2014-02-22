using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Request
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

	public Request()
	{ }

    public void Requisition(int accountid, string title, string series, string author, string publisher, float price, 
        int quantity, string recordedby)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_Request", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
        com.Parameters.Add("@Series", SqlDbType.NVarChar).Value = series;
        com.Parameters.Add("@Author", SqlDbType.NVarChar).Value = author;
        com.Parameters.Add("@Publisher", SqlDbType.NVarChar).Value = publisher;
        com.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;
        com.Parameters.Add("@Price", SqlDbType.Float).Value = price;
        com.Parameters.Add("@RecordedBy", SqlDbType.NVarChar).Value = recordedby;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewRequest()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ViewRequest", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewApprovedRequest()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select RequestID AS [Req. ID], AccountID AS [Account], Title, Series, Author, Publisher, Quantity, Price,(Select Convert (varchar(10), DateRecorded, 101)) AS [Date Recorded],  (Select Convert (varchar(10), DateApproved, 101)) AS [Date Approved], RecordedBy As [Recorded By], ApprovedBy AS [Approved By],RequestStatus AS [Req. Status], Remarks From tblRequest Where RequestStatus = 'Approve'", con);
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewRejectRequest()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select RequestID AS [Req. ID], AccountID AS [Account], Title, Series, Author, Publisher, Quantity, Price,(Select Convert (varchar(10), DateRecorded, 101)) AS [Date Recorded],  (Select Convert (varchar(10), DateApproved, 101)) AS [Date Approved], RecordedBy As [Recorded By], ApprovedBy AS [Approved By],RequestStatus AS [Req. Status], Remarks From tblRequest Where RequestStatus = 'Reject'", con);
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewPendingRequest()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select RequestID AS [Req. ID], AccountID AS [Account], Title, Series, Author, Publisher, Quantity, Price,(Select Convert (varchar(10), DateRecorded, 101)) AS [Date Recorded],  (Select Convert (varchar(10), DateApproved, 101)) AS [Date Approved], RecordedBy As [Recorded By], ApprovedBy AS [Approved By],RequestStatus AS [Req. Status], Remarks From tblRequest Where RequestStatus = 'Pending'", con);
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }


    public void RequestApproval(int requestid, int accountid, string approvedby, string requeststatus, string remarks)
    {
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand("SP_RequestApproval", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@RequestID", SqlDbType.Int).Value = requestid;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@ApprovedBy", SqlDbType.NVarChar).Value = approvedby;
        com.Parameters.Add("@RequestStatus", SqlDbType.NVarChar).Value = requeststatus;
        com.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = remarks;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewRequestApproval()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ViewRequestApproval", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    
}