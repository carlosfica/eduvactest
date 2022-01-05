using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress.vistas
{
    public partial class RegistrarSalas : System.Web.UI.Page
    {
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
                var lastId = SalaController.agregarSalas(Convert.ToInt32(txtNumero.Text), txtNombre.Text, Convert.ToInt32(txtForoSala.Text));

               
                lblMsg.Text = "Sala registrada con el  numero : " + lastId;
                lblMsg.ForeColor = Color.Green;


            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }
    }
}