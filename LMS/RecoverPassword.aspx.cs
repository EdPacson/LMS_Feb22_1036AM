using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class RecoverPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //if (txtEmail.Text == txtEmail2.Text)
        //{
            try
            {
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection("Data Source=JEFFANJINSON-PC;Integrated Security=true;Initial Catalog=LMS"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT AccountID, Password FROM tblAccount Where Email= '" + txtEmail2.Text.Trim() + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    con.Close();
                }
                if (ds.Tables[0].Rows.Count > 0)
                {
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    Msg.From = new MailAddress(txtEmail2.Text);
                    // Recipient e-mail address.
                    Msg.To.Add(txtEmail2.Text);
                    Msg.Subject = "Your Password Details";
                    Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your AccountID: " + ds.Tables[0].Rows[0]["AccountID"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>";
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new System.Net.NetworkCredential("user@gmail.com", "password");
                    smtp.EnableSsl = true;
                    smtp.Send(Msg);
                    //Msg = null;
                    lbltxt.Text = "<i class='icon-check-sign'></i>&nbsp;&nbsp;We have sent your password. Go check it out!";
                    lbltxt.CssClass = "alert alert-success";
                    // Clear the textbox valuess
                    txtEmail.Text = "";
                }
                else
                {
                    lbltxt.CssClass = "alert alert-error";
                    lbltxt.Text = "<i class='icon-question-sign'></i>&nbsp;&nbsp;Something went wrong. Are you sure that's your email with us?";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("{0} Exception caught.", ex);
            }
        }
    //    else
    //    {
    //        lbltxt.Text = "<i class='icon-remove-sign'></i>&nbsp;&nbsp;Ooops. Did you retype your email correctly?";
    //        lbltxt.CssClass = "alert alert-error";
    //    }
    //}
}