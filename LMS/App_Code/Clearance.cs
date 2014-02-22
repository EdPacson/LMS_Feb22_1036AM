using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Clearance
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

	public Clearance()
	{ }
	
    public DataTable ViewClearanceList()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT AccountID as 'Account ID', PenaltyFee as 'Penalty Fee', DateRecorded as 'Date Recorded', DateCleared as 'Date Cleared', RecordedBy as 'Recorded By' FROM tblPenalty ORDER BY DateRecorded DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

}