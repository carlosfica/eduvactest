<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AgregarUsuarios.aspx.cs" Inherits="EntregaTress.vistas.AgregarUsuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
     <br/>
    
  <div class="jumbotron">


        <h3>Registros de usuarios</h3>
     
         
             <hr />
     <br />
        <br />

    <div class="row">

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="txtCodigoRut" class="font-weight-bold">Rut</label>
                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                          &nbsp;<asp:TextBox ID="txtCodigoRut" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>              
            </div>          

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="rut" class="font-weight-bold">Nombre Usuario</label>
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtUserName" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


               <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtPassword" class="font-weight-bold">Password</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtPassword" runat="server" Width="210px" TextMode="Password"></asp:TextBox>
                    </div>
                </div>             

            </div>

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtPasswordConfirm" class="font-weight-bold">Confirm Password</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtPasswordConfirm" runat="server" Width="210px" TextMode="Password"></asp:TextBox>
                    </div>
                </div>             

            </div>

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtNombres" class="font-weight-bold">Nombre</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtNombres" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtApellidos" class="font-weight-bold">Apellidos</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtApellidos" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


             <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtCorreo" class="font-weight-bold">Correo</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtCorreo" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>

              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtTipoUsuario" class="font-weight-bold">Tipo Usuario</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                      
                        <asp:DropDownList ID="cboTipoUsuario" runat="server" Height="25px" Width="210px">
                            <asp:ListItem Value="0">Estandar</asp:ListItem>
                            <asp:ListItem Value="1">Administrador</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>             

            </div>


            <br />

                <br />
                <br />
             <hr />

              <div class="row">
                <div class="col-md-4">
                  <%--  <div class="form-group">--%>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">
                     <%-- <button id="btnGuardar" class="btn btn-lg btn-primary" type="button" runat="server">Guardar</button>--%>


                    <asp:Button runat="server" ID="btnAgregar" class="btn btn-lg btn-success" text="Guardar" width="170px" OnClick="btnGuardar_Click" />
               
                  
           <%-- </div>--%>                   
                    </div>                   
                </div>

                <div class="col-md-7">
                   <%-- <div class="form-group">--%>
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">
                      <button id="btnCancelar" class="btn btn-lg btn-danger" type="button">
                    Cancelar
                 </button>
           <%-- </div>--%>
                    </div>
                </div>             

            </div>

             <div class="col-xs-11 space-vert">
           
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>



            
            </div>
        </div>
 <%--   </div>--%>

     </div>



</asp:Content>
