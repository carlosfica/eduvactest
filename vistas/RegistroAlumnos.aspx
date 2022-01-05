
<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="RegistroAlumnos.aspx.cs" Inherits="EntregaTress.vistas.RegistroAlumnos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br/>
     <br/>
    
  <div class="jumbotron">


        <h3>Registro de Almunos</h3>
     
         
             <hr />
     <br />
        <br />
      <h5 class="row justify-content-center">Ingrese Datos del Alumno</h5>
     <hr />
    <div class="row">

        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="txtRut" class="font-weight-bold">Rut</label>
                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                          &nbsp;<asp:TextBox ID="txtRut" runat="server" Width="210px"></asp:TextBox>
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
                       &nbsp;<asp:TextBox ID="txtNombre" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


              <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtApellido" class="font-weight-bold">Apellidos</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtApellido" runat="server" Width="210px"></asp:TextBox>
                    </div>
                </div>             

            </div>


             <div class="row">
                <div class="col-md-2">
                    <div class="form-group">
                         <label for="txtEmail" class="font-weight-bold">Correo</label>                    
                    </div>                   
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                       &nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="369px" placeholder="Ingrese Correo" TextMode="Email"></asp:TextBox>
                    </div>
                </div>             

            </div>

            <%--  <div class="row">
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

            </div>--%>


            <br />

                <br />
                <br />
             <hr />

              <div class="row">
                <div class="col-md-4">
                
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">                   
                    <asp:Button runat="server" ID="btnAgregar" class="btn btn-success" text="Enviar Codigo" width="170px" OnClick="btnAgregar_Click"  />
                          
                    </div>                   
                </div>

                <div class="col-md-7">
               
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end col-6">
                   
                       <asp:Button runat="server" CssClass="form-control btn btn-warning" text="Borrar Datos" Width="168px" OnClick="Unnamed1_Click" />
                                   

                    </div>
                </div>             

            </div>

             <div class="col-xs-11 space-vert">
           
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
                        
            </div>
        </div>

       <hr />
    <asp:PlaceHolder ID="plBarCode" runat="server" />

     </div>



</asp:Content>

