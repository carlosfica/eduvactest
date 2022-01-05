using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["UNAME"] != null && Request.Cookies["PWD"] != null)
                {
                    //UserName.Text = Request.Cookies["UNAME"].Value;
                    //Password.Attributes["value"] = Request.Cookies["PWD"].Value;
                    //CheckBox1.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtCorreo.Text != "" && txtPassword.Text != "")
            {
                var pass = txtPassword.Text;
                var correo = txtCorreo.Text;

                UsuarioController usuario = new UsuarioController();
                var RespLogin = usuario.LoginUser(correo, pass);

                if (RespLogin != null)
                {
                    FormsAuthentication.RedirectFromLoginPage(txtCorreo.Text, true);

                    lblMsg.Text = "Login Successfull";
                    lblMsg.ForeColor = Color.Green;

                    Session["USERNAME"] = RespLogin.username;
                    Session["TIPOUSUARIO"] = RespLogin.usuario_admin.ToString();

                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Passwords do not match";

                    Session["USERNAME"] = "";
                }

                // Response.Redirect("Default.aspx");
            }







        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}