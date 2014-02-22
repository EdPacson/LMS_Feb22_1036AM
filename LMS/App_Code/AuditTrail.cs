using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class AuditTrail
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
    public AuditTrail()
    { }

    public void AddAuditTrail(string accountid, string usertype, string activity)
    {
        con.Open();
        SqlCommand com = new SqlCommand("INSERT INTO tblAuditTrail (AccountID, UserType, Activity, ActivityDate) VALUES(@accountid, @usertype, @activity, CURRENT_TIMESTAMP)", con);
        com.Parameters.Add("@accountid", SqlDbType.NVarChar).Value = accountid;
        com.Parameters.Add("@usertype", SqlDbType.NVarChar).Value = usertype;
        com.Parameters.Add("@activity", SqlDbType.NVarChar).Value = activity;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable GetAuditTrailByUserType(string usertype)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', UserType, Activity, ActivityDate as 'Activity Date' FROM tblAuditTrail WHERE UserType = @usertype ORDER BY CONVERT(datetime, ActivityDate, 102) ASC ", con);
        com.Parameters.Add("@usertype", SqlDbType.NVarChar).Value = usertype;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable GetAuditTrailByActivity(string activity)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', UserType, Activity, ActivityDate as 'Activity Date' FROM tblAuditTrail WHERE Activity = 'User Login'", con);
        com.Parameters.Add("@activity", SqlDbType.NVarChar).Value = activity;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable GetAuditTrail()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', UserType, Activity, ActivityDate as 'Activity Date' FROM tblAuditTrail", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable GetAuditTrailSortASC()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', UserType, Activity, ActivityDate as 'Activity Date' FROM tblAuditTrail ORDER BY CONVERT(datetime, ActivityDate, 102) ASC ", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable GetAuditTrailSortDESC()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', UserType, Activity, ActivityDate as 'Activity Date' FROM tblAuditTrail ORDER BY CONVERT(datetime, ActivityDate, 102) DESC ", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }
}