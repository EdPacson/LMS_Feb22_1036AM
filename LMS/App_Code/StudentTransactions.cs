using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class StudentTransactions
{
    SqlConnection con = new SqlConnection(Helper.GetConnection());

	public StudentTransactions()
	{ }

    public DataTable ViewBookCirculation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select AccountID as 'Account ID', tblBook.Title, tblBook.CallNumber AS 'Call No.', tblBook.CatalogNo AS 'Catalog No.', BorrowedOn as 'Borrowed On', ReturnedOn as 'Returned On', DateDue as 'Date Due', LendBy as 'Lend By', CirculationStatus as 'Status', CirculationType from tblBookCirculation inner join tblBook on tblBook.BookID = tblBookCirculation.BookID Where AccountID = @accountid Order By Convert(datetime, ReturnedOn, 102) DESC", con);
        com.Parameters.Add("@accountid", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewMultimediaCirculation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("Select AccountID as 'Account ID', tblMultimedia.Title,  BorrowedOn as 'Borrowed On', ReturnedOn as 'Returned On', DateDue as 'Date Due', LendBy as 'Lend By', CirculationStatus as 'Status', CirculationType from tblMultimediaCirculation inner join tblMultimedia on tblMultimedia.MultimediaID = tblMultimediaCirculation.MultimediaID Where AccountID = @accountid Order By Convert(datetime, ReturnedOn, 102) DESC", con);
        com.Parameters.Add("@accountid", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewBookReservation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("select AccountID as 'Account ID', tblBook.Title, tblBook.CallNumber AS 'Call No.', tblBook.CatalogNo AS 'Catalog No.', DateReserved as 'Date Reserved', ReservationStatus as 'Reservation Status' from tblBookReservation inner join tblBook on tblBook.BookID = tblBookReservation.BookID Where AccountID = @accountid Order By Convert(datetime, DateReserved, 102) DESC" , con);
        com.Parameters.Add("@accountid", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    public DataTable ViewAVReservation(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("select AccountID as 'Account ID', tblAVAsset.Brand, tblAVAsset.Model, tblAVAsset.Type, DateReserved as 'Date Reserved', ReservationStat as 'Reservation Status' from tblAVReservation inner join tblAVAsset on tblAVAsset.AVAssetID = tblAVReservation.AVAssetID Where AccountID = @accountid Order By Convert(datetime, DateReserved, 102) DESC ", con);
        com.Parameters.Add("@accountid", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable table = new DataTable();
        da.Fill(table);
        con.Close();
        return table;
    }

    
    
}