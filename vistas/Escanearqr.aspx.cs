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

    public partial class Escanearqr : System.Web.UI.Page 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            if (IsPostBack) return;

            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }

            CargarListaSalas();
        }

        public void CargarListaSalas()
        {
            SalaController salaController = new SalaController();
            var ListaSala = salaController.ListadoSalas();

            if (ListaSala.Count != 0)
            {
                ddlSalas.DataTextField = "NombreSala";
                ddlSalas.DataValueField = "CodigoSala";
                ddlSalas.DataSource = ListaSala;                             
                ddlSalas.DataBind();
                ddlSalas.Items.Insert(0, new ListItem("-Select-", "0"));
                ddlSalas.SelectedValue = "0";



            }


        }
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (!IsPostBack) return;
            // var fk_Sala = Convert.ToInt32(ddlSalas.SelectedValue);
            var fk_Sala = Convert.ToInt32(ddlSalas.SelectedValue.ToString());
            var valorScan = txtQRHide.Value;
          

            // char DatosScan = valorScan.Split(new[] { "|" }).ToList();
            string[] CamarasWebSrm = valorScan.Split('|');

          //  var CodAlumno = CamarasWebSrm[0].Take(1);
            var CodAlumno = (CamarasWebSrm[0]).ToString();            

            QrController qr = new QrController();
            var fk_qr = qr.GetCodigoEnvioByAluId(Convert.ToInt32(CodAlumno));

            var resp = qr.GuardarEntradaSala(fk_qr.cod_codigo, fk_Sala);

            if (resp > 0)
            {
                lblMsg.Text = "Código Valido";
                lblMsg.ForeColor = Color.Green;
            }

        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            Response.Redirect("vistas/Escanearqr.aspx");
        }
    }
}