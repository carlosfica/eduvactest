using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace EntregaTress.vistas
{
    public partial class RegistroAlumnos : System.Web.UI.Page
    {
       

        private string MailUserName = ConfigurationManager.AppSettings["MailUserName"];
        private string MailPassword = ConfigurationManager.AppSettings["MailPassword"];
        private string MailFrom = ConfigurationManager.AppSettings["MailFrom"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

       

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                var SavedAlumno = AlumnoController.agregarAlumno(txtRut.Text, txtNombre.Text, txtApellido.Text, txtEmail.Text);


                QrController qr = new QrController();

                var qrText = SavedAlumno.cod_alumno +  "|" +
                            SavedAlumno.nombre_alumno + "|" +
                            SavedAlumno.apellido_alumno + "|" +
                            SavedAlumno.rut_alumno + "|" +
                            SavedAlumno.correo_alumno;

                //generar QR
                var ImageQR = qr.GenerateQRCode(qrText);

                //Mostrar QR en la vista- modo test:
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
                imgBarCode.Height = 150;
                imgBarCode.Width = 150;
                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(ImageQR);
                plBarCode.Controls.Add(imgBarCode);


                //enviar correo:               
                SendMailQR(ImageQR, SavedAlumno.correo_alumno);

              var codEnvio =  qr.EnvioCodigoQR(SavedAlumno.cod_alumno);

                lblMsg.Text = "Registro Correcto";
                lblMsg.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                var msg1 = "";
                if (msgError.Contains("An error occurred while updating the entries"))
                {
                    msg1 = "Validar que el Registro no exista.";
                }
                else
                    lblMsg.Text = ex.Message;

                lblMsg.Text = msg1;// ex.Message;
            }
        }



        protected void SendMailQR(byte[] imgQR, string CorreoAlumno)
        {            
            try
            { 
            string sAttchent = string.Empty;
            string attachmentPath = string.Empty;

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(MailFrom);
            mm.To.Add(CorreoAlumno);

            string sContent = string.Empty;
            sContent = "";
       
                  
                            byte[] barrImg = (byte[])imgQR;
                            MemoryStream ms = new MemoryStream(barrImg);
                            mm.Attachments.Add(new Attachment(ms, "QR Validaciones", "Image/png"));
                                           
              
            mm.Subject = "Código de Ingreso EduVac";
            mm.IsBodyHtml = true;
            mm.Body = "Código para ingresar";// "this content is in the body<br/>" + sContent + "</table>";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            NetworkCredential credential = new NetworkCredential();
            credential.UserName = MailUserName;
            credential.Password = MailPassword;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = credential;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(mm);

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }


      /*  protected void SendEmailQR()
        {


            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress("txtUsername.Text");
            // Recipient e-mail address.
            Msg.To.Add("txtTo.Text");
            Msg.Subject = "txtSubject.Text";
            // File Upload path
            String FileName = " fileUpload1.PostedFile.FileName";


            string mailbody = "Body Correo" + "<br/><img src=cid:companylogo>";

            //LinkedResource LinkedImage = new LinkedResource(FileName);
            //HttpContext.Current.Server.MapPath("/UploadedFiles");
            LinkedResource LinkedImage = new LinkedResource(Server.MapPath("~//" + FileName), "image/jpg");
            LinkedImage.ContentId = "MyPic";
            //Added the patch for Thunderbird as suggested by Jorge
            LinkedImage.ContentType = new ContentType(MediaTypeNames.Image.Jpeg);

            AlternateView htmlView = AlternateView.CreateAlternateViewFromString(mailbody +
              " <img src=cid:MyPic>",
              null, "text/html");

            htmlView.LinkedResources.Add(LinkedImage);
            Msg.AlternateViews.Add(htmlView);


            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("username", "password");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            Msg = null;
            //Page.RegisterStartupScript("UserMsg", "<script>alert('Mail sent thank you...');if(alert){ window.location='SendMail.aspx';}</script>");
        }
    */



protected void Unnamed1_Click(object sender, EventArgs e)
        {
            txtRut.Text = "";
            txtNombre.Text = ""; 
            txtApellido.Text = "";
            txtEmail.Text = "";
        }
    }
}