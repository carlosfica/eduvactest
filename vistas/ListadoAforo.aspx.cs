using EntregaTress.controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress.vistas
{
    public partial class ListadoAforo : System.Web.UI.Page
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

        //protected void btnRefrescar_Click(object sender, EventArgs e)
        //{

        //}


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

        protected void ddlSalas_SelectedIndexChanged(object sender, EventArgs e)
        {

           // if (!Page.IsValid) return;

            var fk_Sala = Convert.ToInt32(ddlSalas.SelectedValue.ToString());

            SalaController salaController = new SalaController();
            var ListaSala = salaController.GetAsistenciaBySalaId(fk_Sala);

            gvListadoAforos.DataSource = ListaSala;
           gvListadoAforos.DataBind();

        }


        //private void BindGrid()
        //{
        //    using (CustomersEntities entities = new CustomersEntities())
        //    {
        //        gvListadoAforos.DataSource = from customer in entities.Customers
        //                               select customer;
        //        gvListadoAforos.DataBind();
        //    }
        //}


    }
}