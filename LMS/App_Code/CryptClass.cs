using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using BCryptEncryption;

namespace Crypt
{
    /// <summary>
    /// Summary description for CryptClass
    /// </summary>

    public static class AntiXSSMethods
    {
        //prevents html chars / scripts from being inserted - Anti XSS
        public static string CleanHTML(string htmlString)
        {

            string pattern = @"<(.|\n)*?>";

            return Regex.Replace(htmlString, pattern, string.Empty);
        }

        public static string CleanString(string _text)
        {
            return CleanHTML(_text.Trim());
        }

    }

    public static class EncryptBCrypt
    {

        public static string GenerateBCryptHash(string _text)
        {
            //adjust salt level here below"
            string salt = BCrypt.GenerateSalt();

            return BCrypt.HashPassword(AntiXSSMethods.CleanString(_text), salt);
        }

    }
}