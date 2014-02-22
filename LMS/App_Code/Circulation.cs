using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class Circulation
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

    public Circulation()
    { }

    //book circulation
    public int BookCirculationID { get; set; }
    public int BookID { get; set; }
    public int AccountID { get; set; }
    public string BorrowedOn { get; set; }
    public string ReturnedOn { get; set; }
    public string DateDue { get; set; }
    public string LendBy { get; set; }
    public string BorrowedBy { get; set; }
    public string ReceivedBy { get; set; }
    public string CirculationStatus { get; set; }
    public string CiculationType { get; set; }

    //multimedia circulation
    public int MultimediaCirculationID { get; set; }
    public int MultimediaID { get; set; }

    public bool CheckIfBookStockIsOk(int bookid)
    {
        con.Open();
        bool condition = true;
        SqlCommand com = new SqlCommand("SELECT * FROM tblBook WHERE BookID = @BookID", con);
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
            if (Convert.ToInt32(sdr["InStock"]) == 0)
                condition = false;
        con.Close();
        return condition;
    }

    public void UpdateBookAvailability(int bookid, string status)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblBook SET Availability = @Status WHERE BookID = @BookID", con);
        com.Parameters.Add("@Status", SqlDbType.NVarChar).Value = status;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateMultimediaAvailability(int multimediaid, string status)
    {
        SqlCommand com = new SqlCommand("UPDATE tblMultimedia SET Availability = @Status WHERE MultimediaID = @MultimediaID", con);
        com.Parameters.Add("@Status", SqlDbType.NVarChar).Value = status;
        com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = multimediaid;
        com.ExecuteNonQuery();
    }

    public List<DateTime> GetHolidays()
    {
        SqlCommand com = new SqlCommand("SP_ViewHolidays", con);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter data = new SqlDataAdapter(com);
        var list = new List<DateTime>();
        DataTable table = new DataTable();
        data.Fill(table);
        foreach (DataRow row in table.Rows)
            list.Add(Convert.ToDateTime(row["Holidays"]));
        return list;
    }

    public bool CheckIfDueDateIsHoliday()
    {
        var condition = false;
        foreach (var item in GetHolidays())
            if (item == DateTime.Now.AddDays(7))
                condition = true;
        return condition;
    }

    public void BorrowAsset(int accountid, int assetid, string assettype, string lendby, string type)
    {
        con.Open();
        if (assettype.Equals("Book"))
        {
            SqlCommand com = new SqlCommand("INSERT INTO tblBookCirculation(AccountID, BookID, BorrowedOn, DateDue, LendBy, CirculationStatus, CirculationType) VALUES (@AccountID, @BookID, @BorrowedOn, @DateDue, @LendBy, 'Out', @Type)", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
            com.Parameters.Add("@BorrowedOn", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();

            //filter duedate for holidays
            if (CheckIfDueDateIsHoliday())
                com.Parameters.Add("@DateDue", SqlDbType.Date).Value = DateTime.Now.AddDays(6);
            else
                com.Parameters.Add("@DateDue", SqlDbType.Date).Value = DateTime.Now.AddDays(7);

            com.Parameters.Add("@LendBy", SqlDbType.NVarChar).Value = lendby;
            com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;

            com.ExecuteNonQuery();
            DeductBookInStock(assetid);
        }
        else
        {
            SqlCommand com = new SqlCommand("INSERT INTO tblMultimediaCirculation(AccountID, MultimediaID, BorrowedOn, DateDue, LendBy, CirculationStatus, CirculationType) VALUES (@AccountID, @MultimediaID, @BorrowedOn, @DateDue, @LendBy, 'Out', @Type)", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = assetid;
            com.Parameters.Add("@BorrowedOn", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
            com.Parameters.Add("@DateDue", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
            com.Parameters.Add("@LendBy", SqlDbType.NVarChar).Value = lendby;
            com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
            com.ExecuteNonQuery();
            UpdateMultimediaAvailability(assetid, "Unavailable");

        }
        con.Close();
    }

    public void AddBookInStock(int assetid)
    {
        SqlCommand com = new SqlCommand("UPDATE tblBook SET InStock = (InStock + 1) WHERE BookID = @BookID", con);
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
        com.ExecuteNonQuery();
    }

    public void DeductBookInStock(int assetid)
    {
        SqlCommand com = new SqlCommand("UPDATE tblBook SET InStock = (InStock - 1) WHERE BookID = @BookID", con);
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
        com.ExecuteNonQuery();
    }

    public void ReturnAsset(int accountid, int assetid, string assettype, string receivedby, string type)
    {
        con.Open();
        if (assettype.Equals("Book"))
        {
            SqlCommand com = new SqlCommand("UPDATE tblBookCirculation SET ReturnedOn = @ReturnedOn, ReceivedBy = @ReceivedBy, CirculationStatus= 'In', CirculationType=@Type WHERE AccountID = @AccountID AND BookID = @BookID", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@BookID", SqlDbType.Int).Value = assetid;
            com.Parameters.Add("@ReturnedOn", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
            com.Parameters.Add("@ReceivedBy", SqlDbType.NVarChar).Value = receivedby;
            com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
            com.ExecuteNonQuery();
            //filter penalty according to type
            if (type.Equals("Partially Damaged"))
            {
                AddPenalty(accountid, type, receivedby);
                AddBookInStock(assetid);
            }
            else if (type.Equals("Damaged"))
            {
                AddPenalty(accountid, type, receivedby);
            }
            else if (type.Equals("Lost"))
            {
                AddPenalty(accountid, type, receivedby);
            }
            else
            {
                AddBookInStock(assetid);
            }
            //filter penalty according to overdue
            Circulation book = GetBookCirculation(accountid, assetid);
            if (Convert.ToDateTime(book.ReturnedOn).Day - Convert.ToDateTime(book.DateDue).Day > 7)//if overdue
            {
                //add penalty
                AddPenalty(accountid, type, receivedby);
            }
        }
        else
        {
            SqlCommand com = new SqlCommand("UPDATE tblMultimediaCirculation SET ReturnedOn = @ReturnedOn, ReceivedBy = @ReceivedBy, CirculationStatus= 'In', CirculationType=@Type WHERE AccountID = @AccountID AND MultimediaID = @MultimediaID", con);
            com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
            com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = assetid;
            com.Parameters.Add("@ReturnedOn", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
            com.Parameters.Add("@ReceivedBy", SqlDbType.NVarChar).Value = receivedby;
            com.Parameters.Add("@Type", SqlDbType.NVarChar).Value = type;
            com.ExecuteNonQuery();

            if (type.Equals("Damaged"))
            {
                AddPenalty(accountid, type, receivedby, 100);
            }
            else if (type.Equals("Lost"))
            {
                AddPenalty(accountid, type, receivedby, 100);
            }
            else if (type.Equals("Partially Damaged"))
            {
                AddPenalty(accountid, type, receivedby);
                UpdateMultimediaAvailability(assetid, "Available");
            }
            else
            {
                UpdateMultimediaAvailability(assetid, "Available");
            }
        }
        con.Close();
    }

    public Circulation GetBookCirculation(int accountid, int bookid)
    {
        Circulation book = new Circulation();
        SqlCommand com = new SqlCommand("SELECT * FROM tblBookCirculation WHERE AccountID=@AccountID AND BookID = @BookID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@BookID", SqlDbType.Int).Value = bookid;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            book.BookCirculationID = Convert.ToInt32(sdr["BookCirculationID"]);
            book.AccountID = Convert.ToInt32(sdr["AccountID"]);
            book.BookID = Convert.ToInt32(sdr["BookID"].ToString());
            book.BorrowedOn = sdr["BorrowedOn"].ToString();
            book.ReturnedOn = sdr["ReturnedOn"].ToString();
            book.DateDue = sdr["DateDue"].ToString();
            book.LendBy = sdr["LendBy"].ToString();
            book.BorrowedBy = sdr["BorrowedBy"].ToString();
            book.ReceivedBy = sdr["ReceivedBy"].ToString();
            book.CirculationStatus = sdr["CirculationStatus"].ToString();
            book.CiculationType = sdr["CirculationType"].ToString();
        }
        return book;
    }

    public Circulation GetMultimediaCirculation(int accountid, int multimediaid)
    {
        con.Open();
        Circulation multimedia = new Circulation();
        SqlCommand com = new SqlCommand("SELECT * FROM tblMultimediaCirculation WHERE AccountID=@AccountID AND MultimediaID = @MultimediaCirculationID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@MultimediaCirculationID", SqlDbType.Int).Value = multimediaid;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            multimedia.MultimediaCirculationID = Convert.ToInt32(sdr["MultimediaCirculationID"].ToString());
            multimedia.AccountID = Convert.ToInt32(sdr["AccountID"].ToString());
            multimedia.MultimediaID = Convert.ToInt32(sdr["MultimediaID"].ToString());
            multimedia.ReturnedOn = sdr["ReturnedOn"].ToString();
            multimedia.DateDue = sdr["DateDue"].ToString();
            multimedia.LendBy = sdr["LendBy"].ToString();
            multimedia.BorrowedBy = sdr["BorrowedBy"].ToString();
            multimedia.ReceivedBy = sdr["ReceivedBy"].ToString();
            multimedia.CirculationStatus = sdr["CirculationStatus"].ToString();
            multimedia.CiculationType = sdr["CirculationType"].ToString();
        }

        con.Close();
        return multimedia;
    }

    public void AddPenalty(int accountid, string type, string recordedby, double fee = 50)
    {
        SqlCommand com = new SqlCommand("INSERT INTO tblPenalty(AccountID, PenaltyFee, PenaltyStatus, PenaltyType, DateRecorded, RecordedBy) VALUES(@AccountID, @PenaltyFee, 'Pending', @PenaltyType, CURRENT_TIMESTAMP, @RecordedBy)", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@PenaltyFee", SqlDbType.Float).Value = fee;
        com.Parameters.Add("@RecordedBy", SqlDbType.NVarChar).Value = recordedby;
        com.Parameters.Add("@PenaltyType", SqlDbType.NVarChar).Value = type;
        com.ExecuteNonQuery();
    }

    public DataTable GetPenaltyOfAccount(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select * from tblPenalty WHERE AccountID = @ACCOUNTID AND PenaltyStatus = 'Pending'", con);
        com.Parameters.Add("@ACCOUNTID", SqlDbType.Int).Value = accountid;
        SqlDataAdapter data = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        data.Fill(table);
        con.Close();
        return table;
    }

    public bool CheckIfAccountHasPenalty(int accountid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("Select * from tblPenalty WHERE AccountID = @ACCOUNTID AND PenaltyStatus = 'Pending'", con);
        com.Parameters.Add("@ACCOUNTID", SqlDbType.Int).Value = accountid;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public DataTable ViewBookInfo(string barcode)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT tblBook.*, tblAuthor.ALName + ',' + tblAuthor.AFName as 'Author' FROM tblBook INNER JOIN tblAuthor ON tblBook.AuthorID = tblAuthor.AuthorID Where Barcode = @Barcode", con);
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewMultimediaInfo(string multimediaid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblMultimedia Where MultimediaID = @MultimediaID", con);
        com.Parameters.Add("@MultimediaID", SqlDbType.Int).Value = multimediaid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable ViewStudentInfo(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblAccount Where AccountID = @AccountID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public bool CheckIfBookExists(string barcode)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("Select * from tblBook Where Barcode = @Barcode", con);
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = barcode;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public bool CheckIfMultimediaExists(string multimediabarcode)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("Select * from tblMultimedia Where Barcode = @Barcode", con);
        com.Parameters.Add("@Barcode", SqlDbType.NVarChar).Value = multimediabarcode;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public bool CheckIfBookCirculationExist(string accountid, string bookid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("Select * from tblBookCirculation where AccountID = @A and BookID = @B and CirculationStatus = 'Out'", con);
        com.Parameters.Add("@A", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@B", SqlDbType.Int).Value = bookid;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public bool CheckIfMultimediaCirculationExist(string accountid, string multimediaid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("Select * from tblMultimediaCirculation where AccountID = @A and MultimediaID = @B and CirculationStatus = 'Out'", con);
        com.Parameters.Add("@A", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@B", SqlDbType.Int).Value = multimediaid;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public void UpdatePenalty(int penaltyid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblPenalty SET PenaltyStatus='Paid', DateCleared=CURRENT_TIMESTAMP WHERE PenaltyID = @ID", con);
        com.Parameters.Add("@ID", SqlDbType.Int).Value = penaltyid;
        com.ExecuteNonQuery();

        con.Close();
    }

    public void UpdateEPurseThroughPenalty(int accountid, double amount)
    {
        con.Open();
        SqlCommand com = new SqlCommand("UPDATE tblAccount SET EPurseBalance = EPurseBalance-@amount WHERE AccountID = @accountid", con);
        com.Parameters.Add("@accountid", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@amount", SqlDbType.Float).Value = amount;
        com.ExecuteNonQuery();
        con.Close();
    }
}