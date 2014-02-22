using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Security;
using System.IO;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;
using System.Text;
using Crypt;
using BCryptEncryption;

public class Account
{

    public int AccountId { get; set; }
    public string UserType { get; set; }
    public string LastName { get; set; }
    public string FirstName { get; set; }
    public string MiddleName { get; set; }
    public string Address { get; set; }
    public string Gender { get; set; }
    public string Birthdate { get; set; }
    public string ContactNumber { get; set; }
    public string Email { get; set; }
    public float EPurseBalance { get; set; }
    public string AccountStatus { get; set; }

    SqlConnection con = new SqlConnection(Helper.GetConnection());
	public Account()
	{ }

    public bool CheckIfLoginIsValid(string accountid, string password)
    {
        con.Open();

        //string Pass = "SELECT Password FROM tblAccount WHERE AccountID = @AccountD";
        var condition = false;
        SqlCommand com = new SqlCommand("SP_Account_Login", con); //put sql statement
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public string GetLoginUserType(string accountid, string password)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_Account_Login", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        string data = (string)com.ExecuteScalar();
        con.Close();
        return data;
    }

    public string GetLoginFullName(string accountid, string password)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_Account_FullName", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        string data = (string)com.ExecuteScalar();
        con.Close();
        return data;
    }

    public void UserRegistration(string accountid, string usertype, string lname, string fname, string mname,
        string address, string gender, string birthday, string contactno, string email, string password)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_RegisterAccount",con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = usertype;
        com.Parameters.Add("@LName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(lname);
        com.Parameters.Add("@FName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(fname);
        com.Parameters.Add("@MName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(mname);
        com.Parameters.Add("@Address", SqlDbType.NVarChar).Value = address;
        com.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = gender;
        com.Parameters.Add("@Birthdate", SqlDbType.Date).Value = birthday;
        com.Parameters.Add("@ContactNo", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(contactno);
        com.Parameters.Add("@Email", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(email);
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        com.ExecuteNonQuery();
        con.Close();
    }

    public void AdminRegistration(string accountid, string usertype, string lname, string fname, string mname,
        string address, string gender, string birthday, string contactno, string email, string password)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_AdminRegistration", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = usertype;
        com.Parameters.Add("@LName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(lname);
        com.Parameters.Add("@FName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(fname);
        com.Parameters.Add("@MName", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(mname);
        com.Parameters.Add("@Address", SqlDbType.NVarChar).Value = address;
        com.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = gender;
        com.Parameters.Add("@Birthdate", SqlDbType.Date).Value = birthday;
        com.Parameters.Add("@ContactNo", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(contactno);
        com.Parameters.Add("@Email", SqlDbType.NVarChar).Value = AntiXSSMethods.CleanString(email);
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        com.ExecuteNonQuery();
        con.Close();
    }

    public bool CheckIfPasswordIsMatch(int accountid, string oldpassword)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("SP_Account_ConfirmPassword", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(oldpassword);
        SqlDataReader dr = com.ExecuteReader();
        if (dr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public void UpdateProfile(int accountid, string password)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_Account_UpdateProfile", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@Password", SqlDbType.NVarChar).Value = Encrypt(password);
        com.ExecuteNonQuery();
        con.Close();
    }

    public void UpdateAccountStatus(int accountid, string status)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SP_ActivateDeactivate", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        com.Parameters.Add("@AccountStatus", SqlDbType.NVarChar).Value = status;
        com.ExecuteNonQuery();
        con.Close();
    }

    public bool CheckIfAccountExist(int accountid)
    {
        con.Open();
        bool condition = false;
        SqlCommand com = new SqlCommand("SELECT * FROM tblAccount WHERE AccountID = @AccountID and UserType = 'Student'", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        SqlDataReader sdr = com.ExecuteReader();
        if (sdr.HasRows)
            condition = true;
        con.Close();
        return condition;
    }

    public DataTable GetAccountInfoTable(int accountid)
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblAccount WHERE AccountID = @AccountID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public Account GetAccountInfo(int accountid)
    {
        con.Open();
        Account account = new Account();
        SqlCommand com = new SqlCommand("SELECT * FROM tblAccount WHERE AccountID = @AccountID", con);
        com.Parameters.Add("@AccountID", SqlDbType.Int).Value = accountid;
        SqlDataReader sdr = com.ExecuteReader();
        while (sdr.Read())
        {
            account.AccountId = Convert.ToInt32(sdr["AccountID"].ToString());
            account.LastName = sdr["LName"].ToString();
            account.FirstName = sdr["FName"].ToString();
            account.MiddleName = sdr["MName"].ToString();
            account.UserType = sdr["UserType"].ToString();
            account.Email = sdr["Email"].ToString();
            account.EPurseBalance = float.Parse(sdr["EPurseBalance"].ToString());
            account.AccountStatus = sdr["AccountStatus"].ToString();
        }
        con.Close();
        return account;
    }

    public DataTable ViewAccountList()
    {
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM tblAccount Where UserType != 'Admin'", con);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        return dt;
    }

    public string Encrypt(string plainText)
    {

        string passPhrase = "yourPassPhrase";
        string saltValue = "mySaltValue";
        string hashAlgorithm = "SHA512";

        int passwordIterations = 2;
        string initVector = "@1B2c3D4e5F6g7H8";
        int keySize = 256;

        byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
        byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);


        PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, saltValueBytes, hashAlgorithm, passwordIterations);

        byte[] keyBytes = password.GetBytes(keySize / 8);
        RijndaelManaged symmetricKey = new RijndaelManaged();

        symmetricKey.Mode = CipherMode.CBC;

        ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);

        MemoryStream memoryStream = new MemoryStream();
        CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);

        cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
        cryptoStream.FlushFinalBlock();
        byte[] cipherTextBytes = memoryStream.ToArray();
        memoryStream.Close();
        cryptoStream.Close();
        string cipherText = Convert.ToBase64String(cipherTextBytes);
        return cipherText;
    }

    public string Decrypt(string cipherText)
    {
        string passPhrase = "yourPassPhrase";
        string saltValue = "mySaltValue";
        string hashAlgorithm = "SHA512";

        int passwordIterations = 2;
        string initVector = "@1B2c3D4e5F6g7H8";
        int keySize = 256;
        // Convert strings defining encryption key characteristics into byte
        // arrays. Let us assume that strings only contain ASCII codes.
        // If strings include Unicode characters, use Unicode, UTF7, or UTF8
        // encoding.
        byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
        byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

        // Convert our ciphertext into a byte array.
        byte[] cipherTextBytes = Convert.FromBase64String(cipherText);

        // First, we must create a password, from which the key will be 
        // derived. This password will be generated from the specified 
        // passphrase and salt value. The password will be created using
        // the specified hash algorithm. Password creation can be done in
        // several iterations.
        PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, saltValueBytes, hashAlgorithm, passwordIterations);

        // Use the password to generate pseudo-random bytes for the encryption
        // key. Specify the size of the key in bytes (instead of bits).
        byte[] keyBytes = password.GetBytes(keySize / 8);

        // Create uninitialized Rijndael encryption object.
        RijndaelManaged symmetricKey = new RijndaelManaged();

        // It is reasonable to set encryption mode to Cipher Block Chaining
        // (CBC). Use default options for other symmetric key parameters.
        symmetricKey.Mode = CipherMode.CBC;

        // Generate decryptor from the existing key bytes and initialization 
        // vector. Key size will be defined based on the number of the key 
        // bytes.
        ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);

        // Define memory stream which will be used to hold encrypted data.
        MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

        // Define cryptographic stream (always use Read mode for encryption).
        CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);

        // Since at this point we don't know what the size of decrypted data
        // will be, allocate the buffer long enough to hold ciphertext;
        // plaintext is never longer than ciphertext.
        byte[] plainTextBytes = new byte[cipherTextBytes.Length];

        // Start decrypting.
        int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);

        // Close both streams.
        memoryStream.Close();
        cryptoStream.Close();

        // Convert decrypted data into a string. 
        // Let us assume that the original plaintext string was UTF8-encoded.
        string plainText = Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);

        // Return decrypted string.   
        return plainText;
    }
}