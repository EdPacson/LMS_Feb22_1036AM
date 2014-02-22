using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class comm
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    public comm()
	{
	}

    public void AddComment(string Name, string Email, string Comment)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Insert into tblFeedback(Name, Email, Comment, Date)VALUES(@Name, @Email, @Comment, CURRENT_TIMESTAMP)", con);
        com.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Name;
        com.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
        com.Parameters.Add("@Comment", SqlDbType.NVarChar).Value = Comment;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewComment()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select * from tblFeedback", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }
}