using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Reservation
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

	public Reservation()
	{}

    //book reservation
    public int BookReservationID { get; set; }
    public int AccountId { get; set; }
    public int BookID { get; set; }
    public string DateReserved { get; set; }
    public DateTime DateDue { get; set; }
    public DateTime DateClaimed { get; set; }
    public string ReservationStatus { get; set; }

    // av reservation
    public int AVAssetID { get; set; }

    public void ReserveBook(int accountid, int assetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("INSERT INTO tblBookReservation(AccountID, BookID, DateReserved, DateDue, ReservationStatus) VALUES (@AccountID, @BookID, CURRENT_TIMESTAMP, @DateDue, 'Reserved')", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
        com.Parameters.Add("@DateDue", SqlDbType.DateTime).Value = DateTime.Now.AddDays(1);
        com.ExecuteNonQuery();
        con.Close();

        DeductBookInStock(assetid);
    }

    public void AddBookInStock(int assetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblBook SET InStock = (InStock + 1) WHERE BookID = @BookID", con);
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void DeductBookInStock(int assetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblBook SET InStock = (InStock - 1) WHERE BookID = @BookID", con);
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void ReserveAVAsset(int accountid, int assetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("INSERT INTO tblAVReservation(AccountID, AVAssetID, DateReserved, DateDue, ReservationStat) VALUES (@AccountID, @AVAssetID, CURRENT_TIMESTAMP, @DateDue, 'Reserved')", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@AVAssetID", SqlDbType.Int).Value = assetid;
        com.Parameters.Add("@DateDue", SqlDbType.DateTime).Value = DateTime.Now.AddDays(1);
        com.ExecuteNonQuery();
        con.Close();
    }

    public bool CheckIfBookReservationExist(int accountid, int bookid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("SELECT * FROM tblBookReservation WHERE AccountID = @AccountID AND BookID = @BookID AND ReservationStatus='Reserved'", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public bool IfBookDateDued(string accountid, string bookresid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select DateDue, DateClaimed from tblBookReservation Where AccountID = @AccountID and BookReservationID = @BookResID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@BookResID", SqlDbType.Int).Value = bookresid;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                DateClaimed = Convert.ToDateTime(dr["DateClaimed"]);
                DateDue = Convert.ToDateTime(dr["DateDue"]);
            }
        }

        int result = DateTime.Compare(DateDue, DateClaimed);
        bool condition = false;
        if (result < 0)
            condition =  true;

            con.Close();
        return condition;
    }

    public bool IfAVExpire(string accountid, string avresid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select DateDue, DateClaimed from tblAVReservation Where AccountID = @AccountID and AVAssetReservationID = @AVResID", con);
        com.Parameters.Add("@AccountID", SqlDbType.DateTime).Value = accountid;
        com.Parameters.Add("@AVResID", SqlDbType.DateTime).Value = avresid;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                DateClaimed = Convert.ToDateTime(dr["DateClaimed"].ToString());
                DateDue = Convert.ToDateTime(dr["DateDue"].ToString());
            }
        }

        int result = DateTime.Compare(DateDue, DateClaimed);
        bool condition = false;
        if (result < 0)
            condition = true;
        con.Close();
        return condition;
    }

    public bool CheckIfAVAssetReservationExist(int accountid, int assetid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("SELECT * FROM tblAVReservation WHERE AccountID = @AccountID AND AVAssetID= @AVAssetID AND ReservationStat='Reserved'", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@AVAssetID", SqlDbType.Int).Value = assetid;
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public void CancelReserveBook(int accountid, int bookid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblBookReservation SET ReservationStatus='Cancelled', DateClaimed = CURRENT_TIMESTAMP WHERE AccountID = @AccountID AND BookID = @BookID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        com.ExecuteNonQuery();
        con.Close();

        AddBookInStock(bookid);
    }

    public void CancelReserveAVAsset(int accountid, int assetid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblAVReservation SET ReservationStat='Cancelled', DateClaimed = CURRENT_TIMESTAMP WHERE AccountID = @AccountID AND AVAssetID= @AVAssetID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@AVAssetID", SqlDbType.Int).Value = assetid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AddPenalty(int accountid)
    {
        con.Open();
        double fee = 50;
        SqlCommand com = new SqlCommand("INSERT INTO tblPenalty(AccountID, PenaltyFee, PenaltyStatus, PenaltyType, DateRecorded) VALUES(@AccountID, @PenaltyFee, 'Pending', 'Unclaimed Reservation', CURRENT_TIMESTAMP)", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@PenaltyFee", SqlDbType.Float).Value = fee;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewReservedBooks()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblBookReservation ORDER BY DateReserved DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewReservedAVAsset()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblAVReservation ORDER BY DateReserved DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchBookTitle(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], (tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName) AS [Author's Name], Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.], CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where Title LIKE '%' + @Title + '%'", con);
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
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], (tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName) AS [Author's Name],  Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.], CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where Series LIKE '%' + @Series + '%' ", con);
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
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], (tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName) AS [Author's Name], Title, ISBN, ItemDescription AS [Item Descrp.], Series,Publisher,InStock AS [In Stock],  Barcode, Availability, CallNumber AS [Call No.], CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published], CopyNo from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where ALName LIKE '%' + @ALName + '%' OR AFName LIKE '%' + @AFName + '%' OR AMName LIKE '%' + @AMName + '%'", con);
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
        SqlCommand com = new SqlCommand("Select tblBook.BookID AS [Book ID], (tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName) AS [Author's Name], Title, ISBN, ItemDescription AS [Item Descrp.], Series, Publisher,InStock AS [In Stock], Barcode, Availability, CallNumber AS [Call No.], CatalogNo,(SELECT CONVERT(VARCHAR(10), DatePublished, 101)) AS [Date Published] from tblBook inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where CallNumber LIKE '%' + @CallNumber + '%' ", con);
        com.Parameters.Add("@CallNumber", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchMultiTitle(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblMultimedia.*, (SELECT CONVERT(VARCHAR(10),ReleaseDate, 101)) As [Release Date] from tblMultimedia where Title LIKE '%' + @Title + '%' ", con);
        com.Parameters.Add("@Title", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchDirector(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblMultimedia.*, (SELECT CONVERT(VARCHAR(10),ReleaseDate, 101)) As [Release Date] from tblMultimedia where Director LIKE '%' + @Director + '%' ", con);
        com.Parameters.Add("@Director", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchGenre(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblMultimedia.*, (SELECT CONVERT(VARCHAR(10),ReleaseDate, 101)) As [Release Date] from tblMultimedia where Genre LIKE '%' + @Genre + '%' ", con);
        com.Parameters.Add("@Genre", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchAVAssetBrand(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblAVAsset.* from tblAVAsset where Brand LIKE '%' + @Brand + '%' ", con);
        com.Parameters.Add("@Brand", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchAVAssetType(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblAVAsset.* from tblAVAsset where [Type] LIKE '%' + @Type + '%' ", con);
        com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SearchAVAssetModel(string search)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblAVAsset.* from tblAVAsset where Model LIKE '%' + @Model + '%' ", con);
        com.Parameters.Add("@Model", SqlDbType.NVarChar).Value = search;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewBookReservation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBookReservation.BookReservationID as 'ID', tblBookReservation.AccountID as 'Account ID', tblAccount.LName + ', ' + tblAccount.FName + ' ' + tblAccount.MName as 'Name', tblBook.Title as 'Title', tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName as 'Author Name', tblBookReservation.DateReserved as 'Date' from tblBookReservation inner join tblAccount on tblBookReservation.AccountID = tblAccount.AccountID inner join tblBook on tblBookReservation.BookID = tblBook.BookID inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID where tblBookReservation.AccountID = @AccountID AND tblBookReservation.ReservationStatus = 'Reserved' ORDER BY DateReserved DESC", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewAVReservation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblAVReservation.AVAssetReservationID as 'ID', tblAVReservation.AccountID as 'Account ID', tblAccount.LName + ', ' + tblAccount.FName + ' ' + tblAccount.MName as 'Name', tblAVAsset.Brand, tblAVAsset.Model, tblAVAsset.SerialNumber, tblAVAsset.Type, tblAVReservation.DateReserved as 'Date' from tblAVReservation inner join tblAccount on tblAVReservation.AccountID = tblAccount.AccountID inner join tblAVAsset on tblAVReservation.AVAssetID = tblAVAsset.AVAssetID where tblAVReservation.AccountID = @AccountID AND tblAVReservation.ReservationStat = 'Reserved' ORDER BY DateReserved DESC", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public void UpdateBookReservationStatus(int reservationid, string status)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Update tblBookReservation Set ReservationStatus = @ReservationStatus, DateClaimed= CURRENT_TIMESTAMP Where BookReservationID = @BookResID ", con);
        com.Parameters.Add("@ReservationStatus", SqlDbType.NVarChar).Value = status;
        com.Parameters.Add("@BookResID", SqlDbType.Int).Value = reservationid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateAVReservationStatus(int reservationid, string status)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Update tblAVReservation Set ReservationStat = @ReservationStatus, DateClaimed= CURRENT_TIMESTAMP Where AVAssetReservationID = @AVResID ", con);
        com.Parameters.Add("@ReservationStatus", SqlDbType.NVarChar).Value = status;
        com.Parameters.Add("@AVResID", SqlDbType.Int).Value = reservationid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AddPenaltyFee(int accountid, double amount, string recordedby)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Insert Into tblPenalty(AccountID, PenaltyFee, PenaltyStatus, PenaltyType, DateRecorded, RecordedBy) VALUES(@AccountID, @Amount, 'Pending' ,'Unclaimed', CURRENT_TIMESTAMP, @RecordedBy )  ", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Amount", SqlDbType.Float).Value = amount;
        com.Parameters.Add("@RecordedBy", SqlDbType.NVarChar).Value = recordedby;
        com.ExecuteNonQuery();
        con.Close();
    }

    public DataTable ViewReservedBook()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblBookReservation.AccountID as 'Account ID', tblAccount.LName + ', ' + tblAccount.FName + ' ' + tblAccount.MName as 'Name', tblBook.Title as 'Title', tblAuthor.ALName + ', ' + tblAuthor.AFName + ' ' + tblAuthor.AMName as 'Author Name', tblBookReservation.DateReserved as 'Date' from tblBookReservation inner join tblAccount on tblBookReservation.AccountID = tblAccount.AccountID inner join tblBook on tblBookReservation.BookID = tblBook.BookID inner join tblAuthor on tblBook.AuthorID = tblAuthor.AuthorID ORDER BY DateReserved DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewReservedAV()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select tblAVReservation.AccountID as 'Account ID', tblAccount.LName + ', ' + tblAccount.FName + ' ' + tblAccount.MName as 'Name', tblAVAsset.Brand, tblAVAsset.Model, tblAVAsset.SerialNumber as 'Serial No.', tblAVAsset.Type, tblAVReservation.DateReserved as 'Date' from tblAVReservation inner join tblAccount on tblAVReservation.AccountID = tblAccount.AccountID inner join tblAVAsset on tblAVReservation.AVAssetID = tblAVAsset.AVAssetID ORDER BY DateReserved DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable GetBookDate()
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select * from tblBookReservation",con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }
}