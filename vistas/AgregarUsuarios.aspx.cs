using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress.vistas
{
    public partial class AgregarUsuarios : System.Web.UI.Page
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtCodigoRut.Text != "" & txtUserName.Text != "" && txtNombres.Text != ""
                && txtApellidos.Text != "" && txtPassword.Text != "" && txtCorreo.Text != "" && txtPasswordConfirm.Text != "")
            {
                if (txtPassword.Text == txtPasswordConfirm.Text)
                {

                    var codigoRut = txtCodigoRut.Text;
                    var userName = txtUserName.Text;
                    var Fname = txtNombres.Text;
                    var Lname = txtApellidos.Text;
                    var pass = txtPassword.Text;
                    var correo = txtCorreo.Text;
                    var tipoUser = Convert.ToInt32(cboTipoUsuario.SelectedValue);

                    UsuarioController usuario = new UsuarioController();
                    usuario.agregarAlumno(codigoRut, userName, Fname, Lname, correo, pass, tipoUser);

                    lblMsg.Text = "Nuevo Usuario Guardado";
                    lblMsg.ForeColor = Color.Green;

                    //si todo esta bien, enviar correo:
                    SendMailQR(correo, userName, pass);

               //  Response.Redirect("~/Login.aspx");
                //}
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Las contraseñas deben coincidir";
            }
        }
        else
        {
            lblMsg.ForeColor = Color.Red;
            lblMsg.Text = "Debe Ingresar Todos Los Datos";

        }



}

        protected void SendMailQR(string CorreoUsurio, string UsuarioN, string PassN)
        {

            string sAttchent = string.Empty;
            string attachmentPath = string.Empty;

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(MailFrom);
            mm.To.Add(CorreoUsurio);

            string sContent = string.Empty;
            sContent = "";
                       
            var mBody = String.Format("Confirmacion de registro EduVac" +  "\n" +
                           "Nombre Usuario: " + UsuarioN + "\n" +
                           "Password: "+ PassN );
                           

            mm.Subject = "EDUC Confirmacion";
            mm.IsBodyHtml = true;
            mm.Body = mBody;// "Confirmacion de registro.";// "this content is in the body<br/>" + sContent + "</table>";
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

    }
}