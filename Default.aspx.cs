using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;


            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {

                try
                {
                    CargarListaSalas();
                    CargarListadoAlumnos();

                    ListarTodasSalas();

                    CargarListadoUsuarios();


                }
                catch (Exception ex)
                {

                }
            }

        }



        public void CargarListaSalas()
        {
            try
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
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }


        }

        protected void ddlSalas_SelectedIndexChanged(object sender, EventArgs e)
        {

            // if (!Page.IsValid) return;

            try
            {

                var fk_Sala = Convert.ToInt32(ddlSalas.SelectedValue.ToString());

                SalaController salaController = new SalaController();
                var ListaSala = salaController.GetAsistenciaBySalaId(fk_Sala);

                gvListadoAforos.DataSource = ListaSala;
                gvListadoAforos.DataBind();

            }

            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }

        }

        public void CargarListadoAlumnos()
        {
            try
            {
                AlumnoController alumno = new AlumnoController();
                var ListaAlu = alumno.ListadoAlumnos();
                gvListadoAlumnos.DataSource = ListaAlu;
                gvListadoAlumnos.DataBind();


            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }


        public void ListarTodasSalas()
        {
            try
            {
                SalaController sala = new SalaController();
                var ListaSal = sala.ListarTodasSalas();
                gvListaSalas.DataSource = ListaSal;
                gvListaSalas.DataBind();

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }

        }



        public void CargarListadoUsuarios()
        {
            try
            {
                UsuarioController musuaer = new UsuarioController();
                var ListaUsu = musuaer.ListadoUsuarios();
                this.gvListadoUsuario.DataSource = ListaUsu;
                gvListadoUsuario.DataBind();

            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }
        }




    }
}