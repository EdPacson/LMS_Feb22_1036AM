using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class EPurse
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

	public EPurse()
	{ }

    public void ComputeEPurseRecord(int accountid, float amount, string recordedby, string recordtype)
    {
        con.Open();

        ////INSERT TO EPURSE/TRANSACTION RECORD
        SqlCommand com = new SqlCommand("INSERT INTO tblEPurseRecord VALUES(@AccountID, @Amount, CURRENT_TIMESTAMP, @RecordedBy, @RecordType, 'Paid')", con);
        //com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Amount", SqlDbType.Float).Value = amount;
        com.Parameters.Add("@RecordedBy", SqlDbType.NVarChar).Value = recordedby;
        com.Parameters.Add("@RecordType", SqlDbType.NVarChar).Value = recordtype;
        com.ExecuteNonQuery();


        ////RELOAD EPURSE BALANCE
        if (recordtype.Equals("Reload"))
        {
            com = new SqlCommand("UPDATE tblAccount SET EPurseBalance = (EpurseBalance + @Amount) WHERE AccountID = @AccountID", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@Amount", SqlDbType.Float).Value = amount;
            com.ExecuteNonQuery();
        }
        else
        {
            com = new SqlCommand("UPDATE tblAccount SET EPurseBalance = (EpurseBalance - @Amount) WHERE AccountID = @AccountID", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@Amount", SqlDbType.Float).Value = amount;
            com.ExecuteNonQuery();
        }
        
        con.Close();
    }
    
    public DataTable ViewEPurse()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblEPurseRecord", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable GetEPurseRecordByAccountID(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblEPurseRecord WHERE AccountID = @AccountID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public void EPurseBalance(int accountid)
    {
        con.Open();

        SqlCommand com = new SqlCommand("SP_EPurseBalance", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.ExecuteNonQuery();

        con.Close();
    }
}