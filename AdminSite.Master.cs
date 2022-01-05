using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EntregaTress
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try { 

            string UserNameLogin = (string)Session["USERNAME"];
            var UserTipoLogin = (string)Session["TIPOUSUARIO"];

            if (!string.IsNullOrEmpty(UserNameLogin))
            {
                lblLoginName.Text = UserNameLogin;

                //if (UserTipoLogin >0)
                //{
                    if (UserTipoLogin == "1")
                    {
                        pnlNavigationAdmin.Visible = true;
                        pnlNavigationStandar.Visible = false;
                    }
                    else
                    {
                        pnlNavigationAdmin.Visible = false;
                        pnlNavigationStandar.Visible = true;
                    }
                //}

            }
            else
            {
                lblLoginName.Text = "";

                pnlNavigationAdmin.Visible = false;
                pnlNavigationStandar.Visible = true;
            }


            }
            catch (Exception ex)
            {

            }
        }

        protected void BtAdminLogout_Click(object sender, EventArgs e)
        {
           // FormsAuthentication.RedirectFromLoginPage("", false);
            FormsAuthentication.SignOut();

           Session["USERNAME"] = null;
            Session["TIPOUSUARIO"] = null;
            Response.Redirect("~/Default.aspx");
        }
    }
}