using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Resource
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    //book properties
    public int BookID { get; set; }
    public int AuthorID { get; set; }
    public string Author { get; set; }
    public string Title { get; set; }
    public string ISBN { get; set; }
    public string ItemDescription { get; set; }
    public string Series { get; set; }
    public string Publisher { get; set; }
    public int InStock { get; set; }
    public string CatalogNo { get; set; }
    public string Barcode { get; set; }
    public string Availability { get; set; }
    public string CallNumber { get; set; }
    public string DatePublished { get; set; }
    public string CopyNo { get; set; }

    //multimedia properties
    public int MultimediaID { get; set; }
    public string MultimediaTitle { get; set; }
    public string Director { get; set; }
    public string ReleaseDate  { get; set; }
    public string Genre { get; set; }
    public string MultiBarcode { get; set; }
    public string MultimediaAvailability { get; set; }

    // av asset properties
    public int AVAssetID { get; set; }
    public string Brand { get; set; }
    public string AssetNo { get; set; }
    public string Type { get; set; }
    public string SerialNo { get; set; }
    public string Model { get; set; }
    public string AVAssetAvailability { get; set; }

    public Resource()
    {
    }

    public int CheckIfAuthorExist(string lname, string fname, string mname)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_CheckIfAuthorExist", con); //put sql statement
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@ALName", SqlDbType.NVarChar).Value = lname;
        com.Parameters.Add("@AFName", SqlDbType.NVarChar).Value = fname;
        com.Parameters.Add("@AMName", SqlDbType.NVarChar).Value = mname;
        int authorID = Convert.ToInt32(com.ExecuteScalar());
        if (authorID == 0)
            authorID = 0;

        con.Close();
        return authorID;
    }

    public void AddAuthor(string lname, string fname, string mname)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_AddAuthor", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@ALName", SqlDbType.NVarChar).Value = lname;
        com.Parameters.Add("@AFName", SqlDbType.NVarChar).Value = fname;
        com.Parameters.Add("@AMName", SqlDbType.NVarChar).Value = mname;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AddBook(int authorID, string title, string isbn, string itemdescription, string series, string publisher,
        string catalogno, string barcode, string callnumber, string datepublished, string copyno)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_AddBookCatalog", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AuthorID", SqlDbType.Int).Value = authorID;
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
        com.Parameters.Add("@ISBN", SqlDbType.NVarChar).Value = isbn;
        com.Parameters.Add("@ItemDescription", SqlDbType.NVarChar).Value = itemdescription;
        com.Parameters.Add("@Series", SqlDbType.NVarChar).Value = series;
        com.Parameters.Add("@Publisher", SqlDbType.NVarChar).Value = publisher;
        com.Parameters.Add("@CatalogNo", SqlDbType.NVarChar).Value = catalogno;
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        com.Parameters.Add("@CallNumber", SqlDbType.NVarChar).Value = callnumber;
        com.Parameters.Add("@DatePublished", SqlDbType.Date).Value = datepublished;
        com.Parameters.Add("@CopyNo", SqlDbType.NVarChar).Value = copyno;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateBook(int bookid, int authorID, 
        string title, string isbn, string itemdescription, string series, string publisher,
        string catalogno, string barcode, string callnumber, string datepublished, string copyno)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_UpdateBook", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        com.Parameters.Add("@AuthorID", SqlDbType.Int).Value = authorID;
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
        com.Parameters.Add("@ISBN", SqlDbType.NVarChar).Value = isbn;
        com.Parameters.Add("@ItemDescription", SqlDbType.NVarChar).Value = itemdescription;
        com.Parameters.Add("@Series", SqlDbType.NVarChar).Value = series;
        com.Parameters.Add("@Publisher", SqlDbType.NVarChar).Value = publisher;
        com.Parameters.Add("@CatalogNo", SqlDbType.NVarChar).Value = catalogno;
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        com.Parameters.Add("@CallNumber", SqlDbType.NVarChar).Value = callnumber;
        com.Parameters.Add("@DatePublished", SqlDbType.Date).Value = datepublished;
        com.Parameters.Add("@CopyNo", SqlDbType.NVarChar).Value = copyno;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewBook()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ViewBook", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public void DeleteBook(int bookid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_DeleteBook", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AddAVAsset(string brand, string assetno, string type, string serialno, string model)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_AddAV", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@Brand", SqlDbType.NVarChar).Value = brand;
        com.Parameters.Add("@AssetNo", SqlDbType.NVarChar).Value = assetno;
        com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
        com.Parameters.Add("@SerialNumber", SqlDbType.NVarChar).Value = serialno;
        com.Parameters.Add("@Model", SqlDbType.NVarChar).Value = model;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateAV(int avassetid, string brand, string assetno, string type, string serialno, string model, string availability)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_UpdateAV", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AVAssetID", SqlDbType.Int).Value = avassetid;
        com.Parameters.Add("@Brand", SqlDbType.NVarChar).Value = brand;
        com.Parameters.Add("@AssetNo", SqlDbType.NVarChar).Value = assetno;
        com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
        com.Parameters.Add("@SerialNumber", SqlDbType.NVarChar).Value = serialno;
        com.Parameters.Add("@Model", SqlDbType.NVarChar).Value = model;
        com.Parameters.Add("@Availability", SqlDbType.NVarChar).Value = availability;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewAV()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ViewAV", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public void DeleteAV(int avassetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_DeleteAV", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AVAssetID", SqlDbType.Int).Value = avassetid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AddMulti(string title, string director, DateTime releasedate, string genre, string barcode)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_AddMultimedia", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
        com.Parameters.Add("@Director", SqlDbType.NVarChar).Value = director;
        com.Parameters.Add("@ReleaseDate", SqlDbType.Date).Value = releasedate;
        com.Parameters.Add("@Genre", SqlDbType.NVarChar).Value = genre;
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateMulti(int multimediaid, string title, string director, DateTime releasedate, string genre, string barcode, string availability)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_UpdateMultimedia", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = multimediaid;
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = title;
        com.Parameters.Add("@Director", SqlDbType.NVarChar).Value = director;
        com.Parameters.Add("@ReleaseDate", SqlDbType.Date).Value = releasedate;
        com.Parameters.Add("@Genre", SqlDbType.NVarChar).Value = genre;
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        com.Parameters.Add("@Availability", SqlDbType.NVarChar).Value = availability;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewMulti()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ViewMultimedia", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public void DeleteMulti(int multimediaid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_DeleteMultimedia", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = multimediaid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public Resource GetBookInfoByBarcode(string barcode)
    {
        con.Open();
        Resource res = new Resource();
        SqlCommand com = new SqlCommand("SELECT tblBook.*, tblAuthor.ALName + ',' + tblAuthor.AFName as 'Author', CallNumber AS 'Call No.', CatalogNo AS 'Catalog No', CopyNo AS 'Copy No' FROM tblBook INNER JOIN tblAuthor ON tblBook.AuthorID = tblAuthor.AuthorID Where Barcode = @Barcode", con);//another inner join
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            res.BookID = Convert.ToInt32(sdr["BookID"].ToString());
            res.Title = sdr["Title"].ToString();
            res.Author = sdr["Author"].ToString();
            res.ItemDescription = sdr["ItemDescription"].ToString();
            res.ISBN = sdr["ISBN"].ToString();
            res.Series = sdr["Series"].ToString();
            res.Publisher = sdr["Publisher"].ToString();
            res.CatalogNo = sdr["CatalogNo"].ToString();
            res.DatePublished = sdr["DatePublished"].ToString();
            res.Barcode = sdr["Barcode"].ToString();
            res.Availability = sdr["Availability"].ToString();
            res.InStock = Convert.ToInt32(sdr["InStock"].ToString());
            res.Barcode = sdr["Barcode"].ToString();
            res.CallNumber = sdr["CallNumber"].ToString();
            res.CatalogNo = sdr["CatalogNo"].ToString();
            res.CopyNo = sdr["CopyNo"].ToString();
        }
        con.Close();
        return res;
    }

    public Resource GetMultimediaInfoByID(string barcode)
    {
        con.Open();
        Resource res = new Resource();
        SqlCommand com = new SqlCommand("SELECT * FROM tblMultimedia Where Barcode = @Barcode", con);

        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            res.MultimediaID = Convert.ToInt32(sdr["MultimediaID"].ToString());
            res.MultimediaTitle = sdr["Title"].ToString();
            res.Director = sdr["Director"].ToString();
            res.ReleaseDate = sdr["ReleaseDate"].ToString();
            res.Genre = sdr["Genre"].ToString();
            res.Barcode = sdr["Barcode"].ToString();
            res.MultimediaAvailability = sdr["Availability"].ToString();
        }
        con.Close();
        return res;
    }

    public Resource GetAVAssetInfoByID(string assetno)
    {
        con.Open();
        Resource res = new Resource();
        SqlCommand com = new SqlCommand("Select tblAVAsset.* from tblAVAsset Where AssetNo = @AssetNo", con);
        com.Parameters.Add("@AssetNo", SqlDbType.NVarChar).Value = assetno;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            res.AVAssetID = Convert.ToInt32(sdr["AVAssetID"].ToString());
            res.Brand = sdr["Brand"].ToString();
            res.AssetNo = sdr["AssetNo"].ToString();
            res.Type = sdr["Type"].ToString();
            res.SerialNo = sdr["SerialNumber"].ToString();
            res.Model = sdr["Model"].ToString();
            res.AVAssetAvailability = sdr["Availability"].ToString();
        }
        con.Close();
        return res;
        }

        public DataTable SearchBookTitle(string search)
        {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], tblAuthor.ALName as [Author's LName], tblAuthor.AFName as [Author's FName],  tblAuthor.AMName AS [Author's MName], Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.],CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where Title LIKE '%' + @Title + '%'", con);
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchBookSeries(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], tblAuthor.ALName as [Author's LName], tblAuthor.AFName as [Author's FName],  tblAuthor.AMName AS [Author's MName], Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.],CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where Series LIKE '%' + @Series + '%' ", con);
        com.Parameters.Add("@Series", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchBookAuthor(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], tblAuthor.ALName as [Author's LName], tblAuthor.AFName as [Author's FName],  tblAuthor.AMName AS [Author's MName], Title, ISBN, ItemDescription AS [Item Descrp.], Series,Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.],CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published],CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where ALName LIKE '%' + @ALName + '%' OR AFName LIKE '%' + @AFName + '%' OR AMName LIKE '%' + @AMName + '%'", con);
        com.Parameters.Add("@ALName", SqlDbType.NVarChar).Value = search;
        com.Parameters.Add("@AFName", SqlDbType.NVarChar).Value = search;
        com.Parameters.Add("@AMName", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchBookCallNumber(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], tblAuthor.ALName as [Author's LName], tblAuthor.AFName as [Author's FName],  tblAuthor.AMName AS [Author's MName], Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.], CatalogNo, (SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where CallNumber LIKE '%' + @CallNumber + '%' ", con);
        com.Parameters.Add("@CallNumber", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }
}　