using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class SQLConnection
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());
	public SQLConnection()
	{ }

    public DataTable GetData(SqlCommand com)
    {
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        return table;
    }
}