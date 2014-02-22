using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

public class Helper
{
	public Helper()
	{ }

    public static string GetConnection()
    {
        return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
    }

    public static string ConvertToNameFormat(string firstname, string middlename, string lastname)
    {
        string name = string.Format("{0}, {1} {2}",lastname, firstname, middlename);
        return name;
    }
}