using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net;
using System.Net.Mail;

namespace PushNotifications.SendMails
{
   public class MailGmail
    {
        static string smtpAddress = "smtp.gmail.com";
        static int portNumber = 587;
        static bool enableSSL = true;

        static string emailFromAddress = "epsoft2015@gmail.com";//Sender Email Address
        static string password = "softnet**277";//Sender Password
       public string emailToAddress = "epuente@camarasantodomingo.do";//Receiver Email Address
        public string subject = "Hello";
        public string body = "Thanks for using samanthadesk.<br> Please verify your email id by clicking the link<br> <a href = 'youraccount.com/verifycode=12323232' > verify </ a > ";


        public  void SendEmail()
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFromAddress);
                mail.To.Add(emailToAddress);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }


    }
}
